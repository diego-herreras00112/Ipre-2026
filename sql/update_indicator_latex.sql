-- UPDATE de fórmulas LaTeX corregidas para tabla `indicator`
-- Generado por fix_latex_extraction.py
-- Bug original: regex de \newcommand capturaba [^}]+, perdiendo
-- la } de cierre cuando el cuerpo contenía llaves anidadas.

BEGIN;

UPDATE indicator SET function_name = '\(\mathit{AT}(c)\)', formalization_latex = '\(\mathit{LT}(c) - \mathit{IT}(c)\)', formalization_fp = '\(\mathit{LT}(c) - \mathit{IT}(c)\)', description_fp = '\(\mathit{LT}(c)\) returns the Lead Time (time from case start to completion) of case \(c\).
\newline \(\mathit{IT}(c)\) returns the Idle Time (total time spent waiting or idle) of case \(c\). \\' WHERE slug = 'active-time-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{ARoleR}(c)\)', formalization_latex = '\(\frac{\mathit{A}(c)}{\mathit{Role}(c)}\)', formalization_fp = '\(\frac{\mathit{A}(c)}{\mathit{Role}(c)}\)', description_fp = '\(\mathit{A}(c)\) returns the number of unique activities in case \(c\).
\newline \(\mathit{Role}(c)\) returns the number of unique roles involved in case \(c\). \\' WHERE slug = 'activity-and-role-count-ratio-case-granularity-f-c';
UPDATE indicator SET function_name = '\(\mathit{ARoleR}(g)\)', formalization_latex = '\(\frac{\mathit{A}(g)}{\mathit{Role}(g)}\)', formalization_fp = '\(\frac{\mathit{A}(g)}{\mathit{Role}(g)}\)', description_fp = '\(\mathit{A}(g)\) returns the number of unique activities in group \(g\).
\newline \(\mathit{Role}(g)\) returns the number of unique roles involved in group \(g\). \\' WHERE slug = 'activity-and-role-count-ratio-group-of-cases-granularity-f-g';
UPDATE indicator SET function_name = '\(\mathit{A}(c)\)', formalization_latex = '\(|\mathit{act}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{act}(c))\)', description_fp = '$\mathit{act}(c)$ returns the set of unique activities that occur in case $c$. \\' WHERE slug = 'activity-count-case-granularity-g-c';
UPDATE indicator SET function_name = '\(\mathit{A}(g)\)', formalization_latex = '\(|\cup_{c \in g} \mathit{act}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{act}(g))\)', description_fp = '$\mathit{act}(g)$ returns the set of unique activities that occur in group of cases $g$. \\' WHERE slug = 'activity-count-group-of-cases-granularity-g-g';
UPDATE indicator SET function_name = '\(\mathit{A}(c)\)', formalization_latex = '\(|\mathit{act}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{act}(c))\)', description_fp = '$\mathit{act}(c)$ returns the set of unique activities that occur in case $c$.
\\' WHERE slug = 'activity-count-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{A}(g)\)', formalization_latex = '\(|\cup_{c \in g} \mathit{act}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{act}(g))\)', description_fp = '$\mathit{act}(g)$ returns the set of unique activities that occur in group of cases $g$.
\\' WHERE slug = 'activity-count-group-of-cases-granularity-t-g';
UPDATE indicator SET function_name = '\(\mathit{IHRR}(a)\)', formalization_latex = '\(\frac{\mathit{I}(a)}{\mathit{HR}(a)}\)', formalization_fp = '\(\frac{\mathit{I}(a)}{\mathit{HR}(a)}\)', description_fp = '\(\mathit{I}(a)\) returns the total number of instances of activity \(a\).
\newline \(\mathit{HR}(a)\) returns the number of unique human resources that performed activity \(a\). \\' WHERE slug = 'activity-instance-and-human-resource-count-ratio-activity-granularity-f-a';
UPDATE indicator SET function_name = '\(\mathit{IHRR}(c)\)', formalization_latex = '\(\frac{\mathit{I}(c)}{\mathit{HR}(c)}\)', formalization_fp = '\(\frac{\mathit{I}(c)}{\mathit{HR}(c)}\)', description_fp = '\(\mathit{I}(c)\) returns the total number of activity instances in case \(c\).
\newline \(\mathit{HR}(c)\) returns the number of unique human resources involved in case \(c\). \\' WHERE slug = 'activity-instance-and-human-resource-count-ratio-case-granularity-f-c';
UPDATE indicator SET function_name = '\(\mathit{IHRR}(g)\)', formalization_latex = '\(\frac{\mathit{I}(g)}{\mathit{HR}(g)}\)', formalization_fp = '\(\frac{\mathit{I}(g)}{\mathit{HR}(g)}\)', description_fp = '\(\mathit{I}(g)\) returns the total number of activity instances in group \(g\).
\newline \(\mathit{HR}(g)\) returns the number of unique human resources involved in group \(g\). \\' WHERE slug = 'activity-instance-and-human-resource-count-ratio-group-of-cases-granularity-f-g';
UPDATE indicator SET function_name = '\(\mathit{I}(a)\)', formalization_latex = '\(|\mathit{inst}(a)|\)', formalization_fp = '\(\mathit{count}(\mathit{inst}(a))\)', description_fp = '$\mathit{inst}(a)$ returns the set of instances of activity $a$ that occur in the event log. \\' WHERE slug = 'activity-instance-count-activity-granularity-g-a';
UPDATE indicator SET function_name = '\(\mathit{I}(c)\)', formalization_latex = '\(|\mathit{inst}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{inst}(c))\)', description_fp = '$\mathit{inst}(c)$ returns the set of activity instances that occur in case $c$.\\' WHERE slug = 'activity-instance-count-case-granularity-g-c';
UPDATE indicator SET function_name = '\(\mathit{I}(g)\)', formalization_latex = '\(\sum _{c \in g} \mathit{I}(c)\)', formalization_fp = '\(\sum _{c \in \mathit{cases}(g)} \mathit{I}(c)\)', description_fp = '$\mathit{cases}(g)$ returns the set of cases in group of cases $g$.
\newline $\mathit{I}(c)$ returns the activity instance count of case $c$. \\' WHERE slug = 'activity-instance-count-group-of-cases-granularity-g-g';
UPDATE indicator SET function_name = '\(\mathit{I}(c)\)', formalization_latex = '\(|\mathit{inst}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{inst}(c))\)', description_fp = '$\mathit{inst}(c)$ returns the set of activity instances that occur in case $c$.
\\' WHERE slug = 'activity-instance-count-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{I}(g)\)', formalization_latex = '\(\sum _{c \in g} \mathit{I}(c)\)', formalization_fp = '\(\sum_{c \in \mathit{cases}(g)} \mathit{I}(c)\)', description_fp = '$\mathit{cases}(g)$ returns the set of cases in group of cases $g$.
\newline $\mathit{I}(c)$ returns the activity instance count of case $c$.
\\' WHERE slug = 'activity-instance-count-group-of-cases-granularity-t-g';
UPDATE indicator SET function_name = '\(\mathit{IbyHR}(a, \mathit{hr})\)', formalization_latex = '\(|\{i \in \mathit{inst}(a) \mid \mathit{hres}(i) = \mathit{hr}\}|\)', formalization_fp = '\(\displaystyle \sum_{i \in \mathit{inst}(a)}
\begin{cases}
1 & \text{if } \mathit{hres}(i) = \mathit{hr} \\
0 & \text{otherwise}
\end{cases}
\)', description_fp = '\(\mathit{inst}(a)\) returns the set of all instances of activity \(a\).
\newline \(\mathit{hres}(i)\) returns the human resource associated with activity instance \(i\). \\' WHERE slug = 'activity-instance-count-by-human-resource-activity-granularity-q-a';
UPDATE indicator SET function_name = '\(\mathit{IbyHR}(c, \mathit{hr})\)', formalization_latex = '\(|\{i \in \mathit{inst}(c) \mid \mathit{hres}(i) = \mathit{hr}\}|\)', formalization_fp = '\(\displaystyle \sum_{i \in \mathit{inst}(c)}
\begin{cases}
1 & \text{if } \mathit{hres}(i) = \mathit{hr} \\
0 & \text{otherwise}
\end{cases}
\)', description_fp = '\(\mathit{inst}(c)\) returns the set of all activity instances in case \(c\).
\newline \(\mathit{hres}(i)\) returns the human resource associated with activity instance \(i\). \\' WHERE slug = 'activity-instance-count-by-human-resource-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{IbyHR}(g, \mathit{hr})\)', formalization_latex = '\(\sum _{c \in g} \mathit{IbyHR}(c, \mathit{hr})\)', formalization_fp = '\(\sum _{c \in g} \mathit{IbyHR}(c, \mathit{hr})\)', description_fp = '\(\mathit{IbyHR}(c, \mathit{hr})\) returns the activity instance count by human resource \(\mathit{hr}\) in case \(c\). \\' WHERE slug = 'activity-instance-count-by-human-resource-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{IbyRole}(c, \mathit{rl})\)', formalization_latex = '\(|\{i \in \mathit{inst}(c) \mid \mathit{role}(i) = \mathit{rl}\}|\)', formalization_fp = '\(\displaystyle \sum_{i \in \mathit{inst}(c)}
\begin{cases}
1 & \text{if } \mathit{role}(i) = \mathit{rl} \\
0 & \text{otherwise}
\end{cases}
\)', description_fp = '\(\mathit{inst}(c)\) returns the set of all activity instances in case \(c\).
\newline \(\mathit{role}(i)\) returns the role associated with activity instance \(i\). \\' WHERE slug = 'activity-instance-count-by-role-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{IbyRole}(g, \mathit{rl})\)', formalization_latex = '\(\sum _{c \in g} \mathit{IbyRole}(c, \mathit{rl})\)', formalization_fp = '\(\sum _{c \in g} \mathit{IbyRole}(c, \mathit{rl})\)', description_fp = '\(\mathit{IbyRole}(c, \mathit{rl})\) returns the activity instance count by role \(\mathit{rl}\) in case \(c\). \\' WHERE slug = 'activity-instance-count-by-role-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{AutC}\mathit{^{\times}}(c)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(c), \mathit{act}(i) \in \mathit{Autl}} \mathit{TC}\mathit{^{\times}}(i)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{i \in \mathit{inst}(c), \mathit{act}(i) \in \mathit{Autl}} \mathit{TC}(i)\)', description_fp = '\(\mathit{inst}(c)\) returns the set of all activity instances in case \(c\).
\newline \(\mathit{act}(i)\) returns the activity of activity instance \(i\).
\newline \(\mathit{Autl}\) returns the set of automated activities.
\newline \(\mathit{TC}(i)\) returns the cost of activity instance \(i\). \\' WHERE slug = 'automated-activity-cost-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{AutC}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{c \in g} \mathit{AutC}\mathit{^{\times}}(c)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{AutC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{AutC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{c \in g} \mathit{AutC}(c)\)', description_fp = '\(\mathit{AutC}(c)\) returns the automated activity cost for case \(c\). \\' WHERE slug = 'automated-activity-cost-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{Auta}(c)\)', formalization_latex = '\(|\mathit{Autl} \cap \mathit{act}(c)|\)', formalization_fp = '\(\sum_{a \in \mathit{act}(c)} 
\begin{cases}
1 & \text{if } a \text{ is automated} \\
0 & \text{otherwise}
\end{cases}\)', description_fp = '$\mathit{act}(c)$ returns the set of unique activities that occur in case $c$.\\' WHERE slug = 'automated-activity-count-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{Auta}(g)\)', formalization_latex = '\(|\mathit{Autl} \cap (\cup_{c \in g} \mathit{act}(c))|\)', formalization_fp = '\(\sum_{a \in \mathit{act}(g)} 
\begin{cases}
1 & \text{if } a \text{ is automated} \\
0 & \text{otherwise}
\end{cases}\)', description_fp = '$\mathit{act}(g)$ returns the set of unique activities that occur in group of cases $g$.\\' WHERE slug = 'automated-activity-count-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{Auta}(c)\)', formalization_latex = '\(|\mathit{Autl} \cap \mathit{act}(c)|\)', formalization_fp = '\(\sum_{a \in \mathit{act}(c)} 
\begin{cases}
1 & \text{if } a \text{ is automated} \\
0 & \text{otherwise}
\end{cases}\)', description_fp = '$\mathit{act}(c)$ returns the set of unique activities that occur in case $c$.\\' WHERE slug = 'automated-activity-count-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{Auta}(g)\)', formalization_latex = '\(|\mathit{Autl} \cap (\cup_{c \in g} \mathit{act}(c))|\)', formalization_fp = '\(\sum_{a \in \mathit{act}(g)} 
\begin{cases}
1 & \text{if } a \text{ is automated} \\
0 & \text{otherwise}
\end{cases}\)', description_fp = '$\mathit{act}(g)$ returns the set of unique activities that occur in group of cases $g$.\\' WHERE slug = 'automated-activity-count-group-of-cases-granularity-t-g';
UPDATE indicator SET function_name = '\(\mathit{Auti}(c)\)', formalization_latex = '\(|\{i \in \mathit{inst}(c) \mid \mathit{act}(i) \in \mathit{Autl}\}|\)', formalization_fp = '\(\sum_{i \in \mathit{inst}(c)}
\begin{cases}
1 & \text{if } \mathit{act}(i) \text{ is automated} \\
0 & \text{otherwise}
\end{cases}\)', description_fp = '$\mathit{inst}(c)$ returns the set of activity instances that occur in case $c$.
\newline $\mathit{act}(i)$ returns the activity associated to activity instance $i$.\\' WHERE slug = 'automated-activity-instance-count-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{Auti}(g)\)', formalization_latex = '\(\sum _{c \in g} \mathit{Auti}(c)\)', formalization_fp = '\(\sum _{c \in g} \mathit{Auti}(c)\)', description_fp = '\(\mathit{Auti}(c)\) returns the automated activity instance count for case \(c\). \\' WHERE slug = 'automated-activity-instance-count-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{Auti}(c)\)', formalization_latex = '\(|\{i \in \mathit{inst}(c) \mid \mathit{act}(i) \in \mathit{Autl}\}|\)', formalization_fp = '\(\sum_{i \in \mathit{inst}(c)}
\begin{cases}
1 & \text{if } \mathit{act}(i) \text{ is automated} \\
0 & \text{otherwise}
\end{cases}\)', description_fp = '$\mathit{inst}(c)$ returns the set of activity instances that occur in case $c$.
\newline $\mathit{act}(i)$ returns the activity associated to activity instance $i$.\\' WHERE slug = 'automated-activity-instance-count-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{Auti}(g)\)', formalization_latex = '\(\sum _{c \in g} \mathit{Auti}(c)\)', formalization_fp = '\(\sum_{c \in \mathit{cases}(g)} \mathit{Auti}(c)\)', description_fp = '$\mathit{cases}(g)$ returns the set of cases in group of cases $g$.
\newline $\mathit{Auti}(c)$ returns the automated activity instance count of case $c$.\\' WHERE slug = 'automated-activity-instance-count-group-of-cases-granularity-t-g';
UPDATE indicator SET function_name = '\(\mathit{AutST}(c)\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(c), \mathit{act}(i) \in \mathit{Autl}} \mathit{ST}(i)\)', formalization_fp = '\(\sum_{i \in \mathit{inst}(c),\, \mathit{act}(i) \in \mathit{Autl}} \mathit{ST}(i)\)', description_fp = '$\mathit{inst}(c)$ returns the set of activity instances that occur in case $c$.
\newline $\mathit{act}(i)$ returns the activity associated with activity instance $i$.
\newline $\mathit{Autl}$ denotes the set of automated activities.
\newline $\mathit{ST}(i)$ returns the service time of activity instance $i$.\\' WHERE slug = 'automated-activity-service-time-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{AutST}(g)\)', formalization_latex = '\(\sum _{c \in g} \mathit{AutST}(c)\)', formalization_fp = '\(\sum_{c \in \mathit{cases}(g)} \mathit{AutST}(c)\)', description_fp = '$\mathit{cases}(g)$ returns the set of cases that belong to group of cases $g$.
\newline$\mathit{AutST}(c)$ returns the automated activity service time of case $c$.\\' WHERE slug = 'automated-activity-service-time-group-of-cases-granularity-t-g';
UPDATE indicator SET function_name = '\(\mathit{CCliR}(g)\)', formalization_latex = '\(\frac{\mathit{C}(g)}{\mathit{Cli}(g)}\)', formalization_fp = '\(\frac{\mathit{C}(g)}{\mathit{Cli}(g)}\)', description_fp = '\(\mathit{C}(g)\) returns the number of cases in group \(g\).
\newline \(\mathit{Cli}(g)\) returns the number of clients associated with group \(g\). \\' WHERE slug = 'case-and-client-count-ratio-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{C}(g)\)', formalization_latex = '\(|g|\)', formalization_fp = '\(\mathit{count}(\mathit{cases}(g))\)', description_fp = '$\mathit{cases}(g)$ returns the set of cases in group of cases $g$. \\' WHERE slug = 'case-count-group-of-cases-granularity-g-g';
UPDATE indicator SET function_name = '\(\mathit{CLTR}(g)\)', formalization_latex = '\(\frac{\mathit{C}(g)}{\mathit{LT}(g)}\)', formalization_fp = '', description_fp = '' WHERE slug = 'case-count-and-lead-time-ratio-group-of-cases-granularity-t-g';
UPDATE indicator SET function_name = '\(\mathit{CApastTFC}(g, \mathit{a}, \mathit{et})\)', formalization_latex = '\(|\{c \in g \mid \exists i \in \mathit{inst}(c, \mathit{a})[\mathit{stime}(i) \geq \mathit{et}]\}|\)', formalization_fp = '\(\displaystyle \sum_{c \in g}
\begin{cases}
1 & \text{if } \exists i \in \mathit{inst}(c, \mathit{a})[\mathit{stime}(i) \geq \mathit{et}] \\
0 & \text{otherwise}
\end{cases}
\)', description_fp = '\(\mathit{inst}(c, \mathit{a})\) returns the set of all instances of activity \(\mathit{a}\) in case \(c\).
\newline \(\mathit{stime}(i)\) returns the start timestamp of activity instance \(i\). \\' WHERE slug = 'case-count-where-activity-after-time-frame-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{CAdueTFC}(g, \mathit{a}, \mathit{st})\)', formalization_latex = '\(|\{c \in g \mid \exists i \in \mathit{inst}(c, \mathit{a})[\mathit{stime}(i) \leq \mathit{st}]\}|\)', formalization_fp = '\(\displaystyle \sum_{c \in g}
\begin{cases}
1 & \text{if } \exists i \in \mathit{inst}(c, \mathit{a})[\mathit{stime}(i) \leq \mathit{st}] \\
0 & \text{otherwise}
\end{cases}
\)', description_fp = '\(\mathit{inst}(c, \mathit{a})\) returns the set of all instances of activity \(\mathit{a}\) in case \(c\).
\newline \(\mathit{stime}(i)\) returns the start timestamp of activity instance \(i\). \\' WHERE slug = 'case-count-where-activity-before-time-frame-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{CAinTFC}(g, \mathit{a}, \mathit{st}, \mathit{et})\)', formalization_latex = '\(|\{c \in g \mid \exists i \in \mathit{inst}(c, \mathit{a})[\mathit{st} \leq \mathit{stime}(i) \land \mathit{stime}(i) \leq \mathit{et}]\}|\)', formalization_fp = '\(\displaystyle \sum_{c \in g}
\begin{cases}
1 & \text{if } \exists i \in \mathit{inst}(c, \mathit{a})[\mathit{st} \leq \mathit{stime}(i) \land \mathit{stime}(i) \leq \mathit{et}] \\
0 & \text{otherwise}
\end{cases}
\)', description_fp = '\(\mathit{inst}(c, \mathit{a})\) returns the set of all instances of activity \(\mathit{a}\) in case \(c\).
\newline \(\mathit{stime}(i)\) returns the start timestamp of activity instance \(i\). \\' WHERE slug = 'case-count-where-activity-during-time-frame-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{CendAC}(g, \mathit{a})\)', formalization_latex = '\(|\{c \in g \mid \exists i \in \mathit{endin}(c)[\mathit{act}(i) = \mathit{a}]\}|\)', formalization_fp = '\(\displaystyle \sum_{c \in g}
\begin{cases}
1 & \text{if } \exists i \in \mathit{endin}(c)[\mathit{act}(i) = \mathit{a}] \\
0 & \text{otherwise}
\end{cases}
\)', description_fp = '\(\mathit{endin}(c)\) returns the set of last activity instances in case \(c\).
\newline \(\mathit{act}(i)\) returns the activity of activity instance \(i\). \\' WHERE slug = 'case-count-where-end-activity-is-a-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{CLTOC}(g, \mathit{val})\)', formalization_latex = '\(|\{c \in g \mid \mathit{LT}(c) > \mathit{val}\}|\)', formalization_fp = '', description_fp = '' WHERE slug = 'case-count-where-lead-time-over-value-group-of-cases-granularity-t-g';
UPDATE indicator SET function_name = '\(\mathit{CstartAC}(g, \mathit{a})\)', formalization_latex = '\(|\{c \in g \mid \exists i \in \mathit{strin}(c)[\mathit{act}(i) = \mathit{a}]\}|\)', formalization_fp = '\(\displaystyle \sum_{c \in g}
\begin{cases}
1 & \text{if } \exists i \in \mathit{strin}(c)[\mathit{act}(i) = \mathit{a}] \\
0 & \text{otherwise}
\end{cases}
\)', description_fp = '\(\mathit{strin}(c)\) returns the set of first activity instances in case \(c\).
\newline \(\mathit{act}(i)\) returns the activity of activity instance \(i\). \\' WHERE slug = 'case-count-where-start-activity-is-a-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{CRewC}(g)\)', formalization_latex = '\(|\{c \in g \mid \mathit{RewC}(c) > 0\}|\)', formalization_fp = '\(\displaystyle \sum_{c \in g}
\begin{cases}
1 & \text{if } \mathit{RewC}(c) > 0 \\
0 & \text{otherwise}
\end{cases}
\)', description_fp = '\(\mathit{RewC}(c)\) returns the rework count for case \(c\). \\' WHERE slug = 'case-count-with-rework-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{CApastTFP}(g, \mathit{a}, \mathit{et})\)', formalization_latex = '\(\frac{\mathit{CApastTFC}(g, \mathit{a}, \mathit{et})}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{CApastTFC}(g, \mathit{a}, \mathit{et})}{\mathit{C}(g)}\)', description_fp = '\(\mathit{CApastTFC}(g, \mathit{a}, \mathit{et})\) returns the case count where activity \(\mathit{a}\) starts after time frame \(\mathit{et}\) in group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'case-percentage-where-activity-after-time-frame-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{CAdueTFP}(g, \mathit{a}, \mathit{st})\)', formalization_latex = '\(\frac{\mathit{CAdueTFC}(g, \mathit{a}, \mathit{st})}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{CAdueTFC}(g, \mathit{a}, \mathit{st})}{\mathit{C}(g)}\)', description_fp = '\(\mathit{CAdueTFC}(g, \mathit{a}, \mathit{st})\) returns the case count where activity \(\mathit{a}\) starts before time frame \(\mathit{st}\) in group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'case-percentage-where-activity-before-time-frame-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{CAinTFP}(g, \mathit{a}, \mathit{st}, \mathit{et})\)', formalization_latex = '\(\frac{\mathit{CAinTFC}(g, \mathit{a}, \mathit{st}, \mathit{et})}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{CAinTFC}(g, \mathit{a}, \mathit{st}, \mathit{et})}{\mathit{C}(g)}\)', description_fp = '\(\mathit{CAinTFC}(g, \mathit{a}, \mathit{st}, \mathit{et})\) returns the case count where activity \(\mathit{a}\) starts during the time frame in group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'case-percentage-where-activity-during-time-frame-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{CendAP}(g, \mathit{a})\)', formalization_latex = '\(\frac{\mathit{CendAC}(g, \mathit{a})}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{CendAC}(g, \mathit{a})}{\mathit{C}(g)}\)', description_fp = '\(\mathit{CendAC}(g, \mathit{a})\) returns the case count where the end activity is \(\mathit{a}\) in group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'case-percentage-where-end-activity-is-a-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{CLTOP}(g, \mathit{val})\)', formalization_latex = '\(\frac{\mathit{CLTOC}(g, \mathit{val})}{\mathit{C}(g)}\)', formalization_fp = '', description_fp = '' WHERE slug = 'case-percentage-where-lead-time-over-value-group-of-cases-granularity-t-g';
UPDATE indicator SET function_name = '\(\mathit{CstartAP}(g, \mathit{a})\)', formalization_latex = '\(\frac{\mathit{CstartAC}(g, \mathit{a})}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{CstartAC}(g, \mathit{a})}{\mathit{C}(g)}\)', description_fp = '\(\mathit{CstartAC}(g, \mathit{a})\) returns the case count where the start activity is \(\mathit{a}\) in group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'case-percentage-where-start-activity-is-a-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{CMDP}(g, \mathit{val})\)', formalization_latex = '\(\frac{|\{c \in g \mid \mathit{endt}(c) > \mathit{val}\}|}{\mathit{C}(g)}\)', formalization_fp = '\(\displaystyle \frac{
\sum_{c \in g}
\begin{cases}
1 & \text{if } \mathit{endt}(c) > \mathit{val} \\
0 & \text{otherwise}
\end{cases}
}{\mathit{C}(g)}\)', description_fp = '\(\mathit{endt}(c)\) returns the completion timestamp of case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'case-percentage-with-missed-deadline-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{CMDP}(g, \mathit{val})\)', formalization_latex = '\(\frac{|\{c \in g \mid \mathit{endt}(c) > \mathit{val}\}|}{\mathit{C}(g)}\)', formalization_fp = '\(\displaystyle \frac{
\sum_{c \in g}
\begin{cases}
1 & \text{if } \mathit{endt}(c) > \mathit{val} \\
0 & \text{otherwise}
\end{cases}
}{\mathit{C}(g)}\)', description_fp = '\(\mathit{endt}(c)\) returns the completion timestamp of case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'case-percentage-with-missed-deadline-group-of-cases-granularity-t-g';
UPDATE indicator SET function_name = '\(\mathit{CRewP}(g)\)', formalization_latex = '\(\frac{\mathit{CRewC}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{CRewC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{CRewC}(g)\) returns the case count with rework in group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'case-percentage-with-rework-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{Cli}(a)\)', formalization_latex = '\(|\{\#^{}_{\mathit{cli}}(c) \mid c \in C[a \in \mathit{act}(c)]\}|\)', formalization_fp = '\(\mathit{count}(\mathit{Cli}(a))\)', description_fp = '\(\mathit{Cli}(a)\) returns the set of distinct client identifiers associated with activity $a$. \\' WHERE slug = 'client-count-activity-granularity-f-a';
UPDATE indicator SET function_name = '\(\mathit{Cli}(g)\)', formalization_latex = '\(|\{\#^{}_{\mathit{cli}}(c) \mid c \in g\}|\)', formalization_fp = '\(\mathit{count}(\mathit{Cli}(g))\)', description_fp = '\(\mathit{Cli}(g)\) returns the set of distinct client identifiers associated with case group $g$. \\' WHERE slug = 'client-count-group-of-cases-granularity-f-g';
UPDATE indicator SET function_name = '\(\mathit{CliTCR}\mathit{^{\times}}(a)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{Cli}(a)}{\mathit{TC}\mathit{^{\times}}(a)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{Cli}(a)}{\mathit{TC}(a)}\)', description_fp = '\(\mathit{Cli}(a)\) returns the number of distinct clients involved in activity \(a\).
\newline \(\mathit{TC}(a)\) returns the total cost of activity \(a\). \\' WHERE slug = 'client-count-and-total-cost-ratio-activity-granularity-q-a';
UPDATE indicator SET function_name = '\(\mathit{CliTCR}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{Cli}(g)}{\mathit{TC}\mathit{^{\times}}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{Cli}(g)}{\mathit{TC}(g)}\)', description_fp = '\(\mathit{Cli}(g)\) returns the number of distinct clients associated with group \(g\).
\newline \(\mathit{TC}(g)\) returns the total cost of case group \(g\). \\' WHERE slug = 'client-count-and-total-cost-ratio-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{DAC}(c)\)', formalization_latex = '\(| \mathit{Desl} \cap \mathit{act}(c)|\)', formalization_fp = '\(\mathit{count}( \mathit{Desl} \cap \mathit{act}(c))\)', description_fp = '\(\mathit{Desl}\) returns the set of desired activities.
\newline \(\mathit{act}(c)\) returns the set of activities that occurred in case \(c\). \\' WHERE slug = 'desired-activity-count-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{DAC}(g)\)', formalization_latex = '\(|\mathit{Desl} \cap (\cup_{c \in g} \mathit{act}(c))|\)', formalization_fp = '\(\mathit{count}(\mathit{Desl} \cap (\cup_{c \in g} \mathit{act}(c)))\)', description_fp = '\(\mathit{Desl}\) returns the set of desired activities.
\newline \(\mathit{act}(c)\) returns the set of activities that occurred in case \(c\). \\' WHERE slug = 'desired-activity-count-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{DAC}(c)\)', formalization_latex = '\(| \mathit{Desl} \cap \mathit{act}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{Desl} \cap \mathit{act}(c))\)', description_fp = '\(\mathit{Desl}\) returns the set of desired activities.
\newline \(\mathit{act}(c)\) returns the set of activities that occurred in case \(c\). \\' WHERE slug = 'desired-activity-count-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{DAC}(g)\)', formalization_latex = '\(|\mathit{Desl} \cap (\cup_{c \in g} \mathit{act}(c))|\)', formalization_fp = '\(\mathit{count}(\mathit{Desl} \cap (\cup_{c \in g} \mathit{act}(c)))\)', description_fp = '\(\mathit{Desl}\) returns the set of desired activities.
\newline \(\mathit{act}(c)\) returns the set of activities that occurred in case \(c\). \\' WHERE slug = 'desired-activity-count-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{DC}\mathit{^{\times}}(c)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(c), \mathit{act}(i) \in \mathit{DCl}} \mathit{TC}\mathit{^{\times}}(i)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{i \in \mathit{inst}(c), \mathit{act}(i) \in \mathit{DCl}} \mathit{TC}(i)\)', description_fp = '\(\mathit{inst}(c)\) returns the set of all activity instances in case \(c\).
\newline \(\mathit{act}(i)\) returns the activity of activity instance \(i\).
\newline \(\mathit{DCl}\) returns the set of direct cost activities.
\newline \(\mathit{TC}(i)\) returns the cost of activity instance \(i\). \\' WHERE slug = 'direct-cost-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{DC}\mathit{^{\times}}(g)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{c \in g} \mathit{DC}\mathit{^{\times}}(c)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{DC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{DC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{c \in g} \mathit{DC}(c)\)', description_fp = '\(\mathit{DC}(c)\) returns the direct cost for case \(c\). \\' WHERE slug = 'direct-cost-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{DFRAR}(c)\)', formalization_latex = '\(\frac{\mathit{DFR}(c)}{\mathit{A}(c)}\)', formalization_fp = '\(\frac{\mathit{DFR}(c)}{\mathit{A}(c)}\)', description_fp = '\(\mathit{DFR}(c)\) returns the number of unique Directly-Follows Relations (DFR) in case \(c\).
\newline \(\mathit{A}(c)\) returns the number of unique activities in case \(c\). \\' WHERE slug = 'directly-follows-relations-and-activity-count-ratio-case-granularity-f-c';
UPDATE indicator SET function_name = '\(\mathit{DFRAR}(g)\)', formalization_latex = '\(\frac{\mathit{DFR}(g)}{\mathit{A}(g)}\)', formalization_fp = '\(\frac{\mathit{DFR}(g)}{\mathit{A}(g)}\)', description_fp = '\(\mathit{DFR}(g)\) returns the number of unique Directly-Follows Relations (DFR) in group \(g\).
\newline \(\mathit{A}(g)\) returns the number of unique activities in group \(g\). \\' WHERE slug = 'directly-follows-relations-and-activity-count-ratio-group-of-cases-granularity-f-g';
UPDATE indicator SET function_name = '\(\mathit{DFR}(a)\)', formalization_latex = '\(|\cup_{i \in \mathit{inst}(a)} \{\mathit{act}(i'') \mid i'' \in \mathit{next}(i)\}|\)', formalization_fp = '\(\sum_{a \in \mathit{act}(a)} \mathit{dfrel}(a)\)', description_fp = '\(\mathit{inst}(a)\) returns the set of all instances of activity \(a\).
\newline \(\mathit{dfrel}(a)\) returns the set of activities that directly follow activity \(a\) in any case. \\' WHERE slug = 'directly-follows-relations-count-activity-granularity-f-a';
UPDATE indicator SET function_name = '\(\mathit{DFR}(c)\)', formalization_latex = '\(|\mathit{dfrel}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{dfrel}(c))\)', description_fp = '\(\mathit{dfrel}(c)\) returns the set of unique Directly-Follows Relations (DFR) in case \(c\). \\' WHERE slug = 'directly-follows-relations-count-case-granularity-f-c';
UPDATE indicator SET function_name = '\(\mathit{DFR}(g)\)', formalization_latex = '\(|\cup_{c \in g} \mathit{dfrel}(c)|\)', formalization_fp = '\(\displaystyle \sum_{r \in (\cup_{c \in g} \mathit{dfrel}(c))} 1\)', description_fp = '\(\mathit{dfrel}(c)\) returns the set of unique Directly-Follows Relations (DFR) in case \(c\). \\' WHERE slug = 'directly-follows-relations-count-group-of-cases-granularity-f-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{AT}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{AT}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{AT}(c)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{AT}(c)\) returns the Active Time of case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-active-time-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{ARoleR}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{A}(c)}{\sum _{c \in g} \mathit{Role}(c)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{A}(c)}{\sum _{c \in g} \mathit{Role}(c)}\)', description_fp = '\(\mathit{A}(c)\) returns the number of unique activities in case \(c\).
\newline \(\mathit{Role}(c)\) returns the number of unique roles involved in case \(c\). \\' WHERE slug = 'expected-activity-and-role-count-ratio-f-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{A}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{A}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in \mathit{cases}(g)} \mathit{A}(c)}{\mathit{C}(g)}\)', description_fp = '$\mathit{cases}(g)$ returns the set of cases in group of cases $g$.
\newline $\mathit{A}(c)$ returns the activity count of case $c$.
\newline $\mathit{C}(g)$ returns the case count of group of cases $g$. \\' WHERE slug = 'expected-activity-count-g-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{A}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{A}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in \mathit{cases}(g)} \mathit{A}(c)}{\mathit{C}(g)}\)', description_fp = '$\mathit{cases}(g)$ returns the set of cases in group of cases $g$.
\newline $\mathit{A}(c)$ returns the activity count of case $c$.
\newline $\mathit{C}(g)$ returns the case count of group of cases $g$.
\\' WHERE slug = 'expected-activity-count-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{IHRR}(g)\)', formalization_latex = '\(\frac{\mathit{I}(g)}{\sum _{c \in g} \mathit{HR}(c)}\)', formalization_fp = '\(\frac{\mathit{I}(g)}{\sum _{c \in g} \mathit{HR}(c)}\)', description_fp = '\(\mathit{I}(g)\) returns the total number of activity instances in group \(g\).
\newline \(\mathit{HR}(c)\) returns the number of unique human resources involved in case \(c\). \\' WHERE slug = 'expected-activity-instance-and-human-resource-count-ratio-f-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{I}(g)\)', formalization_latex = '\(\frac{\mathit{I}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{I}(g)}{\mathit{C}(g)}\)', description_fp = '$\mathit{I}(g)$ returns the activity instance count of group of cases $g$.
\newline $\mathit{C}(g)$ returns the case count of group of cases $g$.\\' WHERE slug = 'expected-activity-instance-count-g-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{I}(g)\)', formalization_latex = '\(\frac{\mathit{I}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{I}(g)}{\mathit{C}(g)}\)', description_fp = '$\mathit{I}(g)$ returns the activity instance count of group of cases $g$.
\newline $\mathit{C}(g)$ returns the case count of group of cases $g$.
\\' WHERE slug = 'expected-activity-instance-count-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{IbyHR}(g, \mathit{hr})\)', formalization_latex = '\(\frac{\mathit{IbyHR}(g, \mathit{hr})}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{IbyHR}(g, \mathit{hr})}{\mathit{C}(g)}\)', description_fp = '\(\mathit{IbyHR}(g, \mathit{hr})\) returns the total activity instance count by human resource \(\mathit{hr}\) in group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-activity-instance-count-by-human-resource-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{IbyRole}(g, \mathit{rl})\)', formalization_latex = '\(\frac{\mathit{IbyRole}(g, \mathit{rl})}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{IbyRole}(g, \mathit{rl})}{\mathit{C}(g)}\)', description_fp = '\(\mathit{IbyRole}(g, \mathit{rl})\) returns the total activity instance count by role \(\mathit{rl}\) in group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-activity-instance-count-by-role-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{AutC}\mathit{^{\times}}(g)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{AutC}\mathit{^{\times}}(g)}{\mathit{C}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{AutC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{AutC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{AutC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{AutC}(g)\) returns the total automated activity cost for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-automated-activity-cost-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{Auta}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{Auta}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{Auta}(c)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{Auta}(c)\) returns the automated activity count for case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-automated-activity-count-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{Auta}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{Auta}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum_{c \in \mathit{cases}(g)} \mathit{Auta}(c)}{\mathit{C}(g)}\)', description_fp = '$\mathit{cases}(g)$ returns the set of cases in group of cases $g$.
\newline $\mathit{Auta}(c)$ returns the automated activity count of case $c$.
\newline $\mathit{C}(g)$ returns the case count of group of cases $g$.\\' WHERE slug = 'expected-automated-activity-count-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{Auti}(g)\)', formalization_latex = '\(\frac{\mathit{Auti}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{Auti}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{Auti}(g)\) returns the total automated activity instance count for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-automated-activity-instance-count-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{Auti}(g)\)', formalization_latex = '\(\frac{\mathit{Auti}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{Auti}(g)}{\mathit{C}(g)}\)', description_fp = '$\mathit{Auti}(g)$ returns the automated activity instance count of group of cases $g$.
\newline $\mathit{C}(g)$ returns the case count of group of cases $g$.\\' WHERE slug = 'expected-automated-activity-instance-count-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{AutST}(g)\)', formalization_latex = '\(\frac{\mathit{AutST}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{AutST}(g)}{\mathit{C}(g)}\)', description_fp = '$\mathit{AutST}(g)$ returns the automated activity service time of group of cases $g$.
\newline $\mathit{C}(g)$ returns the case count of group of cases $g$.\\' WHERE slug = 'expected-automated-activity-service-time-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{Cli}(g)\)', formalization_latex = '\(\frac{\mathit{Cli}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{Cli}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{Cli}(g)\) returns the number of distinct clients associated with group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-client-count-f-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{CliTCR}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{Cli}(g)}{\mathit{TC}\mathit{^{\times}}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{Cli}(g)}{\mathit{TC}(g)}\)', description_fp = '\(\mathit{Cli}(g)\) returns the number of distinct clients associated with group \(g\).
\newline \(\mathit{TC}(g)\) returns the total cost of case group \(g\). \\' WHERE slug = 'expected-client-count-and-total-cost-ratio-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{DAC}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{DAC}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{DAC}(c)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{DAC}(c)\) returns the desired activity count for case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-desired-activity-count-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{DAC}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{DAC}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{DAC}(c)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{DAC}(c)\) returns the desired activity count for case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-desired-activity-count-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{DC}\mathit{^{\times}}(g)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{DC}\mathit{^{\times}}(g)}{\mathit{C}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{DC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{DC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{DC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{DC}(g)\) returns the total direct cost for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-direct-cost-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{DFRAR}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{DFR}(c)}{\sum _{c \in g} \mathit{A}(c)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{DFR}(c)}{\sum _{c \in g} \mathit{A}(c)}\)', description_fp = '\(\mathit{DFR}(c)\) returns the number of unique Directly-Follows Relations (DFR) in case \(c\).
\newline \(\mathit{A}(c)\) returns the number of unique activities in case \(c\). \\' WHERE slug = 'expected-directly-follows-relations-and-activity-count-ratio-f-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{DFR}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{DFR}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{DFR}(c)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{DFR}(c)\) returns the number of unique Directly-Follows Relations (DFR) in case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-directly-follows-relations-count-f-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{FC}\mathit{^{\times}}(g)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{FC}\mathit{^{\times}}(g)}{\mathit{C}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{FC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{FC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{FC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{FC}(g)\) returns the total fixed cost for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-fixed-cost-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{H}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{H}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum_{c \in g} \mathit{H}(c)}{\mathit{C}(g)}\)', description_fp = '$g$ represents the group of cases under analysis.
\newline $\mathit{H}(c)$ returns the handover count of case $c$.
\newline $\mathit{C}(g)$ returns the case count of group of cases $g$.\\' WHERE slug = 'expected-handover-count-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{HR}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{HR}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in \mathit{cases}(g)} \mathit{HR}(c)}{\mathit{C}(g)}\)', description_fp = '$\mathit{cases}(g)$ returns the set of cases in group of cases $g$.
\newline $\mathit{HR}(c)$ returns the human resource count of case $c$.
\newline $\mathit{C}(g)$ returns the case count of group of cases $g$. \\' WHERE slug = 'expected-human-resource-count-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{HR}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{HR}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in \mathit{cases}(g)} \mathit{HR}(c)}{\mathit{C}(g)}\)', description_fp = '$\mathit{cases}(g)$ returns the set of cases in group of cases $g$.
\newline $\mathit{HR}(c)$ returns the human resource count of case $c$.
\newline $\mathit{C}(g)$ returns the case count of group of cases $g$. \\' WHERE slug = 'expected-human-resource-count-f-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{HR}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{HR}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in \mathit{cases}(g)} \mathit{HR}(c)}{\mathit{C}(g)}\)', description_fp = '$\mathit{cases}(g)$ returns the set of cases in group of cases $g$.
\newline $\mathit{HR}(c)$ returns the human resource count of case $c$.
\newline $\mathit{C}(g)$ returns the case count of group of cases $g$. \\' WHERE slug = 'expected-human-resource-count-g-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{HR}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{HR}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in \mathit{cases}(g)} \mathit{HR}(c)}{\mathit{C}(g)}\)', description_fp = '$\mathit{cases}(g)$ returns the set of cases in group of cases $g$.
\newline $\mathit{HR}(c)$ returns the human resource count of case $c$.
\newline $\mathit{C}(g)$ returns the case count of group of cases $g$. \\' WHERE slug = 'expected-human-resource-count-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{IT}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{IT}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum_{c \in g} \mathit{IT}(c)}{\mathit{C}(g)}\)', description_fp = '$g$ represents the group of cases under analysis.
\newline $\mathit{IT}(c)$ returns the idle time of case $c$.
\newline $\mathit{C}(g)$ returns the case count of group of cases $g$.\\' WHERE slug = 'expected-idle-time-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{IC}\mathit{^{\times}}(g)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{IC}\mathit{^{\times}}(g)}{\mathit{C}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{IC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{IC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{IC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{IC}(g)\) returns the total inventory cost for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-inventory-cost-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{LC}\mathit{^{\times}}(g)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{LC}\mathit{^{\times}}(g)}{\mathit{C}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{LC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{LC}(g)\) returns the total labor cost for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-labor-cost-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{LCTCR}\mathit{^{\times}}(g)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{LC}\mathit{^{\times}}(g)}{\mathit{TC}\mathit{^{\times}}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sgl}}$ and $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sum}}$ and $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{LC}(g)}{\mathit{TC}(g)}\)', description_fp = '\(\mathit{LC}(g)\) returns the total labor cost of case group \(g\).
\newline \(\mathit{TC}(g)\) returns the total cost of case group \(g\). \\' WHERE slug = 'expected-labor-cost-and-total-cost-ratio-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{LT}(g)\)', formalization_latex = '\(\frac{\sum _{c\in g}\mathit{LT}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum_{c \in g} \mathit{LT}(c)}{\mathit{C}(g)}\)', description_fp = '$\mathit{LT}(c)$ returns the lead time of case $c$.
\newline $\mathit{C}(g)$ returns the total number of cases in group $g$.
\newline The numerator $\sum_{c \in g} \mathit{LT}(c)$ sums the lead times of all cases in $g$.\\' WHERE slug = 'expected-lead-time-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{LTDE}(g, \mathit{val})\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{LTDE}(c, \mathit{val})}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{LTDE}(c, \mathit{val})}{\mathit{C}(g)}\)', description_fp = '$\mathit{LTDE}(c, \mathit{val})$ returns the lead time deviation from expectation of case $c$.
\newline $\mathit{C}(g)$ returns the number of cases in group $g$.\\' WHERE slug = 'expected-lead-time-deviation-from-expectation-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{LTDL}(g, \mathit{val})\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{LTDL}(c, \mathit{val})}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{LTDL}(c, \mathit{val})}{\mathit{C}(g)}\)', description_fp = '$\mathit{LTDL}(c, \mathit{val})$ returns the lead time deviation from time Limit for case $c$.
\newline $\mathit{val}$ represents the predefined time Limit.
\newline $\mathit{C}(g)$ returns the number of cases in group $g$.\\' WHERE slug = 'expected-lead-time-deviation-from-time-limit-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{LTfA}(g, \mathit{a})\)', formalization_latex = '\(\frac{\sum _{c \in g} \begin{cases}
\mathit{LTfA}(c, \mathit{a}) & \mathit{if \ } \mathit{fi}\mathit{^{s}}(c, \mathit{a}) \neq \emptyset \\ 0 & \mathit{if \ } \mathit{fi}\mathit{^{s}}(c, \mathit{a}) = \emptyset
\end{cases}}{|\{c \in g \mid \mathit{fi}\mathit{^{s}}(c, \mathit{a}) \neq \emptyset\}|}\)', formalization_fp = '\(\frac{\sum _{c \in g} \begin{cases}
\mathit{LTfA}(c, \mathit{a}) & \mathit{if \ } \mathit{fi}\mathit{^{s}}(c, \mathit{a}) \neq \emptyset \\
0 & \mathit{if \ } \mathit{fi}\mathit{^{s}}(c, \mathit{a}) = \emptyset
\end{cases}}{
\sum_{c \in \mathit{cases}(g)} 
\begin{cases}
1 & \text{if } \mathit{fi}\mathit{^{s}}(c, \mathit{a}) \neq \emptyset \\
0 & \text{otherwise}
\end{cases}
}\)', description_fp = '$\mathit{fi}\mathit{^{s}}(c, \mathit{a})$ returns the set of first started instances of activity $\mathit{a}$ in case $c$.
\newline $\mathit{LTfA}(c, \mathit{a})$ returns the lead time from the first started instance of activity $\mathit{a}$ in case $c$ to the end of case $c$.
\\' WHERE slug = 'expected-lead-time-from-activity-a-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{LTAB}(g, \mathit{a}, \mathit{b})\)', formalization_latex = '\(\frac{\sum _{c \in g} \begin{cases}
\mathit{LTAB}(c, \mathit{a}, \mathit{b}) & \mathit{if \ } \mathit{fi}\mathit{^{sc}}(c, \mathit{a}, \mathit{b}) \neq \emptyset \\ 0 & \mathit{if \ } \mathit{fi}\mathit{^{sc}}(c, \mathit{a}, \mathit{b}) = \emptyset
\end{cases}}{|\{c \in g \mid \mathit{fi}\mathit{^{sc}}(c, \mathit{a}, \mathit{b}) \neq \emptyset)\}|}\)', formalization_fp = '\[
\frac{
\sum_{c \in \mathit{cases}(g)} 
\begin{cases}
\mathit{LTAB}(c, a, b) & \text{if } \mathit{fi}(c, \mathit{a}, \mathit{b}) \neq \emptyset \\
0 & \text{otherwise}
\end{cases}
}{
\sum_{c \in \mathit{cases}(g)} 
\begin{cases}
1 & \text{if } \mathit{fi}(c, \mathit{a}, \mathit{b})  \neq \emptyset \\
0 & \text{otherwise}
\end{cases}
}
\]

