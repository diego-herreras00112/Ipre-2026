#!/usr/bin/env python3
"""
PPI Data Extraction and Merging Script

Extracts Process Performance Indicator (PPI) data from 3 LaTeX files:
  1. PPI Definitions.tex
  2. PPI Descriptions.tex
  3. PPI for Engineers.tex

Merges extracted data into comprehensive CSV files with command expansion.
"""

import os
import re
import csv
import json
from pathlib import Path
from collections import defaultdict
from typing import Dict, List, Tuple, Optional, Set


class LatexCommandParser:
    """Parses LaTeX command definitions from document preambles."""

    def __init__(self):
        self.commands: Dict[str, str] = {}
        self.parametric_commands: Set[str] = set()

    def extract_commands_from_preamble(self, content: str) -> None:
        """
        Extract all \\newcommand definitions from preamble (before \\begin{document}).

        Handles:
          - Simple: \\newcommand{\\name}{definition}
          - Parametric: \\newcommand{\\name}[N]{definition}

        Parametric commands are stored separately (skip normal expansion).
        """
        doc_start = content.find(r'\begin{document}')
        preamble = content[:doc_start] if doc_start != -1 else content

        # Pattern for both simple and parametric newcommands
        pattern = r'\\newcommand\s*\{\\([a-zA-Z]+)\}\s*(?:\[(\d+)\])?\s*\{([^}]+)\}'

        matches = re.finditer(pattern, preamble)
        for match in matches:
            cmd_name = match.group(1)
            num_params = match.group(2)
            definition = match.group(3)

            if num_params:
                # Parametric command - mark but don't store expansion
                self.parametric_commands.add(cmd_name)
            else:
                # Simple command - store for expansion
                self.commands[cmd_name] = definition

    def expand_command(self, cmd_name: str) -> Optional[str]:
        """Expand a single command by name."""
        return self.commands.get(cmd_name)

    def expand_text(self, text: str) -> str:
        """
        Expand all commands in text recursively.

        Special handling for:
          - \\universe[opt]{req} -> U^{opt}_{req}
          - \\attribute[opt]{req} -> #^{opt}_{req}
          - Regular \\cmdname -> definition
        """
        if not text:
            return text

        # Handle parametric commands first
        # \\universe[opt]{req} pattern
        text = re.sub(
            r'\\universe\s*\[([^\]]*)\]\s*\{([^}]+)\}',
            lambda m: 'U^{' + m.group(1) + '}_{' + m.group(2) + '}',
            text
        )
        # \\universe{req} pattern (no optional arg)
        text = re.sub(
            r'\\universe\s*\{([^}]+)\}',
            lambda m: 'U^{}_{' + m.group(1) + '}',
            text
        )

        # \\attribute[opt]{req} pattern
        text = re.sub(
            r'\\attribute\s*\[([^\]]*)\]\s*\{([^}]+)\}',
            lambda m: '#^{' + m.group(1) + '}_{' + m.group(2) + '}',
            text
        )
        # \\attribute{req} pattern (no optional arg)
        text = re.sub(
            r'\\attribute\s*\{([^}]+)\}',
            lambda m: '#^{}_{' + m.group(1) + '}',
            text
        )

        # Expand regular commands - iterate until no more replacements
        max_iterations = 10
        iteration = 0
        while iteration < max_iterations:
            iteration += 1
            new_text = text

            # Find all command references
            for cmd_name in sorted(self.commands.keys(), key=len, reverse=True):
                # Match \\cmdname not followed by { or [
                pattern = r'\\' + re.escape(cmd_name) + r'(?![a-zA-Z\[\{])'
                replacement = self.commands[cmd_name]
                # Use lambda to avoid issues with backslashes in replacement
                new_text = re.sub(pattern, lambda m: replacement, new_text)

            if new_text == text:
                break
            text = new_text

        return text


