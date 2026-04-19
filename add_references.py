#!/usr/bin/env python3
"""
add_references.py
-----------------
Enriches final_data.csv with bibliographic references for each PPI.

Sources:
  - main-References.tex  : LaTeX table mapping indicator names → \citep{keys}
  - ref-References.bib   : BibTeX file with full bibliographic metadata
  - data/final_data.csv  : Merged PPI data (tab-separated)

Output:
  - data/final_data_with_refs.csv   : Enriched CSV (tab-separated)
  - data/reference_match_report.txt : Match audit (matched / unmatched)

Name-matching strategy
----------------------
The Reference .tex uses base names like "Active time" or "Lead Time",
while the CSV uses "Active Time (case granularity)". We normalize both sides:
  1. Strip the granularity suffix: " (case granularity)", etc.
  2. Lowercase and collapse whitespace.
When multiple CSV rows share the same base name (different granularities),
they all receive the same references.
"""

import re
import csv
import sys
from pathlib import Path
from collections import defaultdict


# ─── Paths ────────────────────────────────────────────────────────────────────

BASE = Path(__file__).parent
TEX_PATH = BASE / "docs" / "main-References.tex"
BIB_PATH = BASE / "docs" / "ref-References.bib"
CSV_IN   = BASE / "data" / "final_data.csv"
CSV_OUT  = BASE / "data" / "final_data_with_refs.csv"
REPORT   = BASE / "data" / "reference_match_report.txt"


# ─── Step 1: Strip LaTeX comments from content ────────────────────────────────

def strip_latex_comments(content: str) -> str:
    """Remove % comments (unescaped) from LaTeX content."""
    cleaned = []
    for line in content.split('\n'):
        result, i = [], 0
        while i < len(line):
            if line[i] == '\\':
                result.append(line[i])
                if i + 1 < len(line):
                    result.append(line[i + 1])
                    i += 2
                else:
                    i += 1
            elif line[i] == '%':
                break          # rest of line is a comment
            else:
                result.append(line[i])
                i += 1
        cleaned.append(''.join(result))
    return '\n'.join(cleaned)


# ─── Step 2: Parse main-References.tex ────────────────────────────────────────

def parse_references_tex(
    path: Path,
) -> tuple[dict[str, list[str]], set[str]]:
    """
    Parse the LaTeX reference table.

    Returns:
        tuple of:
          - name_to_keys  : {indicator_name_raw: [bibtex_key, ...]}
                            Only rows that have at least one \\citep{} are included.
                            Names are returned as-is (not normalized yet).
                            Duplicate names across tables are merged (union of keys).
          - added_for_completeness : set of raw names that appear in the table
                            with "Added for completeness." instead of \\citep{}.
                            These PPIs are intentionally reference-free.
    """
    content = strip_latex_comments(path.read_text(encoding='utf-8'))

    name_to_keys: dict[str, list[str]] = defaultdict(list)
    added_for_completeness: set[str] = set()

    _ADDED_RE = re.compile(r'added\s+for\s+completeness', re.IGNORECASE)

    for line in content.split('\n'):
        line = line.strip()
        if '&' not in line:
            continue

        cols = line.split('&')
        if len(cols) < 2:
            continue

        raw_name = cols[0].strip()

        # Skip header-like rows
        if raw_name in ('PPI', '') or '\\toprule' in raw_name or '\\midrule' in raw_name:
            continue

        # Track "Added for completeness." entries even though they have no \citep
        if _ADDED_RE.search(line) and '\\citep{' not in line:
            added_for_completeness.add(raw_name)
            continue

        if '\\citep{' not in line:
            continue

        # Extract all \citep{key1,key2,...} in this line
        keys = []
        for match in re.finditer(r'\\citep\{([^}]+)\}', line):
            for key in match.group(1).split(','):
                key = key.strip()
                if key and key not in keys:
                    keys.append(key)

        if keys:
            # Merge keys across tables (same name may appear in multiple tables)
            existing = set(name_to_keys[raw_name])
            for k in keys:
                if k not in existing:
                    name_to_keys[raw_name].append(k)
                    existing.add(k)

    return dict(name_to_keys), added_for_completeness


# ─── Step 3: Parse ref-References.bib ─────────────────────────────────────────