\(\mathit{cases}(g)\): Set of all cases belonging to group \(g\).', description_fp = '\(\mathit{LTAB}(c, a, b)\): Lead time between activity \(a\) and activity \(b\) within case \(c\).
\newline
\(\mathit{fi}(c, \mathit{a}, \mathit{b})\): Function that returns the flow instance between \(a\) and \(b\) in case \(c\). If empty, the pair \((a, b)\) does not occur in \(c\). \\' WHERE slug = 'expected-lead-time-from-activity-a-to-activity-b-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{LTtA}(g, \mathit{a})\)', formalization_latex = '\(\frac{\sum _{c \in g} \begin{cases}
\mathit{LTtA}(c, \mathit{a}) & \mathit{if \ } \mathit{fi}\mathit{^{c}}(c, \mathit{a}) \neq \emptyset \\ 0 & \mathit{if \ } \mathit{fi}\mathit{^{c}}(c, \mathit{a}) = \emptyset
\end{cases}}{|\{c \in g \mid \mathit{if \ } \mathit{fi}\mathit{^{c}}(c, \mathit{a}) \neq \emptyset\}|}\)', formalization_fp = '\(\displaystyle \frac{\sum_{c \in g} 
\begin{cases} 
\mathit{LTtA}(c, \mathit{a}) & \mathit{if \ } \mathit{fi}\mathit{^{c}}(c, \mathit{a}) \neq \emptyset \\ 
0 & \mathit{if \ } \mathit{fi}\mathit{^{c}}(c, \mathit{a}) = \emptyset 
\end{cases}}
{
\sum_{c \in \mathit{cases}(g)} 
\begin{cases}
1 & \text{if } \mathit{fi}\mathit{^{c}}(c, \mathit{a}) \neq \emptyset \\
0 & \text{otherwise}
\end{cases}
}\)', description_fp = '\(\mathit{LTtA}(c, \mathit{a})\) returns the lead time from the start of case \(c\) to the first completed instance of activity \(\mathit{a}\) in case \(c\).
\newline \(\mathit{fi}\mathit{^{c}}(c, \mathit{a})\) returns the set of first completed instances of activity \(\mathit{a}\) in case \(c\).
\newline \(\left| \{ c \in g \mid \mathit{fi}\mathit{^{c}}(c, \mathit{a}) \neq \emptyset \} \right|\) returns the number of cases in group \(g\) where activity \(\mathit{a}\) occurs at least once (i.e., cases with a non-empty \(\mathit{fi}\mathit{^{c}}(c, \mathit{a})\)).\\' WHERE slug = 'expected-lead-time-to-activity-a-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{MainC}(g)\)', formalization_latex = '\(\frac{\mathit{MainC}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{MainC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{MainC}(g)\) returns the total maintenance cost for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-maintenance-cost-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{MDC}(g)\)', formalization_latex = '\(\frac{\mathit{MDC}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{MDC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{MDC}(g)\) returns the total missed deadline cost for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-missed-deadline-cost-c-g';
UPDATE indicator SET function_name = '\(\mathit{NAutA}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{NAutA}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{NAutA}(c)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{NAutA}(c)\) returns the non-automated activity count for case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-non-automated-activity-count-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{NAutI}(g)\)', formalization_latex = '\(\frac{\mathit{NAutI}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{NAutI}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{NAutI}(g)\) returns the total non-automated activity instance count for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-non-automated-activity-instance-count-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{OptA}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{OptA}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{OptA}(c)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{OptA}(c)\) returns the optional activity count for case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-optional-activity-count-f-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{Opt}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{OptA}(c)}{\sum _{c \in g} \mathit{A}(c)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{OptA}(c)}{\sum _{c \in g} \mathit{A}(c)}\)', description_fp = '\(\mathit{OptA}(c)\) returns the optional activity count for case \(c\).
\newline \(\mathit{A}(c)\) returns the number of unique activities in case \(c\). \\' WHERE slug = 'expected-optionality-f-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{U}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{U}\mathit{^{\times}}(g)}{\mathit{C}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\mathit{U}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\mathit{U}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{U}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{U}(g)\) returns the total outcome unit count for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-outcome-unit-count-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{OQ}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{OQ}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{OQ}(c)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{OQ}(c)\) returns the overall quality associated with case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-overall-quality-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{OC}\mathit{^{\times}}(g)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{OC}\mathit{^{\times}}(g)}{\mathit{C}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{OC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{OC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{OC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{OC}(g)\) returns the total overhead cost for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-overhead-cost-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{Rep}(g)\)', formalization_latex = '\(1 - \frac{\sum _{c \in g} \mathit{A}(c)}{\mathit{I}(g)}\)', formalization_fp = '\(1 - \frac{\sum _{c \in g} \mathit{A}(c)}{\mathit{I}(g)}\)', description_fp = '\(\mathit{A}(c)\) returns the number of unique activities in case \(c\).
\newline \(\mathit{I}(g)\) returns the total number of activity instances in group \(g\). \\' WHERE slug = 'expected-repeatability-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{R}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{R}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{R}(c)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{R}(c)\) returns the resource count for case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-resource-count-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{R}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{R}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in \mathit{cases}(g)} \mathit{R}(c)}{\mathit{C}(g)}\)', description_fp = '$\mathit{cases}(g)$ returns the set of cases in group of cases $g$.
\newline $\mathit{R}(c)$ returns the resource count of case $c$.
\newline $\mathit{C}(g)$ returns the case count of group of cases $g$. \\' WHERE slug = 'expected-resource-count-g-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{RC}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{RC}\mathit{^{\times}}(g)}{\mathit{C}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{RC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{RC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{RC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{RC}(g)\) returns the total rework cost for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-rework-cost-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{RewC}(g)\)', formalization_latex = '\(\frac{\mathit{RewC}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{RewC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{RewC}(g)\) returns the total rework count for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-rework-count-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{RewC}(g)\)', formalization_latex = '\(\frac{\mathit{RewC}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{RewC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{RewC}(g)\) returns the total rework count for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-rework-count-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{RewCV}(g, \mathit{val})\)', formalization_latex = '\(\frac{\mathit{RewCV}(g, \mathit{val})}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{RewCV}(g, \mathit{val})}{\mathit{C}(g)}\)', description_fp = '\(\mathit{RewCV}(g, \mathit{val})\) returns the total rework count by value \(\mathit{val}\) for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-rework-count-by-value-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{RewSub}(g, \mathit{sub})\)', formalization_latex = '\(\frac{\mathit{RewSub}(g, \mathit{sub})}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{RewSub}(g, \mathit{sub})}{\mathit{C}(g)}\)', description_fp = '\(\mathit{RewSub}(g, \mathit{sub})\) returns the total rework count for subset \(\mathit{sub}\) in group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-rework-of-activities-subset-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{RewP}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{RewP}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{RewP}(c)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{RewP}(c)\) returns the rework percentage for case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-rework-percentage-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{RewP}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{RewP}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{RewP}(c)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{RewP}(c)\) returns the rework percentage for case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-rework-percentage-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{RewPV}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{RewPV}(c, \mathit{val})}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{RewPV}(c, \mathit{val})}{\mathit{C}(g)}\)', description_fp = '\(\mathit{RewPV}(c, \mathit{val})\) returns the rework percentage by value \(\mathit{val}\) for case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-rework-percentage-by-value-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{RT}(g)\)', formalization_latex = '\(\frac{\mathit{RT}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{RT}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{RT}(g)\) returns the total rework time for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-rework-time-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{Role}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{Role}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{Role}(c)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{Role}(c)\) returns the role count for case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-role-count-f-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{Role}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{Role}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum_{c \in \mathit{cases}(g)} \mathit{Role}(c)}{\mathit{C}(g)}\)', description_fp = '$\mathit{cases}(g)$ returns the set of cases in group of cases $g$.
\newline $\mathit{Role}(c)$ returns the role count of case $c$.
\newline$\mathit{C}(g)$ returns the case count of group of cases $g$. \\' WHERE slug = 'expected-role-count-g-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{SLTR}(g)\)', formalization_latex = '\(\frac{\mathit{ST}(g)}{\sum _{c \in g} \mathit{LT}(c)}\)', formalization_fp = '\(\frac{\mathit{ST}(g)}{\sum _{c \in g} \mathit{LT}(c)}\)', description_fp = '\(\mathit{ST}(g)\) returns the total service time accumulated across all cases in group \(g\).
\newline \(\mathit{LT}(c)\) returns the total lead time of case \(c\). \\' WHERE slug = 'expected-service-and-lead-time-ratio-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{ST}(g)\)', formalization_latex = '\(\frac{\mathit{ST}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{ST}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{ST}(g)\) returns the total service time accumulated across all cases in group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-service-time-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{STAB}\mathit{^{\times}}(g, \mathit{a}, \mathit{b})\)
\newline \newline \(\mathit{\times} \in \{\mathit{s}, \mathit{c}, \mathit{sc}, \mathit{w}\}\)', formalization_latex = '\(\frac{\mathit{STAB}\mathit{^{\times}}(g, \mathit{a}, \mathit{b})}{|\{c \in g \mid \mathit{fi}\mathit{^{sc}}(c, \mathit{a}, \mathit{b}) \neq \emptyset\}|}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{s}, \mathit{c}, \mathit{sc}, \mathit{w}\}$. If $\mathit{\times} = \mathit{s}$, then the function considers activity instances that were started within the start and end activity instances, i.e., it uses $\mathit{STAB}\mathit{^{s}}$; if $\mathit{\times} = \mathit{c}$, then the function considers activity instances that were completed within the start and end activity instances, i.e., it uses $\mathit{STAB}\mathit{^{c}}$; if $\mathit{\times} = \mathit{sc}$, then the function considers activity instances that were either started or completed within the start and end activity instances, i.e., it uses $\mathit{STAB}\mathit{^{sc}}$; if $\mathit{\times} = \mathit{^{w}}$, then the function considers all activity instances that were active within the start and end activity instances, i.e., it uses $\mathit{STAB}\mathit{^{w}}$.', formalization_fp = '\(\frac{\mathit{STAB}(g, \mathit{a}, \mathit{b})}{|\{c \in g \mid \mathit{fi}(c, \mathit{a}, \mathit{b}) \neq \emptyset\}|}\)', description_fp = '\(\mathit{STAB}\) returns the total service time from activity \(\mathit{a}\) to activity \(\mathit{b}\) accumulated across all cases in group \(g\).
\newline \(\mathit{fi}\) returns the set of first instances of activity \(\mathit{b}\) that occur after the first instance of \(\mathit{a}\) in case \(c\). \\' WHERE slug = 'expected-service-time-from-activity-a-to-activity-b-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{SUC}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{SUC}\mathit{^{\times}}(g)}{\mathit{C}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{SUC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{SUC}(g)\) returns the total successful outcome unit count for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-successful-outcome-unit-count-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{SUP}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{SUP}\mathit{^{\times}}(c)}{\mathit{C}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUP}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUP}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{SUP}(c)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{SUP}(c)\) returns the successful outcome unit percentage of case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-successful-outcome-unit-percentage-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{TC}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(g)}{\mathit{C}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{TC}(g)\) returns the total cost for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-total-cost-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{TCCliR}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(g)}{\mathit{Cli}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(g)}{\mathit{Cli}(g)}\)', description_fp = '\(\mathit{TC}(g)\) returns the total cost of case group \(g\).
\newline \(\mathit{Cli}(g)\) returns the number of distinct clients associated with group \(g\). \\' WHERE slug = 'expected-total-cost-and-client-count-ratio-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{TCLTR}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(g)}{\sum _{c \in g} \mathit{LT}(c)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(g)}{\sum _{c \in g} \mathit{LT}(c)}\)', description_fp = '\(\mathit{TC}(g)\) returns the total cost of case group \(g\).
\newline \(\mathit{LT}(c)\) returns the total lead time of case \(c\). \\' WHERE slug = 'expected-total-cost-and-lead-time-ratio-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{TCUR}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(g)}{\mathit{U}\mathit{^{\times}}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost and outcome unit calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$ and $\mathit{U}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost and outcome unit calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$ and $\mathit{U}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(g)}{\mathit{U}(g)}\)', description_fp = '\(\mathit{TC}(g)\) returns the total cost of case group \(g\).
\newline \(\mathit{U}(g)\) returns the total outcome unit count of case group \(g\). \\' WHERE slug = 'expected-total-cost-and-outcome-unit-ratio-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{TCSTR}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(g)}{\mathit{ST}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(g)}{\mathit{ST}(g)}\)', description_fp = '\(\mathit{TC}(g)\) returns the total cost of case group \(g\).
\newline \(\mathit{ST}(g)\) returns the total service time of case group \(g\). \\' WHERE slug = 'expected-total-cost-and-service-time-ratio-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{TransC}(g)\)', formalization_latex = '\(\frac{\mathit{TransC}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{TransC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{TransC}(g)\) returns the total transportation cost for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-transportation-cost-c-g';
UPDATE indicator SET function_name = '\(\mathit{UAC}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{UAC}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{UAC}(c)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{UAC}(c)\) returns the unwanted activity count for case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-unwanted-activity-count-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{UIC}(g)\)', formalization_latex = '\(\frac{\mathit{UIC}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{UIC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{UIC}(g)\) returns the total unwanted activity instance count for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-unwanted-activity-instance-count-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{UIP}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{UIP}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{UIP}(c)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{UIP}(c)\) returns the unwanted activity instance percentage for case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-unwanted-activity-instance-percentage-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{UAP}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{UAP}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{UAP}(c)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{UAP}(c)\) returns the unwanted activity percentage for case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-unwanted-activity-percentage-q-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{VC}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{VC}\mathit{^{\times}}(g)}{\mathit{C}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{VC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{VC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{VC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{VC}(g)\) returns the total variable cost for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-variable-cost-c-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{WT}(g)\)', formalization_latex = '\(\frac{\sum _{c \in g} \mathit{WT}(c)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\sum _{c \in g} \mathit{WT}(c)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{WT}(c)\) returns the total waiting time of case \(c\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-waiting-time-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{WTAB}\mathit{^{\times}}(g, \mathit{a}, \mathit{b})\)
\newline \newline \(\mathit{\times} \in \{\mathit{s}, \mathit{c}, \mathit{sc}, \mathit{w}\}\)', formalization_latex = '\(\frac{\sum _{c \in g} \begin{cases}
\mathit{WTAB}\mathit{^{\times}}(c, \mathit{a}, \mathit{b}) & \mathit{if \ } \mathit{fi}\mathit{^{sc}}(c, \mathit{a}, \mathit{b}) \neq \emptyset \\ 0 & \mathit{if \ } \mathit{fi}\mathit{^{sc}}(c, \mathit{a}, \mathit{b}) = \emptyset
\end{cases}}{|\{c \in g \mid \mathit{fi}\mathit{^{sc}}(c, \mathit{a}, \mathit{b}) \neq \emptyset\}|}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{s}, \mathit{c}, \mathit{sc}, \mathit{w}\}$. If $\mathit{\times} = \mathit{s}$, then the function considers activity instances that were started within the start and end activity instances, i.e., it uses $\mathit{WTAB}\mathit{^{s}}$; if $\mathit{\times} = \mathit{c}$, then the function considers activity instances that were completed within the start and end activity instances, i.e., it uses $\mathit{WTAB}\mathit{^{c}}$; if $\mathit{\times} = \mathit{sc}$, then the function considers activity instances that were either started or completed within the start and end activity instances, i.e., it uses $\mathit{WTAB}\mathit{^{sc}}$; if $\mathit{\times} = \mathit{^{w}}$, then the function considers all activity instances that were active within the start and end activity instances, i.e., it uses $\mathit{WTAB}\mathit{^{w}}$.', formalization_fp = '\(\displaystyle \frac{\sum _{c \in g} \begin{cases}
\mathit{WTAB}(c, \mathit{a}, \mathit{b}) & \mathit{if \ } \mathit{fi}(c, \mathit{a}, \mathit{b}) \neq \emptyset \\
0 & \mathit{if \ } \mathit{fi}(c, \mathit{a}, \mathit{b}) = \emptyset
\end{cases}}{
\sum_{c \in g}
\begin{cases}
1 & \text{if } \mathit{fi}(c, \mathit{a}, \mathit{b}) \neq \emptyset \\
0 & \text{otherwise}
\end{cases}
}\)', description_fp = '\(\mathit{WTAB}\) returns the waiting time from activity \(\mathit{a}\) to activity \(\mathit{b}\) in case \(c\).
\newline \(\mathit{fi}\) returns the set of first instances of activity \(\mathit{b}\) that occur after the first instance of \(\mathit{a}\) in case \(c\). \\' WHERE slug = 'expected-waiting-time-from-activity-a-to-activity-b-t-g';
UPDATE indicator SET function_name = '\(\mathit{e}\mathit{WareC}(g)\)', formalization_latex = '\(\frac{\mathit{WareC}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{WareC}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{WareC}(g)\) returns the total warehousing cost for group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'expected-warehousing-cost-c-g';
UPDATE indicator SET function_name = '\(\mathit{FC}\mathit{^{\times}}(a)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(a)} \mathit{FC}\mathit{^{\times}}(i)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{FC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{FC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{i \in \mathit{inst}(a)} \mathit{FC}(i)\)', description_fp = '\(\mathit{inst}(a)\) returns the set of all instances of activity \(a\).
\newline \(\mathit{FC}(i)\) returns the fixed cost of activity instance \(i\). \\' WHERE slug = 'fixed-cost-activity-granularity-c-a';
UPDATE indicator SET function_name = '\(\mathit{FC}\mathit{^{\times}}(c)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(c)} \mathit{FC}\mathit{^{\times}}(i)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{FC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{FC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{i \in \mathit{inst}(c)} \mathit{FC}(i)\)', description_fp = '\(\mathit{inst}(c)\) returns the set of all activity instances in case \(c\).
\newline \(\mathit{FC}(i)\) returns the fixed cost of activity instance \(i\). \\' WHERE slug = 'fixed-cost-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{FC}\mathit{^{\times}}(g)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{c \in g} \mathit{FC}\mathit{^{\times}}(c)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{FC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{FC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{c \in g} \mathit{FC}(c)\)', description_fp = '\(\mathit{FC}(c)\) returns the fixed cost for case \(c\). \\' WHERE slug = 'fixed-cost-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{FC}\mathit{^{sgl}}(i)\)', formalization_latex = '\(\begin{cases}
\#^{}_{\mathit{fc}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{fc}}(\mathit{cpl}(i)) \neq \bot \\
\#^{}_{\mathit{fc}}(\mathit{str}(i)) & \mathit{if \ } \#^{}_{\mathit{fc}}(\mathit{cpl}(i)) = \bot \land \#^{}_{\mathit{fc}}(\mathit{str}(i)) \neq \bot \\
\bot & \mathit{if \ } \#^{}_{\mathit{fc}}(\mathit{cpl}(i)) = \bot \land \#^{}_{\mathit{fc}}(\mathit{str}(i)) = \bot \\
\end{cases}\)', formalization_fp = '\(\begin{cases} \#^{}_{\mathit{fc}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{fc}}(\mathit{cpl}(i)) \neq undefined \\ \#^{}_{\mathit{fc}}(\mathit{str}(i)) & \mathit{if \ } \#^{}_{\mathit{fc}}(\mathit{cpl}(i)) = undefined \land \#^{}_{\mathit{fc}}(\mathit{str}(i)) \neq undefined \\ undefined & \mathit{if \ } \#^{}_{\mathit{fc}}(\mathit{cpl}(i)) = undefined \land \#^{}_{\mathit{fc}}(\mathit{str}(i)) = undefined \\ \end{cases}\)', description_fp = '\(\#^{}_{\mathit{fc}}\) returns the fixed cost associated with an event.
\newline \(\mathit{cpl}(i)\) returns the completion event of activity instance \(i\).
\newline \(\mathit{str}(i)\) returns the start event of activity instance \(i\). \\' WHERE slug = 'fixed-cost-considering-single-events-of-activity-instances-activity-instance-granularity-c-i';
UPDATE indicator SET function_name = '\(\mathit{FC}\mathit{^{sum}}(i)\)', formalization_latex = '\(\begin{cases}
\#^{}_{\mathit{fc}}(\mathit{str}(i)) + & \\ \#^{}_{\mathit{fc}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{fc}}(\mathit{cpl}(i)) \neq \bot \land \#^{}_{\mathit{fc}}(\mathit{str}(i)) \neq \bot \\
\bot & \mathit{if \ } \#^{}_{\mathit{fc}}(\mathit{cpl}(i)) = \bot \lor \#^{}_{\mathit{fc}}(\mathit{str}(i)) = \bot \\
\end{cases}\)', formalization_fp = '\(\begin{cases} \#^{}_{\mathit{fc}}(\mathit{str}(i)) + & \\ \#^{}_{\mathit{fc}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{fc}}(\mathit{cpl}(i)) \neq undefined \land \#^{}_{\mathit{fc}}(\mathit{str}(i)) \neq undefined \\ undefined & \mathit{if \ } \#^{}_{\mathit{fc}}(\mathit{cpl}(i)) = undefined \lor \#^{}_{\mathit{fc}}(\mathit{str}(i)) = undefined \\ \end{cases}\)', description_fp = '\(\#^{}_{\mathit{fc}}\) returns the fixed cost associated with an event.
\newline \(\mathit{str}(i)\) returns the start event of activity instance \(i\).
\newline \(\mathit{cpl}(i)\) returns the completion event of activity instance \(i\). \\' WHERE slug = 'fixed-cost-considering-the-sum-of-all-events-of-activity-instances-activity-instance-granularity-c-i';
UPDATE indicator SET function_name = '\(\mathit{H}(c)\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(c)} \mathit{dres}(i)\)', formalization_fp = '\(\sum_{i \in \mathit{inst}(c)} \mathit{dres}(i)\)', description_fp = 'Here, \(\mathit{inst}(c)\) is the set of activity instances in case \(c\), \newline \(\mathit{dres}(i)\) returns the number of distinct resources involved in the execution of activity instance \(i\). 
\newline The formula sums these values to obtain the total handovers in case \(c\). \\' WHERE slug = 'handover-count-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{HRCR}(g)\)', formalization_latex = '\(\frac{\mathit{HR}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{HR}(g)}{\mathit{C}(g)}\)', description_fp = '\(\mathit{HR}(g)\) returns the number of unique human resources involved in group \(g\).
\newline \(\mathit{C}(g)\) returns the number of cases in group \(g\). \\' WHERE slug = 'human-resource-and-case-count-ratio-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{HR}(a)\)', formalization_latex = '\(|\mathit{hres}(a)|\)', formalization_fp = '\(\mathit{count}(\mathit{hres}(a))\)', description_fp = '$\mathit{hres}(a)$ returns the set of human resources that perform activity $a$ in the event log. \\' WHERE slug = 'human-resource-count-activity-granularity-c-a';
UPDATE indicator SET function_name = '\(\mathit{HR}(c)\)', formalization_latex = '\(|\mathit{hres}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{hres}(c))\)', description_fp = '$\mathit{hres}(c)$ returns the set of human resources that work in case $c$. \\' WHERE slug = 'human-resource-count-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{HR}(g)\)', formalization_latex = '\(|\cup_{c \in g} \mathit{hres}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{hres}(g))\)', description_fp = '$\mathit{hres}(g)$ returns the set of human resources that work in group of cases $g$. \\' WHERE slug = 'human-resource-count-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{HR}(a)\)', formalization_latex = '\(|\mathit{hres}(a)|\)', formalization_fp = '\(\mathit{count}(\mathit{hres}(a))\)', description_fp = '$\mathit{hres}(a)$ returns the set of human resources that perform activity $a$ in the event log. \\' WHERE slug = 'human-resource-count-activity-granularity-f-a';
UPDATE indicator SET function_name = '\(\mathit{HR}(c)\)', formalization_latex = '\(|\mathit{hres}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{hres}(c))\)', description_fp = '$\mathit{hres}(c)$ returns the set of human resources that work in case $c$. \\' WHERE slug = 'human-resource-count-case-granularity-f-c';
UPDATE indicator SET function_name = '\(\mathit{HR}(g)\)', formalization_latex = '\(|\cup_{c \in g} \mathit{hres}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{hres}(g))\)', description_fp = '$\mathit{hres}(g)$ returns the set of human resources that work in group of cases $g$. \\' WHERE slug = 'human-resource-count-group-of-cases-granularity-f-g';
UPDATE indicator SET function_name = '\(\mathit{HR}(a)\)', formalization_latex = '\(|\mathit{hres}(a)|\)', formalization_fp = '\(\mathit{count}(\mathit{hres}(a))\)', description_fp = '$\mathit{hres}(a)$ returns the set of human resources that perform activity $a$ in the event log. \\' WHERE slug = 'human-resource-count-activity-granularity-g-a';
UPDATE indicator SET function_name = '\(\mathit{HR}(c)\)', formalization_latex = '\(|\mathit{hres}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{hres}(c))\)', description_fp = '$\mathit{hres}(c)$ returns the set of human resources that work in case $c$. \\' WHERE slug = 'human-resource-count-case-granularity-g-c';
UPDATE indicator SET function_name = '\(\mathit{HR}(g)\)', formalization_latex = '\(|\cup_{c \in g} \mathit{hres}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{hres}(g))\)', description_fp = '$\mathit{hres}(g)$ returns the set of human resources that work in group of cases $g$. \\' WHERE slug = 'human-resource-count-group-of-cases-granularity-g-g';
UPDATE indicator SET function_name = '\(\mathit{HR}(a)\)', formalization_latex = '\(|\mathit{hres}(a)|\)', formalization_fp = '\(\mathit{count}(\mathit{hres}(a))\)', description_fp = '$\mathit{hres}(a)$ returns the set of human resources that perform activity $a$ in the event log. \\' WHERE slug = 'human-resource-count-activity-granularity-q-a';
UPDATE indicator SET function_name = '\(\mathit{HR}(c)\)', formalization_latex = '\(|\mathit{hres}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{hres}(c))\)', description_fp = '$\mathit{hres}(c)$ returns the set of human resources that work in case $c$. \\' WHERE slug = 'human-resource-count-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{HR}(g)\)', formalization_latex = '\(|\cup_{c \in g} \mathit{hres}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{hres}(g))\)', description_fp = '$\mathit{hres}(g)$ returns the set of human resources that work in group of cases $g$. \\' WHERE slug = 'human-resource-count-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{IT}(c)\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(c)} \begin{cases}
\frac{\mathit{WT}(i)}{|\mathit{concstr}(i)|} & \mathit{if \ } \mathit{prevstr}(i) = \emptyset \\
0 & \mathit{if \ } \mathit{prevstr}(i) \neq \emptyset
\end{cases}\)', formalization_fp = '\(\sum_{i \in \mathit{inst}(c)} 
\begin{cases}
\frac{\mathit{WT}(i)}{|\mathit{concstr}(i)|} & \text{if } \mathit{prevstr}(i) = \emptyset \\
0 & \text{if } \mathit{prevstr}(i) \neq \emptyset
\end{cases}\)', description_fp = '$\mathit{inst}(c)$ returns the set of activity instances that occur in case $c$.
\newline $\mathit{WT}(i)$ returns the waiting time of activity instance $i$.
\newline $\mathit{concstr}(i)$ returns the set of concurrent structures (parallel branches) related to instance $i$.
\newline $\mathit{prevstr}(i)$ returns the preceding structure of activity instance $i$.\\' WHERE slug = 'idle-time-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{IC}\mathit{^{\times}}(a)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(a)} \mathit{IC}\mathit{^{\times}}(i)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{IC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{IC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{i \in \mathit{inst}(a)} \mathit{IC}(i)\)', description_fp = '\(\mathit{inst}(a)\) returns the set of all instances of activity \(a\).
\newline \(\mathit{IC}(i)\) returns the inventory cost of activity instance \(i\). \\' WHERE slug = 'inventory-cost-activity-granularity-c-a';
UPDATE indicator SET function_name = '\(\mathit{IC}\mathit{^{\times}}(c)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(c)} \mathit{IC}\mathit{^{\times}}(i)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{IC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{IC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{i \in \mathit{inst}(c)} \mathit{IC}(i)\)', description_fp = '\(\mathit{inst}(c)\) returns the set of all activity instances in case \(c\).
\newline \(\mathit{IC}(i)\) returns the inventory cost of activity instance \(i\). \\' WHERE slug = 'inventory-cost-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{IC}\mathit{^{\times}}(g)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{c \in g} \mathit{IC}\mathit{^{\times}}(c)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{IC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{IC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{c \in g} \mathit{IC}(c)\)', description_fp = '\(\mathit{IC}(c)\) returns the inventory cost for case \(c\). \\' WHERE slug = 'inventory-cost-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{IC}\mathit{^{sgl}}(i)\)', formalization_latex = '\(\begin{cases}
\#^{}_{\mathit{ic}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{ic}}(\mathit{cpl}(i)) \neq \bot \\
\#^{}_{\mathit{ic}}(\mathit{str}(i)) & \mathit{if \ } \#^{}_{\mathit{ic}}(\mathit{cpl}(i)) = \bot \land \#^{}_{\mathit{ic}}(\mathit{str}(i)) \neq \bot \\
\bot & \mathit{if \ } \#^{}_{\mathit{ic}}(\mathit{cpl}(i)) = \bot \land \#^{}_{\mathit{ic}}(\mathit{str}(i)) = \bot \\
\end{cases}\)', formalization_fp = '\(\begin{cases} \#^{}_{\mathit{ic}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{ic}}(\mathit{cpl}(i)) \neq undefined \\ \#^{}_{\mathit{ic}}(\mathit{str}(i)) & \mathit{if \ } \#^{}_{\mathit{ic}}(\mathit{cpl}(i)) = undefined \land \#^{}_{\mathit{ic}}(\mathit{str}(i)) \neq undefined \\ undefined & \mathit{if \ } \#^{}_{\mathit{ic}}(\mathit{cpl}(i)) = undefined \land \#^{}_{\mathit{ic}}(\mathit{str}(i)) = undefined \\ \end{cases}\)', description_fp = '\(\#^{}_{\mathit{ic}}\) returns the inventory cost associated with an event.
\newline \(\mathit{cpl}(i)\) returns the completion event of activity instance \(i\).
\newline \(\mathit{str}(i)\) returns the start event of activity instance \(i\). \\' WHERE slug = 'inventory-cost-considering-single-events-of-activity-instances-activity-instance-granularity-c-i';
UPDATE indicator SET function_name = '\(\mathit{IC}\mathit{^{sum}}(i)\)', formalization_latex = '\(\begin{cases}
\#^{}_{\mathit{ic}}(\mathit{str}(i)) + & \\ \#^{}_{\mathit{ic}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{ic}}(\mathit{cpl}(i)) \neq \bot \land \#^{}_{\mathit{ic}}(\mathit{str}(i)) \neq \bot \\
\bot & \mathit{if \ } \#^{}_{\mathit{ic}}(\mathit{cpl}(i)) = \bot \lor \#^{}_{\mathit{ic}}(\mathit{str}(i)) = \bot \\
\end{cases}\)', formalization_fp = '\(\begin{cases} \#^{}_{\mathit{ic}}(\mathit{str}(i)) + & \\ \#^{}_{\mathit{ic}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{ic}}(\mathit{cpl}(i)) \neq undefined \land \#^{}_{\mathit{ic}}(\mathit{str}(i)) \neq undefined \\ undefined & \mathit{if \ } \#^{}_{\mathit{ic}}(\mathit{cpl}(i)) = undefined \lor \#^{}_{\mathit{ic}}(\mathit{str}(i)) = undefined \\ \end{cases}\)', description_fp = '\(\#^{}_{\mathit{ic}}\) returns the inventory cost associated with an event.
\newline \(\mathit{str}(i)\) returns the start event of activity instance \(i\).
\newline \(\mathit{cpl}(i)\) returns the completion event of activity instance \(i\). \\' WHERE slug = 'inventory-cost-considering-the-sum-of-all-events-of-activity-instances-activity-instance-granularity-c-i';
UPDATE indicator SET function_name = '\(\mathit{LC}\mathit{^{\times}}(a)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(a)} \mathit{LC}\mathit{^{\times}}(i)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{i \in \mathit{inst}(a)} \mathit{LC}(i)\)', description_fp = '\(\mathit{inst}(a)\) returns the set of all instances of activity \(a\).
\newline \(\mathit{LC}(i)\) returns the labor cost of activity instance \(i\). \\' WHERE slug = 'labor-cost-activity-granularity-c-a';
UPDATE indicator SET function_name = '\(\mathit{LC}\mathit{^{\times}}(c)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(c)} \mathit{LC}\mathit{^{\times}}(i)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{i \in \mathit{inst}(c)} \mathit{LC}(i)\)', description_fp = '\(\mathit{inst}(c)\) returns the set of all activity instances in case \(c\).
\newline \(\mathit{LC}(i)\) returns the labor cost of activity instance \(i\). \\' WHERE slug = 'labor-cost-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{LC}\mathit{^{\times}}(g)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{c \in g} \mathit{LC}\mathit{^{\times}}(c)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{c \in g} \mathit{LC}(c)\)', description_fp = '\(\mathit{LC}(c)\) returns the labor cost for case \(c\). \\' WHERE slug = 'labor-cost-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{LCTCR}\mathit{^{\times}}(a)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{LC}\mathit{^{\times}}(a)}{\mathit{TC}\mathit{^{\times}}(a)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sgl}}$ and $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sum}}$ and $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{LC}(a)}{\mathit{TC}(a)}\)', description_fp = '\(\mathit{LC}(a)\) returns the total labor cost of activity \(a\).
\newline \(\mathit{TC}(a)\) returns the total cost of activity \(a\). \\' WHERE slug = 'labor-cost-and-total-cost-ratio-activity-granularity-c-a';
UPDATE indicator SET function_name = '\(\mathit{LCTCR}\mathit{^{\times}}(c)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{LC}\mathit{^{\times}}(c)}{\mathit{TC}\mathit{^{\times}}(c)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sgl}}$ and $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sum}}$ and $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{LC}(c)}{\mathit{TC}(c)}\)', description_fp = '\(\mathit{LC}(c)\) returns the total labor cost of case \(c\).
\newline \(\mathit{TC}(c)\) returns the total cost of case \(c\). \\' WHERE slug = 'labor-cost-and-total-cost-ratio-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{LCTCR}\mathit{^{\times}}(g)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{LC}\mathit{^{\times}}(g)}{\mathit{TC}\mathit{^{\times}}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sgl}}$ and $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sum}}$ and $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{LC}(g)}{\mathit{TC}(g)}\)', description_fp = '\(\mathit{LC}(g)\) returns the total labor cost of case group \(g\).
\newline \(\mathit{TC}(g)\) returns the total cost of case group \(g\). \\' WHERE slug = 'labor-cost-and-total-cost-ratio-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{LCTCR}\mathit{^{\times}}(i)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{LC}\mathit{^{\times}}(i)}{\mathit{TC}\mathit{^{\times}}(i)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sgl}}$ and $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{LC}\mathit{^{sum}}$ and $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{LC}(i)}{\mathit{TC}(i)}\)', description_fp = '\(\mathit{LC}(i)\) returns the labor cost of activity instance \(i\).
\newline \(\mathit{TC}(i)\) returns the total cost of activity instance \(i\). \\' WHERE slug = 'labor-cost-and-total-cost-ratio-activity-instance-granularity-c-i';
UPDATE indicator SET function_name = '\(\mathit{LC}\mathit{^{sgl}}(i)\)', formalization_latex = '\(\begin{cases}
\#^{}_{\mathit{lc}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{lc}}(\mathit{cpl}(i)) \neq \bot \\
\#^{}_{\mathit{lc}}(\mathit{str}(i)) & \mathit{if \ } \#^{}_{\mathit{lc}}(\mathit{cpl}(i)) = \bot \land \#^{}_{\mathit{lc}}(\mathit{str}(i)) \neq \bot \\
\bot & \mathit{if \ } \#^{}_{\mathit{lc}}(\mathit{cpl}(i)) = \bot \land \#^{}_{\mathit{lc}}(\mathit{str}(i)) = \bot \\
\end{cases}\)', formalization_fp = '\(\begin{cases}
\#^{}_{\mathit{lc}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{lc}}(\mathit{cpl}(i)) \neq undefined \\
\#^{}_{\mathit{lc}}(\mathit{str}(i)) & \mathit{if \ } \#^{}_{\mathit{lc}}(\mathit{cpl}(i)) = undefined \land \#^{}_{\mathit{lc}}(\mathit{str}(i)) \neq undefined \\
undefined & \mathit{if \ } \#^{}_{\mathit{lc}}(\mathit{cpl}(i)) = undefined \land \#^{}_{\mathit{lc}}(\mathit{str}(i)) = undefined \\
\end{cases}\)', description_fp = '\(\#^{}_{\mathit{lc}}\) returns the labor cost associated with an event.
\newline \(\mathit{cpl}(i)\) returns the completion event of activity instance \(i\).
\newline \(\mathit{str}(i)\) returns the start event of activity instance \(i\). \\' WHERE slug = 'labor-cost-considering-single-events-of-activity-instances-activity-instance-granularity-c-i';
UPDATE indicator SET function_name = '\(\mathit{LC}\mathit{^{sum}}(i)\)', formalization_latex = '\(\begin{cases}
\#^{}_{\mathit{lc}}(\mathit{str}(i)) + & \\ \#^{}_{\mathit{lc}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{lc}}(\mathit{cpl}(i)) \neq \bot \land \#^{}_{\mathit{lc}}(\mathit{str}(i)) \neq \bot \\
\bot & \mathit{if \ } \#^{}_{\mathit{lc}}(\mathit{cpl}(i)) = \bot \lor \#^{}_{\mathit{lc}}(\mathit{str}(i)) = \bot \\
\end{cases}\)', formalization_fp = '\(\begin{cases}
\#^{}_{\mathit{lc}}(\mathit{str}(i)) + & \\ \#^{}_{\mathit{lc}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{lc}}(\mathit{cpl}(i)) \neq undefined \land \#^{}_{\mathit{lc}}(\mathit{str}(i)) \neq undefined \\
undefined & \mathit{if \ } \#^{}_{\mathit{lc}}(\mathit{cpl}(i)) = undefined \lor \#^{}_{\mathit{lc}}(\mathit{str}(i)) = undefined \\
\end{cases}\)', description_fp = '\(\#^{}_{\mathit{lc}}\) returns the labor cost associated with an event.
\newline \(\mathit{str}(i)\) returns the start event of activity instance \(i\).
\newline \(\mathit{cpl}(i)\) returns the completion event of activity instance \(i\). \\' WHERE slug = 'labor-cost-considering-the-sum-of-all-events-of-activity-instances-activity-instance-granularity-c-i';
UPDATE indicator SET function_name = '\(\mathit{LT}(a)\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(a)} \mathit{LT}(i)\)', formalization_fp = '\(\sum_{i \in \mathit{inst}(a)} \mathit{LT}(i)\)', description_fp = '$\mathit{inst}(a)$ returns the set of activity instances that belong to activity $a$.
\newline $\mathit{LT}(i)$ returns the lead time of activity instance $i$.\\' WHERE slug = 'lead-time-activity-granularity-t-a';
UPDATE indicator SET function_name = '\(\mathit{LT}(c)\)', formalization_latex = '\(\mathit{endt}(c) - \mathit{startt}(c)\)', formalization_fp = '\(\mathit{endt}(c) - \mathit{startt}(c)\)', description_fp = '$\mathit{endt}(c)$ returns the end timestamp of case $c$.
\newline $\mathit{startt}(c)$ returns the start timestamp of case $c$.\\' WHERE slug = 'lead-time-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{LT}(g)\)', formalization_latex = '\(^{\mathit{max}}_{c \in g} \mathit{endt}(c) - ^{\mathit{min}}_{c \in g} \mathit{startt}(c)\)', formalization_fp = '\(^{\mathit{max}}_{c \in g} \mathit{endt}(c) - ^{\mathit{min}}_{c \in g} \mathit{startt}(c)\)', description_fp = '$\mathit{endt}(c)$ returns the end timestamp of case $c$.
\newline $\mathit{startt}(c)$ returns the start timestamp of case $c$.
\newline  $^{\mathit{max}}_{c \in g}$ and $^{\mathit{min}}_{c \in g}$ indicate that the maximum end time and minimum start time are taken across all cases in the group $g$.\\' WHERE slug = 'lead-time-group-of-cases-granularity-t-g';
UPDATE indicator SET function_name = '\(\mathit{LT}(i)\)', formalization_latex = '\(\mathit{ST}(i) + \mathit{WT}(i)\)', formalization_fp = '\(\mathit{ST}(i) + \mathit{WT}(i)\)', description_fp = '$\mathit{ST}(i)$ returns the service time of activity instance $i$, representing the time between its start and completion.
\newline $\mathit{WT}(i)$ returns the waiting time of activity instance $i$, representing the idle period before the instance starts execution.\\' WHERE slug = 'lead-time-activity-instance-granularity-t-i';
UPDATE indicator SET function_name = '\(\mathit{LTCR}(g)\)', formalization_latex = '\(\frac{\mathit{LT}(g)}{\mathit{C}(g)}\)', formalization_fp = '\(\frac{\mathit{LT}(g)}{\mathit{C}(g)}\)', description_fp = '$\mathit{LT}(g)$ returns the total lead time of group $g$.
\newline $\mathit{C}(g)$ returns the total number of cases in group $g$.\\' WHERE slug = 'lead-time-and-case-count-ratio-group-of-cases-granularity-t-g';
UPDATE indicator SET function_name = '\(\mathit{LTDE}(c, \mathit{val})\)', formalization_latex = '\(|\mathit{val} - \mathit{LT}(c)|\)', formalization_fp = '\(|val - \mathit{LT}(c)|\)', description_fp = '\ $val$ represents the expected time value.
\newline $\mathit{LT}(c)$ returns the lead time of case $c$.\\' WHERE slug = 'lead-time-deviation-from-expectation-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{LTDL}(c, \mathit{val})\)', formalization_latex = '\(\mathit{val} - \mathit{LT}(c)\)', formalization_fp = '\(val - \mathit{LT}(c)\)', description_fp = '$\mathit{LT}(c)$ returns the lead time of case $c$.
\newline $val$ represents the predefined time Limit for the case.
\newline The expression $|val - \mathit{LT}(c)|$ measures the absolute deviation of the case lead time from its deadline.\\' WHERE slug = 'lead-time-deviation-from-time-limit-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{LTfA}(c, \mathit{a})\)', formalization_latex = '\(\begin{cases}
\mathit{lt}(x, y) & \mathit{for~any \ } x \in \mathit{fi}\mathit{^{s}}(c, \mathit{a}) \mathit{\ and \ } y \in \mathit{endin}(c) \\ \bot & \mathit{if \ } \mathit{fi}\mathit{^{s}}(c, \mathit{a}) = \emptyset
\end{cases}\)', formalization_fp = '\(\begin{cases}
\mathit{lt}(any (\mathit{fi}\mathit{^{s}}(c, \mathit{a}), any (\mathit{endin}(c))) & \mathit{if \ } \mathit{fi}\mathit{^{s}}(c, \mathit{a}) \neq \emptyset \\
undefined & \mathit{if \ } \mathit{fi}\mathit{^{s}}(c, \mathit{a}) = \emptyset
\end{cases}\)', description_fp = '$\mathit{fi}\mathit{^{s}}(c, \mathit{a})$ returns the set of first started instances of activity $\mathit{a}$ in case $c$.
\newline $\mathit{endin}(c)$ returns the final activity instance of case $c$.
\newline $\mathit{lt}(x, y)$ returns the lead time from activity instance $x$ to $y$.\\' WHERE slug = 'lead-time-from-activity-a-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{LTAB}(c, \mathit{a}, \mathit{b})\)', formalization_latex = '\(\begin{cases}
\mathit{lt}(x,y) & \mathit{for~any \ } x \in \mathit{fi}\mathit{^{s}}(c, \mathit{a}) \mathit{\ and \ } y \in \mathit{fi}\mathit{^{sc}}(c, \mathit{a}, \mathit{b}) \\
\bot & \mathit{if \ } \mathit{fi}\mathit{^{sc}}(c, \mathit{a}, \mathit{b}) = \emptyset
\end{cases}\)', formalization_fp = '\(\begin{cases}
\mathit{lt}(x,y) & \mathit{for~any \ } x \in \mathit{fi}\mathit{^{s}}(c, \mathit{a}) \mathit{\ and \ } y \in \mathit{fi}(c, \mathit{a}, \mathit{b}) \\
undefined & \mathit{if \ } \mathit{fi}(c, \mathit{a}, \mathit{b}) = \emptyset
\end{cases}\)', description_fp = '$\mathit{fi}\mathit{^{s}}(c, \mathit{a})$ returns the set of first started instances of activity $\mathit{a}$ in case $c$.
\newline $\mathit{fi}(c, \mathit{a}, \mathit{b})$ returns the first instance of activity $\mathit{b}$ occurring after the first started instance of activity $\mathit{a}$ in case $c$.
\newline $\mathit{lt}(x,y)$ returns the lead time between activity instances $x$ and $y$.\\' WHERE slug = 'lead-time-from-activity-a-to-activity-b-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{LTtA}(c, \mathit{a})\)', formalization_latex = '\(\begin{cases}
\mathit{lt}(x, y) & \mathit{for~any \ } x \in \mathit{strin}(c) \mathit{\ and \ } y \in \mathit{fi}\mathit{^{c}}(c, \mathit{a}) \\ \bot & \mathit{if \ } \mathit{fi}\mathit{^{c}}(c, \mathit{a}) = \emptyset
\end{cases}\)', formalization_fp = '\(\begin{cases}
\mathit{lt}(x, y) & \mathit{for~any \ } x \in \mathit{strin}(c) \mathit{\ and \ } y \in \mathit{fi}\mathit{^{c}}(c, \mathit{a}) \\
undefined & \mathit{if \ } \mathit{fi}\mathit{^{c}}(c, \mathit{a}) = \emptyset
\end{cases}\)', description_fp = '$\mathit{strin}(c)$ returns the activity instance that starts case $c$.
\newline $\mathit{fi}\mathit{^{c}}(c, \mathit{a})$ returns the first completed instance of activity $\mathit{a}$ in case $c$.
\newline $\mathit{lt}(x, y)$ returns the lead time between activity instances $x$ and $y$.\\' WHERE slug = 'lead-time-to-activity-a-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{MainC}(c)\)', formalization_latex = '\(\#^{}_{\mathit{mainc}}(c)\)', formalization_fp = '\(\#^{}_{\mathit{mainc}}(c)\)', description_fp = '\(\#^{}_{\mathit{mainc}}\) returns the maintenance cost associated with case \(c\). \\' WHERE slug = 'maintenance-cost-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{MainC}(g)\)', formalization_latex = '\(\sum _{c \in g} \mathit{MainC}(c)\)', formalization_fp = '\(\sum _{c \in g} \mathit{MainC}(c)\)', description_fp = '\(\mathit{MainC}(c)\) returns the maintenance cost for case \(c\). \\' WHERE slug = 'maintenance-cost-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{MDC}(c)\)', formalization_latex = '\(\#^{}_{\mathit{mdc}}(c)\)', formalization_fp = '\(\#^{}_{\mathit{mdc}}(c)\)', description_fp = '\(\#^{}_{\mathit{mdc}}\) returns the missed deadline cost associated with case \(c\). \\' WHERE slug = 'missed-deadline-cost-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{MDC}(g)\)', formalization_latex = '\(\sum _{c \in g} \mathit{MDC}(c)\)', formalization_fp = '\(\sum _{c \in g} \mathit{MDC}(c)\)', description_fp = '\(\mathit{MDC}(c)\) returns the missed deadline cost for case \(c\). \\' WHERE slug = 'missed-deadline-cost-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{NAutA}(c)\)', formalization_latex = '\(|\mathit{act}(c) \backslash \mathit{Autl}|\)', formalization_fp = '\(\displaystyle \sum_{a \in \mathit{act}(c)}
\begin{cases}
1 & \text{if } a \notin \mathit{Autl} \\
0 & \text{otherwise}
\end{cases}
\)', description_fp = '\(\mathit{act}(c)\) returns the set of activities that occurred in case \(c\).
\newline \(\mathit{Autl}\) returns the set of automated activities. \\' WHERE slug = 'non-automated-activity-count-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{NAutA}(g)\)', formalization_latex = '\(|(\cup _{c \in g} \mathit{act}(c)) \backslash \mathit{Autl}|\)', formalization_fp = '\(\displaystyle \sum_{a \in (\cup _{c \in g} \mathit{act}(c))}
\begin{cases}
1 & \text{if } a \notin \mathit{Autl} \\
0 & \text{otherwise}
\end{cases}
\)', description_fp = '\(\mathit{act}(c)\) returns the set of activities that occurred in case \(c\).
\newline \(\mathit{Autl}\) returns the set of automated activities. \\' WHERE slug = 'non-automated-activity-count-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{NAutI}(c)\)', formalization_latex = '\(|\{i \in \mathit{inst}(c) \mid \mathit{act}(i) \notin \mathit{Autl}\}|\)', formalization_fp = '\(\displaystyle \sum_{i \in \mathit{inst}(c)}
\begin{cases}
1 & \text{if } \mathit{act}(i) \notin \mathit{Autl} \\
0 & \text{otherwise}
\end{cases}
\)', description_fp = '\(\mathit{inst}(c)\) returns the set of all activity instances in case \(c\).
\newline \(\mathit{act}(i)\) returns the activity of activity instance \(i\).
\newline \(\mathit{Autl}\) returns the set of automated activities. \\' WHERE slug = 'non-automated-activity-instance-count-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{NAutI}(g)\)', formalization_latex = '\(\sum _{c \in g} \mathit{NAutI}(c)\)', formalization_fp = '\(\sum _{c \in g} \mathit{NAutI}(c)\)', description_fp = '\(\mathit{NAutI}(c)\) returns the non-automated activity instance count for case \(c\). \\' WHERE slug = 'non-automated-activity-instance-count-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{OptA}(c)\)', formalization_latex = '\(|\{a \in \mathit{act}(c) \mid \exists c'' \in C[a \notin \mathit{act}(c'')]\}|\)', formalization_fp = '\(\displaystyle \sum_{a \in \mathit{act}(c)}
\begin{cases}
1 & \text{if } a \in \mathit{opt}(C) \\
0 & \text{otherwise}
\end{cases}
\)', description_fp = '\(\mathit{act}(c)\) returns the set of activities that occurred in case \(c\).
\newline \(\mathit{opt}(C)\) returns the set of optional activities in the event log \(C\). \\' WHERE slug = 'optional-activity-count-case-granularity-f-c';
UPDATE indicator SET function_name = '\(\mathit{OptA}(g)\)', formalization_latex = '\(|\{a \in \mathit{act}(c) \mid c \in g \land \exists c'' \in C[a \notin \mathit{act}(c'')]\}|\)', formalization_fp = '\(\displaystyle \sum_{a \in \mathit{act}(g)}
\begin{cases}
1 & \text{if } a \in \mathit{opt}(C) \\
0 & \text{otherwise}
\end{cases}
\)', description_fp = '\(\mathit{act}(c)\) returns the set of activities that occurred in case \(c\).
\newline \(\mathit{opt}(C)\) returns the set of optional activities in the event log \(C\). \\' WHERE slug = 'optional-activity-count-group-of-cases-granularity-f-g';
UPDATE indicator SET function_name = '\(\mathit{Opt}(c)\)', formalization_latex = '\(\frac{\mathit{OptA}(c)}{\mathit{A}(c)}\)', formalization_fp = '\(\frac{\mathit{OptA}(c)}{\mathit{A}(c)}\)', description_fp = '\(\mathit{OptA}(c)\) returns the optional activity count for case \(c\).
\newline \(\mathit{A}(c)\) returns the number of unique activities in case \(c\). \\' WHERE slug = 'optionality-case-granularity-f-c';
UPDATE indicator SET function_name = '\(\mathit{Opt}(g)\)', formalization_latex = '\(\frac{\mathit{OptA}(g)}{\mathit{A}(g)}\)', formalization_fp = '\(\frac{\mathit{OptA}(g)}{\mathit{A}(g)}\)', description_fp = '\(\mathit{OptA}(g)\) returns the optional activity count for group \(g\).
\newline \(\mathit{A}(g)\) returns the number of unique activities in group \(g\). \\' WHERE slug = 'optionality-group-of-cases-granularity-f-g';
UPDATE indicator SET function_name = '\(\mathit{U}\mathit{^{\times}}(a)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(a)} \mathit{U}\mathit{^{\times}}(i)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\mathit{U}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\mathit{U}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{i \in \mathit{inst}(a)} \mathit{U}(i)\)', description_fp = '\(\mathit{inst}(a)\) returns the set of all instances of activity \(a\).
\newline \(\mathit{U}(i)\) returns the outcome unit count of activity instance \(i\). \\' WHERE slug = 'outcome-unit-count-activity-granularity-q-a';
UPDATE indicator SET function_name = '\(\mathit{U}\mathit{^{\times}}(c)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{e \in \mathit{inst}(c)} \mathit{U}\mathit{^{\times}}(i)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\mathit{U}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\mathit{U}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{i \in \mathit{inst}(c)} \mathit{U}(i)\)', description_fp = '\(\mathit{inst}(c)\) returns the set of all activity instances in case \(c\).
\newline \(\mathit{U}(i)\) returns the outcome unit count of activity instance \(i\). \\' WHERE slug = 'outcome-unit-count-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{U}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{c \in g} \mathit{U}\mathit{^{\times}}(c)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\mathit{U}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\mathit{U}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{c \in g} \mathit{U}(c)\)', description_fp = '\(\mathit{U}(c)\) returns the outcome unit count of case \(c\). \\' WHERE slug = 'outcome-unit-count-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{U}\mathit{^{sgl}}(i)\)', formalization_latex = '\(\begin{cases}
\#^{}_{\mathit{unt}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{unt}}(\mathit{cpl}(i)) \neq \bot \\
\#^{}_{\mathit{unt}}(\mathit{str}(i)) & \mathit{if \ } \#^{}_{\mathit{unt}}(\mathit{cpl}(i)) = \bot \land \\ & \#^{}_{\mathit{unt}}(\mathit{str}(i)) \neq \bot \\
\bot & \mathit{if \ } \#^{}_{\mathit{unt}}(\mathit{cpl}(i)) = \bot \land \\ & \#^{}_{\mathit{unt}}(\mathit{str}(i)) = \bot \\
\end{cases}\)', formalization_fp = '\(\begin{cases}
\#^{}_{\mathit{unt}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{unt}}(\mathit{cpl}(i)) \neq undefined \\
\#^{}_{\mathit{unt}}(\mathit{str}(i)) & \mathit{if \ } \#^{}_{\mathit{unt}}(\mathit{cpl}(i)) = undefined \land \#^{}_{\mathit{unt}}(\mathit{str}(i)) \neq undefined \\
undefined & \mathit{if \ } \#^{}_{\mathit{unt}}(\mathit{cpl}(i)) = undefined \land \#^{}_{\mathit{unt}}(\mathit{str}(i)) = undefined \\
\end{cases}\)', description_fp = '\(\#^{}_{\mathit{unt}}\) returns the outcome unit count associated with an event.
\newline \(\mathit{cpl}(i)\) returns the completion event of activity instance \(i\).
\newline \(\mathit{str}(i)\) returns the start event of activity instance \(i\). \\' WHERE slug = 'outcome-unit-count-considering-single-events-of-activity-instances-activity-instance-granularity-q-i';
UPDATE indicator SET function_name = '\(\mathit{U}\mathit{^{sum}}(i)\)', formalization_latex = '\(\begin{cases}
\#^{}_{\mathit{unt}}(\mathit{str}(i)) + & \mathit{if \ } \#^{}_{\mathit{unt}}(\mathit{cpl}(i)) \neq \bot \land \\ \#^{}_{\mathit{unt}}(\mathit{cpl}(i)) & \#^{}_{\mathit{unt}}(\mathit{str}(i)) \neq \bot \\
\bot & \mathit{if \ } \#^{}_{\mathit{unt}}(\mathit{cpl}(i)) = \bot \lor \\ & \#^{}_{\mathit{unt}}(\mathit{str}(i)) = \bot \\
\end{cases}\)', formalization_fp = '\(\begin{cases}
\#^{}_{\mathit{unt}}(\mathit{str}(i)) + \#^{}_{\mathit{unt}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{unt}}(\mathit{cpl}(i)) \neq undefined \land \\ & \#^{}_{\mathit{unt}}(\mathit{str}(i)) \neq undefined \\
undefined & \mathit{if \ } \#^{}_{\mathit{unt}}(\ \mathit{cpl}(i)) = undefined \lor \#^{}_{\mathit{unt}}(\mathit{str}(i)) = undefined \\
\end{cases}\)', description_fp = '\(\#^{}_{\mathit{unt}}\) returns the outcome unit count associated with an event.
\newline \(\mathit{str}(i)\) returns the start event of activity instance \(i\).
\newline \(\mathit{cpl}(i)\) returns the completion event of activity instance \(i\). \\' WHERE slug = 'outcome-unit-count-considering-the-sum-of-all-events-of-activity-instances-activity-instance-granularity-q-i';
UPDATE indicator SET function_name = '\(\mathit{OQ}(c)\)', formalization_latex = '\(\#^{}_{\mathit{qual}}(c)\)', formalization_fp = '\(\#^{}_{\mathit{qual}}(c)\)', description_fp = '\(\#^{}_{\mathit{qual}}\) returns the overall quality associated with case \(c\). \\' WHERE slug = 'overall-quality-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{OC}\mathit{^{\times}}(c)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(c), \mathit{act}(i) \notin \mathit{DCl}} \mathit{TC}\mathit{^{\times}}(i)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{i \in \mathit{inst}(c), \mathit{act}(i) \notin \mathit{DCl}} \mathit{TC}(i)\)', description_fp = '\(\mathit{inst}(c)\) returns the set of all activity instances in case \(c\).
\newline \(\mathit{act}(i)\) returns the activity of activity instance \(i\).
\newline \(\mathit{DCl}\) returns the set of direct cost activities.
\newline \(\mathit{TC}(i)\) returns the total cost of activity instance \(i\). \\' WHERE slug = 'overhead-cost-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{OC}\mathit{^{\times}}(g)\) 
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{c \in g} \mathit{OC}\mathit{^{\times}}(c)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{OC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{OC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{c \in g} \mathit{OC}(c)\)', description_fp = '\(\mathit{OC}(c)\) returns the overhead cost for case \(c\). \\' WHERE slug = 'overhead-cost-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{Rep}(c)\)', formalization_latex = '\(1 - \frac{\mathit{A}(c)}{\mathit{I}(c)}\)', formalization_fp = '\(1 - \frac{\mathit{A}(c)}{\mathit{I}(c)}\)', description_fp = '\(\mathit{A}(c)\) returns the number of unique activities in case \(c\).
\newline \(\mathit{I}(c)\) returns the total number of activity instances in case \(c\). \\' WHERE slug = 'repeatability-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{Rep}(g)\)', formalization_latex = '\(1 - \frac{\mathit{A}(g)}{\mathit{I}(g)}\)', formalization_fp = '\(1 - \frac{\mathit{A}(g)}{\mathit{I}(g)}\)', description_fp = '\(\mathit{A}(g)\) returns the number of unique activities in group \(g\).
\newline \(\mathit{I}(g)\) returns the total number of activity instances in group \(g\). \\' WHERE slug = 'repeatability-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{R}(a)\)', formalization_latex = '\(|\mathit{res}(a)|\)', formalization_fp = '\(\mathit{count}(\mathit{res}(a))\)', description_fp = '$\mathit{res}(a)$ returns the set of resources used for activity $a$ in the event log. \\' WHERE slug = 'resource-count-activity-granularity-c-a';
UPDATE indicator SET function_name = '\(\mathit{R}(c)\)', formalization_latex = '\(|\mathit{res}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{res}(c))\)', description_fp = '$\mathit{res}(c)$ returns the set of resources used in case $c$. \\' WHERE slug = 'resource-count-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{R}(g)\)', formalization_latex = '\(|\cup_{c \in g} \mathit{res}(c)|\)', formalization_fp = '\(\mathit{count}(\cup_{c \in g} \mathit{res}(c))\)', description_fp = '\(\mathit{res}(c)\) returns the set of unique resources involved in case \(c\). \\' WHERE slug = 'resource-count-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{R}(a)\)', formalization_latex = '\(|\mathit{res}(a)|\)', formalization_fp = '\(\mathit{count}(\mathit{res}(a))\)', description_fp = '$\mathit{res}(a)$ returns the set of resources used for activity $a$ in the event log. \\' WHERE slug = 'resource-count-activity-granularity-g-a';
UPDATE indicator SET function_name = '\(\mathit{R}(c)\)', formalization_latex = '\(|\mathit{res}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{res}(c))\)', description_fp = '$\mathit{res}(c)$ returns the set of resources used in case $c$. \\' WHERE slug = 'resource-count-case-granularity-g-c';
UPDATE indicator SET function_name = '\(\mathit{R}(g)\)', formalization_latex = '\(|\cup_{c \in g} \mathit{res}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{res}(g))\)', description_fp = '$\mathit{res}(g)$ returns the set of resources used in group of cases $g$. \\' WHERE slug = 'resource-count-group-of-cases-granularity-g-g';
UPDATE indicator SET function_name = '\(\mathit{RC}\mathit{^{\times}}(a)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\mathit{TC}(a) - \sum _{c \in C} \mathit{fitc}\mathit{^{\times}}(c, a)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{fitc}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{fitc}\mathit{^{sum}}$.', formalization_fp = '\(\mathit{TC}(a) - \sum _{c \in C} \mathit{fitc}(c, a)\)', description_fp = '\(\mathit{TC}(a)\) returns the total cost of activity \(a\).
\newline \(\mathit{fitc}\) returns the cost of the first instance of activity \(a\) in case \(c\). \\' WHERE slug = 'rework-cost-activity-granularity-c-a';
UPDATE indicator SET function_name = '\(\mathit{RC}\mathit{^{\times}}(c)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\mathit{TC}(c) - \sum _{a \in A} \mathit{fitc}\mathit{^{\times}}(c, a)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{fitc}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{fitc}\mathit{^{sum}}$.', formalization_fp = '\(\mathit{TC}(c) - \sum _{a \in A} \mathit{fitc}(c, a)\)', description_fp = '\(\mathit{TC}(c)\) returns the total cost of case \(c\).
\newline \(\mathit{fitc}\) returns the cost of the first instance of activity \(a\) in case \(c\). \\' WHERE slug = 'rework-cost-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{RC}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{c \in g} \mathit{RC}\mathit{^{\times}}(c)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{RC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{RC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{c \in g} \mathit{RC}(c)\)', description_fp = '\(\mathit{RC}(c)\) returns the rework cost for case \(c\). \\' WHERE slug = 'rework-cost-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{RewC}(a)\)', formalization_latex = '\(\sum _{c \in C} \mathit{max}(0, \mathit{count}(c, a) - 1)\)', formalization_fp = '\(\sum _{c \in C} \mathit{max}(0, \mathit{count}(c, a) - 1)\)', description_fp = '\(\mathit{count}(c, a)\) returns the number of instances of activity \(a\) in case \(c\). \\' WHERE slug = 'rework-count-activity-granularity-c-a';
UPDATE indicator SET function_name = '\(\mathit{RewC}(c)\)', formalization_latex = '\(\sum _{a \in A} \mathit{max}(0, \mathit{count}(c, a) - 1)\)', formalization_fp = '\(\sum _{a \in A} \mathit{max}(0, \mathit{count}(c, a) - 1)\)', description_fp = '\(\mathit{count}(c, a)\) returns the number of instances of activity \(a\) in case \(c\). \\' WHERE slug = 'rework-count-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{RewC}(g)\)', formalization_latex = '\(\sum _{c \in g} \mathit{RewC}(c)\)', formalization_fp = '\(\sum _{c \in g} \mathit{RewC}(c)\)', description_fp = '\(\mathit{RewC}(c)\) returns the rework count for case \(c\). \\' WHERE slug = 'rework-count-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{RewC}(a)\)', formalization_latex = '\(\sum _{c \in C} \mathit{max}(0, \mathit{count}(c, a) - 1)\)', formalization_fp = '\(\sum _{c \in C} \mathit{max}(0, \mathit{count}(c, a) - 1)\)', description_fp = '\(\mathit{count}(c, a)\) returns the number of instances of activity \(a\) in case \(c\). \\' WHERE slug = 'rework-count-activity-granularity-q-a';
UPDATE indicator SET function_name = '\(\mathit{RewC}(c)\)', formalization_latex = '\(\sum _{a \in A} \mathit{max}(0, \mathit{count}(c, a) - 1)\)', formalization_fp = '\(\sum _{a \in A} \mathit{max}(0, \mathit{count}(c, a) - 1)\)', description_fp = '\(\mathit{count}(c, a)\) returns the number of instances of activity \(a\) in case \(c\). \\' WHERE slug = 'rework-count-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{RewC}(g)\)', formalization_latex = '\(\sum _{c \in g} \mathit{RewC}(c)\)', formalization_fp = '\(\sum _{c \in g} \mathit{RewC}(c)\)', description_fp = '\(\mathit{RewC}(c)\) returns the rework count for case \(c\). \\' WHERE slug = 'rework-count-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{RewCV}(a, \mathit{val})\)', formalization_latex = '\(\sum _{c \in C} \mathit{max}(0, \mathit{count}(c, a) - \mathit{val})\)', formalization_fp = '\(\sum _{c \in C} \mathit{max}(0, \mathit{count}(c, a) - \mathit{val})\)', description_fp = '\(\mathit{count}(c, a)\) returns the number of instances of activity \(a\) in case \(c\). \\' WHERE slug = 'rework-count-by-value-activity-granularity-q-a';
UPDATE indicator SET function_name = '\(\mathit{RewCV}(c, \mathit{val})\)', formalization_latex = '\(\sum _{a \in A} \mathit{max}(0, \mathit{count}(c, a) - \mathit{val})\)', formalization_fp = '\(\sum _{a \in A} \mathit{max}(0, \mathit{count}(c, a) - \mathit{val})\)', description_fp = '\(\mathit{count}(c, a)\) returns the number of instances of activity \(a\) in case \(c\). \\' WHERE slug = 'rework-count-by-value-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{RewCV}(g, \mathit{val})\)', formalization_latex = '\(\sum _{c \in g} \mathit{RewCV}(c, \mathit{val})\)', formalization_fp = '\(\sum _{c \in g} \mathit{RewCV}(c, \mathit{val})\)', description_fp = '\(\mathit{RewCV}(c, \mathit{val})\) returns the rework count by value \(\mathit{val}\) for case \(c\). \\' WHERE slug = 'rework-count-by-value-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{RewSub}(c, \mathit{sub})\)', formalization_latex = '\(\sum _{a \in \mathit{sub}} \mathit{max}(0, \mathit{count}(c, a) - 1)\)', formalization_fp = '\(\sum _{a \in \mathit{sub}} \mathit{max}(0, \mathit{count}(c, a) - 1)\)', description_fp = '\(\mathit{count}(c, a)\) returns the number of instances of activity \(a\) in case \(c\). \\' WHERE slug = 'rework-of-activities-subset-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{RewSub}(g, \mathit{sub})\)', formalization_latex = '\(\sum _{c \in g} \mathit{RewSub}(c, \mathit{sub})\)', formalization_fp = '\(\sum _{c \in g} \mathit{RewSub}(c, \mathit{sub})\)', description_fp = '\(\mathit{RewSub}(c, \mathit{sub})\) returns the rework count for subset \(\mathit{sub}\) in case \(c\). \\' WHERE slug = 'rework-of-activities-subset-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{RewP}(a)\)', formalization_latex = '\(\frac{\mathit{RewC}(a)}{\mathit{I}(a)}\)', formalization_fp = '\(\frac{\mathit{RewC}(a)}{\mathit{I}(a)}\)', description_fp = '\(\mathit{RewC}(a)\) returns the rework count for activity \(a\).
\newline \(\mathit{I}(a)\) returns the number of instances of activity \(a\). \\' WHERE slug = 'rework-percentage-activity-granularity-c-a';
UPDATE indicator SET function_name = '\(\mathit{RewP}(c)\)', formalization_latex = '\(\frac{\mathit{RewC}(c)}{\mathit{I}(c)}\)', formalization_fp = '\(\frac{\mathit{RewC}(c)}{\mathit{I}(c)}\)', description_fp = '\(\mathit{RewC}(c)\) returns the rework count for case \(c\).
\newline \(\mathit{I}(c)\) returns the total number of activity instances in case \(c\). \\' WHERE slug = 'rework-percentage-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{RewP}(g)\)', formalization_latex = '\(\frac{\mathit{RewC}(g)}{\mathit{I}(g)}\)', formalization_fp = '\(\frac{\mathit{RewC}(g)}{\mathit{I}(g)}\)', description_fp = '\(\mathit{RewC}(g)\) returns the rework count for group \(g\).
\newline \(\mathit{I}(g)\) returns the total number of activity instances in group \(g\). \\' WHERE slug = 'rework-percentage-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{RewP}(a)\)', formalization_latex = '\(\frac{\mathit{RewC}(a)}{\mathit{I}(a)}\)', formalization_fp = '\(\frac{\mathit{RewC}(a)}{\mathit{I}(a)}\)', description_fp = '\(\mathit{RewC}(a)\) returns the rework count for activity \(a\).
\newline \(\mathit{I}(a)\) returns the total number of instances of activity \(a\). \\' WHERE slug = 'rework-percentage-activity-granularity-q-a';
UPDATE indicator SET function_name = '\(\mathit{RewP}(c)\)', formalization_latex = '\(\frac{\mathit{RewC}(c)}{\mathit{I}(c)}\)', formalization_fp = '\(\frac{\mathit{RewC}(c)}{\mathit{I}(c)}\)', description_fp = '\(\mathit{RewC}(c)\) returns the rework count for case \(c\).
\newline \(\mathit{I}(c)\) returns the total number of activity instances in case \(c\). \\' WHERE slug = 'rework-percentage-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{RewP}(g)\)', formalization_latex = '\(\frac{\mathit{RewC}(g)}{\mathit{I}(g)}\)', formalization_fp = '\(\frac{\mathit{RewC}(g)}{\mathit{I}(g)}\)', description_fp = '\(\mathit{RewC}(g)\) returns the total rework count for group \(g\).
\newline \(\mathit{I}(g)\) returns the total number of activity instances in group \(g\). \\' WHERE slug = 'rework-percentage-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{RewPV}(a, \mathit{val})\)', formalization_latex = '\(\frac{\mathit{RewCV}(a, \mathit{val})}{\mathit{I}(a)}\)', formalization_fp = '\(\frac{\mathit{RewCV}(a, \mathit{val})}{\mathit{I}(a)}\)', description_fp = '\(\mathit{RewCV}(a, \mathit{val})\) returns the rework count by value \(\mathit{val}\) for activity \(a\).
\newline \(\mathit{I}(a)\) returns the total number of instances of activity \(a\). \\' WHERE slug = 'rework-percentage-by-value-activity-granularity-q-a';
UPDATE indicator SET function_name = '\(\mathit{RewPV}(c, \mathit{val})\)', formalization_latex = '\(\frac{\mathit{RewCV}(c, \mathit{val})}{\mathit{I}(c)}\)', formalization_fp = '\(\frac{\mathit{RewCV}(c, \mathit{val})}{\mathit{I}(c)}\)', description_fp = '\(\mathit{RewCV}(c, \mathit{val})\) returns the rework count by value \(\mathit{val}\) for case \(c\).
\newline \(\mathit{I}(c)\) returns the total number of activity instances in case \(c\). \\' WHERE slug = 'rework-percentage-by-value-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{RewPV}(g, \mathit{val})\)', formalization_latex = '\(\frac{\mathit{RewCV}(g, \mathit{val})}{\mathit{I}(g)}\)', formalization_fp = '\(\frac{\mathit{RewCV}(g, \mathit{val})}{\mathit{I}(g)}\)', description_fp = '\(\mathit{RewCV}(g, \mathit{val})\) returns the rework count by value \(\mathit{val}\) for group \(g\).
\newline \(\mathit{I}(g)\) returns the total number of activity instances in group \(g\). \\' WHERE slug = 'rework-percentage-by-value-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{RT}(a)\)', formalization_latex = '\(\mathit{LT}(a) - \sum _{c \in C} \mathit{filt}(c, a)\)', formalization_fp = '\(\mathit{LT}(a) - \sum _{c \in C} \mathit{filt}(c, a)\)', description_fp = '\(\mathit{LT}(a)\) returns the total lead time of activity \(a\).
\newline \(\mathit{filt}(c, a)\) returns the lead time of the first instance of activity \(a\) in case \(c\). \\' WHERE slug = 'rework-time-activity-granularity-q-a';
UPDATE indicator SET function_name = '\(\mathit{RT}(c)\)', formalization_latex = '\(\mathit{LT}(c) - \sum _{a \in A} \mathit{filt}(c, a)\)', formalization_fp = '\(\mathit{LT}(c) - \sum _{a \in A} \mathit{filt}(c, a)\)', description_fp = '\(\mathit{LT}(c)\) returns the total lead time of case \(c\).
\newline \(\mathit{filt}(c, a)\) returns the lead time of the first instance of activity \(a\) in case \(c\). \\' WHERE slug = 'rework-time-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{RT}(g)\)', formalization_latex = '\(\sum _{c \in g} \mathit{RT}(c)\)', formalization_fp = '\(\sum _{c \in g} \mathit{RT}(c)\)', description_fp = '\(\mathit{RT}(c)\) returns the rework time for case \(c\). \\' WHERE slug = 'rework-time-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{RoleVR}(g)\)', formalization_latex = '\(\frac{\mathit{Role}(g)}{\mathit{V}(g)}\)', formalization_fp = '\(\frac{\mathit{Role}(g)}{\mathit{V}(g)}\)', description_fp = '\(\mathit{Role}(g)\) returns the number of unique roles involved in group \(g\).
\newline \(\mathit{V}(g)\) returns the number of unique variants in group \(g\). \\' WHERE slug = 'role-and-variant-count-ratio-group-of-cases-granularity-f-g';
UPDATE indicator SET function_name = '\(\mathit{Role}(c)\)', formalization_latex = '\(|\mathit{role}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{role}(c))\)', description_fp = '\(\mathit{role}(c)\) returns the set of unique roles involved in case \(c\). \\' WHERE slug = 'role-count-case-granularity-f-c';
UPDATE indicator SET function_name = '\(\mathit{Role}(g)\)', formalization_latex = '\(|\cup_{c \in g} \mathit{role}(c)|\)', formalization_fp = '\(\mathit{count}(\cup_{c \in g} \mathit{role}(c))\)', description_fp = '\(\mathit{role}(c)\) returns the set of unique roles involved in case \(c\). \\' WHERE slug = 'role-count-group-of-cases-granularity-f-g';
UPDATE indicator SET function_name = '\(\mathit{Role}(c)\)', formalization_latex = '\(|\mathit{role}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{role}(c))\)', description_fp = '$\mathit{role}(c)$ returns all roles involved in case $c$. \\' WHERE slug = 'role-count-case-granularity-g-c';
UPDATE indicator SET function_name = '\(\mathit{Role}(g)\)', formalization_latex = '\(|\cup_{c \in g} \mathit{role}(c)|\)', formalization_fp = '\(\mathit{count}(\mathit{role}(g))\)', description_fp = '$\mathit{role}(g)$ returns the set of roles involved in group of cases \(g\). \\' WHERE slug = 'role-count-group-of-cases-granularity-g-g';
UPDATE indicator SET function_name = '\(\mathit{SLTR}(a)\)', formalization_latex = '\(\frac{\mathit{ST}(a)}{\mathit{LT}(a)}\)', formalization_fp = '\(\frac{\mathit{ST}(a)}{\mathit{LT}(a)}\)', description_fp = '\(\mathit{ST}(a)\) returns the total service time accumulated across all instances of activity \(a\).
\newline \(\mathit{LT}(a)\) returns the total lead time of activity \(a\). \\' WHERE slug = 'service-and-lead-time-ratio-activity-granularity-t-a';
UPDATE indicator SET function_name = '\(\mathit{SLTR}(c)\)', formalization_latex = '\(\frac{\mathit{ST}(c)}{\mathit{LT}(c)}\)', formalization_fp = '\(\frac{\mathit{ST}(c)}{\mathit{LT}(c)}\)', description_fp = '\(\mathit{ST}(c)\) returns the total service time of case \(c\).
\newline \(\mathit{LT}(c)\) returns the total lead time of case \(c\). \\' WHERE slug = 'service-and-lead-time-ratio-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{SLTR}(g)\)', formalization_latex = '\(\frac{\mathit{ST}(g)}{\mathit{LT}(g)}\)', formalization_fp = '\(\frac{\mathit{ST}(g)}{\mathit{LT}(g)}\)', description_fp = '\(\mathit{ST}(g)\) returns the total service time accumulated across all cases in group \(g\).
\newline \(\mathit{LT}(g)\) returns the total lead time accumulated across all cases in group \(g\). \\' WHERE slug = 'service-and-lead-time-ratio-group-of-cases-granularity-t-g';
UPDATE indicator SET function_name = '\(\mathit{SLTR}(i)\)', formalization_latex = '\(\frac{\mathit{ST}(i)}{\mathit{LT}(i)}\)', formalization_fp = '\(\frac{\mathit{ST}(i)}{\mathit{LT}(i)}\)', description_fp = '\(\mathit{ST}(i)\) returns the service time of activity instance \(i\).
\newline \(\mathit{LT}(i)\) returns the lead time of activity instance \(i\). \\' WHERE slug = 'service-and-lead-time-ratio-activity-instance-granularity-t-i';
UPDATE indicator SET function_name = '\(\mathit{ST}(a)\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(a)} \mathit{ST}(i)\)', formalization_fp = '\(\sum _{i \in \mathit{inst}(a)} \mathit{ST}(i)\)', description_fp = '\(\mathit{inst}(a)\) returns the set of all instances of activity \(a\).
\newline \(\mathit{ST}(i)\) returns the service time of activity instance \(i\). \\' WHERE slug = 'service-time-activity-granularity-t-a';
UPDATE indicator SET function_name = '\(\mathit{ST}(c)\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(c)} \mathit{ST}(i)\)', formalization_fp = '\(\sum _{i \in \mathit{inst}(c)} \mathit{ST}(i)\)', description_fp = '\(\mathit{inst}(c)\) returns the set of all activity instances in case \(c\).
\newline \(\mathit{ST}(i)\) returns the service time of activity instance \(i\). \\' WHERE slug = 'service-time-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{ST}(g)\)', formalization_latex = '\(\sum _{c \in g} \mathit{ST}(c)\)', formalization_fp = '\(\sum _{c \in g} \mathit{ST}(c)\)', description_fp = '\(\mathit{ST}(c)\) returns the total service time of case \(c\). \\' WHERE slug = 'service-time-group-of-cases-granularity-t-g';
UPDATE indicator SET function_name = '\(\mathit{ST}(i)\)', formalization_latex = '\(\mathit{ctime}(i) - \mathit{stime}(i)\)', formalization_fp = '\(\mathit{ctime}(i) - \mathit{stime}(i)\)', description_fp = '\(\mathit{ctime}(i)\) returns the completion timestamp of activity instance \(i\).
\newline \(\mathit{stime}(i)\) returns the start timestamp of activity instance \(i\). \\' WHERE slug = 'service-time-activity-instance-granularity-t-i';
UPDATE indicator SET function_name = '\(\mathit{STAB}\mathit{^{\times}}(c, \mathit{a}, \mathit{b})\)
\newline \newline \(\mathit{\times} \in \{\mathit{s}, \mathit{c}, \mathit{sc}, \mathit{w}\}\)', formalization_latex = '\(\begin{cases} \mathit{st}\mathit{^{\times}}(x, y) & \mathit{for~any \ } x \in \mathit{fi}\mathit{^{s}}(c, \mathit{a}) \mathit{\ and \ } y \in \mathit{fi}\mathit{^{sc}}(c, \mathit{a}, \mathit{b}) \\
\bot & \mathit{if \ } \mathit{fi}\mathit{^{sc}}(c, \mathit{a}, \mathit{b}) = \emptyset \end{cases}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{s}, \mathit{c}, \mathit{sc}, \mathit{w}\}$. If $\mathit{\times} = \mathit{s}$, then the function considers activity instances that were started within the start and end activity instances, i.e., it uses $\mathit{st}\mathit{^{s}}$; if $\mathit{\times} = \mathit{c}$, then the function considers activity instances that were completed within the start and end activity instances, i.e., it uses $\mathit{st}\mathit{^{c}}$; if $\mathit{\times} = \mathit{sc}$, then the function considers activity instances that were either started or completed within the start and end activity instances, i.e., it uses $\mathit{st}\mathit{^{sc}}$; if $\mathit{\times} = \mathit{^{w}}$, then the function considers all activity instances that were active within the start and end activity instances, i.e., it uses $\mathit{st}\mathit{^{w}}$.', formalization_fp = '\(\begin{cases} \mathit{st}(x, y) & \mathit{for~any \ } x \in \mathit{fi}\mathit{^{s}}(c, \mathit{a}) \mathit{\ and \ } y \in \mathit{fi}(c, \mathit{a}, \mathit{b}) \\ undefined & \mathit{if \ } \mathit{fi}(c, \mathit{a}, \mathit{b}) = \emptyset \end{cases}\)', description_fp = '\(\mathit{st}\) returns the service time between activity instance \(x\) and activity instance \(y\).
\newline \(\mathit{fi}\mathit{^{s}}\) returns the set of first started instances of activity \(\mathit{a}\) in case \(c\).
\newline \(\mathit{fi}\) returns the set of first instances of activity \(\mathit{b}\) that occur after the first instance of \(\mathit{a}\) in case \(c\). \\' WHERE slug = 'service-time-from-activity-a-to-activity-b-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{STAB}\mathit{^{\times}}(g, \mathit{a}, \mathit{b})\)
\newline \newline \(\mathit{\times} \in \{\mathit{s}, \mathit{c}, \mathit{sc}, \mathit{w}\}\)', formalization_latex = '\(\sum _{c \in g} \begin{cases}
\mathit{STAB}\mathit{^{\times}}(c, \mathit{a}, \mathit{b}) & \mathit{if \ } \mathit{fi}\mathit{^{sc}}(c, \mathit{a}, \mathit{b}) \neq \emptyset \\ 0 & \mathit{if \ } \mathit{fi}\mathit{^{sc}}(c, \mathit{a}, \mathit{b}) = \emptyset
\end{cases}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{s}, \mathit{c}, \mathit{sc}, \mathit{w}\}$. If $\mathit{\times} = \mathit{s}$, then the function considers activity instances that were started within the start and end activity instances, i.e., it uses $\mathit{STAB}\mathit{^{s}}$; if $\mathit{\times} = \mathit{c}$, then the function considers activity instances that were completed within the start and end activity instances, i.e., it uses $\mathit{STAB}\mathit{^{c}}$; if $\mathit{\times} = \mathit{sc}$, then the function considers activity instances that were either started or completed within the start and end activity instances, i.e., it uses $\mathit{STAB}\mathit{^{sc}}$; if $\mathit{\times} = \mathit{^{w}}$, then the function considers all activity instances that were active within the start and end activity instances, i.e., it uses $\mathit{STAB}\mathit{^{w}}$.', formalization_fp = '\(\sum _{c \in g} \begin{cases} \mathit{STAB}(c, \mathit{a}, \mathit{b}) & \mathit{if \ } \mathit{fi}(c, \mathit{a}, \mathit{b}) \neq \emptyset \\ 0 & \mathit{if \ } \mathit{fi}(c, \mathit{a}, \mathit{b}) = \emptyset \end{cases}\)', description_fp = '\(\mathit{STAB}\) returns the service time from activity \(\mathit{a}\) to activity \(\mathit{b}\) in case \(c\).
\newline \(\mathit{fi}\) returns the set of first instances of activity \(\mathit{b}\) that occur after the first instance of \(\mathit{a}\) in case \(c\). \\' WHERE slug = 'service-time-from-activity-a-to-activity-b-group-of-cases-granularity-t-g';
UPDATE indicator SET function_name = '\(\mathit{SUC}\mathit{^{\times}}(a)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(a)} \mathit{SUC}\mathit{^{\times}}(i)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{i \in \mathit{inst}(a)} \mathit{SUC}(i)\)', description_fp = '\(\mathit{inst}(a)\) returns the set of all instances of activity \(a\).
\newline \(\mathit{SUC}(i)\) returns the successful outcome unit count of activity instance \(i\). \\' WHERE slug = 'successful-outcome-unit-count-activity-granularity-q-a';
UPDATE indicator SET function_name = '\(\mathit{SUC}\mathit{^{\times}}(c)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(c)} \mathit{SUC}\mathit{^{\times}}(i)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{i \in \mathit{inst}(c)} \mathit{SUC}(i)\)', description_fp = '\(\mathit{inst}(c)\) returns the set of all activity instances in case \(c\).
\newline \(\mathit{SUC}(i)\) returns the successful outcome unit count of activity instance \(i\). \\' WHERE slug = 'successful-outcome-unit-count-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{SUC}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{c \in G} \mathit{SUC}\mathit{^{\times}}(c)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{c \in G} \mathit{SUC}(c)\)', description_fp = '\(\mathit{SUC}(c)\) returns the successful outcome unit count for case \(c\). \\' WHERE slug = 'successful-outcome-unit-count-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{SUC}\mathit{^{\times}}(i)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\begin{cases}
\mathit{U}\mathit{^{\times}}(i) - \#^{}_{\mathit{uns}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{uns}}(\mathit{cpl}(i)) \neq \bot \\
\mathit{U}\mathit{^{\times}}(i) & \mathit{if \ } \#^{}_{\mathit{uns}}(\mathit{cpl}(i)) = \bot \\
\end{cases}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\mathit{U}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\mathit{U}\mathit{^{sum}}$.', formalization_fp = '\(\begin{cases}
\mathit{U}(i) - \#^{}_{\mathit{uns}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{uns}}(\mathit{cpl}(i)) \neq undefined \\
\mathit{U}(i) & \mathit{if \ } \#^{}_{\mathit{uns}}(\mathit{cpl}(i)) = undefined \\
\end{cases}\)', description_fp = '\(\mathit{U}(i)\) returns the outcome unit count of activity instance \(i\).
\newline \(\#^{}_{\mathit{uns}}\) returns the unsuccessful outcome unit count associated with an event.
\newline \(\mathit{cpl}(i)\) returns the completion event of activity instance \(i\). \\' WHERE slug = 'successful-outcome-unit-count-activity-instance-granularity-q-i';
UPDATE indicator SET function_name = '\(\mathit{SUP}\mathit{^{\times}}(a)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{SUC}\mathit{^{\times}}(a)}{\mathit{U}\mathit{^{\times}}(a)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUC}\mathit{^{sgl}}$ and $\mathit{U}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUC}\mathit{^{sum}}$ and $\mathit{U}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{SUC}(a)}{\mathit{U}(a)}\)', description_fp = '\(\mathit{SUC}(a)\) returns the successful outcome unit count of activity \(a\).
\newline \(\mathit{U}(a)\) returns the total outcome unit count of activity \(a\). \\' WHERE slug = 'successful-outcome-unit-percentage-activity-granularity-q-a';
UPDATE indicator SET function_name = '\(\mathit{SUP}\mathit{^{\times}}(c)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{SUC}\mathit{^{\times}}(c)}{\mathit{U}\mathit{^{\times}}(c)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUC}\mathit{^{sgl}}$ and $\mathit{U}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUC}\mathit{^{sum}}$ and $\mathit{U}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{SUC}(c)}{\mathit{U}(c)}\)', description_fp = '\(\mathit{SUC}(c)\) returns the successful outcome unit count of case \(c\).
\newline \(\mathit{U}(c)\) returns the total outcome unit count of case \(c\). \\' WHERE slug = 'successful-outcome-unit-percentage-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{SUP}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{SUC}\mathit{^{\times}}(g)}{\mathit{U}\mathit{^{\times}}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUC}\mathit{^{sgl}}$ and $\mathit{U}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUC}\mathit{^{sum}}$ and $\mathit{U}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{SUC}(g)}{\mathit{U}(g)}\)', description_fp = '\(\mathit{SUC}(g)\) returns the total successful outcome unit count of case group \(g\).
\newline \(\mathit{U}(g)\) returns the total outcome unit count of case group \(g\). \\' WHERE slug = 'successful-outcome-unit-percentage-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{SUP}\mathit{^{\times}}(i)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{SUC}\mathit{^{\times}}(i)}{\mathit{U}\mathit{^{\times}}(i)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUC}\mathit{^{sgl}}$ and $\mathit{U}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\mathit{SUC}\mathit{^{sum}}$ and $\mathit{U}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{SUC}(i)}{\mathit{U}(i)}\)', description_fp = '\(\mathit{SUC}(i)\) returns the successful outcome unit count of activity instance \(i\).
\newline \(\mathit{U}(i)\) returns the outcome unit count of activity instance \(i\). \\' WHERE slug = 'successful-outcome-unit-percentage-activity-instance-granularity-q-i';
UPDATE indicator SET function_name = '\(\mathit{TC}\mathit{^{\times}}(a)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(a)} \mathit{TC}\mathit{^{\times}}(i)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{i \in \mathit{inst}(a)} \mathit{TC}(i)\)', description_fp = '\(\mathit{inst}(a)\) returns the set of all instances of activity \(a\).
\newline \(\mathit{TC}(i)\) returns the total cost of activity instance \(i\). \\' WHERE slug = 'total-cost-activity-granularity-c-a';
UPDATE indicator SET function_name = '\(\mathit{TC}\mathit{^{\times}}(c)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(c)} \mathit{TC}\mathit{^{\times}}(i)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{i \in \mathit{inst}(c)} \mathit{TC}(i)\)', description_fp = '\(\mathit{inst}(c)\) returns the set of all activity instances in case \(c\).
\newline \(\mathit{TC}(i)\) returns the total cost of activity instance \(i\). \\' WHERE slug = 'total-cost-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{TC}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{c \in g} \mathit{TC}\mathit{^{\times}}(c)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{c \in g} \mathit{TC}(c)\)', description_fp = '\(\mathit{TC}(c)\) returns the total cost of case \(c\). \\' WHERE slug = 'total-cost-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{TCCliR}\mathit{^{\times}}(a)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(a)}{\mathit{Cli}(a)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(a)}{\mathit{Cli}(a)}\)', description_fp = '\(\mathit{TC}(a)\) returns the total cost of activity \(a\).
\newline \(\mathit{Cli}(a)\) returns the number of distinct clients involved in activity \(a\). \\' WHERE slug = 'total-cost-and-client-count-ratio-activity-granularity-q-a';
UPDATE indicator SET function_name = '\(\mathit{TCCliR}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(g)}{\mathit{Cli}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(g)}{\mathit{Cli}(g)}\)', description_fp = '\(\mathit{TC}(g)\) returns the total cost of case group \(g\).
\newline \(\mathit{Cli}(g)\) returns the number of distinct clients associated with group \(g\). \\' WHERE slug = 'total-cost-and-client-count-ratio-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{TCLTR}\mathit{^{\times}}(a)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(a)}{\mathit{LT}(a)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(a)}{\mathit{LT}(a)}\)', description_fp = '\(\mathit{TC}(a)\) returns the total cost of activity \(a\).
\newline \(\mathit{LT}(a)\) returns the total lead time of activity \(a\). \\' WHERE slug = 'total-cost-and-lead-time-ratio-activity-granularity-c-a';
UPDATE indicator SET function_name = '\(\mathit{TCLTR}\mathit{^{\times}}(c)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(c)}{\mathit{LT}(c)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(c)}{\mathit{LT}(c)}\)', description_fp = '\(\mathit{TC}(c)\) returns the total cost of case \(c\).
\newline \(\mathit{LT}(c)\) returns the total lead time of case \(c\). \\' WHERE slug = 'total-cost-and-lead-time-ratio-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{TCLTR}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(g)}{\mathit{LT}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(g)}{\mathit{LT}(g)}\)', description_fp = '\(\mathit{TC}(g)\) returns the total cost of case group \(g\).
\newline \(\mathit{LT}(g)\) returns the total lead time of case group \(g\). \\' WHERE slug = 'total-cost-and-lead-time-ratio-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{TCLTR}\mathit{^{\times}}(i)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(i)}{\mathit{LT}(i)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(i)}{\mathit{LT}(i)}\)', description_fp = '\(\mathit{TC}(i)\) returns the total cost of activity instance \(i\).
\newline \(\mathit{LT}(i)\) returns the lead time of activity instance \(i\). \\' WHERE slug = 'total-cost-and-lead-time-ratio-activity-instance-granularity-c-i';
UPDATE indicator SET function_name = '\(\mathit{TCUR}\mathit{^{\times}}(a)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(a)}{\mathit{U}\mathit{^{\times}}(a)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost and outcome unit calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$ and $\mathit{U}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost and outcome unit calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$ and $\mathit{U}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(a)}{\mathit{U}(a)}\)', description_fp = '\(\mathit{TC}(a)\) returns the total cost of activity \(a\).
\newline \(\mathit{U}(a)\) returns the total outcome unit count of activity \(a\). \\' WHERE slug = 'total-cost-and-outcome-unit-ratio-activity-granularity-c-a';
UPDATE indicator SET function_name = '\(\mathit{TCUR}\mathit{^{\times}}(c)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(c)}{\mathit{U}\mathit{^{\times}}(c)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost and outcome unit calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$ and $\mathit{U}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost and outcome unit calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$ and $\mathit{U}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(c)}{\mathit{U}(c)}\)', description_fp = '\(\mathit{TC}(c)\) returns the total cost of case \(c\).
\newline \(\mathit{U}(c)\) returns the total outcome unit count of case \(c\). \\' WHERE slug = 'total-cost-and-outcome-unit-ratio-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{TCUR}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(g)}{\mathit{U}\mathit{^{\times}}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost and outcome unit calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$ and $\mathit{U}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost and outcome unit calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$ and $\mathit{U}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(g)}{\mathit{U}(g)}\)', description_fp = '\(\mathit{TC}(g)\) returns the total cost of case group \(g\).
\newline \(\mathit{U}(g)\) returns the total outcome unit count of case group \(g\). \\' WHERE slug = 'total-cost-and-outcome-unit-ratio-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{TCUR}\mathit{^{\times}}(i)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(i)}{\mathit{U}\mathit{^{\times}}(i)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost and outcome unit calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$ and $\mathit{U}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost and outcome unit calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$ and $\mathit{U}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(i)}{\mathit{U}(i)}\)', description_fp = '\(\mathit{TC}(i)\) returns the total cost of activity instance \(i\).
\newline \(\mathit{U}(i)\) returns the outcome unit count of activity instance \(i\). \\' WHERE slug = 'total-cost-and-outcome-unit-ratio-activity-instance-granularity-c-i';
UPDATE indicator SET function_name = '\(\mathit{TCSTR}\mathit{^{\times}}(a)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(a)}{\mathit{ST}(a)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(a)}{\mathit{ST}(a)}\)', description_fp = '\(\mathit{TC}(a)\) returns the total cost of activity \(a\).
\newline \(\mathit{ST}(a)\) returns the total service time of activity \(a\). \\' WHERE slug = 'total-cost-and-service-time-ratio-activity-granularity-c-a';
UPDATE indicator SET function_name = '\(\mathit{TCSTR}\mathit{^{\times}}(c)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(c)}{\mathit{ST}(c)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(c)}{\mathit{ST}(c)}\)', description_fp = '\(\mathit{TC}(c)\) returns the total cost of case \(c\).
\newline \(\mathit{ST}(c)\) returns the total service time of case \(c\). \\' WHERE slug = 'total-cost-and-service-time-ratio-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{TCSTR}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(g)}{\mathit{ST}(g)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(g)}{\mathit{ST}(g)}\)', description_fp = '\(\mathit{TC}(g)\) returns the total cost of case group \(g\).
\newline \(\mathit{ST}(g)\) returns the total service time of case group \(g\). \\' WHERE slug = 'total-cost-and-service-time-ratio-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{TCSTR}\mathit{^{\times}}(i)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\frac{\mathit{TC}\mathit{^{\times}}(i)}{\mathit{ST}(i)}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{TC}\mathit{^{sum}}$.', formalization_fp = '\(\frac{\mathit{TC}(i)}{\mathit{ST}(i)}\)', description_fp = '\(\mathit{TC}(i)\) returns the total cost of activity instance \(i\).
\newline \(\mathit{ST}(i)\) returns the service time of activity instance \(i\). \\' WHERE slug = 'total-cost-and-service-time-ratio-activity-instance-granularity-c-i';
UPDATE indicator SET function_name = '\(\mathit{TC}\mathit{^{sgl}}(i)\)', formalization_latex = '\(\begin{cases}
\#^{}_{\mathit{tc}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{tc}}(\mathit{cpl}(i)) \neq \bot \\
\#^{}_{\mathit{tc}}(\mathit{str}(i)) & \mathit{if \ } \#^{}_{\mathit{tc}}(\mathit{cpl}(i)) = \bot \land \#^{}_{\mathit{tc}}(\mathit{str}(i)) \neq \bot \\
\bot & \mathit{if \ } \#^{}_{\mathit{tc}}(\mathit{cpl}(i)) = \bot \land \#^{}_{\mathit{tc}}(\mathit{str}(i)) = \bot \\
\end{cases}\)', formalization_fp = '\(\begin{cases}
\#^{}_{\mathit{tc}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{tc}}(\mathit{cpl}(i)) \neq undefined \\
\#^{}_{\mathit{tc}}(\mathit{str}(i)) & \mathit{if \ } \#^{}_{\mathit{tc}}(\mathit{cpl}(i)) = undefined \land \#^{}_{\mathit{tc}}(\mathit{str}(i)) \neq undefined \\
undefined & \mathit{if \ } \#^{}_{\mathit{tc}}(\mathit{cpl}(i)) = undefined \land \#^{}_{\mathit{tc}}(\mathit{str}(i)) = undefined \\
\end{cases}\)', description_fp = '\(\#^{}_{\mathit{tc}}\) returns the total cost associated with an event.
\newline \(\mathit{cpl}(i)\) returns the completion event of activity instance \(i\).
\newline \(\mathit{str}(i)\) returns the start event of activity instance \(i\). \\' WHERE slug = 'total-cost-considering-single-events-of-activity-instances-activity-instance-granularity-c-i';
UPDATE indicator SET function_name = '\(\mathit{TC}\mathit{^{sum}}(i)\)', formalization_latex = '\(\begin{cases}
\#^{}_{\mathit{tc}}(\mathit{str}(i)) + & \\ \#^{}_{\mathit{tc}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{tc}}(\mathit{cpl}(i)) \neq \bot \land \#^{}_{\mathit{tc}}(\mathit{str}(i)) \neq \bot \\
\bot & \mathit{if \ } \#^{}_{\mathit{tc}}(\mathit{cpl}(i)) = \bot \lor \#^{}_{\mathit{tc}}(\mathit{str}(i)) = \bot \\
\end{cases}\)', formalization_fp = '\(\begin{cases}
\#^{}_{\mathit{tc}}(\mathit{str}(i)) + & \\ \#^{}_{\mathit{tc}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{tc}}(\mathit{cpl}(i)) \neq undefined \land \#^{}_{\mathit{tc}}(\mathit{str}(i)) \neq undefined \\
undefined & \mathit{if \ } \#^{}_{\mathit{tc}}(\mathit{cpl}(i)) = undefined \lor \#^{}_{\mathit{tc}}(\mathit{str}(i)) = undefined \\
\end{cases}\)', description_fp = '\(\#^{}_{\mathit{tc}}\) returns the total cost associated with an event.
\newline \(\mathit{str}(i)\) returns the start event of activity instance \(i\).
\newline \(\mathit{cpl}(i)\) returns the completion event of activity instance \(i\). \\' WHERE slug = 'total-cost-considering-the-sum-of-all-events-of-activity-instances-activity-instance-granularity-c-i';
UPDATE indicator SET function_name = '\(\mathit{TransC}(c)\)', formalization_latex = '\(\#^{}_{\mathit{transc}}(c)\)', formalization_fp = '\(\#^{}_{\mathit{transc}}(c)\)', description_fp = '\(\#^{}_{\mathit{transc}}\) returns the transportation cost associated with case \(c\). \\' WHERE slug = 'transportation-cost-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{TransC}(g)\)', formalization_latex = '\(\sum _{c \in g} \mathit{TransC}(c)\)', formalization_fp = '\(\sum _{c \in g} \mathit{TransC}(c)\)', description_fp = '\(\mathit{TransC}(c)\) returns the transportation cost for case \(c\). \\' WHERE slug = 'transportation-cost-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{UAC}(c)\)', formalization_latex = '\(|\mathit{Unwl} \cap \mathit{act}(c)|\)', formalization_fp = '\(\displaystyle \sum_{a \in \mathit{act}(c)}
\begin{cases}
1 & \text{if } a \in \mathit{Unwl} \\
0 & \text{otherwise}
\end{cases}
\)', description_fp = '\(\mathit{Unwl}\) returns the set of unwanted activities.
\newline \(\mathit{act}(c)\) returns the set of activities that occurred in case \(c\). \\' WHERE slug = 'unwanted-activity-count-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{UAC}(g)\)', formalization_latex = '\(|\mathit{Unwl} \cap (\cup_{c \in g} \mathit{act}(c))|\)', formalization_fp = '\(\displaystyle \sum_{a \in (\cup_{c \in g} \mathit{act}(c))}
\begin{cases}
1 & \text{if } a \in \mathit{Unwl} \\
0 & \text{otherwise}
\end{cases}
\)', description_fp = '\(\mathit{Unwl}\) returns the set of unwanted activities.
\newline \(\mathit{act}(c)\) returns the set of activities that occurred in case \(c\). \\' WHERE slug = 'unwanted-activity-count-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{UIC}(c)\)', formalization_latex = '\(|\{i \in \mathit{inst}(c) \mid \mathit{act}(i) \in \mathit{Unwl}\}|\)', formalization_fp = '\(\displaystyle \sum_{i \in \mathit{inst}(c)}
\begin{cases}
1 & \text{if } \mathit{act}(i) \in \mathit{Unwl} \\
0 & \text{otherwise}
\end{cases}
\)', description_fp = '\(\mathit{inst}(c)\) returns the set of all activity instances in case \(c\).
\newline \(\mathit{act}(i)\) returns the activity of activity instance \(i\).
\newline \(\mathit{Unwl}\) returns the set of unwanted activities. \\' WHERE slug = 'unwanted-activity-instance-count-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{UIC}(g)\)', formalization_latex = '\(\sum _{c \in g} \mathit{UIC}(c)\)', formalization_fp = '\(\sum _{c \in g} \mathit{UIC}(c)\)', description_fp = '\(\mathit{UIC}(c)\) returns the unwanted activity instance count for case \(c\). \\' WHERE slug = 'unwanted-activity-instance-count-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{UIP}(c)\)', formalization_latex = '\(\frac{\mathit{UIC}(c)}{\mathit{I}(c)}\)', formalization_fp = '\(\frac{\mathit{UIC}(c)}{\mathit{I}(c)}\)', description_fp = '\(\mathit{UIC}(c)\) returns the unwanted activity instance count for case \(c\).
\newline \(\mathit{I}(c)\) returns the total number of activity instances in case \(c\). \\' WHERE slug = 'unwanted-activity-instance-percentage-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{UIP}(g)\)', formalization_latex = '\(\frac{\mathit{UIC}(g)}{\mathit{I}(g)}\)', formalization_fp = '\(\frac{\mathit{UIC}(g)}{\mathit{I}(g)}\)', description_fp = '\(\mathit{UIC}(g)\) returns the unwanted activity instance count for group \(g\).
\newline \(\mathit{I}(g)\) returns the total number of activity instances in group \(g\). \\' WHERE slug = 'unwanted-activity-instance-percentage-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{UAP}(c)\)', formalization_latex = '\(\frac{\mathit{UAC}(c)}{\mathit{A}(c)}\)', formalization_fp = '\(\frac{\mathit{UAC}(c)}{\mathit{A}(c)}\)', description_fp = '\(\mathit{UAC}(c)\) returns the unwanted activity count for case \(c\).
\newline \(\mathit{A}(c)\) returns the number of unique activities in case \(c\). \\' WHERE slug = 'unwanted-activity-percentage-case-granularity-q-c';
UPDATE indicator SET function_name = '\(\mathit{UAP}(g)\)', formalization_latex = '\(\frac{\mathit{UAC}(g)}{\mathit{A}(g)}\)', formalization_fp = '\(\frac{\mathit{UAC}(g)}{\mathit{A}(g)}\)', description_fp = '\(\mathit{UAC}(g)\) returns the unwanted activity count for group \(g\).
\newline \(\mathit{A}(g)\) returns the number of unique activities in group \(g\). \\' WHERE slug = 'unwanted-activity-percentage-group-of-cases-granularity-q-g';
UPDATE indicator SET function_name = '\(\mathit{VC}\mathit{^{\times}}(a)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(a)} \mathit{VC}\mathit{^{\times}}(i)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{VC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{VC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{i \in \mathit{inst}(a)} \mathit{VC}(i)\)', description_fp = '\(\mathit{inst}(a)\) returns the set of all instances of activity \(a\).
\newline \(\mathit{VC}(i)\) returns the variable cost of activity instance \(i\). \\' WHERE slug = 'variable-cost-activity-granularity-c-a';
UPDATE indicator SET function_name = '\(\mathit{VC}\mathit{^{\times}}(c)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(c)} \mathit{VC}\mathit{^{\times}}(i)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{VC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{VC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{i \in \mathit{inst}(c)} \mathit{VC}(i)\)', description_fp = '\(\mathit{inst}(c)\) returns the set of all activity instances in case \(c\).
\newline \(\mathit{VC}(i)\) returns the variable cost of activity instance \(i\). \\' WHERE slug = 'variable-cost-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{VC}\mathit{^{\times}}(g)\)
\newline \newline \(\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}\)', formalization_latex = '\(\sum _{c \in g} \mathit{VC}\mathit{^{\times}}(c)\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{sgl}, \mathit{sum}\}$. If $\mathit{\times} = \mathit{sgl}$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\mathit{VC}\mathit{^{sgl}}$; if $\mathit{\times} = \mathit{sum}$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\mathit{VC}\mathit{^{sum}}$.', formalization_fp = '\(\sum _{c \in g} \mathit{VC}(c)\)', description_fp = '\(\mathit{VC}(c)\) returns the variable cost for case \(c\). \\' WHERE slug = 'variable-cost-group-of-cases-granularity-c-g';
UPDATE indicator SET function_name = '\(\mathit{VC}\mathit{^{sgl}}(i)\)', formalization_latex = '\(\begin{cases}
\#^{}_{\mathit{vc}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{vc}}(\mathit{cpl}(i)) \neq \bot \\
\#^{}_{\mathit{vc}}(\mathit{str}(i)) & \mathit{if \ } \#^{}_{\mathit{vc}}(\mathit{cpl}(i)) = \bot \land \#^{}_{\mathit{vc}}(\mathit{str}(i)) \neq \bot \\
\bot & \mathit{if \ } \#^{}_{\mathit{vc}}(\mathit{cpl}(i)) = \bot \land \#^{}_{\mathit{vc}}(\mathit{str}(i)) = \bot \\
\end{cases}\)', formalization_fp = '\(\begin{cases}
\#^{}_{\mathit{vc}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{vc}}(\mathit{cpl}(i)) \neq undefined \\
\#^{}_{\mathit{vc}}(\mathit{str}(i)) & \mathit{if \ } \#^{}_{\mathit{vc}}(\mathit{cpl}(i)) = undefined \land \#^{}_{\mathit{vc}}(\mathit{str}(i)) \neq undefined \\
undefined & \mathit{if \ } \#^{}_{\mathit{vc}}(\mathit{cpl}(i)) = undefined \land \#^{}_{\mathit{vc}}(\mathit{str}(i)) = undefined \\
\end{cases}\)', description_fp = '\(\#^{}_{\mathit{vc}}\) returns the variable cost associated with an event.
\newline \(\mathit{cpl}(i)\) returns the completion event of activity instance \(i\).
\newline \(\mathit{str}(i)\) returns the start event of activity instance \(i\). \\' WHERE slug = 'variable-cost-considering-single-events-of-activity-instances-activity-instance-granularity-c-i';
UPDATE indicator SET function_name = '\(\mathit{VC}\mathit{^{sum}}(i)\)', formalization_latex = '\(\begin{cases}
\#^{}_{\mathit{vc}}(\mathit{str}(i)) + & \\ \#^{}_{\mathit{vc}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{vc}}(\mathit{cpl}(i)) \neq \bot \land \#^{}_{\mathit{vc}}(\mathit{str}(i)) \neq \bot \\
\bot & \mathit{if \ } \#^{}_{\mathit{vc}}(\mathit{cpl}(i)) = \bot \lor \#^{}_{\mathit{vc}}(\mathit{str}(i)) = \bot \\
\end{cases}\)', formalization_fp = '\(\begin{cases}
\#^{}_{\mathit{vc}}(\mathit{str}(i)) + & \\ \#^{}_{\mathit{vc}}(\mathit{cpl}(i)) & \mathit{if \ } \#^{}_{\mathit{vc}}(\mathit{cpl}(i)) \neq undefined \land \#^{}_{\mathit{vc}}(\mathit{str}(i)) \neq undefined \\
undefined & \mathit{if \ } \#^{}_{\mathit{vc}}(\mathit{cpl}(i)) = undefined \lor \#^{}_{\mathit{vc}}(\mathit{str}(i)) = undefined \\
\end{cases}\)', description_fp = '\(\#^{}_{\mathit{vc}}\) returns the variable cost associated with an event.
\newline \(\mathit{str}(i)\) returns the start event of activity instance \(i\).
\newline \(\mathit{cpl}(i)\) returns the completion event of activity instance \(i\). \\' WHERE slug = 'variable-cost-considering-the-sum-of-all-events-of-activity-instances-activity-instance-granularity-c-i';
UPDATE indicator SET function_name = '\(\mathit{VCC}(c)\)', formalization_latex = '\(\frac{|\{c'' \in C \mid \exists tr \in \mathit{trace}(c'')[tr \in \mathit{trace}(c)]\}|}{|C|}\)', formalization_fp = '\(\frac{
\sum_{c'' \in C}
\begin{cases}
1 & \text{if } \exists tr \in \mathit{trace}(c) \land tr'' \in \mathit{trace}(c'') [tr = tr''] \\
0 & \text{otherwise}
\end{cases}
}{\mathit{count}(C)}\)', description_fp = '$\mathit{trace}(c'')$ returns the trace (sequence of activities) of case $c''$.
\newline $\mathit{trace}(c)$ returns the trace (sequence of activities) of case $c$.
\newline $\mathit{count}(C)$ returns the total number of cases in the event log. \\' WHERE slug = 'variant-case-coverage-case-granularity-f-c';
UPDATE indicator SET function_name = '\(\mathit{VCC}(g)\)', formalization_latex = '\(\frac{|\{c \in C \mid \exists tr \in \mathit{trace}(c)[tr \in \mathit{variants}(g)]\}|}{|C|}\)', formalization_fp = '\(\frac{
\sum_{c \in C}
\begin{cases}
1 & \text{if } \exists tr \in \mathit{trace}(c) [tr \in \mathit{variants}(g)] \\
0 & \text{otherwise}
\end{cases}
}{\mathit{count}(C)}\)', description_fp = '$\mathit{trace}(c)$ returns the trace (sequence of activities) of case $c$.
\newline $\mathit{variants}(g)$ returns the set of unique traces (variants) present in group $g$.
\newline $\mathit{count}(C)$ returns the total number of cases in the event log. \\' WHERE slug = 'variant-case-coverage-group-of-cases-granularity-f-g';
UPDATE indicator SET function_name = '\(\mathit{V}(g)\)', formalization_latex = '\(|\mathit{variants}(g)|\)', formalization_fp = '\(\mathit{count}(\mathit{variants}(g))\)', description_fp = '\(\mathit{variants}(g)\) returns the set of unique traces (variants) present in group \(g\). \\' WHERE slug = 'variant-count-group-of-cases-granularity-f-g';
UPDATE indicator SET function_name = '\(\mathit{WT}(a)\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(a)} \mathit{WT}(i)\)', formalization_fp = '\(\sum _{i \in \mathit{inst}(a)} \mathit{WT}(i)\)', description_fp = '\(\mathit{inst}(a)\) returns the set of all instances of activity \(a\).
\newline \(\mathit{WT}(i)\) returns the waiting time of activity instance \(i\). \\' WHERE slug = 'waiting-time-activity-granularity-t-a';
UPDATE indicator SET function_name = '\(\mathit{WT}(c)\)', formalization_latex = '\(\sum _{i \in \mathit{inst}(c)} \mathit{WT}(i)\)', formalization_fp = '\(\sum _{i \in \mathit{inst}(c)} \mathit{WT}(i)\)', description_fp = '\(\mathit{inst}(c)\) returns the set of all activity instances in case \(c\).
\newline \(\mathit{WT}(i)\) returns the waiting time of activity instance \(i\). \\' WHERE slug = 'waiting-time-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{WT}(i)\)', formalization_latex = '\(\begin{cases}
\mathit{stime}(i) - \mathit{ctime}(x) & \mathit{for~any \ } x \in \mathit{prev}(i) \\
0 & \mathit{if \ } \mathit{prev}(i) = \emptyset
\end{cases}\)', formalization_fp = '\(\begin{cases} \mathit{stime}(i) - \mathit{ctime}(x) & \mathit{for~any \ } x \in \mathit{prev}(i) \\ 0 & \mathit{if \ } \mathit{prev}(i) = \emptyset \end{cases}\)', description_fp = '\(\mathit{stime}(i)\) returns the start timestamp of activity instance \(i\).
\newline \(\mathit{ctime}(x)\) returns the completion timestamp of activity instance \(x\).
\newline \(\mathit{prev}(i)\) returns the set of preceding activity instances to instance \(i\). \\' WHERE slug = 'waiting-time-activity-instance-granularity-t-i';
UPDATE indicator SET function_name = '\(\mathit{WTAB}\mathit{^{\times}}(c, \mathit{a}, \mathit{b})\)
\newline \newline \(\mathit{\times} \in \{\mathit{s}, \mathit{c}, \mathit{sc}, \mathit{w}\}\)', formalization_latex = '\(\begin{cases} \mathit{wt}\mathit{^{\times}}(x, y) & \mathit{for~any \ } x \in \mathit{fi}\mathit{^{s}}(c, \mathit{a}) \mathit{\ and \ } y \in \mathit{fi}\mathit{^{sc}}(c, \mathit{a}, \mathit{b}) \\
\bot & \mathit{if \ } \mathit{fi}\mathit{^{sc}}(c, \mathit{a}, \mathit{b}) = \emptyset \end{cases}\)
\newline \newline The $\mathit{\times}$ indicates that the PPI can take multiple forms, in this case, $\mathit{\times} \in \{\mathit{s}, \mathit{c}, \mathit{sc}, \mathit{w}\}$. If $\mathit{\times} = \mathit{s}$, then the function considers activity instances that were started within the start and end activity instances, i.e., it uses $\mathit{wt}\mathit{^{s}}$; if $\mathit{\times} = \mathit{c}$, then the function considers activity instances that were completed within the start and end activity instances, i.e., it uses $\mathit{wt}\mathit{^{c}}$; if $\mathit{\times} = \mathit{sc}$, then the function considers activity instances that were either started or completed within the start and end activity instances, i.e., it uses $\mathit{wt}\mathit{^{sc}}$; if $\mathit{\times} = \mathit{^{w}}$, then the function considers all activity instances that were active within the start and end activity instances, i.e., it uses $\mathit{wt}\mathit{^{w}}$.', formalization_fp = '\(\begin{cases} \mathit{wt}(x, y) & \mathit{for~any \ } x \in \mathit{fi}\mathit{^{s}}(c, \mathit{a}) \mathit{\ and \ } y \in \mathit{fi}(c, \mathit{a}, \mathit{b}) \\ undefined & \mathit{if \ } \mathit{fi}(c, \mathit{a}, \mathit{b}) = \emptyset \end{cases}\)', description_fp = '\(\mathit{wt}\) returns the waiting time between activity instance \(x\) and activity instance \(y\).
\newline \(\mathit{fi}\mathit{^{s}}\) returns the set of first started instances of activity \(\mathit{a}\) in case \(c\).
\newline \(\mathit{fi}\) returns the set of first instances of activity \(\mathit{b}\) that occur after the first instance of \(\mathit{a}\) in case \(c\). \\' WHERE slug = 'waiting-time-from-activity-a-to-activity-b-case-granularity-t-c';
UPDATE indicator SET function_name = '\(\mathit{WareC}(c)\)', formalization_latex = '\(\#^{}_{\mathit{warec}}(c)\)', formalization_fp = '\(\#^{}_{\mathit{warec}}(c)\)', description_fp = '\(\#^{}_{\mathit{warec}}\) returns the warehousing cost associated with case \(c\). \\' WHERE slug = 'warehousing-cost-case-granularity-c-c';
UPDATE indicator SET function_name = '\(\mathit{WareC}(g)\)', formalization_latex = '\(\sum _{c \in g} \mathit{WareC}(c)\)', formalization_fp = '\(\sum _{c \in g} \mathit{WareC}(c)\)', description_fp = '\(\mathit{WareC}(c)\) returns the warehousing cost for case \(c\). \\' WHERE slug = 'warehousing-cost-group-of-cases-granularity-c-g';

COMMIT;
