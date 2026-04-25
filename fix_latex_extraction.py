#!/usr/bin/env python3
r"""
fix_latex_extraction.py
========================

Re-extrae las fórmulas LaTeX de los 3 archivos .tex con un parser de
\\newcommand correcto (que respeta llaves anidadas) y genera:

  - data/final_all_data_FIXED.csv  (CSV con las columnas corregidas)
  - sql/update_indicator_latex.sql  (UPDATE para Supabase)

EL BUG ORIGINAL:
  La regex era:
      r'\\newcommand\s*\{\\([a-zA-Z]+)\}\s*(?:\[(\d+)\])?\s*\{([^}]+)\}'
  El '[^}]+' captura solo hasta la PRIMERA '}', así que un newcommand
  como  \newcommand{\utacta}{\mathit{a}}  capturaba el cuerpo como
  '\mathit{a' (sin la llave de cierre del \mathit), dejando el LaTeX
  desbalanceado en cada expansión.

LA CORRECCIÓN:
  Parser que cuenta llaves abiertas/cerradas para encontrar el verdadero
  cierre del cuerpo de \newcommand.
"""

import os
import re
import csv
from pathlib import Path
from typing import Dict, List, Tuple, Optional, Set

BASE = Path(__file__).parent
# Carpeta canónica con los .tex actualizados (Ipre-2026/docs).
LATEX_DIR = Path("/sessions/sharp-amazing-curie/mnt/Documentos al 2026-03-27/Ipre-2026/docs")
OUT_CSV = BASE / "final_all_data_FIXED.csv"
OUT_SQL = BASE / "update_indicator_latex.sql"


# ─────────────────────────────────────────────────────────────────────────────
# Parser de \newcommand con llaves balanceadas (la corrección al bug)
# ─────────────────────────────────────────────────────────────────────────────

class LatexCommandParser:
    def __init__(self):
        self.commands: Dict[str, str] = {}
        self.parametric_commands: Set[str] = set()

    @staticmethod
    def _read_balanced_braces(text: str, start: int) -> Tuple[Optional[str], int]:
        """
        Dado que text[start] == '{', devuelve (contenido_sin_llaves, indice_despues_de_})
        respetando llaves anidadas y escapes \\{ \\}.
        Si no está balanceado devuelve (None, start).
        """
        if start >= len(text) or text[start] != '{':
            return None, start
        depth = 0
        i = start
        while i < len(text):
            ch = text[i]
            if ch == '\\' and i + 1 < len(text):
                # saltar el caracter escapado (incluye \{ y \})
                i += 2
                continue
            if ch == '{':
                depth += 1
            elif ch == '}':
                depth -= 1
                if depth == 0:
                    return text[start + 1:i], i + 1
            i += 1
        return None, start  # no balanceado

    def extract_commands_from_preamble(self, content: str) -> None:
        """Parsea \\newcommand{\\name}[N]{body} respetando llaves anidadas."""
        doc_start = content.find(r'\begin{document}')
        preamble = content[:doc_start] if doc_start != -1 else content

        # Recorremos el preámbulo buscando '\newcommand{\name}'
        head_re = re.compile(r'\\newcommand\s*\{\s*\\([a-zA-Z]+)\s*\}\s*(?:\[(\d+)\])?\s*')
        i = 0
        while i < len(preamble):
            m = head_re.search(preamble, i)
            if not m:
                break
            cmd_name = m.group(1)
            num_params = m.group(2)
            body_start = m.end()
            # ahora debe venir '{' del cuerpo
            if body_start < len(preamble) and preamble[body_start] == '{':
                body, after = self._read_balanced_braces(preamble, body_start)
                if body is not None:
                    if num_params:
                        self.parametric_commands.add(cmd_name)
                    else:
                        self.commands[cmd_name] = body
                    i = after
                    continue
            i = m.end()

    def expand_text(self, text: str) -> str:
        """Expansión recursiva de comandos en el texto."""
        if not text:
            return text

        # \universe / \attribute con argumentos opcionales y obligatorios
        text = re.sub(
            r'\\universe\s*\[([^\]]*)\]\s*\{([^}]+)\}',
            lambda m: 'U^{' + m.group(1) + '}_{' + m.group(2) + '}',
            text,
        )
        text = re.sub(
            r'\\universe\s*\{([^}]+)\}',
            lambda m: 'U^{}_{' + m.group(1) + '}',
            text,
        )
        # \attribute -> \# (escapado para KaTeX, que no permite # crudo)
        text = re.sub(
            r'\\attribute\s*\[([^\]]*)\]\s*\{([^}]+)\}',
            lambda m: r'\#^{' + m.group(1) + '}_{' + m.group(2) + '}',
            text,
        )
        text = re.sub(
            r'\\attribute\s*\{([^}]+)\}',
            lambda m: r'\#^{}_{' + m.group(1) + '}',
            text,
        )

        for _ in range(10):
            new_text = text
            for cmd_name in sorted(self.commands.keys(), key=len, reverse=True):
                pattern = r'\\' + re.escape(cmd_name) + r'(?![a-zA-Z\[\{])'
                replacement = self.commands[cmd_name]
                new_text = re.sub(pattern, lambda m, r=replacement: r, new_text)
            if new_text == text:
                break
            text = new_text
        return text


