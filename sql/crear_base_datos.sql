-- ═══════════════════════════════════════════════════════════════
--  BASE DE DATOS PPI — Creación de estructura (DDL)
--  Motor: PostgreSQL
--  Modelo E/R post-reunión 2026-04-07
-- ═══════════════════════════════════════════════════════════════

-- Eliminar tablas si existen (orden inverso de dependencias)
DROP TABLE IF EXISTS indicator_reference CASCADE;
DROP TABLE IF EXISTS indicator_parameter CASCADE;
DROP TABLE IF EXISTS indicator_attribute CASCADE;
DROP TABLE IF EXISTS extra_input CASCADE;
DROP TABLE IF EXISTS indicator CASCADE;
DROP TABLE IF EXISTS parameter CASCADE;
DROP TABLE IF EXISTS attribute CASCADE;
DROP TABLE IF EXISTS reference CASCADE;
DROP TABLE IF EXISTS translation CASCADE;
DROP TABLE IF EXISTS granularity CASCADE;
DROP TABLE IF EXISTS dimension CASCADE;

-- ═══════════════════════════════════════════════════════════════
--  TABLAS DE CATÁLOGO
-- ═══════════════════════════════════════════════════════════════

CREATE TABLE dimension (
    id_dimension   SERIAL PRIMARY KEY,
    code           VARCHAR(1)  NOT NULL UNIQUE,
    name           VARCHAR(50) NOT NULL
);

CREATE TABLE granularity (
    id_granularity SERIAL PRIMARY KEY,
    code           VARCHAR(2)  NOT NULL UNIQUE,
    name           VARCHAR(50) NOT NULL
);

-- ═══════════════════════════════════════════════════════════════
--  TRADUCCIÓN DE COMANDOS LATEX
-- ═══════════════════════════════════════════════════════════════

CREATE TABLE translation (
    id_translation  SERIAL PRIMARY KEY,
    command         VARCHAR(100) NOT NULL UNIQUE,
    latex_expansion VARCHAR(255) NOT NULL,
    category        VARCHAR(20),
    description     TEXT
);

-- ═══════════════════════════════════════════════════════════════
--  REFERENCIAS BIBLIOGRÁFICAS
-- ═══════════════════════════════════════════════════════════════

CREATE TABLE reference (
    id_reference   SERIAL PRIMARY KEY,
    citation_key   VARCHAR(100) NOT NULL UNIQUE,
    authors        TEXT NOT NULL,
    title          TEXT,
    year           INT,
    source         TEXT
);

-- ═══════════════════════════════════════════════════════════════
--  ATRIBUTOS DEL EVENT LOG
-- ═══════════════════════════════════════════════════════════════

CREATE TABLE attribute (
    id_attribute   SERIAL PRIMARY KEY,
    name           VARCHAR(50) NOT NULL UNIQUE,
    description    TEXT
);

-- ═══════════════════════════════════════════════════════════════
--  PARÁMETROS FORMALES
-- ═══════════════════════════════════════════════════════════════

CREATE TABLE parameter (
    id_parameter    SERIAL PRIMARY KEY,
    symbol          VARCHAR(50)  NOT NULL,
    name            VARCHAR(100),
    domain          VARCHAR(100),
    "constraint"    TEXT,
    parameter_type  VARCHAR(20)  NOT NULL,
    description     TEXT
);

-- ═══════════════════════════════════════════════════════════════
--  EXTRA INPUTS
-- ═══════════════════════════════════════════════════════════════

CREATE TABLE extra_input (
    id_extra_input  SERIAL PRIMARY KEY,
    id_parameter    INT NOT NULL REFERENCES parameter(id_parameter),
    input_type      VARCHAR(50),
    description     TEXT
);

-- ═══════════════════════════════════════════════════════════════
--  TABLA PRINCIPAL — INDICATOR
-- ═══════════════════════════════════════════════════════════════

CREATE TABLE indicator (
    id_indicator        SERIAL PRIMARY KEY,
    id_parent_indicator INT REFERENCES indicator(id_indicator),
    slug                VARCHAR(150) NOT NULL UNIQUE,
    name                VARCHAR(255) NOT NULL,
    id_dimension        INT REFERENCES dimension(id_dimension),
    id_granularity      INT REFERENCES granularity(id_granularity),
    explanation         TEXT,
    potential_use       TEXT,
    assumptions         TEXT,
    desired_value       VARCHAR(10),
    function_name       TEXT,
    formalization_latex TEXT,
    formalization_fp    TEXT,
    description_fp      TEXT
);

-- ═══════════════════════════════════════════════════════════════
--  TABLAS INTERMEDIAS (N:M)
-- ═══════════════════════════════════════════════════════════════

CREATE TABLE indicator_attribute (
    id_indicator INT NOT NULL REFERENCES indicator(id_indicator),
    id_attribute INT NOT NULL REFERENCES attribute(id_attribute),
    PRIMARY KEY (id_indicator, id_attribute)
);

CREATE TABLE indicator_parameter (
    id_indicator INT NOT NULL REFERENCES indicator(id_indicator),
    id_parameter INT NOT NULL REFERENCES parameter(id_parameter),
    position     INT NOT NULL,
    PRIMARY KEY (id_indicator, id_parameter)
);

CREATE TABLE indicator_reference (
    id_indicator INT NOT NULL REFERENCES indicator(id_indicator),
    id_reference INT NOT NULL REFERENCES reference(id_reference),
    PRIMARY KEY (id_indicator, id_reference)
);

-- ═══════════════════════════════════════════════════════════════
--  FIN DEL DDL
--  Para poblar la base de datos, ejecutar: poblar_base_datos.sql
-- ═══════════════════════════════════════════════════════════════