def parse_bibtex(path: Path) -> dict[str, dict]:
    """
    Parse a BibTeX file.

    Returns:
        {citation_key: {author, year, title, type, journal/booktitle/...}}
    """
    content = path.read_text(encoding='utf-8')

    entries = {}
    # Match each @type{key, ... }
    entry_pattern = re.compile(
        r'@(\w+)\s*\{\s*(\w+)\s*,([^@]+)',
        re.DOTALL
    )

    for m in entry_pattern.finditer(content):
        entry_type = m.group(1).lower()
        key        = m.group(2)
        body       = m.group(3)

        fields = {}
        # Extract field = {value} or field = "value"
        field_pattern = re.compile(
            r'(\w+)\s*=\s*(?:\{([^{}]*(?:\{[^{}]*\}[^{}]*)*)\}|"([^"]*)")',
            re.DOTALL
        )
        for fm in field_pattern.finditer(body):
            field_name  = fm.group(1).lower()
            field_value = (fm.group(2) or fm.group(3) or '').strip()
            # Collapse whitespace and remove LaTeX formatting
            field_value = re.sub(r'\s+', ' ', field_value)
            fields[field_name] = field_value

        fields['entry_type'] = entry_type
        entries[key] = fields

    return entries


def format_authors(author_string: str) -> str:
    """
    Convert BibTeX author string to 'Last1, Last2, ...' or 'Last1 et al.'
    BibTeX format: 'Last, First and Last, First and ...'
    """
    if not author_string:
        return ''

    # Split by ' and '
    authors = [a.strip() for a in re.split(r'\s+and\s+', author_string, flags=re.IGNORECASE)]

    last_names = []
    for author in authors:
        if ',' in author:
            last_names.append(author.split(',')[0].strip())
        else:
            # "First Last" format
            parts = author.strip().split()
            last_names.append(parts[-1] if parts else author)

    if len(last_names) == 1:
        return last_names[0]
    elif len(last_names) == 2:
        return f"{last_names[0]} and {last_names[1]}"
    else:
        return f"{last_names[0]} et al."


def format_reference(key: str, bib: dict[str, dict]) -> str:
    """Return 'Author et al. (year)' string for a bibtex key."""
    entry = bib.get(key)
    if not entry:
        return key   # fallback: just the key

    author = format_authors(entry.get('author', ''))
    year   = entry.get('year', '?')
    return f"{author} ({year})" if author else f"({year})"


# ─── Step 4: Normalize indicator names for matching ───────────────────────────

GRANULARITY_SUFFIXES = [
    r'\s*\(\s*activity\s+instance\s+granularity\s*\)',
    r'\s*\(\s*activity\s+granularity\s*\)',
    r'\s*\(\s*case\s+granularity\s*\)',
    r'\s*\(\s*group\s+of\s+cases\s+granularity\s*\)',
]
_SUFFIX_PATTERN = re.compile('|'.join(GRANULARITY_SUFFIXES), re.IGNORECASE)

# Strip "considering single/sum events of activity instances" variants
_VARIANT_SUFFIX = re.compile(
    r'\s+considering\s+(single|the sum of all)\s+events\s+of\s+activity\s+instances',
    re.IGNORECASE
)

# Known name mismatches: CSV name → Reference.tex name (same PPI, different wording).
# Rules:
#   1. Both sides must already be normalized (lowercase, no granularity suffix).
#   2. Source and target must refer to the SAME conceptual PPI — never use this to
#      inherit references from a different indicator.
#   3. Only add an alias when the direct normalized match genuinely fails.
#      If the direct match works, no alias is needed (dead aliases are caught at
#      startup by validate_aliases()).
_NAME_ALIASES: dict[str, str] = {
    # CSV: "Labor Cost and Total Cost Ratio"  ←→  tex: "Labor and Total Cost Ratio"
    'labor cost and total cost ratio': 'labor and total cost ratio',
}


def normalize_name(name: str) -> str:
    """
    Lowercase + strip granularity suffix + strip variant suffix + collapse whitespace.
    Returns the canonical key used for lookup.
    """
    name = _SUFFIX_PATTERN.sub('', name)
    name = _VARIANT_SUFFIX.sub('', name)
    name = re.sub(r'\s+', ' ', name).strip().lower()
    return name