# ─────────────────────────────────────────────────────────────────────────────
# Extracción de filas de las tablas (igual que el script original)
# ─────────────────────────────────────────────────────────────────────────────

def _strip_latex_comments(content: str) -> str:
    cleaned = []
    for line in content.split('\n'):
        out = []
        i = 0
        while i < len(line):
            if line[i] == '\\':
                out.append(line[i])
                if i + 1 < len(line):
                    out.append(line[i + 1]); i += 2
                else:
                    i += 1
            elif line[i] == '%':
                break
            else:
                out.append(line[i]); i += 1
        cleaned.append(''.join(out))
    return '\n'.join(cleaned)


def _strip_structural_lines(content: str) -> str:
    structural = [r'\toprule', r'\midrule', r'\bottomrule', r'\hline',
                  r'\endhead', r'\endfirsthead', r'\endfoot', r'\endlastfoot',
                  r'\caption', r'\label', r'\textbf']
    out = []
    for line in content.split('\n'):
        s = line.strip()
        if not s:
            out.append(line); continue
        if '&' in s:
            out.append(line); continue
        if any(c in s for c in structural):
            continue
        out.append(line)
    return '\n'.join(out)


def _split_by_double_backslash(text: str) -> List[str]:
    rows, current, i = [], [], 0
    while i < len(text):
        if text[i:i+13] == r'\begin{cases}':
            end = text.find(r'\end{cases}', i + 13)
            if end == -1:
                end = len(text)
            else:
                end += 11
            current.append(text[i:end]); i = end; continue
        if text[i:i+3] == '\\\\\n':
            rows.append(''.join(current)); current = []; i += 3; continue
        current.append(text[i]); i += 1
    if current:
        rows.append(''.join(current))
    return rows


def _split_by_hline(text: str) -> List[str]:
    parts = text.split(r'\hline')
    return [p.strip() for p in parts if p.strip()]


def _is_structural_line(line: str) -> bool:
    structural = [r'\toprule', r'\midrule', r'\bottomrule', r'\hline',
                  r'\endhead', r'\endfirsthead', r'\endfoot', r'\endlastfoot',
                  r'\caption', r'\label', r'\textbf']
    return any(s in line for s in structural)


def _smart_split_amp(text: str) -> List[str]:
    cols, cur, i = [], [], 0
    in_d = in_p = in_b = in_cases = False
    depth = 0
    while i < len(text):
        ch = text[i]
        if text[i:i+13] == r'\begin{cases}':
            in_cases = True; cur.append(text[i:i+13]); i += 13; continue
        if text[i:i+11] == r'\end{cases}':
            in_cases = False; cur.append(text[i:i+11]); i += 11; continue
        if text[i:i+2] == r'\(':
            in_p = True; cur.append(text[i:i+2]); i += 2; continue
        if text[i:i+2] == r'\)':
            in_p = False; cur.append(text[i:i+2]); i += 2; continue
        if text[i:i+2] == r'\[':
            in_b = True; cur.append(text[i:i+2]); i += 2; continue
        if text[i:i+2] == r'\]':
            in_b = False; cur.append(text[i:i+2]); i += 2; continue
        if ch == '$':
            in_d = not in_d; cur.append(ch); i += 1; continue
        if ch == '{':
            depth += 1; cur.append(ch); i += 1; continue
        if ch == '}':
            depth -= 1; cur.append(ch); i += 1; continue
        if ch == '&' and depth == 0 and not in_d and not in_p and not in_b and not in_cases:
            cols.append(''.join(cur)); cur = []; i += 1; continue
        cur.append(ch); i += 1
    cols.append(''.join(cur))
    return cols