class TableRowExtractor:
    """Extracts rows from LaTeX longtables with proper handling of complex content."""

    @staticmethod
    def is_structural_line(line: str) -> bool:
        """Check if line is structural (header, footer, etc.)."""
        structural = [
            r'\toprule', r'\midrule', r'\bottomrule', r'\hline',
            r'\endhead', r'\endfirsthead', r'\endfoot', r'\endlastfoot',
            r'\caption', r'\label', r'\textbf'
        ]
        return any(struct in line for struct in structural)

    @staticmethod
    def is_row_start(text: str) -> bool:
        """Check if text looks like the start of a data row."""
        # Data rows typically don't start with structural commands
        return not TableRowExtractor.is_structural_line(text.strip())

    @staticmethod
    def _strip_latex_comments(content: str) -> str:
        """
        Remove LaTeX comments from content.

        In LaTeX, '%' starts a comment that runs to the end of the line,
        UNLESS it is escaped as '\\%'.  This must run BEFORE any splitting
        so that comment lines are never concatenated with real data rows.

        Example that caused bugs in PPI for Engineers.tex:
            %aqui definir los max?
            Lead Time (group of cases granularity) & ...
        After split by \\hline the whole fragment started with '%', so
        is_structural_line() discarded the real indicator row.
        """
        cleaned_lines = []
        for line in content.split('\n'):
            result = []
            i = 0
            while i < len(line):
                if line[i] == '\\':
                    result.append(line[i])
                    if i + 1 < len(line):
                        result.append(line[i + 1])
                        i += 2
                    else:
                        i += 1
                elif line[i] == '%':
                    break
                else:
                    result.append(line[i])
                    i += 1
            cleaned_lines.append(''.join(result))
        return '\n'.join(cleaned_lines)

    @staticmethod
    def _strip_structural_lines(content: str) -> str:
        """
        Pre-process table content to remove lines that are purely structural
        (e.g. \\midrule, \\endlastfoot, \\caption{...}) BEFORE splitting by \\\\.

        This prevents structural commands (which lack a trailing \\\\) from being
        concatenated with the first data row during the split, which would cause
        is_structural_line() to discard real data.
        """
        structural_commands = [
            r'\toprule', r'\midrule', r'\bottomrule', r'\hline',
            r'\endhead', r'\endfirsthead', r'\endfoot', r'\endlastfoot',
            r'\caption', r'\label', r'\textbf'
        ]
        cleaned_lines = []
        for line in content.split('\n'):
            stripped = line.strip()
            if not stripped:
                cleaned_lines.append(line)
                continue
            # A line with '&' carries column data — always keep it
            if '&' in stripped:
                cleaned_lines.append(line)
                continue
            # If the line contains any structural command and has no '&',
            # it is a pure structural/header line — drop it
            if any(cmd in stripped for cmd in structural_commands):
                continue
            cleaned_lines.append(line)
        return '\n'.join(cleaned_lines)

    @staticmethod
    def extract_rows_from_content(content: str) -> List[List[str]]:
        """
        Extract data rows from longtable content.

        Uses different strategies depending on row separators found.
        - If \\hline present: split by \\hline (used in Engineers file)
        - Otherwise: split by \\\\ (used in Definitions and Descriptions)
        """
        rows = []

        # Extract longtable environments
        table_pattern = r'\\begin\{longtable\}.*?\\end\{longtable\}'
        tables = re.findall(table_pattern, content, re.DOTALL)

        for table_content in tables:
            # Always strip LaTeX comments first (% to end-of-line).
            # Comments in Engineers.tex appear between \hline and data rows,
            # causing the comment + data to be treated as one fragment that
            # then gets discarded because it starts with '%'.
            table_content = TableRowExtractor._strip_latex_comments(table_content)

            # Determine which row separator to use
            has_hline = r'\hline' in table_content
            has_toprule = r'\toprule' in table_content

            if has_hline:
                # Engineers file format: rows separated by \hline
                row_texts = TableRowExtractor._split_by_hline(table_content)
            else:
                # Strip structural lines BEFORE splitting by \\
                # so they don't contaminate the first data row
                table_content = TableRowExtractor._strip_structural_lines(table_content)
                # Standard format: rows separated by \\
                row_texts = TableRowExtractor._split_by_double_backslash(table_content)

            for row_text in row_texts:
                row_text = row_text.strip()
                if not row_text or TableRowExtractor.is_structural_line(row_text):
                    continue

                # Skip lines with structural markers or LaTeX comments
                if row_text.strip().startswith('%'):
                    continue
                if any(x in row_text for x in [r'\begin{longtable}', r'\end{longtable}',
                                                 r'\caption', r'\label', r'\toprule', r'\midrule',
                                                 r'\hline', r'\endhead', r'\endfoot']):
                    continue

                # Split by & to get columns
                columns = TableRowExtractor.smart_split_by_ampersand(row_text)
                if columns and len(columns) > 1:
                    # Clean columns
                    columns = [col.strip() for col in columns]
                    # Validate: first column should be non-empty and reasonable
                    first_col = columns[0]
                    if first_col and len(first_col) > 2:
                        rows.append(columns)

        return rows

    @staticmethod
    def _split_by_hline(text: str) -> List[str]:
        """Split by \\hline, but collect all content between hlines as one row."""
        rows = []
        parts = text.split(r'\hline')

        for part in parts:
            part = part.strip()
            if part and not TableRowExtractor.is_structural_line(part):
                rows.append(part)

        return rows

    @staticmethod
    def _split_by_double_backslash(text: str) -> List[str]:
        """
        Split by \\\\ respecting \\begin{cases}...\\end{cases} blocks.
        """
        rows = []
        current = []
        i = 0

        while i < len(text):
            # Check for \begin{cases}
            if text[i:i+14] == r'\begin{cases}':
                # Find matching \end{cases}
                end_pos = text.find(r'\end{cases}', i + 14)
                if end_pos == -1:
                    end_pos = len(text)
                else:
                    end_pos += 11

                current.append(text[i:end_pos])
                i = end_pos
                continue

            # Check for \\\ followed by newline (row separator)
            elif text[i:i+3] == '\\\\\n':
                rows.append(''.join(current))
                current = []
                i += 3
                continue

            current.append(text[i])
            i += 1

        if current:
            rows.append(''.join(current))

        return rows


    @staticmethod
    def smart_split_by_ampersand(text: str) -> List[str]:
        """
        Split text by & but respect:
        - Math environments: $...$, \\(...\\), \\[...\\]
        - Braces: {...}
        - Cases: \\begin{cases}...\\end{cases}
        """
        columns = []
        current = []
        i = 0
        in_math = False
        in_dollar = False
        in_paren_math = False
        in_bracket_math = False
        in_cases = False
        brace_depth = 0

        while i < len(text):
            char = text[i]

            # Check for special markers
            if text[i:i+14] == r'\begin{cases}':
                in_cases = True
                current.append(text[i:i+14])
                i += 14
                continue
            elif text[i:i+12] == r'\end{cases}':
                in_cases = False
                current.append(text[i:i+12])
                i += 12
                continue
            elif text[i:i+2] == r'\(':
                in_paren_math = True
                current.append(text[i:i+2])
                i += 2
                continue
            elif text[i:i+2] == r'\)':
                in_paren_math = False
                current.append(text[i:i+2])
                i += 2
                continue
            elif text[i:i+2] == r'\[':
                in_bracket_math = True
                current.append(text[i:i+2])
                i += 2
                continue
            elif text[i:i+2] == r'\]':
                in_bracket_math = False
                current.append(text[i:i+2])
                i += 2
                continue
            elif char == '$':
                in_dollar = not in_dollar
                current.append(char)
                i += 1
                continue
            elif char == '{':
                brace_depth += 1
                current.append(char)
                i += 1
                continue
            elif char == '}':
                brace_depth -= 1
                current.append(char)
                i += 1
                continue
            elif char == '&' and brace_depth == 0 and not in_dollar and not in_paren_math and not in_bracket_math and not in_cases:
                # This is a column separator
                columns.append(''.join(current))
                current = []
                i += 1
                continue
            else:
                current.append(char)
                i += 1

        # Add last column
        if current or columns:
            columns.append(''.join(current))

        return columns