def resolve_name(norm: str) -> str:
    """
    Apply alias corrections and Expected-prefix stripping.
    Returns the best lookup key to try.
    """
    # Apply explicit alias corrections first
    if norm in _NAME_ALIASES:
        return _NAME_ALIASES[norm]

    # Strip "expected " prefix as a fallback — Expected indicators inherit
    # the references of their base indicator.
    if norm.startswith('expected '):
        base = norm[len('expected '):]
        if base in _NAME_ALIASES:
            return _NAME_ALIASES[base]
        return base

    return norm


# ─── Step 4b: Validate aliases against the lookup ────────────────────────────

def validate_aliases(
    aliases: dict[str, str],
    lookup: dict[str, list[str]],
    added_norms: set[str],
) -> None:
    """
    Raise ValueError if any alias is broken or unnecessary.

    Checks performed for each (source → target) pair:
      - BROKEN TARGET  : target not in lookup (alias would always fail silently)
      - REDUNDANT      : source already has a direct match in lookup or added_norms
                         (alias is dead code and should be removed)
      - SELF-LOOP      : source == target (no-op)

    Call this after build_lookup() so the lookup is fully populated.
    """
    errors = []
    for src, tgt in aliases.items():
        if src == tgt:
            errors.append(f"  SELF-LOOP  : '{src}' → '{tgt}'  (alias maps name to itself)")
            continue
        if tgt not in lookup:
            errors.append(
                f"  BROKEN TARGET : '{src}' → '{tgt}'"
                f"  (target not found in lookup — alias will never resolve)"
            )
        if src in lookup or src in added_norms:
            errors.append(
                f"  REDUNDANT  : '{src}' → '{tgt}'"
                f"  (source already has a direct match — alias is dead code)"
            )

    if errors:
        msg = "\n".join(["Alias validation failed:"] + errors)
        raise ValueError(msg)

    print(f"  Alias validation passed ({len(aliases)} alias(es) checked).")


# ─── Step 5: Build normalized lookup ──────────────────────────────────────────

def build_lookup(
    tex_map: dict[str, list[str]],
    added_set: set[str],
) -> tuple[dict[str, list[str]], set[str]]:
    """
    Return:
      - lookup      : {normalized_name: [bibtex_keys]} for PPIs with citations.
      - added_norms : set of normalized names for PPIs marked "Added for completeness."
    When two raw names normalize to the same key, their key lists are merged.
    """
    lookup: dict[str, list[str]] = defaultdict(list)
    for raw_name, keys in tex_map.items():
        norm = normalize_name(raw_name)
        existing = set(lookup[norm])
        for k in keys:
            if k not in existing:
                lookup[norm].append(k)
                existing.add(k)

    added_norms: set[str] = {normalize_name(n) for n in added_set}

    return dict(lookup), added_norms


# ─── Step 6: Enrich CSV ───────────────────────────────────────────────────────

