PPI Data Extraction Script
==========================

DESCRIPTION:
This script extracts Process Performance Indicator (PPI) data from 3 LaTeX files
and merges them into comprehensive CSV files with automatic command expansion.

FILES:
- script.py: Main extraction and merging script

INPUT FILES (in docs/ subfolder):
- PPI Definitions.tex: ~305 indicators with formal definitions
- PPI Descriptions.tex: ~305 indicators with explanations
- PPI for Engineers.tex: ~309 indicators with formulas for engineers

OUTPUT FILES (in data/ subfolder):
- definitions_extracted.csv: Extracted data from Definitions file
- descriptions_extracted.csv: Extracted data from Descriptions file
- engineers_extracted.csv: Extracted data from Engineers file
- final_all_data.csv: All unique indicators merged (322 total)
- final_data.csv: Complete indicators only (272 clean rows)
  * Includes only rows with non-empty: Formalization_latex, Explanation, Formalization_fp

FEATURES:
- Auto-extracts LaTeX \newcommand definitions from preambles
- Expands commands in table data (dimensions, granularities, attributes, functions)
- Handles complex multi-line rows with \newline and \begin{cases}...\end{cases}
- Respects different table formats (uses \hline for Engineers, \\\\ for others)
- Generates slugs: indicator-name-D-G (D=dimension, G=granularity)
- Cleans attribute lists: removes \bm{}, converts \newline to semicolons
- Merges data from 3 sources with outer join (no indicator lost)

USAGE:
python3 script.py

The script will create the data/ directory if needed and write all output files.

CSV FORMAT:
- Delimiter: TAB (\t)
- Encoding: UTF-8
- All LaTeX math notation preserved for analysis

DATA MAPPING:
- Dimensions: T (time), C (cost), Q (quality), F (flexibility), G (general)
- Granularities: I (activity-instance), A (activity), C (case), G (group-of-cases)
