#!/usr/bin/env python3
"""
normalizar_csv.py
─────────────────
Lee final_data_with_refs.csv y genera un CSV normalizado por cada tabla
del modelo E/R.  Estos CSVs se cargan luego con \copy en PostgreSQL.

Uso:
    python normalizar_csv.py

Salida (en data/csv_normalizados/):
    dimension.csv
    granularity.csv
    attribute.csv
    reference.csv
    parameter.csv
    extra_input.csv
    indicator.csv
    indicator_attribute.csv
    indicator_parameter.csv
    indicator_reference.csv
"""

import csv
import os
import re
from pathlib import Path

# ─── Configuración ──────────────────────────────────────────────
INPUT_CSV = Path("../data/final_data_with_refs.csv")
BIB_FILE  = Path("../docs/ref-References.bib")
OUTPUT_DIR = Path("../data/csv_normalizados")
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

# ─── Catálogos fijos ────────────────────────────────────────────
DIMS = {
    "C": ("C", "Cost"),
    "F": ("F", "Flexibility"),
    "G": ("G", "General"),
    "Q": ("Q", "Quality"),
    "T": ("T", "Time"),
}

GRANS = {
    "A": ("A", "Activity"),
    "C": ("C", "Case"),
    "G": ("G", "Group of cases"),
    "I": ("I", "Activity instance"),
}

DESIRED_MAP = {"MAX": "maximize", "MIN": "minimize", "N/A": None}

# ─── Metadata de parámetros conocidos ───────────────────────────
PARAM_META = {
    "a":    {"name": "activity",                     "domain": "A",    "type": "extra_input"},
    "Autl": {"name": "list of automated activities",  "domain": "⊆ A",  "type": "extra_input"},
    "b":    {"name": "activity (second)",             "domain": "A",    "type": "extra_input"},
    "c":    {"name": "case",                          "domain": "C",    "type": "required_attribute"},
    "DCl":  {"name": "list of direct cost activities", "domain": "⊆ A", "type": "extra_input"},
    "Desl": {"name": "list of desirable activities",   "domain": "⊆ A", "type": "extra_input"},
    "et":   {"name": "end timestamp",                 "domain": "T",    "type": "extra_input"},
    "g":    {"name": "group of cases",                "domain": "⊆ C",  "type": "required_attribute"},
    "hr":   {"name": "human resource",                "domain": "U_hres", "type": "extra_input"},
    "i":    {"name": "activity instance",             "domain": "I",    "type": "required_attribute"},
    "rl":   {"name": "role",                          "domain": "U_role", "type": "extra_input"},
    "st":   {"name": "start timestamp",               "domain": "T",    "type": "extra_input"},
    "sub":  {"name": "subset of activities",          "domain": "⊆ A",  "type": "extra_input"},
    "Unwl": {"name": "list of unwanted activities",    "domain": "⊆ A", "type": "extra_input"},
    "val":  {"name": "numeric value",                 "domain": "ℝ",    "type": "extra_input"},
}

EXTRA_INPUT_TYPE = {
    "a": "activity", "b": "activity", "hr": "resource", "rl": "role",
    "val": "value", "st": "timestamp", "et": "timestamp",
    "sub": "set", "Autl": "set", "DCl": "set", "Desl": "set", "Unwl": "set",
}


# ─── Funciones de parseo ────────────────────────────────────────

def parse_attributes(raw):
    """'$tc$ – Event attribute: total cost ; $time$ – ...' → [(symbol, desc), ...]"""
    results = []
    if not raw:
        return results
    for item in raw.split(";"):
        item = item.strip()
        m = re.match(r"\$(\w+)\$\s*[–\-]\s*(.*)", item)
        if m:
            results.append((m.group(1), m.group(2).strip()))
    return results


def parse_extra_inputs(raw):
    """'$a$ – the specific activity ; $val$ – ...' → [(symbol, desc), ...]"""
    return parse_attributes(raw)  # mismo formato