def enrich_csv(
    csv_in: Path,
    csv_out: Path,
    report_path: Path,
    lookup: dict[str, list[str]],
    added_norms: set[str],
    bib: dict[str, dict],
) -> None:
    """
    Read csv_in (tab-separated), add reference columns, write csv_out.

    New columns added:
      - references_keys     : semicolon-separated BibTeX keys (e.g. RN4153; RN4308)
                              Value is 'ADDED_FOR_COMPLETENESS' when the PPI was
                              intentionally left without references in the paper.
      - references_formatted: semicolon-separated "Author (year)" strings
                              (empty string for ADDED_FOR_COMPLETENESS rows)

    Match categories written to the report:
      MATCHED             – found a \\citep in main-References.tex
      ADDED_FOR_COMPLETENESS – found in the table but marked "Added for completeness."
      UNMATCHED           – name not found in main-References.tex at all
    """
    with open(csv_in, encoding='utf-8', newline='') as f:
        reader = csv.DictReader(f, delimiter='\t')
        fieldnames = reader.fieldnames or []
        rows = list(reader)

    matched   = []   # (raw, norm, resolved, match_type, keys)
    added     = []   # (raw, norm, resolved)  — no keys, intentional
    unmatched = []   # (raw, norm)

    out_rows = []
    for row in rows:
        raw_name = row.get('Name', '').strip()
        norm     = normalize_name(raw_name)
        resolved = resolve_name(norm)
        keys     = lookup.get(norm) or lookup.get(resolved, [])

        if keys:
            match_type = 'direct' if lookup.get(norm) else 'resolved'
            matched.append((raw_name, norm, resolved, match_type, keys))
            row['references_keys']      = '; '.join(keys)
            row['references_formatted'] = '; '.join(format_reference(k, bib) for k in keys)

        elif norm in added_norms or resolved in added_norms:
            # The PPI exists in the table but has no citations by design
            added.append((raw_name, norm, resolved))
            row['references_keys']      = 'ADDED_FOR_COMPLETENESS'
            row['references_formatted'] = ''

        else:
            unmatched.append((raw_name, norm))
            row['references_keys']      = ''
            row['references_formatted'] = ''

        out_rows.append(row)

    new_fields = fieldnames + ['references_keys', 'references_formatted']

    with open(csv_out, 'w', encoding='utf-8', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=new_fields, delimiter='\t')
        writer.writeheader()
        writer.writerows(out_rows)

    # ── Write match report ────────────────────────────────────────────────────
    with open(report_path, 'w', encoding='utf-8') as f:
        f.write("=" * 70 + "\n")
        f.write("REFERENCE MATCH REPORT\n")
        f.write("=" * 70 + "\n\n")

        f.write(f"Total indicators in CSV        : {len(rows)}\n")
        f.write(f"Matched to references          : {len(matched)}\n")
        f.write(f"Added for completeness (no ref): {len(added)}\n")
        f.write(f"Truly unmatched                : {len(unmatched)}\n\n")

        f.write("─" * 70 + "\n")
        f.write("MATCHED\n")
        f.write("─" * 70 + "\n")
        for raw, norm, resolved, match_type, keys in sorted(matched, key=lambda x: x[0].lower()):
            tag = '' if match_type == 'direct' else f' [resolved: "{resolved}"]'
            f.write(f"  {raw}{tag}\n")
            f.write(f"    → [{', '.join(keys)}]\n")

        f.write("\n" + "─" * 70 + "\n")
        f.write("ADDED FOR COMPLETENESS (intentionally no references in paper)\n")
        f.write("─" * 70 + "\n")
        for raw, norm, resolved in sorted(added, key=lambda x: x[0].lower()):
            note = f'  [base: "{resolved}"]' if resolved != norm else ''
            f.write(f"  {raw}  (normalized: '{norm}'){note}\n")

        if unmatched:
            f.write("\n" + "─" * 70 + "\n")
            f.write("TRULY UNMATCHED (name not found in main-References.tex)\n")
            f.write("─" * 70 + "\n")
            for raw, norm in sorted(unmatched, key=lambda x: x[0].lower()):
                f.write(f"  {raw}  (normalized: '{norm}')\n")

    print(f"✓ Matched              : {len(matched)}/{len(rows)} indicators")
    print(f"~ Added for completeness: {len(added)}/{len(rows)} indicators")
    print(f"✗ Truly unmatched      : {len(unmatched)}/{len(rows)} indicators")
    print(f"\nOutput CSV    : {csv_out}")
    print(f"Match report  : {report_path}")


# ─── Main ─────────────────────────────────────────────────────────────────────

def main():
    print("Parsing main-References.tex ...")
    tex_map, added_set = parse_references_tex(TEX_PATH)
    print(f"  {len(tex_map)} unique indicator names with citations found.")
    print(f"  {len(added_set)} indicator names marked 'Added for completeness.'")

    print("\nParsing ref-References.bib ...")
    bib = parse_bibtex(BIB_PATH)
    print(f"  {len(bib)} BibTeX entries loaded.")

    print("\nBuilding normalized lookup ...")
    lookup, added_norms = build_lookup(tex_map, added_set)
    print(f"  {len(lookup)} normalized name → keys mappings.")
    print(f"  {len(added_norms)} normalized names flagged as 'Added for completeness.'")

    print("\nValidating aliases ...")
    validate_aliases(_NAME_ALIASES, lookup, added_norms)

    print("\nEnriching CSV ...")
    enrich_csv(CSV_IN, CSV_OUT, REPORT, lookup, added_norms, bib)


if __name__ == '__main__':
    main()