def extract_rows(content: str) -> List[List[str]]:
    rows = []
    table_pattern = r'\\begin\{longtable\}.*?\\end\{longtable\}'
    for table in re.findall(table_pattern, content, re.DOTALL):
        table = _strip_latex_comments(table)
        if r'\hline' in table:
            row_texts = _split_by_hline(table)
        else:
            table = _strip_structural_lines(table)
            row_texts = _split_by_double_backslash(table)

        for rt in row_texts:
            rt = rt.strip()
            if not rt or _is_structural_line(rt):
                continue
            if rt.startswith('%'):
                continue
            if any(x in rt for x in [r'\begin{longtable}', r'\end{longtable}',
                                     r'\caption', r'\label', r'\toprule',
                                     r'\midrule', r'\hline', r'\endhead',
                                     r'\endfoot']):
                continue
            cols = _smart_split_amp(rt)
            if cols and len(cols) > 1:
                cols = [c.strip() for c in cols]
                if cols[0] and len(cols[0]) > 2:
                    rows.append(cols)
    return rows


# ─────────────────────────────────────────────────────────────────────────────
# Extractores específicos
# ─────────────────────────────────────────────────────────────────────────────

VALID_DIMS = {'T', 'C', 'Q', 'F', 'G'}
VALID_GRANS = {'I', 'A', 'C', 'G'}


def extract_definitions(path: Path, parser: LatexCommandParser) -> List[Dict]:
    content = path.read_text(encoding='utf-8')
    rows = extract_rows(content)
    out = []
    for r in rows:
        if len(r) < 6:
            continue
        ind = parser.expand_text(r[0]).strip()
        dim = parser.expand_text(r[1]).strip()
        gran = parser.expand_text(r[2]).strip()
        if dim not in VALID_DIMS or gran not in VALID_GRANS:
            continue
        out.append({
            'Indicator': ind,
            'Dimension': dim,
            'Granularity': gran,
            'Function_name': parser.expand_text(r[4]).strip(),
            'Formalization_latex': parser.expand_text(r[5]).strip(),
        })
    return out


def extract_engineers(path: Path, parser: LatexCommandParser) -> List[Dict]:
    content = path.read_text(encoding='utf-8')
    rows = extract_rows(content)
    out = []
    for r in rows:
        if len(r) < 4:
            continue
        ind = parser.expand_text(r[0]).strip()
        dim = parser.expand_text(r[1]).strip()
        gran = parser.expand_text(r[2]).strip()
        if dim not in VALID_DIMS or gran not in VALID_GRANS:
            continue
        formalization_fp, description_fp = '', ''
        if len(r) >= 5:
            full = parser.expand_text(r[4]).strip()
            parts = re.split(r'\\newline\s*', full, maxsplit=1)
            formalization_fp = parts[0].strip()
            description_fp = parts[1].strip() if len(parts) > 1 else ''
        out.append({
            'Indicator': ind,
            'Dimension': dim,
            'Granularity': gran,
            'Formalization_fp': formalization_fp,
            'Description_fp': description_fp,
        })
    return out


# ─────────────────────────────────────────────────────────────────────────────
# Helpers de slug y matching
# ─────────────────────────────────────────────────────────────────────────────

DIMENSION_LETTER = {'C': 'c', 'F': 'f', 'G': 'g', 'Q': 'q', 'T': 't'}
GRANULARITY_LETTER = {'A': 'a', 'C': 'c', 'G': 'g', 'I': 'i'}


def make_slug(indicator: str, dim: str, gran: str) -> str:
    s = re.sub(r'[^a-z0-9\s\-]', '', indicator.lower())
    s = re.sub(r'\s+', '-', s)
    s = re.sub(r'-+', '-', s)
    return f"{s}-{DIMENSION_LETTER.get(dim, 'g')}-{GRANULARITY_LETTER.get(gran, 'c')}"


def normalize_name(name: str) -> str:
    name = re.sub(r'\s+', ' ', name).strip().lower()
    name = re.sub(r'\s*\((?:activity instance|activity|case|group of cases)\s*granularity\)\s*$', '', name)
    return name.strip()


# ─────────────────────────────────────────────────────────────────────────────
# Main
# ─────────────────────────────────────────────────────────────────────────────