def parse_params(raw):
    """
    Extrae parámetros del campo Params (LaTeX).
    Retorna [(symbol, domain, constraint), ...]
    """
    results = []
    if not raw:
        return results

    parts = re.split(r"\\newline", raw)
    current_symbol = None
    current_domain = None
    constraints = []

    for part in parts:
        part = part.strip()
        if not part:
            continue

        # Patrón: \(c \in C\)
        m = re.match(r".*?\((\w)\s*\\in\s*(.+?)\\?\).*", part)
        if not m:
            # Patrón: \(\mathit{hr \in U^{}_{\mathit{hres}\)
            m = re.match(r".*?\\mathit\{(\w+)\s*\\in\s*(.+?)\\?\).*", part)
        if not m:
            # Patrón: \(g \subseteq C ...\)
            m = re.match(r".*?\((\w)\s*\\subseteq\s*(.+?)(?:\\colon)?\\?\).*", part)

        if m:
            if current_symbol is not None:
                results.append((current_symbol, current_domain,
                                "; ".join(constraints) if constraints else None))
            current_symbol = m.group(1)
            current_domain = m.group(2).strip().rstrip("\\").strip()
            constraints = []
        else:
            constraint_text = re.sub(r"^\\\(", "", part)
            constraint_text = re.sub(r"\\\)$", "", constraint_text).strip()
            if constraint_text and current_symbol:
                constraints.append(constraint_text)

    if current_symbol is not None:
        results.append((current_symbol, current_domain,
                        "; ".join(constraints) if constraints else None))
    return results


def parse_references(keys_raw, formatted_raw):
    """'RN4153; RN4308' + 'Meier et al. (2015); Fogarty (1992)' → [(key, formatted), ...]"""
    if not keys_raw:
        return []
    keys = [k.strip() for k in keys_raw.split(";") if k.strip()]
    fmts = [f.strip() for f in formatted_raw.split(";") if f.strip()] if formatted_raw else []
    return [(keys[i], fmts[i] if i < len(fmts) else "") for i in range(len(keys))]


def parse_ref_authors_year(fmt):
    """'Meier et al. (2015)' → ('Meier et al.', 2015)"""
    m = re.match(r"(.+?)\s*\((\d{4})\)\s*$", fmt)
    if m:
        return m.group(1).strip(), int(m.group(2))
    return (fmt.strip() if fmt else "Unknown"), None


