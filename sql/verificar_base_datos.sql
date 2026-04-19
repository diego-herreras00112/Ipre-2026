-- ===================================================================
--  VERIFICACION DE LA BASE DE DATOS PPI
--  Ejecutar despues de crear_base_datos.sql + poblar_base_datos.sql
--  Uso:  psql -U postgres -d ppi_bdd -f verificar_base_datos.sql
-- ===================================================================

-- Forzar encoding UTF-8 para que caracteres especiales no rompan
SET client_encoding = 'UTF8';

\echo ''
\echo '==================================================='
\echo '  1. CONTEO DE REGISTROS POR TABLA'
\echo '==================================================='

SELECT 'dimension'            AS tabla, COUNT(*) AS registros FROM dimension
UNION ALL SELECT 'granularity',          COUNT(*) FROM granularity
UNION ALL SELECT 'attribute',            COUNT(*) FROM attribute
UNION ALL SELECT 'reference',            COUNT(*) FROM reference
UNION ALL SELECT 'parameter',            COUNT(*) FROM parameter
UNION ALL SELECT 'extra_input',          COUNT(*) FROM extra_input
UNION ALL SELECT 'indicator',            COUNT(*) FROM indicator
UNION ALL SELECT 'indicator_attribute',  COUNT(*) FROM indicator_attribute
UNION ALL SELECT 'indicator_parameter',  COUNT(*) FROM indicator_parameter
UNION ALL SELECT 'indicator_reference',  COUNT(*) FROM indicator_reference
ORDER BY tabla;

\echo ''
\echo '  Conteos esperados:'
\echo '    dimension:            5'
\echo '    granularity:          4'
\echo '    attribute:           21'
\echo '    reference:           35'
\echo '    parameter:           15'
\echo '    extra_input:         12'
\echo '    indicator:          307'
\echo '    indicator_attribute:1096'
\echo '    indicator_parameter: 415'
\echo '    indicator_reference: 799'

\echo ''
\echo '==================================================='
\echo '  2. DISTRIBUCION DE INDICADORES POR DIMENSION'
\echo '==================================================='

SELECT d.code, d.name AS dimension, COUNT(i.id_indicator) AS indicadores
FROM dimension d
LEFT JOIN indicator i ON i.id_dimension = d.id_dimension
GROUP BY d.code, d.name
ORDER BY d.code;

\echo ''
\echo '==================================================='
\echo '  3. DISTRIBUCION POR GRANULARIDAD'
\echo '==================================================='

SELECT g.code, g.name AS granularity, COUNT(i.id_indicator) AS indicadores
FROM granularity g
LEFT JOIN indicator i ON i.id_granularity = g.id_granularity
GROUP BY g.code, g.name
ORDER BY g.code;

\echo ''
\echo '==================================================='
\echo '  4. DIMENSION x GRANULARIDAD (TABLA CRUZADA)'
\echo '==================================================='

SELECT d.code AS dim,
       COUNT(*) FILTER (WHERE g.code = 'I') AS "Instance",
       COUNT(*) FILTER (WHERE g.code = 'A') AS "Activity",
       COUNT(*) FILTER (WHERE g.code = 'C') AS "Case",
       COUNT(*) FILTER (WHERE g.code = 'G') AS "Group",
       COUNT(*) AS total
FROM indicator i
JOIN dimension d ON i.id_dimension = d.id_dimension
JOIN granularity g ON i.id_granularity = g.id_granularity
GROUP BY d.code
ORDER BY d.code;

\echo ''
\echo '==================================================='
\echo '  5. TOP 10 ATRIBUTOS MAS USADOS'
\echo '==================================================='

SELECT a.name AS atributo, COUNT(*) AS indicadores_que_lo_usan
FROM indicator_attribute ia
JOIN attribute a ON ia.id_attribute = a.id_attribute
GROUP BY a.name
ORDER BY COUNT(*) DESC
LIMIT 10;