class PPIDefinitionsExtractor:
    """Extracts data from PPI Definitions.tex file."""

    VALID_DIMENSIONS = {'T', 'C', 'Q', 'F', 'G'}
    VALID_GRANULARITIES = {'I', 'A', 'C', 'G'}

    def __init__(self, file_path: str, command_parser: LatexCommandParser):
        self.file_path = file_path
        self.parser = command_parser
        self.data: List[Dict] = []

    def extract(self) -> List[Dict]:
        """Extract all PPI definitions from file."""
        with open(self.file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        # Extract rows
        rows = TableRowExtractor.extract_rows_from_content(content)

        for row in rows:
            if len(row) >= 6:
                indicator = self.parser.expand_text(row[0]).strip()
                dimension = self.parser.expand_text(row[1]).strip()
                granularity = self.parser.expand_text(row[2]).strip()

                # Validate dimension and granularity - skip phantom rows
                if dimension not in self.VALID_DIMENSIONS or granularity not in self.VALID_GRANULARITIES:
                    continue

                params = self.parser.expand_text(row[3]).strip()
                function_name = self.parser.expand_text(row[4]).strip()
                formalization = self.parser.expand_text(row[5]).strip()

                # Skip empty rows
                if indicator:
                    self.data.append({
                        'Indicator': indicator,
                        'Dimension': dimension,
                        'Granularity': granularity,
                        'Params': params,
                        'Function_name': function_name,
                        'Formalization_latex': formalization,
                    })

        return self.data


class PPIDescriptionsExtractor:
    """Extracts data from PPI Descriptions.tex file."""

    VALID_DIMENSIONS = {'T', 'C', 'Q', 'F', 'G'}
    VALID_GRANULARITIES = {'I', 'A', 'C', 'G'}

    def __init__(self, file_path: str, command_parser: LatexCommandParser):
        self.file_path = file_path
        self.parser = command_parser
        self.data: List[Dict] = []

    def _clean_attributes(self, text: str) -> str:
        """Clean attribute text: remove \\bm{}, replace \\newline with semicolon."""
        if not text or text.strip() == '-':
            return ''

        # Remove \bm{...} wrapping
        text = re.sub(r'\\bm\{([^}]+)\}', r'\1', text)
        # Replace \newline with semicolon separator
        text = re.sub(r'\\newline\s*', '; ', text)
        # Clean up $ math delimiters if around whole expression
        text = re.sub(r'^\$(.+)\$$', r'\1', text)
        return text.strip()

    def extract(self) -> List[Dict]:
        """Extract all PPI descriptions from file."""
        with open(self.file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        # Extract rows
        rows = TableRowExtractor.extract_rows_from_content(content)

        for row in rows:
            if len(row) >= 9:
                indicator = self.parser.expand_text(row[0]).strip()
                dimension = row[1].strip()  # Already a letter in this file
                granularity = row[2].strip()  # Already a letter in this file

                # Validate dimension and granularity - skip phantom rows
                if dimension not in self.VALID_DIMENSIONS or granularity not in self.VALID_GRANULARITIES:
                    continue
                explanation = self.parser.expand_text(row[3]).strip()
                potential_use = self.parser.expand_text(row[4]).strip()
                required_attributes = self._clean_attributes(self.parser.expand_text(row[5]))
                extra_input = self._clean_attributes(self.parser.expand_text(row[6]))
                assumptions = self.parser.expand_text(row[7]).strip()
                if assumptions == '-':
                    assumptions = ''
                desired_value = self.parser.expand_text(row[8]).strip()

                # Skip empty rows
                if indicator:
                    self.data.append({
                        'Indicator': indicator,
                        'Dimension': dimension,
                        'Granularity': granularity,
                        'Explanation': explanation,
                        'Potential_use': potential_use,
                        'Required_attributes': required_attributes,
                        'Extra_input': extra_input,
                        'Assumptions': assumptions,
                        'Desired_value': desired_value,
                    })

        return self.data


class PPIEngineersExtractor:
    """Extracts data from PPI for Engineers.tex file."""

    VALID_DIMENSIONS = {'T', 'C', 'Q', 'F', 'G'}
    VALID_GRANULARITIES = {'I', 'A', 'C', 'G'}

    def __init__(self, file_path: str, command_parser: LatexCommandParser):
        self.file_path = file_path
        self.parser = command_parser
        self.data: List[Dict] = []

    def extract(self) -> List[Dict]:
        """Extract all PPI data from engineers file."""
        with open(self.file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        # Extract rows
        rows = TableRowExtractor.extract_rows_from_content(content)

        for row in rows:
            if len(row) >= 4:
                indicator = self.parser.expand_text(row[0]).strip()
                dimension = self.parser.expand_text(row[1]).strip()
                granularity = self.parser.expand_text(row[2]).strip()

                # Validate dimension and granularity - skip phantom rows
                if dimension not in self.VALID_DIMENSIONS or granularity not in self.VALID_GRANULARITIES:
                    continue

                params = self.parser.expand_text(row[3]).strip() if len(row) > 3 else ''

                # Column 5 (index 4) contains formula + description separated by \newline
                formalization_fp = ''
                description_fp = ''
                if len(row) >= 5:
                    formula_desc = self.parser.expand_text(row[4]).strip()
                    # Split by first \newline
                    parts = re.split(r'\\newline\s*', formula_desc, maxsplit=1)
                    formalization_fp = parts[0].strip() if parts else ''
                    description_fp = parts[1].strip() if len(parts) > 1 else ''

                # Skip empty rows
                if indicator:
                    self.data.append({
                        'Indicator': indicator,
                        'Dimension': dimension,
                        'Granularity': granularity,
                        'Params': params,
                        'Formalization_fp': formalization_fp,
                        'Description_fp': description_fp,
                    })

        return self.data


class PPIDataMerger:
    """Merges PPI data from multiple sources."""

    DIMENSION_MAP = {
        'T': 'time',
        'C': 'cost',
        'Q': 'quality',
        'F': 'flexibility',
        'G': 'general',
    }

    GRANULARITY_MAP = {
        'I': 'activity-instance',
        'A': 'activity',
        'C': 'case',
        'G': 'group-of-cases',
    }

    def __init__(self):
        self.definitions: List[Dict] = []
        self.descriptions: List[Dict] = []
        self.engineers: List[Dict] = []

    def load_data(self, definitions: List[Dict], descriptions: List[Dict], engineers: List[Dict]):
        """Load extracted data from all sources."""
        self.definitions = definitions
        self.descriptions = descriptions
        self.engineers = engineers

    def generate_slug(self, indicator: str, dimension: str, granularity: str) -> str:
        """Generate slug from indicator and dimension/granularity."""
        # Get dimension and granularity first letters
        dim_letter = dimension[0].lower() if dimension else 'g'
        gran_letter = granularity[0].lower() if granularity else 'c'

        # Create slug from indicator name
        slug = indicator.lower()
        slug = re.sub(r'[^a-z0-9\s\-]', '', slug)
        slug = re.sub(r'\s+', '-', slug)
        slug = re.sub(r'-+', '-', slug)

        return f"{slug}-{dim_letter}-{gran_letter}"

    @staticmethod
    def _normalize_name(name: str) -> str:
        """
        Normalize indicator name for matching:
        - lowercase
        - collapse whitespace
        - strip redundant granularity parentheticals like '(case granularity)'
          since granularity is already in the G column
        """
        name = name.strip()
        name = re.sub(r'\s+', ' ', name)
        name = name.lower()
        # Remove granularity parentheticals that are redundant with G column
        name = re.sub(r'\s*\((?:activity instance|activity|case|group of cases)\s*granularity\)\s*$', '', name)
        return name.strip()

    def merge_all(self) -> Tuple[List[Dict], List[Dict]]:
        """
        Merge all data sources using case-insensitive name matching.

        Returns:
            (all_data, clean_data)
            where clean_data has non-empty formalization, explanation, and description
        """
        # Create lookup dicts by normalized (Indicator, Dimension, Granularity)
        def make_key(indicator: str, dimension: str, granularity: str) -> Tuple:
            return (self._normalize_name(indicator), dimension.strip(), granularity.strip())

        # Keep track of canonical (original) names — prefer Definitions, then Descriptions
        canonical_names = {}  # norm_key -> original indicator name

        def_map = {}
        for row in self.definitions:
            key = make_key(row['Indicator'], row['Dimension'], row['Granularity'])
            def_map[key] = row
            canonical_names[key] = row['Indicator'].strip()

        desc_map = {}
        for row in self.descriptions:
            key = make_key(row['Indicator'], row['Dimension'], row['Granularity'])
            desc_map[key] = row
            if key not in canonical_names:
                canonical_names[key] = row['Indicator'].strip()

        eng_map = {}
        for row in self.engineers:
            key = make_key(row['Indicator'], row['Dimension'], row['Granularity'])
            eng_map[key] = row
            if key not in canonical_names:
                canonical_names[key] = row['Indicator'].strip()

        # Collect all unique keys
        all_keys = set(def_map.keys()) | set(desc_map.keys()) | set(eng_map.keys())

        all_data = []
        clean_data = []

        for key in sorted(all_keys):
            _, dimension, granularity = key
            indicator = canonical_names.get(key, key[0])

            def_row = def_map.get(key, {})
            desc_row = desc_map.get(key, {})
            eng_row = eng_map.get(key, {})

            merged = {
                'Name': indicator,
                'Slug': self.generate_slug(indicator, dimension, granularity),
                'Dimension': dimension,
                'Granularity': granularity,
                'Params': def_row.get('Params', ''),
                'Function_name': def_row.get('Function_name', ''),
                'Formalization_latex': def_row.get('Formalization_latex', ''),
                'Explanation': desc_row.get('Explanation', ''),
                'Potential_use': desc_row.get('Potential_use', ''),
                'Required_attributes': desc_row.get('Required_attributes', ''),
                'Extra_input': desc_row.get('Extra_input', ''),
                'Assumptions': desc_row.get('Assumptions', ''),
                'Desired_value': desc_row.get('Desired_value', ''),
                'Formalization_fp': eng_row.get('Formalization_fp', ''),
                'Description_fp': eng_row.get('Description_fp', ''),
            }

            all_data.append(merged)

            # Check if this is "clean" (has all three formalizations)
            if (merged['Formalization_latex'] and
                merged['Explanation'] and
                merged['Formalization_fp']):
                clean_data.append(merged)

        return all_data, clean_data


class CSVWriter:
    """Writes data to CSV files with TAB delimiter."""

    @staticmethod
    def write_csv(file_path: str, data: List[Dict], fieldnames: List[str]):
        """Write data to CSV file using TAB delimiter."""
        os.makedirs(os.path.dirname(file_path), exist_ok=True)

        with open(file_path, 'w', newline='', encoding='utf-8') as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames, delimiter='\t')
            writer.writeheader()
            writer.writerows(data)


class PPIExtractor:
    """Main orchestrator for PPI extraction and merging."""

    def __init__(self, base_dir: str):
        self.base_dir = Path(base_dir)
        self.docs_dir = self.base_dir / 'docs'
        self.data_dir = self.base_dir / 'data'
        self.data_dir.mkdir(exist_ok=True)

    def run(self):
        """Run complete extraction and merging pipeline."""
        print("=" * 70)
        print("PPI Data Extraction and Merging")
        print("=" * 70)

        # Step 1: Parse commands from all files
        print("\n[1/6] Parsing LaTeX commands...")
        parsers = self._parse_all_commands()
        print(f"   Found {len(parsers['definitions'].commands)} commands in Definitions")
        print(f"   Found {len(parsers['descriptions'].commands)} commands in Descriptions")
        print(f"   Found {len(parsers['engineers'].commands)} commands in Engineers")

        # Step 2: Extract from Definitions
        print("\n[2/6] Extracting from PPI Definitions.tex...")
        definitions = PPIDefinitionsExtractor(
            str(self.docs_dir / 'PPI Definitions.tex'),
            parsers['definitions']
        ).extract()
        print(f"   Extracted {len(definitions)} PPIs from Definitions")

        # Step 3: Extract from Descriptions
        print("\n[3/6] Extracting from PPI Descriptions.tex...")
        descriptions = PPIDescriptionsExtractor(
            str(self.docs_dir / 'PPI Descriptions.tex'),
            parsers['descriptions']
        ).extract()
        print(f"   Extracted {len(descriptions)} PPIs from Descriptions")

        # Step 4: Extract from Engineers
        print("\n[4/6] Extracting from PPI for Engineers.tex...")
        engineers = PPIEngineersExtractor(
            str(self.docs_dir / 'PPI for Engineers.tex'),
            parsers['engineers']
        ).extract()
        print(f"   Extracted {len(engineers)} PPIs from Engineers")

        # Step 5: Write individual extractions
        print("\n[5/6] Writing extracted data to CSV files...")
        self._write_extraction_csvs(definitions, descriptions, engineers)

        # Step 6: Merge and write final data
        print("\n[6/6] Merging and writing final data...")
        all_data, clean_data = self._merge_and_write(definitions, descriptions, engineers)

        # Print summary
        self._print_summary(definitions, descriptions, engineers, all_data, clean_data)

    def _parse_all_commands(self) -> Dict:
        """Parse commands from all three files."""
        parsers = {}

        for name, filename in [
            ('definitions', 'PPI Definitions.tex'),
            ('descriptions', 'PPI Descriptions.tex'),
            ('engineers', 'PPI for Engineers.tex'),
        ]:
            filepath = self.docs_dir / filename
            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()

            parser = LatexCommandParser()
            parser.extract_commands_from_preamble(content)
            parsers[name] = parser

        return parsers

    def _write_extraction_csvs(self, definitions: List[Dict],
                               descriptions: List[Dict], engineers: List[Dict]):
        """Write individual extraction CSVs."""
        CSVWriter.write_csv(
            str(self.data_dir / 'definitions_extracted.csv'),
            definitions,
            ['Indicator', 'Dimension', 'Granularity', 'Params',
             'Function_name', 'Formalization_latex']
        )
        print(f"   Wrote definitions_extracted.csv")

        CSVWriter.write_csv(
            str(self.data_dir / 'descriptions_extracted.csv'),
            descriptions,
            ['Indicator', 'Dimension', 'Granularity', 'Explanation',
             'Potential_use', 'Required_attributes', 'Extra_input',
             'Assumptions', 'Desired_value']
        )
        print(f"   Wrote descriptions_extracted.csv")

        CSVWriter.write_csv(
            str(self.data_dir / 'engineers_extracted.csv'),
            engineers,
            ['Indicator', 'Dimension', 'Granularity', 'Params',
             'Formalization_fp', 'Description_fp']
        )
        print(f"   Wrote engineers_extracted.csv")

    def _merge_and_write(self, definitions: List[Dict],
                        descriptions: List[Dict], engineers: List[Dict]) -> Tuple[List[Dict], List[Dict]]:
        """Merge all data and write final CSVs."""
        merger = PPIDataMerger()
        merger.load_data(definitions, descriptions, engineers)
        all_data, clean_data = merger.merge_all()

        # Write final_all_data.csv
        all_columns = [
            'Name', 'Slug', 'Dimension', 'Granularity', 'Params',
            'Function_name', 'Formalization_latex', 'Explanation',
            'Potential_use', 'Required_attributes', 'Extra_input',
            'Assumptions', 'Desired_value', 'Formalization_fp', 'Description_fp'
        ]
        CSVWriter.write_csv(
            str(self.data_dir / 'final_all_data.csv'),
            all_data,
            all_columns
        )
        print(f"   Wrote final_all_data.csv ({len(all_data)} rows)")

        # Write final_data.csv (clean data only)
        CSVWriter.write_csv(
            str(self.data_dir / 'final_data.csv'),
            clean_data,
            all_columns
        )
        print(f"   Wrote final_data.csv ({len(clean_data)} rows)")

        return all_data, clean_data

    def _print_summary(self, definitions: List[Dict], descriptions: List[Dict],
                      engineers: List[Dict], all_data: List[Dict],
                      clean_data: List[Dict]):
        """Print summary statistics."""
        print("\n" + "=" * 70)
        print("SUMMARY")
        print("=" * 70)

        print(f"\nExtraction Results:")
        print(f"  - PPI Definitions.tex:     {len(definitions):4d} indicators")
        print(f"  - PPI Descriptions.tex:    {len(descriptions):4d} indicators")
        print(f"  - PPI for Engineers.tex:   {len(engineers):4d} indicators")

        print(f"\nMerged Results:")
        print(f"  - Total unique indicators: {len(all_data):4d}")
        print(f"  - Complete indicators:     {len(clean_data):4d}")
        print(f"    (with Formalization_latex, Explanation, and Formalization_fp)")

        # Check for missing data
        print(f"\nData Completeness:")
        missing_counts = defaultdict(int)

        for row in all_data:
            if not row['Formalization_latex']:
                missing_counts['Formalization_latex'] += 1
            if not row['Explanation']:
                missing_counts['Explanation'] += 1
            if not row['Formalization_fp']:
                missing_counts['Formalization_fp'] += 1
            if not row['Function_name']:
                missing_counts['Function_name'] += 1

        if missing_counts:
            for field, count in sorted(missing_counts.items()):
                print(f"  - Missing {field:30s}: {count:4d} rows")
        else:
            print(f"  - All critical fields complete!")

        print(f"\nOutput Files:")
        print(f"  - definitions_extracted.csv")
        print(f"  - descriptions_extracted.csv")
        print(f"  - engineers_extracted.csv")
        print(f"  - final_all_data.csv")
        print(f"  - final_data.csv")
        print(f"\nAll files written to: {self.data_dir}")
        print("=" * 70)


def main():
    """Main entry point."""
    # Get script directory
    script_dir = Path(__file__).parent.absolute()

    # Run extraction
    extractor = PPIExtractor(str(script_dir))
    extractor.run()


if __name__ == '__main__':
    main()