def parse_bib_file(bib_path):
    """
    Parsea ref-References.bib y retorna dict:
      citation_key → {authors, title, year, source, type}
    """
    bib_data = {}
    with open(bib_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Encontrar cada entrada @type{key, ... }
    # Usamos regex para extraer bloques
    entries = re.findall(
        r"@(\w+)\{(\w+),\s*(.*?)\n\}",
        content,
        re.DOTALL,
    )

    for entry_type, key, body in entries:
        fields = {}
        # Extraer campos: nombre = {valor} o nombre = valor
        for m in re.finditer(r"(\w+)\s*=\s*\{(.*?)\}", body, re.DOTALL):
            field_name = m.group(1).lower()
            field_val = m.group(2).strip()
            # Limpiar LaTeX escapes comunes
            field_val = field_val.replace("\\&", "&")
            field_val = field_val.replace("\\%", "%")
            field_val = re.sub(r"\s+", " ", field_val)  # normalizar espacios
            fields[field_name] = field_val

        # Determinar source según tipo de publicación
        source = ""
        if "journal" in fields:
            source = fields["journal"]
        elif "booktitle" in fields:
            source = fields["booktitle"]
        elif "school" in fields:
            source = fields["school"]
        elif "publisher" in fields:
            source = fields["publisher"]
        elif "howpublished" in fields:
            source = fields["howpublished"]

        year = None
        if "year" in fields:
            try:
                year = int(fields["year"])
            except ValueError:
                pass

        bib_data[key] = {
            "authors": fields.get("author", "Unknown"),
            "title": fields.get("title", ""),
            "year": year,
            "source": source,
            "type": entry_type,
        }

    return bib_data


# ─── Helper para escribir CSV ───────────────────────────────────

def write_csv(filename, headers, rows):
    path = OUTPUT_DIR / filename
    with open(path, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(headers)
        writer.writerows(rows)
    print(f"  ✓ {filename}: {len(rows)} filas")
    return path


# ═══════════════════════════════════════════════════════════════
#  MAIN
# ═══════════════════════════════════════════════════════════════

def main():
    # Leer CSV fuente
    with open(INPUT_CSV, "r", encoding="utf-8") as f:
        reader = csv.DictReader(f, delimiter="\t")
        rows = list(reader)
    print(f"Leídas {len(rows)} filas de {INPUT_CSV}\n")

    # ─── 1. Dimension ──────────────────────────────────────────
    dim_ids = {}
    dim_rows = []
    for i, (code, (c, name)) in enumerate(sorted(DIMS.items()), 1):
        dim_ids[code] = i
        dim_rows.append([i, c, name])
    write_csv("dimension.csv", ["id_dimension", "code", "name"], dim_rows)

    # ─── 2. Granularity ────────────────────────────────────────
    gran_ids = {}
    gran_rows = []
    for i, (code, (c, name)) in enumerate(sorted(GRANS.items()), 1):
        gran_ids[code] = i
        gran_rows.append([i, c, name])
    write_csv("granularity.csv", ["id_granularity", "code", "name"], gran_rows)

    # ─── 3. Attribute ──────────────────────────────────────────
    all_attrs = {}  # symbol → description
    for row in rows:
        for sym, desc in parse_attributes(row.get("Required_attributes", "")):
            if sym not in all_attrs:
                all_attrs[sym] = desc

    attr_ids = {}
    attr_rows = []
    for i, sym in enumerate(sorted(all_attrs.keys()), 1):
        attr_ids[sym] = i
        attr_rows.append([i, sym, all_attrs[sym]])
    write_csv("attribute.csv", ["id_attribute", "name", "description"], attr_rows)

    # ─── 4. Reference (desde el .bib) ─────────────────────────
    # Primero: recoger qué citation_keys se usan en los indicadores
    used_keys = set()
    for row in rows:
        for key, _ in parse_references(row.get("references_keys", ""),
                                       row.get("references_formatted", "")):
            if key != "ADDED_FOR_COMPLETENESS":
                used_keys.add(key)

    # Segundo: parsear el .bib completo
    bib_data = parse_bib_file(BIB_FILE)
    print(f"  .bib parseado: {len(bib_data)} entradas totales, {len(used_keys)} usadas en indicadores")

    # Tercero: generar reference.csv solo con las keys usadas, datos del .bib
    ref_ids = {}
    ref_rows = []
    missing_in_bib = []
    for i, key in enumerate(sorted(used_keys), 1):
        ref_ids[key] = i
        if key in bib_data:
            b = bib_data[key]
            ref_rows.append([i, key, b["authors"], b["title"], b["year"] or "", b["source"]])
        else:
            # Fallback: datos parciales del CSV
            missing_in_bib.append(key)
            ref_rows.append([i, key, "Unknown", "", "", ""])

    if missing_in_bib:
        print(f"  ⚠ Keys en CSV pero no en .bib: {missing_in_bib}")

    write_csv("reference.csv",
              ["id_reference", "citation_key", "authors", "title", "year", "source"],
              ref_rows)

    # ─── 5. Parameter ──────────────────────────────────────────
    all_params = {}
    for row in rows:
        for sym, domain, constraint in parse_params(row.get("Params", "")):
            if sym not in all_params:
                meta = PARAM_META.get(sym, {"name": sym, "domain": domain, "type": "extra_input"})
                all_params[sym] = {
                    "symbol": sym,
                    "name": meta["name"],
                    "domain": meta.get("domain", domain),
                    "constraint": constraint,
                    "parameter_type": meta["type"],
                }
            elif constraint and not all_params[sym].get("constraint"):
                all_params[sym]["constraint"] = constraint

        for sym, desc in parse_extra_inputs(row.get("Extra_input", "")):
            if sym not in all_params:
                meta = PARAM_META.get(sym, {"name": sym, "domain": "", "type": "extra_input"})
                all_params[sym] = {
                    "symbol": sym, "name": meta["name"],
                    "domain": meta.get("domain", ""),
                    "constraint": None, "parameter_type": "extra_input",
                }

    param_ids = {}
    param_rows = []
    for i, sym in enumerate(sorted(all_params.keys()), 1):
        param_ids[sym] = i
        p = all_params[sym]
        param_rows.append([i, p["symbol"], p["name"], p["domain"],
                           p.get("constraint", ""), p["parameter_type"], ""])
    write_csv("parameter.csv",
              ["id_parameter", "symbol", "name", "domain", "constraint",
               "parameter_type", "description"],
              param_rows)

    # ─── 6. ExtraInput ─────────────────────────────────────────
    all_extra = {}  # symbol → description
    for row in rows:
        for sym, desc in parse_extra_inputs(row.get("Extra_input", "")):
            if sym not in all_extra:
                all_extra[sym] = desc

    ei_rows = []
    ei_id = 1
    for sym in sorted(all_extra.keys()):
        if sym in param_ids:
            ei_rows.append([ei_id, param_ids[sym],
                            EXTRA_INPUT_TYPE.get(sym, "other"), all_extra[sym]])
            ei_id += 1
    write_csv("extra_input.csv",
              ["id_extra_input", "id_parameter", "input_type", "description"],
              ei_rows)

    # ─── 7. Indicator ──────────────────────────────────────────
    ind_rows = []
    ia_rows = []   # indicator_attribute
    ip_rows = []   # indicator_parameter
    ir_rows = []   # indicator_reference

    ia_seen = set()
    ip_seen = set()
    ir_seen = set()

    for idx, row in enumerate(rows):
        ind_id = idx + 1
        desired = DESIRED_MAP.get(row.get("Desired_value", ""), row.get("Desired_value", ""))

        ind_rows.append([
            ind_id,
            "",  # id_parent_indicator (vacío por ahora)
            row["Slug"],
            row["Name"],
            dim_ids.get(row["Dimension"], ""),
            gran_ids.get(row["Granularity"], ""),
            row.get("Explanation", ""),
            row.get("Potential_use", ""),
            row.get("Assumptions", ""),
            desired or "",
            row.get("Function_name", ""),
            row.get("Formalization_latex", ""),
            row.get("Formalization_fp", ""),
            row.get("Description_fp", ""),
        ])

        # ─ indicator_attribute
        for sym, _ in parse_attributes(row.get("Required_attributes", "")):
            if sym in attr_ids:
                key = (ind_id, attr_ids[sym])
                if key not in ia_seen:
                    ia_seen.add(key)
                    ia_rows.append([ind_id, attr_ids[sym]])

        # ─ indicator_parameter
        parsed_params = parse_params(row.get("Params", ""))
        extra_syms = [s for s, _ in parse_extra_inputs(row.get("Extra_input", ""))]
        all_syms_in_row = [s for s, _, _ in parsed_params]
        pos = 1
        for sym, _, _ in parsed_params:
            if sym in param_ids:
                key = (ind_id, param_ids[sym])
                if key not in ip_seen:
                    ip_seen.add(key)
                    ip_rows.append([ind_id, param_ids[sym], pos])
                    pos += 1
        for sym in extra_syms:
            if sym not in all_syms_in_row and sym in param_ids:
                key = (ind_id, param_ids[sym])
                if key not in ip_seen:
                    ip_seen.add(key)
                    ip_rows.append([ind_id, param_ids[sym], pos])
                    pos += 1

        # ─ indicator_reference
        for key, _ in parse_references(row.get("references_keys", ""),
                                       row.get("references_formatted", "")):
            if key in ref_ids:
                rkey = (ind_id, ref_ids[key])
                if rkey not in ir_seen:
                    ir_seen.add(rkey)
                    ir_rows.append([ind_id, ref_ids[key]])

    write_csv("indicator.csv",
              ["id_indicator", "id_parent_indicator", "slug", "name",
               "id_dimension", "id_granularity", "explanation", "potential_use",
               "assumptions", "desired_value", "function_name",
               "formalization_latex", "formalization_fp", "description_fp"],
              ind_rows)

    write_csv("indicator_attribute.csv",
              ["id_indicator", "id_attribute"], ia_rows)

    write_csv("indicator_parameter.csv",
              ["id_indicator", "id_parameter", "position"], ip_rows)

    write_csv("indicator_reference.csv",
              ["id_indicator", "id_reference"], ir_rows)

    # ─── Resumen ────────────────────────────────────────────────
    print(f"\n{'═'*50}")
    print(f"  CSVs generados en: {OUTPUT_DIR}/")
    print(f"  Total indicadores: {len(ind_rows)}")
    print(f"{'═'*50}")


if __name__ == "__main__":
    main()