\echo ''
\echo '==================================================='
\echo '  6. TOP 10 REFERENCIAS MAS CITADAS'
\echo '==================================================='

SELECT r.citation_key,
       r.year,
       COUNT(*) AS indicadores_que_la_citan
FROM indicator_reference ir
JOIN reference r ON ir.id_reference = r.id_reference
GROUP BY r.citation_key, r.year
ORDER BY COUNT(*) DESC
LIMIT 10;

\echo ''
\echo '==================================================='
\echo '  7. REFERENCIAS CON DATOS COMPLETOS'
\echo '==================================================='

SELECT
    COUNT(*) AS total_refs,
    COUNT(NULLIF(title, '')) AS con_titulo,
    COUNT(NULLIF(source, '')) AS con_fuente,
    COUNT(year) AS con_anio
FROM reference;

\echo ''
\echo '==================================================='
\echo '  8. COMPLETITUD DE CAMPOS EN INDICATOR'
\echo '      (campos vacios o NULL por cada columna)'
\echo '==================================================='

SELECT
    'slug'                AS campo,
    COUNT(*) FILTER (WHERE slug IS NULL OR slug = '')                AS vacios
FROM indicator
UNION ALL SELECT
    'name',
    COUNT(*) FILTER (WHERE name IS NULL OR name = '')
FROM indicator
UNION ALL SELECT
    'explanation',
    COUNT(*) FILTER (WHERE explanation IS NULL OR explanation = '')
FROM indicator
UNION ALL SELECT
    'potential_use',
    COUNT(*) FILTER (WHERE potential_use IS NULL OR potential_use = '')
FROM indicator
UNION ALL SELECT
    'assumptions',
    COUNT(*) FILTER (WHERE assumptions IS NULL OR assumptions = '')
FROM indicator
UNION ALL SELECT
    'desired_value',
    COUNT(*) FILTER (WHERE desired_value IS NULL OR desired_value = '')
FROM indicator
UNION ALL SELECT
    'function_name',
    COUNT(*) FILTER (WHERE function_name IS NULL OR function_name = '')
FROM indicator
UNION ALL SELECT
    'formalization_latex',
    COUNT(*) FILTER (WHERE formalization_latex IS NULL OR formalization_latex = '')
FROM indicator
UNION ALL SELECT
    'formalization_fp',
    COUNT(*) FILTER (WHERE formalization_fp IS NULL OR formalization_fp = '')
FROM indicator
UNION ALL SELECT
    'description_fp',
    COUNT(*) FILTER (WHERE description_fp IS NULL OR description_fp = '')
FROM indicator
ORDER BY campo;

\echo ''
\echo '==================================================='
\echo '  9. INDICADORES SIN ASSUMPTIONS NI DESIRED_VALUE'
\echo '     (19 contadores simples - es esperado)'
\echo '==================================================='

SELECT id_indicator, LEFT(name, 60) AS name
FROM indicator
WHERE (assumptions IS NULL OR TRIM(assumptions) = '')
   OR (desired_value IS NULL OR TRIM(desired_value) = '')
ORDER BY id_indicator;

\echo ''
\echo '==================================================='
\echo '  10. INTEGRIDAD REFERENCIAL -- HUERFANOS'
\echo '==================================================='

SELECT 'ind_attribute sin indicador' AS verificacion,
       COUNT(*) AS huerfanos
FROM indicator_attribute ia
WHERE NOT EXISTS (SELECT 1 FROM indicator i WHERE i.id_indicator = ia.id_indicator)
UNION ALL
SELECT 'ind_attribute sin atributo',
       COUNT(*)
FROM indicator_attribute ia
WHERE NOT EXISTS (SELECT 1 FROM attribute a WHERE a.id_attribute = ia.id_attribute)
UNION ALL
SELECT 'ind_parameter sin indicador',
       COUNT(*)
FROM indicator_parameter ip
WHERE NOT EXISTS (SELECT 1 FROM indicator i WHERE i.id_indicator = ip.id_indicator)
UNION ALL
SELECT 'ind_parameter sin parametro',
       COUNT(*)