def main():
    print("=" * 70)
    print("FIX LATEX EXTRACTION")
    print("=" * 70)

    parsers = {}
    for name, fn in [('definitions', 'PPI Definitions.tex'),
                     ('engineers', 'PPI for Engineers.tex')]:
        content = (LATEX_DIR / fn).read_text(encoding='utf-8')
        p = LatexCommandParser()
        p.extract_commands_from_preamble(content)
        parsers[name] = p
        print(f"  {fn}: {len(p.commands)} comandos")

    # Verificar el fix con un caso concreto
    p = parsers['definitions']
    print(f"\n  Verificación bug:")
    print(f"    \\utacta -> {p.commands.get('utacta')!r}")
    print(f"    \\indc   -> {p.commands.get('indc')!r}")
    print(f"    \\indcabetfc -> {p.commands.get('indcabetfc')!r}")
    sample = r'\(\frac{\indcabetfc(g, \utacta, \utstime)}{\indc(g)}\)'
    print(f"    Muestra: {sample}")
    print(f"    Expandida: {p.expand_text(sample)}")

    print("\n  Extrayendo Definitions...")
    defs = extract_definitions(LATEX_DIR / 'PPI Definitions.tex', parsers['definitions'])
    print(f"    {len(defs)} indicadores")

    print("\n  Extrayendo Engineers...")
    engs = extract_engineers(LATEX_DIR / 'PPI for Engineers.tex', parsers['engineers'])
    print(f"    {len(engs)} indicadores")

    # Combinar por (nombre, dim, gran)
    def_map = {}
    for r in defs:
        k = (normalize_name(r['Indicator']), r['Dimension'], r['Granularity'])
        def_map[k] = r
    eng_map = {}
    for r in engs:
        k = (normalize_name(r['Indicator']), r['Dimension'], r['Granularity'])
        eng_map[k] = r

    keys = set(def_map.keys()) | set(eng_map.keys())

    rows_out = []
    for k in sorted(keys):
        nm, dim, gran = k
        d = def_map.get(k, {})
        e = eng_map.get(k, {})
        ind = d.get('Indicator') or e.get('Indicator') or nm
        rows_out.append({
            'Slug': make_slug(ind, dim, gran),
            'Name': ind,
            'Dimension': dim,
            'Granularity': gran,
            'Function_name': d.get('Function_name', ''),
            'Formalization_latex': d.get('Formalization_latex', ''),
            'Formalization_fp': e.get('Formalization_fp', ''),
            'Description_fp': e.get('Description_fp', ''),
        })

    OUT_CSV.parent.mkdir(parents=True, exist_ok=True)
    with open(OUT_CSV, 'w', newline='', encoding='utf-8') as f:
        w = csv.DictWriter(f, fieldnames=['Slug', 'Name', 'Dimension', 'Granularity',
                                          'Function_name', 'Formalization_latex',
                                          'Formalization_fp', 'Description_fp'],
                           delimiter='\t')
        w.writeheader()
        for r in rows_out:
            w.writerow(r)
    print(f"\n  CSV escrito: {OUT_CSV} ({len(rows_out)} filas)")

    # Generar UPDATE SQL para Supabase (por slug)
    def sql_escape(s: str) -> str:
        if s is None:
            return 'NULL'
        return "'" + s.replace("'", "''") + "'"

    with open(OUT_SQL, 'w', encoding='utf-8') as f:
        f.write("-- UPDATE de fórmulas LaTeX corregidas para tabla `indicator`\n")
        f.write("-- Generado por fix_latex_extraction.py\n")
        f.write("-- Bug original: regex de \\newcommand capturaba [^}]+, perdiendo\n")
        f.write("-- la } de cierre cuando el cuerpo contenía llaves anidadas.\n\n")
        f.write("BEGIN;\n\n")
        for r in rows_out:
            slug = r['Slug']
            f.write(
                "UPDATE indicator SET "
                f"function_name = {sql_escape(r['Function_name'])}, "
                f"formalization_latex = {sql_escape(r['Formalization_latex'])}, "
                f"formalization_fp = {sql_escape(r['Formalization_fp'])}, "
                f"description_fp = {sql_escape(r['Description_fp'])} "
                f"WHERE slug = {sql_escape(slug)};\n"
            )
        f.write("\nCOMMIT;\n")
    print(f"  SQL escrito:  {OUT_SQL}")

    # Mostrar caso concreto del usuario
    target_slug = 'case-percentage-where-activity-before-time-frame-group-of-cases-granularity-q-g'
    match = next((r for r in rows_out if r['Slug'] == target_slug), None)
    print("\n" + "=" * 70)
    print("CASO DEL USUARIO (CAdueTFP)")
    print("=" * 70)
    if match:
        print(f"  Slug: {match['Slug']}")
        print(f"  function_name:        {match['Function_name']}")
        print(f"  formalization_latex:  {match['Formalization_latex']}")
        print(f"  formalization_fp:     {match['Formalization_fp']}")
        print(f"  description_fp:       {match['Description_fp']}")
    else:
        print("  No encontrado")


if __name__ == '__main__':
    main()
