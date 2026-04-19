-- ═══════════════════════════════════════════════════════════════
--  BASE DE DATOS PPI — Población de datos con \copy
--  Motor: PostgreSQL
--  Ejecutar DESDE la carpeta sql/:  psql -d ppi_bdd -f poblar_base_datos.sql
--
--  PREREQUISITOS:
--    1. Haber ejecutado crear_base_datos.sql primero
--    2. Los CSVs normalizados deben estar en ../data/csv_normalizados/
--       (generados con: python normalizar_csv.py desde la carpeta sql/)
--
--  NOTA: \copy es un meta-comando de psql que lee archivos desde
--        el cliente (no requiere permisos de superusuario).
--        Las rutas son relativas al directorio desde donde se ejecuta psql.
-- ═══════════════════════════════════════════════════════════════

-- ─── Tablas de catálogo ────────────────────────────────────────

\copy dimension (id_dimension, code, name) FROM '../data/csv_normalizados/dimension.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

\copy granularity (id_granularity, code, name) FROM '../data/csv_normalizados/granularity.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

\copy attribute (id_attribute, name, description) FROM '../data/csv_normalizados/attribute.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

\copy reference (id_reference, citation_key, authors, title, year, source) FROM '../data/csv_normalizados/reference.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8', NULL '');

\copy parameter (id_parameter, symbol, name, domain, "constraint", parameter_type, description) FROM '../data/csv_normalizados/parameter.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8', NULL '');

\copy extra_input (id_extra_input, id_parameter, input_type, description) FROM '../data/csv_normalizados/extra_input.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

-- ─── Tabla principal ───────────────────────────────────────────

\copy indicator (id_indicator, id_parent_indicator, slug, name, id_dimension, id_granularity, explanation, potential_use, assumptions, desired_value, function_name, formalization_latex, formalization_fp, description_fp) FROM '../data/csv_normalizados/indicator.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8', NULL '');

-- ─── Tablas intermedias (N:M) ──────────────────────────────────

\copy indicator_attribute (id_indicator, id_attribute) FROM '../data/csv_normalizados/indicator_attribute.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

\copy indicator_parameter (id_indicator, id_parameter, position) FROM '../data/csv_normalizados/indicator_parameter.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

\copy indicator_reference (id_indicator, id_reference) FROM '../data/csv_normalizados/indicator_reference.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

-- ─── Sincronizar secuencias SERIAL ─────────────────────────────
-- Después de cargar con IDs explícitos, hay que actualizar las
-- secuencias para que el próximo INSERT use el ID correcto.

SELECT setval('dimension_id_dimension_seq',     (SELECT MAX(id_dimension)    FROM dimension));
SELECT setval('granularity_id_granularity_seq',  (SELECT MAX(id_granularity)  FROM granularity));
SELECT setval('attribute_id_attribute_seq',      (SELECT MAX(id_attribute)    FROM attribute));
SELECT setval('reference_id_reference_seq',      (SELECT MAX(id_reference)    FROM reference));
SELECT setval('parameter_id_parameter_seq',      (SELECT MAX(id_parameter)    FROM parameter));
SELECT setval('extra_input_id_extra_input_seq',  (SELECT MAX(id_extra_input)  FROM extra_input));
SELECT setval('indicator_id_indicator_seq',      (SELECT MAX(id_indicator)    FROM indicator));

-- ─── Verificación rápida ───────────────────────────────────────

SELECT 'dimension'            AS tabla, COUNT(*) AS registros FROM dimension
UNION ALL
SELECT 'granularity',                   COUNT(*) FROM granularity
UNION ALL
SELECT 'attribute',                     COUNT(*) FROM attribute
UNION ALL
SELECT 'reference',                     COUNT(*) FROM reference
UNION ALL
SELECT 'parameter',                     COUNT(*) FROM parameter
UNION ALL
SELECT 'extra_input',                   COUNT(*) FROM extra_input
UNION ALL
SELECT 'indicator',                     COUNT(*) FROM indicator
UNION ALL
SELECT 'indicator_attribute',           COUNT(*) FROM indicator_attribute
UNION ALL
SELECT 'indicator_parameter',           COUNT(*) FROM indicator_parameter
UNION ALL
SELECT 'indicator_reference',           COUNT(*) FROM indicator_reference
ORDER BY tabla;

-- ═══════════════════════════════════════════════════════════════
--  FIN — Base de datos poblada
-- ═══════════════════════════════════════════════════════════════