FROM indicator_parameter ip
WHERE NOT EXISTS (SELECT 1 FROM parameter p WHERE p.id_parameter = ip.id_parameter)
UNION ALL
SELECT 'ind_reference sin referencia',
       COUNT(*)
FROM indicator_reference ir
WHERE NOT EXISTS (SELECT 1 FROM reference r WHERE r.id_reference = ir.id_reference);

\echo ''
\echo '==================================================='
\echo '  11. MUESTRA COMPLETA: INDICADOR #1'
\echo '      (todos los campos del modelo E/R)'
\echo '==================================================='

-- Expandir columnas para que se vea bien
\x on

SELECT
    i.id_indicator,
    i.id_parent_indicator,
    i.slug,
    i.name,
    d.name              AS dimension,
    g.name              AS granularity,
    i.explanation,
    i.potential_use,
    i.assumptions,
    i.desired_value,
    i.function_name,
    LEFT(i.formalization_latex, 120) AS formalization_latex,
    LEFT(i.formalization_fp, 120)    AS formalization_fp,
    LEFT(i.description_fp, 120)      AS description_fp
FROM indicator i
JOIN dimension d ON i.id_dimension = d.id_dimension
JOIN granularity g ON i.id_granularity = g.id_granularity
WHERE i.id_indicator = 1;

\x off

\echo ''
\echo '  -- Atributos del indicador #1:'
SELECT a.name AS atributo, a.description
FROM indicator_attribute ia
JOIN attribute a ON ia.id_attribute = a.id_attribute
WHERE ia.id_indicator = 1;

\echo '  -- Parametros del indicador #1:'
SELECT ip.position, p.symbol, p.name, p.parameter_type
FROM indicator_parameter ip
JOIN parameter p ON ip.id_parameter = p.id_parameter
WHERE ip.id_indicator = 1
ORDER BY ip.position;

\echo '  -- Referencias del indicador #1:'
SELECT r.citation_key, r.year, LEFT(r.title, 80) AS titulo
FROM indicator_reference ir
JOIN reference r ON ir.id_reference = r.id_reference
WHERE ir.id_indicator = 1;

\echo ''
\echo '==================================================='
\echo '  12. MUESTRA COMPLETA: INDICADOR #150 (mitad de tabla)'
\echo '==================================================='

\x on

SELECT
    i.id_indicator,
    i.id_parent_indicator,
    i.slug,
    i.name,
    d.name              AS dimension,
    g.name              AS granularity,
    i.explanation,
    i.potential_use,
    i.assumptions,
    i.desired_value,
    i.function_name,
    LEFT(i.formalization_latex, 120) AS formalization_latex,
    LEFT(i.formalization_fp, 120)    AS formalization_fp,
    LEFT(i.description_fp, 120)      AS description_fp
FROM indicator i
JOIN dimension d ON i.id_dimension = d.id_dimension
JOIN granularity g ON i.id_granularity = g.id_granularity
WHERE i.id_indicator = 150;

\x off

\echo '  -- Atributos del indicador #150:'
SELECT a.name AS atributo, a.description
FROM indicator_attribute ia
JOIN attribute a ON ia.id_attribute = a.id_attribute
WHERE ia.id_indicator = 150;

\echo '  -- Parametros del indicador #150:'
SELECT ip.position, p.symbol, p.name, p.parameter_type
FROM indicator_parameter ip
JOIN parameter p ON ip.id_parameter = p.id_parameter
WHERE ip.id_indicator = 150
ORDER BY ip.position;

\echo '  -- Referencias del indicador #150:'
SELECT r.citation_key, r.year, LEFT(r.title, 80) AS titulo
FROM indicator_reference ir
JOIN reference r ON ir.id_reference = r.id_reference
WHERE ir.id_indicator = 150;

\echo ''
\echo '==================================================='
\echo '  VERIFICACION COMPLETADA'
\echo '==================================================='
