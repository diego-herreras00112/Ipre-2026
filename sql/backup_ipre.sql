--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17
-- Dumped by pg_dump version 14.17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attribute (
    id_attribute integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.attribute OWNER TO postgres;

--
-- Name: attribute_id_attribute_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attribute_id_attribute_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attribute_id_attribute_seq OWNER TO postgres;

--
-- Name: attribute_id_attribute_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attribute_id_attribute_seq OWNED BY public.attribute.id_attribute;


--
-- Name: dimension; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dimension (
    id_dimension integer NOT NULL,
    code character varying(1) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.dimension OWNER TO postgres;

--
-- Name: dimension_id_dimension_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dimension_id_dimension_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dimension_id_dimension_seq OWNER TO postgres;

--
-- Name: dimension_id_dimension_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dimension_id_dimension_seq OWNED BY public.dimension.id_dimension;


--
-- Name: extra_input; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.extra_input (
    id_extra_input integer NOT NULL,
    id_parameter integer NOT NULL,
    input_type character varying(50),
    description text
);


ALTER TABLE public.extra_input OWNER TO postgres;

--
-- Name: extra_input_id_extra_input_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.extra_input_id_extra_input_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extra_input_id_extra_input_seq OWNER TO postgres;

--
-- Name: extra_input_id_extra_input_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.extra_input_id_extra_input_seq OWNED BY public.extra_input.id_extra_input;


--
-- Name: granularity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.granularity (
    id_granularity integer NOT NULL,
    code character varying(2) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.granularity OWNER TO postgres;

--
-- Name: granularity_id_granularity_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.granularity_id_granularity_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.granularity_id_granularity_seq OWNER TO postgres;

--
-- Name: granularity_id_granularity_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.granularity_id_granularity_seq OWNED BY public.granularity.id_granularity;


--
-- Name: indicator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.indicator (
    id_indicator integer NOT NULL,
    id_parent_indicator integer,
    slug character varying(150) NOT NULL,
    name character varying(255) NOT NULL,
    id_dimension integer,
    id_granularity integer,
    explanation text,
    potential_use text,
    assumptions text,
    desired_value character varying(10),
    function_name text,
    formalization_latex text,
    formalization_fp text,
    description_fp text
);


ALTER TABLE public.indicator OWNER TO postgres;

--
-- Name: indicator_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.indicator_attribute (
    id_indicator integer NOT NULL,
    id_attribute integer NOT NULL
);


ALTER TABLE public.indicator_attribute OWNER TO postgres;

--
-- Name: indicator_id_indicator_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.indicator_id_indicator_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indicator_id_indicator_seq OWNER TO postgres;

--
-- Name: indicator_id_indicator_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.indicator_id_indicator_seq OWNED BY public.indicator.id_indicator;


--
-- Name: indicator_parameter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.indicator_parameter (
    id_indicator integer NOT NULL,
    id_parameter integer NOT NULL,
    "position" integer NOT NULL
);


ALTER TABLE public.indicator_parameter OWNER TO postgres;

--
-- Name: indicator_reference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.indicator_reference (
    id_indicator integer NOT NULL,
    id_reference integer NOT NULL
);


ALTER TABLE public.indicator_reference OWNER TO postgres;

--
-- Name: parameter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parameter (
    id_parameter integer NOT NULL,
    symbol character varying(50) NOT NULL,
    name character varying(100),
    domain character varying(100),
    "constraint" text,
    parameter_type character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.parameter OWNER TO postgres;

--
-- Name: parameter_id_parameter_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parameter_id_parameter_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parameter_id_parameter_seq OWNER TO postgres;

--
-- Name: parameter_id_parameter_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parameter_id_parameter_seq OWNED BY public.parameter.id_parameter;


--
-- Name: reference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reference (
    id_reference integer NOT NULL,
    citation_key character varying(100) NOT NULL,
    authors text NOT NULL,
    title text,
    year integer,
    source text
);


ALTER TABLE public.reference OWNER TO postgres;

--
-- Name: reference_id_reference_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reference_id_reference_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reference_id_reference_seq OWNER TO postgres;

--
-- Name: reference_id_reference_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reference_id_reference_seq OWNED BY public.reference.id_reference;


--
-- Name: translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.translation (
    id_translation integer NOT NULL,
    command character varying(100) NOT NULL,
    latex_expansion character varying(255) NOT NULL,
    category character varying(20),
    description text
);


ALTER TABLE public.translation OWNER TO postgres;

--
-- Name: translation_id_translation_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.translation_id_translation_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translation_id_translation_seq OWNER TO postgres;

--
-- Name: translation_id_translation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.translation_id_translation_seq OWNED BY public.translation.id_translation;


--
-- Name: attribute id_attribute; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute ALTER COLUMN id_attribute SET DEFAULT nextval('public.attribute_id_attribute_seq'::regclass);


--
-- Name: dimension id_dimension; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dimension ALTER COLUMN id_dimension SET DEFAULT nextval('public.dimension_id_dimension_seq'::regclass);


--
-- Name: extra_input id_extra_input; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extra_input ALTER COLUMN id_extra_input SET DEFAULT nextval('public.extra_input_id_extra_input_seq'::regclass);


--
-- Name: granularity id_granularity; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.granularity ALTER COLUMN id_granularity SET DEFAULT nextval('public.granularity_id_granularity_seq'::regclass);


--
-- Name: indicator id_indicator; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator ALTER COLUMN id_indicator SET DEFAULT nextval('public.indicator_id_indicator_seq'::regclass);


--
-- Name: parameter id_parameter; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parameter ALTER COLUMN id_parameter SET DEFAULT nextval('public.parameter_id_parameter_seq'::regclass);


--
-- Name: reference id_reference; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reference ALTER COLUMN id_reference SET DEFAULT nextval('public.reference_id_reference_seq'::regclass);


--
-- Name: translation id_translation; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translation ALTER COLUMN id_translation SET DEFAULT nextval('public.translation_id_translation_seq'::regclass);


--
-- Data for Name: attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attribute (id_attribute, name, description) FROM stdin;
1	act	Event attribute: activity
2	actinst	Event attribute: activity instance
3	case	Event attribute: case id
4	cli	Case attribute: client
5	fc	Event attribute: fixed cost
6	hres	Event attribute: human resource
7	ic	Event attribute: inventory cost
8	lc	Event attribute: labor cost
9	mainc	Case attribute: maintenance cost
10	mdc	Case attribute: missed deadline cost
11	qual	Case attribute: quality indicator
12	res	Event attribute: resource
13	role	Event attribute: role
14	tc	Event attribute: total cost
15	time	Event attribute: timestamp
16	transc	Case attribute: transportation cost
17	type	Event attribute: lifecycle type
18	uns	Event attribute: unsuccessful outcome units
19	unt	Event attribute: outcome units
20	vc	Event attribute: variable cost
21	warec	Case attribute: warehousing cost
\.


--
-- Data for Name: dimension; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dimension (id_dimension, code, name) FROM stdin;
1	C	Cost
2	F	Flexibility
3	G	General
4	Q	Quality
5	T	Time
\.


--
-- Data for Name: extra_input; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.extra_input (id_extra_input, id_parameter, input_type, description) FROM stdin;
1	1	set	List of automated activities
2	2	set	List of direct cost activities
3	3	set	List of desirable activities
4	4	set	List of unwanted activities
5	5	activity	the considered activity
6	6	activity	the second specific activity
7	8	timestamp	the end timestamp of the time frame
8	10	resource	the specific human resource
9	12	role	the specific role
10	13	timestamp	the start timestamp of the time frame
11	14	set	Subset of activities to consider
12	15	value	A timestamp indicating the deadline that should not be exceeded
\.


--
-- Data for Name: granularity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.granularity (id_granularity, code, name) FROM stdin;
1	A	Activity
2	C	Case
3	G	Group of cases
4	I	Activity instance
\.


--
-- Data for Name: indicator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.indicator (id_indicator, id_parent_indicator, slug, name, id_dimension, id_granularity, explanation, potential_use, assumptions, desired_value, function_name, formalization_latex, formalization_fp, description_fp) FROM stdin;
1	\N	active-time-case-granularity-t-c	Active Time (case granularity)	5	2	Difference between the lead time and the idle time of a case.	Event log that contains lifecycle information for activity instances where the actual time that the case is active is of interest.	Maximizing active time is desirable.	maximize	\\(\\mathit{AT(c)\\)	\\(\\mathit{LT(c) - \\mathit{IT(c)\\)	\\(\\mathit{LT(c) - \\mathit{IT(c)\\)	\\(\\mathit{LT(c)\\) returns the Lead Time (time from case start to completion) of case \\(c\\).\n\\newline \\(\\mathit{IT(c)\\) returns the Idle Time (total time spent waiting or idle) of case \\(c\\). \\\\
2	\N	activity-and-role-count-ratio-case-granularity-f-c	Activity and Role count Ratio (case granularity)	2	2	Ratio between the number of activities that occur in a case, and the number of human resource roles that are involved in the execution of a case.	Process where several roles are involved.	Minimizing the number of human resource roles involved in the execution of the case is desirable.	maximize	\\(\\mathit{ARoleR(c)\\)	\\(\\frac{\\mathit{A(c)}{\\mathit{Role(c)}\\)	\\(\\frac{\\mathit{A(c)}{\\mathit{Role(c)}\\)	\\(\\mathit{A(c)\\) returns the number of unique activities in case \\(c\\).\n\\newline \\(\\mathit{Role(c)\\) returns the number of unique roles involved in case \\(c\\). \\\\
3	\N	activity-and-role-count-ratio-group-of-cases-granularity-f-g	Activity and Role count Ratio (group of cases granularity)	2	3	Ratio between the number of activities that occur in a group of cases, and the number of human resource roles that are involved in the execution of a group of cases.	Process where several roles are involved.	Minimizing the number of human resource roles involved in the execution of a group of cases is desirable.	maximize	\\(\\mathit{ARoleR(g)\\)	\\(\\frac{\\mathit{A(g)}{\\mathit{Role(g)}\\)	\\(\\frac{\\mathit{A(g)}{\\mathit{Role(g)}\\)	\\(\\mathit{A(g)\\) returns the number of unique activities in group \\(g\\).\n\\newline \\(\\mathit{Role(g)\\) returns the number of unique roles involved in group \\(g\\). \\\\
4	\N	activity-count-case-granularity-g-c	Activity count (case granularity)	3	2	Number of activities that occur in a case.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{A(c)\\)	\\(|\\mathit{act(c)|\\)	\\(\\mathit{count(\\mathit{act(c))\\)	$\\mathit{act(c)$ returns the set of unique activities that occur in case $c$. \\\\
5	\N	activity-count-group-of-cases-granularity-g-g	Activity count (group of cases granularity)	3	3	Number of activities that occur in a group of cases.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{A(g)\\)	\\(|\\cup_{c \\in g} \\mathit{act(c)|\\)	\\(\\mathit{count(\\mathit{act(g))\\)	$\\mathit{act(g)$ returns the set of unique activities that occur in group of cases $g$. \\\\
6	\N	activity-count-case-granularity-t-c	Activity count (case granularity)	5	2	Number of activities that occur in a case.	If the event log does not contain timestamps, Activity count can be used as a proxy for the time performance of a case.	A greater number of activities implies that the case takes longer to complete.	minimize	\\(\\mathit{A(c)\\)	\\(|\\mathit{act(c)|\\)	\\(\\mathit{count(\\mathit{act(c))\\)	$\\mathit{act(c)$ returns the set of unique activities that occur in case $c$.\n\\\\
7	\N	activity-count-group-of-cases-granularity-t-g	Activity count (group of cases granularity)	5	3	Number of activities that occur in a group of cases.	If the event log does not contain timestamps, Activity count can be used as a proxy for the time performance of a group of cases.	A greater number of activities implies that the cases in a group of cases take longer to complete.	minimize	\\(\\mathit{A(g)\\)	\\(|\\cup_{c \\in g} \\mathit{act(c)|\\)	\\(\\mathit{count(\\mathit{act(g))\\)	$\\mathit{act(g)$ returns the set of unique activities that occur in group of cases $g$.\n\\\\
8	\N	activity-instance-and-human-resource-count-ratio-activity-granularity-f-a	activity Instance and Human Resource count Ratio (activity granularity)	2	1	Ratio between the number of times that an activity is instantiated in the event log, and the number of human resources that are involved in the execution of an activity in the event log.	Process where several human resources are involved.	Minimizing the number of human resources involved in the execution of an activity is desirable.	maximize	\\(\\mathit{IHRR(a)\\)	\\(\\frac{\\mathit{I(a)}{\\mathit{HR(a)}\\)	\\(\\frac{\\mathit{I(a)}{\\mathit{HR(a)}\\)	\\(\\mathit{I(a)\\) returns the total number of instances of activity \\(a\\).\n\\newline \\(\\mathit{HR(a)\\) returns the number of unique human resources that performed activity \\(a\\). \\\\
9	\N	activity-instance-and-human-resource-count-ratio-case-granularity-f-c	activity Instance and Human Resource count Ratio (case granularity)	2	2	Ratio between the number of times that any activity is instantiated in a case, and the number of human resources that are involved in the execution of a case.	Process where several human resources are involved.	Minimizing the number of human resources involved in the execution of a case is desirable.	maximize	\\(\\mathit{IHRR(c)\\)	\\(\\frac{\\mathit{I(c)}{\\mathit{HR(c)}\\)	\\(\\frac{\\mathit{I(c)}{\\mathit{HR(c)}\\)	\\(\\mathit{I(c)\\) returns the total number of activity instances in case \\(c\\).\n\\newline \\(\\mathit{HR(c)\\) returns the number of unique human resources involved in case \\(c\\). \\\\
10	\N	activity-instance-and-human-resource-count-ratio-group-of-cases-granularity-f-g	activity Instance and Human Resource count Ratio (group of cases granularity)	2	3	Ratio between the number of times that any activity is instantiated in a group of cases, and the number of human resources that are involved in the execution of a group of cases.	Process where several human resources are involved.	Minimizing the number of human resources involved in the execution of a group of cases is desirable.	maximize	\\(\\mathit{IHRR(g)\\)	\\(\\frac{\\mathit{I(g)}{\\mathit{HR(g)}\\)	\\(\\frac{\\mathit{I(g)}{\\mathit{HR(g)}\\)	\\(\\mathit{I(g)\\) returns the total number of activity instances in group \\(g\\).\n\\newline \\(\\mathit{HR(g)\\) returns the number of unique human resources involved in group \\(g\\). \\\\
11	\N	activity-instance-count-activity-granularity-g-a	activity Instance count (activity granularity)	3	1	Number of times that an activity is instantiated in the event log.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{I(a)\\)	\\(|\\mathit{inst(a)|\\)	\\(\\mathit{count(\\mathit{inst(a))\\)	$\\mathit{inst(a)$ returns the set of instances of activity $a$ that occur in the event log. \\\\
12	\N	activity-instance-count-case-granularity-g-c	activity Instance count (case granularity)	3	2	Number of times that any activity is instantiated in a case.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{I(c)\\)	\\(|\\mathit{inst(c)|\\)	\\(\\mathit{count(\\mathit{inst(c))\\)	$\\mathit{inst(c)$ returns the set of activity instances that occur in case $c$.\\\\
13	\N	activity-instance-count-group-of-cases-granularity-g-g	activity Instance count (group of cases granularity)	3	3	Number of times that any activity is instantiated in a group of cases.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{I(g)\\)	\\(\\sum _{c \\in g} \\mathit{I(c)\\)	\\(\\sum _{c \\in \\mathit{cases(g)} \\mathit{I(c)\\)	$\\mathit{cases(g)$ returns the set of cases in group of cases $g$.\n\\newline $\\mathit{I(c)$ returns the activity instance count of case $c$. \\\\
14	\N	activity-instance-count-case-granularity-t-c	activity Instance count (case granularity)	5	2	Number of times that any activity is instantiated in a case.	If the event log does not contain timestamps, activity Instance count can be used as a proxy for the time performance of a case.	A greater number of activity instances implies that the case takes longer to complete.	minimize	\\(\\mathit{I(c)\\)	\\(|\\mathit{inst(c)|\\)	\\(\\mathit{count(\\mathit{inst(c))\\)	$\\mathit{inst(c)$ returns the set of activity instances that occur in case $c$.\n\\\\
15	\N	activity-instance-count-group-of-cases-granularity-t-g	activity Instance count (group of cases granularity)	5	3	Number of times that any activity is instantiated in a group of cases.	If the event log does not contain timestamps, activity Instance count can be used as a proxy for the time performance of a group of cases.	A greater number of activity instances implies that the cases in a group of cases take longer to complete.	minimize	\\(\\mathit{I(g)\\)	\\(\\sum _{c \\in g} \\mathit{I(c)\\)	\\(\\sum_{c \\in \\mathit{cases(g)} \\mathit{I(c)\\)	$\\mathit{cases(g)$ returns the set of cases in group of cases $g$.\n\\newline $\\mathit{I(c)$ returns the activity instance count of case $c$.\n\\\\
16	\N	activity-instance-count-by-human-resource-activity-granularity-q-a	activity Instance count by Human Resource (activity granularity)	4	1	Number of times a specific human resource performs an activity in the event log.	Process where individual performance of human resources is relevant.	Maximizing the number of activities conducted by the same human resource is desirable.	maximize	\\(\\mathit{IbyHR(a, \\mathit{hr)\\)	\\(|\\{i \\in \\mathit{inst(a) \\mid \\mathit{hres(i) = \\mathit{hr\\}|\\)	\\(\\displaystyle \\sum_{i \\in \\mathit{inst(a)}\n\\begin{cases}\n1 & \\text{if } \\mathit{hres(i) = \\mathit{hr \\\\\n0 & \\text{otherwise}\n\\end{cases}\n\\)	\\(\\mathit{inst(a)\\) returns the set of all instances of activity \\(a\\).\n\\newline \\(\\mathit{hres(i)\\) returns the human resource associated with activity instance \\(i\\). \\\\
17	\N	activity-instance-count-by-human-resource-case-granularity-q-c	activity Instance count by Human Resource (case granularity)	4	2	Number of times a specific human resource instantiates any activity in a case.	Process where individual performance of human resources is relevant.	Maximizing the number of activities conducted by the same human resource is desirable.	maximize	\\(\\mathit{IbyHR(c, \\mathit{hr)\\)	\\(|\\{i \\in \\mathit{inst(c) \\mid \\mathit{hres(i) = \\mathit{hr\\}|\\)	\\(\\displaystyle \\sum_{i \\in \\mathit{inst(c)}\n\\begin{cases}\n1 & \\text{if } \\mathit{hres(i) = \\mathit{hr \\\\\n0 & \\text{otherwise}\n\\end{cases}\n\\)	\\(\\mathit{inst(c)\\) returns the set of all activity instances in case \\(c\\).\n\\newline \\(\\mathit{hres(i)\\) returns the human resource associated with activity instance \\(i\\). \\\\
18	\N	activity-instance-count-by-human-resource-group-of-cases-granularity-q-g	activity Instance count by Human Resource (group of cases granularity)	4	3	Number of times a specific human resource instantiates any activity in a group of cases.	Process where individual performance of human resources is relevant.	Maximizing the number of activities conducted by the same human resource is desirable.	maximize	\\(\\mathit{IbyHR(g, \\mathit{hr)\\)	\\(\\sum _{c \\in g} \\mathit{IbyHR(c, \\mathit{hr)\\)	\\(\\sum _{c \\in g} \\mathit{IbyHR(c, \\mathit{hr)\\)	\\(\\mathit{IbyHR(c, \\mathit{hr)\\) returns the activity instance count by human resource \\(\\mathit{hr\\) in case \\(c\\). \\\\
19	\N	activity-instance-count-by-role-case-granularity-q-c	activity Instance count by Role (case granularity)	4	2	Number of times that any activity is instantiated by a specific role in a case.	Process where performance of human resources with certain roles is relevant.	Maximizing the number of activities conducted by human resources with the specific role is desirable.	maximize	\\(\\mathit{IbyRole(c, \\mathit{rl)\\)	\\(|\\{i \\in \\mathit{inst(c) \\mid \\mathit{role(i) = \\mathit{rl\\}|\\)	\\(\\displaystyle \\sum_{i \\in \\mathit{inst(c)}\n\\begin{cases}\n1 & \\text{if } \\mathit{role(i) = \\mathit{rl \\\\\n0 & \\text{otherwise}\n\\end{cases}\n\\)	\\(\\mathit{inst(c)\\) returns the set of all activity instances in case \\(c\\).\n\\newline \\(\\mathit{role(i)\\) returns the role associated with activity instance \\(i\\). \\\\
20	\N	activity-instance-count-by-role-group-of-cases-granularity-q-g	activity Instance count by Role (group of cases granularity)	4	3	Number of times that any activity is instantiated by a specific role in a group of cases.	Process where performance of human resources with certain roles is relevant.	Maximizing the number of activities conducted by the same role is desirable.	maximize	\\(\\mathit{IbyRole(g, \\mathit{rl)\\)	\\(\\sum _{c \\in g} \\mathit{IbyRole(c, \\mathit{rl)\\)	\\(\\sum _{c \\in g} \\mathit{IbyRole(c, \\mathit{rl)\\)	\\(\\mathit{IbyRole(c, \\mathit{rl)\\) returns the activity instance count by role \\(\\mathit{rl\\) in case \\(c\\). \\\\
21	\N	automated-activity-cost-case-granularity-c-c	Automated Activity Cost (case granularity)	1	2	Total cost associated with all instantiations of automated activities in a case.	Event log that contains automated activities and cost information.	Minimizing total cost is desirable.	minimize	\\(\\mathit{AutC\\mathit{^{\\times(c)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{i \\in \\mathit{inst(c), \\mathit{act(i) \\in \\mathit{Autl} \\mathit{TC\\mathit{^{\\times(i)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\sum _{i \\in \\mathit{inst(c), \\mathit{act(i) \\in \\mathit{Autl} \\mathit{TC(i)\\)	\\(\\mathit{inst(c)\\) returns the set of all activity instances in case \\(c\\).\n\\newline \\(\\mathit{act(i)\\) returns the activity of activity instance \\(i\\).\n\\newline \\(\\mathit{Autl\\) returns the set of automated activities.\n\\newline \\(\\mathit{TC(i)\\) returns the cost of activity instance \\(i\\). \\\\
22	\N	automated-activity-cost-group-of-cases-granularity-c-g	Automated Activity Cost (group of cases granularity)	1	3	Total cost associated with all instantiations of automated activities in a group of cases.	Event log that contains automated activities and cost information.	Minimizing total cost is desirable.	minimize	\\(\\mathit{AutC\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{c \\in g} \\mathit{AutC\\mathit{^{\\times(c)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{AutC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{AutC\\mathit{^{sum$.	\\(\\sum _{c \\in g} \\mathit{AutC(c)\\)	\\(\\mathit{AutC(c)\\) returns the automated activity cost for case \\(c\\). \\\\
23	\N	automated-activity-count-case-granularity-q-c	Automated Activity count (case granularity)	4	2	Number of automated activities that occur in a case.	Event log that contains automated activities.	Automated activities yield more reliable, higher-quality results.	maximize	\\(\\mathit{Auta(c)\\)	\\(|\\mathit{Autl \\cap \\mathit{act(c)|\\)	\\(\\sum_{a \\in \\mathit{act(c)} \n\\begin{cases}\n1 & \\text{if } a \\text{ is automated} \\\\\n0 & \\text{otherwise}\n\\end{cases}\\)	$\\mathit{act(c)$ returns the set of unique activities that occur in case $c$.\\\\
24	\N	automated-activity-count-group-of-cases-granularity-q-g	Automated Activity count (group of cases granularity)	4	3	Number of automated activities that occur in a group of cases.	Event log that contains automated activities.	Automated activities yield more reliable, higher-quality results.	maximize	\\(\\mathit{Auta(g)\\)	\\(|\\mathit{Autl \\cap (\\cup_{c \\in g} \\mathit{act(c))|\\)	\\(\\sum_{a \\in \\mathit{act(g)} \n\\begin{cases}\n1 & \\text{if } a \\text{ is automated} \\\\\n0 & \\text{otherwise}\n\\end{cases}\\)	$\\mathit{act(g)$ returns the set of unique activities that occur in group of cases $g$.\\\\
25	\N	automated-activity-count-case-granularity-t-c	Automated Activity count (case granularity)	5	2	Number of automated activities that occur in a case.	Event log that contains automated activities.	Automated activities take less time to be executed.	maximize	\\(\\mathit{Auta(c)\\)	\\(|\\mathit{Autl \\cap \\mathit{act(c)|\\)	\\(\\sum_{a \\in \\mathit{act(c)} \n\\begin{cases}\n1 & \\text{if } a \\text{ is automated} \\\\\n0 & \\text{otherwise}\n\\end{cases}\\)	$\\mathit{act(c)$ returns the set of unique activities that occur in case $c$.\\\\
26	\N	automated-activity-count-group-of-cases-granularity-t-g	Automated Activity count (group of cases granularity)	5	3	Number of automated activities that occur in a group of cases.	Event log that contains automated activities.	Automated activities take less time to be executed.	maximize	\\(\\mathit{Auta(g)\\)	\\(|\\mathit{Autl \\cap (\\cup_{c \\in g} \\mathit{act(c))|\\)	\\(\\sum_{a \\in \\mathit{act(g)} \n\\begin{cases}\n1 & \\text{if } a \\text{ is automated} \\\\\n0 & \\text{otherwise}\n\\end{cases}\\)	$\\mathit{act(g)$ returns the set of unique activities that occur in group of cases $g$.\\\\
27	\N	automated-activity-instance-count-case-granularity-q-c	Automated activity Instance count (case granularity)	4	2	Number of times that an automated activity is instantiated in a case.	Event log that contains automated activities.	Automated activities yield more reliable, higher-quality results.	maximize	\\(\\mathit{Auti(c)\\)	\\(|\\{i \\in \\mathit{inst(c) \\mid \\mathit{act(i) \\in \\mathit{Autl\\}|\\)	\\(\\sum_{i \\in \\mathit{inst(c)}\n\\begin{cases}\n1 & \\text{if } \\mathit{act(i) \\text{ is automated} \\\\\n0 & \\text{otherwise}\n\\end{cases}\\)	$\\mathit{inst(c)$ returns the set of activity instances that occur in case $c$.\n\\newline $\\mathit{act(i)$ returns the activity associated to activity instance $i$.\\\\
28	\N	automated-activity-instance-count-group-of-cases-granularity-q-g	Automated activity Instance count (group of cases granularity)	4	3	Number of times that an automated activity is instantiated in a group of cases.	Event log that contains automated activities.	Automated activities yield more reliable, higher-quality results.	maximize	\\(\\mathit{Auti(g)\\)	\\(\\sum _{c \\in g} \\mathit{Auti(c)\\)	\\(\\sum _{c \\in g} \\mathit{Auti(c)\\)	\\(\\mathit{Auti(c)\\) returns the automated activity instance count for case \\(c\\). \\\\
29	\N	automated-activity-instance-count-case-granularity-t-c	Automated activity Instance count (case granularity)	5	2	Number of times that an automated activity is instantiated in a case.	Event log that contains automated activities.	Automated activities take less time to be executed.	maximize	\\(\\mathit{Auti(c)\\)	\\(|\\{i \\in \\mathit{inst(c) \\mid \\mathit{act(i) \\in \\mathit{Autl\\}|\\)	\\(\\sum_{i \\in \\mathit{inst(c)}\n\\begin{cases}\n1 & \\text{if } \\mathit{act(i) \\text{ is automated} \\\\\n0 & \\text{otherwise}\n\\end{cases}\\)	$\\mathit{inst(c)$ returns the set of activity instances that occur in case $c$.\n\\newline $\\mathit{act(i)$ returns the activity associated to activity instance $i$.\\\\
30	\N	automated-activity-instance-count-group-of-cases-granularity-t-g	Automated activity Instance count (group of cases granularity)	5	3	Number of times that an automated activity is instantiated in a group of cases.	Event log that contains automated activities.	Automated activities take less time to be executed.	maximize	\\(\\mathit{Auti(g)\\)	\\(\\sum _{c \\in g} \\mathit{Auti(c)\\)	\\(\\sum_{c \\in \\mathit{cases(g)} \\mathit{Auti(c)\\)	$\\mathit{cases(g)$ returns the set of cases in group of cases $g$.\n\\newline $\\mathit{Auti(c)$ returns the automated activity instance count of case $c$.\\\\
31	\N	automated-activity-service-time-case-granularity-t-c	Automated Activity Service Time (case granularity)	5	2	Sum of the service time of all instantiations of automated activities in a case.	Event log that contains automated activities and lifecycle information for activity instances.	Minimizing service time is desirable.	minimize	\\(\\mathit{AutST(c)\\)	\\(\\sum _{i \\in \\mathit{inst(c), \\mathit{act(i) \\in \\mathit{Autl} \\mathit{ST(i)\\)	\\(\\sum_{i \\in \\mathit{inst(c),\\, \\mathit{act(i) \\in \\mathit{Autl} \\mathit{ST(i)\\)	$\\mathit{inst(c)$ returns the set of activity instances that occur in case $c$.\n\\newline $\\mathit{act(i)$ returns the activity associated with activity instance $i$.\n\\newline $\\mathit{Autl$ denotes the set of automated activities.\n\\newline $\\mathit{ST(i)$ returns the service time of activity instance $i$.\\\\
32	\N	automated-activity-service-time-group-of-cases-granularity-t-g	Automated Activity Service Time (group of cases granularity)	5	3	Sum of the service time of all instantiations of automated activities in a group of cases.	Event log that contains automated activities and lifecycle information for activity instances.	Minimizing service time is desirable.	minimize	\\(\\mathit{AutST(g)\\)	\\(\\sum _{c \\in g} \\mathit{AutST(c)\\)	\\(\\sum_{c \\in \\mathit{cases(g)} \\mathit{AutST(c)\\)	$\\mathit{cases(g)$ returns the set of cases that belong to group of cases $g$.\n\\newline$\\mathit{AutST(c)$ returns the automated activity service time of case $c$.\\\\
33	\N	case-and-client-count-ratio-group-of-cases-granularity-q-g	Case and Client count Ratio (group of cases granularity)	4	3	Ratio between the number of cases in a group of cases and the number of distinct clients associated with cases in a group of cases.	Process is executed for different clients.	It is desirable to maximize the number of cases per client.	maximize	\\(\\mathit{CCliR(g)\\)	\\(\\frac{\\mathit{C(g)}{\\mathit{Cli(g)}\\)	\\(\\frac{\\mathit{C(g)}{\\mathit{Cli(g)}\\)	\\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\).\n\\newline \\(\\mathit{Cli(g)\\) returns the number of clients associated with group \\(g\\). \\\\
34	\N	case-count-group-of-cases-granularity-g-g	Case count (group of cases granularity)	3	3	Number of cases belonging to a group of cases.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{C(g)\\)	\\(|g|\\)	\\(\\mathit{count(\\mathit{cases(g))\\)	$\\mathit{cases(g)$ returns the set of cases in group of cases $g$. \\\\
35	\N	case-count-where-activity-after-time-frame-group-of-cases-granularity-q-g	Case Count where Activity after Time Frame (group of cases granularity)	4	3	Number of cases in a group of cases where a specific activity occurs after a specific time frame.	Event log is associated with a process in which specific time frames must be taken into consideration.	Maximizing the number of cases where the activity occurs after the time frame is desirable.	maximize	\\(\\mathit{CApastTFC(g, \\mathit{a, \\mathit{et)\\)	\\(|\\{c \\in g \\mid \\exists i \\in \\mathit{inst(c, \\mathit{a)[\\mathit{stime(i) \\geq \\mathit{et]\\}|\\)	\\(\\displaystyle \\sum_{c \\in g}\n\\begin{cases}\n1 & \\text{if } \\exists i \\in \\mathit{inst(c, \\mathit{a)[\\mathit{stime(i) \\geq \\mathit{et] \\\\\n0 & \\text{otherwise}\n\\end{cases}\n\\)	\\(\\mathit{inst(c, \\mathit{a)\\) returns the set of all instances of activity \\(\\mathit{a\\) in case \\(c\\).\n\\newline \\(\\mathit{stime(i)\\) returns the start timestamp of activity instance \\(i\\). \\\\
36	\N	case-count-where-activity-before-time-frame-group-of-cases-granularity-q-g	Case Count where Activity before Time Frame (group of cases granularity)	4	3	Number of cases in a group of cases where a specific activity occurs before a specific time frame.	Event log is associated with a process in which specific time frames must be taken into consideration.	Maximizing the number of cases where the activity occurs before the time frame is desirable.	maximize	\\(\\mathit{CAdueTFC(g, \\mathit{a, \\mathit{st)\\)	\\(|\\{c \\in g \\mid \\exists i \\in \\mathit{inst(c, \\mathit{a)[\\mathit{stime(i) \\leq \\mathit{st]\\}|\\)	\\(\\displaystyle \\sum_{c \\in g}\n\\begin{cases}\n1 & \\text{if } \\exists i \\in \\mathit{inst(c, \\mathit{a)[\\mathit{stime(i) \\leq \\mathit{st] \\\\\n0 & \\text{otherwise}\n\\end{cases}\n\\)	\\(\\mathit{inst(c, \\mathit{a)\\) returns the set of all instances of activity \\(\\mathit{a\\) in case \\(c\\).\n\\newline \\(\\mathit{stime(i)\\) returns the start timestamp of activity instance \\(i\\). \\\\
37	\N	case-count-where-activity-during-time-frame-group-of-cases-granularity-q-g	Case Count where Activity during Time Frame (group of cases granularity)	4	3	Number of cases in a group of cases where a specific activity occurs within a specific time frame.	Event log is associated with a process in which specific time frames must be taken into consideration.	Maximizing the number of cases where the activity occurs within the time frame is desirable.	maximize	\\(\\mathit{CAinTFC(g, \\mathit{a, \\mathit{st, \\mathit{et)\\)	\\(|\\{c \\in g \\mid \\exists i \\in \\mathit{inst(c, \\mathit{a)[\\mathit{st \\leq \\mathit{stime(i) \\land \\mathit{stime(i) \\leq \\mathit{et]\\}|\\)	\\(\\displaystyle \\sum_{c \\in g}\n\\begin{cases}\n1 & \\text{if } \\exists i \\in \\mathit{inst(c, \\mathit{a)[\\mathit{st \\leq \\mathit{stime(i) \\land \\mathit{stime(i) \\leq \\mathit{et] \\\\\n0 & \\text{otherwise}\n\\end{cases}\n\\)	\\(\\mathit{inst(c, \\mathit{a)\\) returns the set of all instances of activity \\(\\mathit{a\\) in case \\(c\\).\n\\newline \\(\\mathit{stime(i)\\) returns the start timestamp of activity instance \\(i\\). \\\\
38	\N	case-count-where-end-activity-is-a-group-of-cases-granularity-q-g	Case Count where end activity is A (group of cases granularity)	4	3	Number of cases in a group of cases where a specific activity is the last one to be instantiated it.	Process is expected to end with specific activities.	Maximizing the number of cases that end with the specific activity is desirable.	maximize	\\(\\mathit{CendAC(g, \\mathit{a)\\)	\\(|\\{c \\in g \\mid \\exists i \\in \\mathit{endin(c)[\\mathit{act(i) = \\mathit{a]\\}|\\)	\\(\\displaystyle \\sum_{c \\in g}\n\\begin{cases}\n1 & \\text{if } \\exists i \\in \\mathit{endin(c)[\\mathit{act(i) = \\mathit{a] \\\\\n0 & \\text{otherwise}\n\\end{cases}\n\\)	\\(\\mathit{endin(c)\\) returns the set of last activity instances in case \\(c\\).\n\\newline \\(\\mathit{act(i)\\) returns the activity of activity instance \\(i\\). \\\\
39	\N	case-count-where-start-activity-is-a-group-of-cases-granularity-q-g	Case Count where start activity is A (group of cases granularity)	4	3	Number of cases in a group of cases where a specific activity is the first one to be instantiated it.	Process is expected to start with specific activities.	Maximizing the number of cases that start with the specific activity is desirable.	maximize	\\(\\mathit{CstartAC(g, \\mathit{a)\\)	\\(|\\{c \\in g \\mid \\exists i \\in \\mathit{strin(c)[\\mathit{act(i) = \\mathit{a]\\}|\\)	\\(\\displaystyle \\sum_{c \\in g}\n\\begin{cases}\n1 & \\text{if } \\exists i \\in \\mathit{strin(c)[\\mathit{act(i) = \\mathit{a] \\\\\n0 & \\text{otherwise}\n\\end{cases}\n\\)	\\(\\mathit{strin(c)\\) returns the set of first activity instances in case \\(c\\).\n\\newline \\(\\mathit{act(i)\\) returns the activity of activity instance \\(i\\). \\\\
40	\N	case-count-with-rework-group-of-cases-granularity-q-g	Case Count with Rework (group of cases granularity)	4	3	Number of cases in a group of cases where there is rework.	Process where rework recurrently occurs.	Minimizing the number of cases with rework is desirable.	minimize	\\(\\mathit{CRewC(g)\\)	\\(|\\{c \\in g \\mid \\mathit{RewC(c) > 0\\}|\\)	\\(\\displaystyle \\sum_{c \\in g}\n\\begin{cases}\n1 & \\text{if } \\mathit{RewC(c) > 0 \\\\\n0 & \\text{otherwise}\n\\end{cases}\n\\)	\\(\\mathit{RewC(c)\\) returns the rework count for case \\(c\\). \\\\
41	\N	case-percentage-where-activity-after-time-frame-group-of-cases-granularity-q-g	Case Percentage where Activity after Time Frame (group of cases granularity)	4	3	Percentage of cases in a group of cases where a specific activity occurs after a specific time frame.	Event log is associated with a process in which specific time frames must be taken into consideration.	Maximizing the number of cases where the activity occurs after the time frame is desirable.	maximize	\\(\\mathit{CApastTFP(g, \\mathit{a, \\mathit{et)\\)	\\(\\frac{\\mathit{CApastTFC(g, \\mathit{a, \\mathit{et)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{CApastTFC(g, \\mathit{a, \\mathit{et)}{\\mathit{C(g)}\\)	\\(\\mathit{CApastTFC(g, \\mathit{a, \\mathit{et)\\) returns the case count where activity \\(\\mathit{a\\) starts after time frame \\(\\mathit{et\\) in group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
42	\N	case-percentage-where-activity-before-time-frame-group-of-cases-granularity-q-g	Case Percentage where Activity before Time Frame (group of cases granularity)	4	3	Percentage of cases in a group of cases where a specific activity occurs before a specific time frame.	Event log is associated with a process in which specific time frames must be taken into consideration.	Maximizing the number of cases where the activity occurs before the time frame is desirable.	maximize	\\(\\mathit{CAdueTFP(g, \\mathit{a, \\mathit{st)\\)	\\(\\frac{\\mathit{CAdueTFC(g, \\mathit{a, \\mathit{st)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{CAdueTFC(g, \\mathit{a, \\mathit{st)}{\\mathit{C(g)}\\)	\\(\\mathit{CAdueTFC(g, \\mathit{a, \\mathit{st)\\) returns the case count where activity \\(\\mathit{a\\) starts before time frame \\(\\mathit{st\\) in group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
72	\N	expected-activity-instance-count-by-role-q-g	Expected activity Instance count by Role	4	3	Expected number of times that any activity is instantiated by a specific role in a case belonging to a group of cases.	Process where performance of human resources with certain roles is relevant.	Maximizing the number of activities conducted by the same role is desirable.	maximize	\\(\\mathit{e\\mathit{IbyRole(g, \\mathit{rl)\\)	\\(\\frac{\\mathit{IbyRole(g, \\mathit{rl)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{IbyRole(g, \\mathit{rl)}{\\mathit{C(g)}\\)	\\(\\mathit{IbyRole(g, \\mathit{rl)\\) returns the total activity instance count by role \\(\\mathit{rl\\) in group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
43	\N	case-percentage-where-activity-during-time-frame-group-of-cases-granularity-q-g	Case Percentage where Activity during Time Frame (group of cases granularity)	4	3	Percentage of cases in a group of cases where a specific activity occurs within a specific time frame.	Event log is associated with a process in which specific time frames must be taken into consideration.	Maximizing the number of cases where the activity occurs within the time frame is desirable.	maximize	\\(\\mathit{CAinTFP(g, \\mathit{a, \\mathit{st, \\mathit{et)\\)	\\(\\frac{\\mathit{CAinTFC(g, \\mathit{a, \\mathit{st, \\mathit{et)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{CAinTFC(g, \\mathit{a, \\mathit{st, \\mathit{et)}{\\mathit{C(g)}\\)	\\(\\mathit{CAinTFC(g, \\mathit{a, \\mathit{st, \\mathit{et)\\) returns the case count where activity \\(\\mathit{a\\) starts during the time frame in group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
44	\N	case-percentage-where-end-activity-is-a-group-of-cases-granularity-q-g	Case Percentage where End Activity is A (group of cases granularity)	4	3	Percentage of cases in a group of cases where a specific activity is the last instantiated one.	Process is expected to end with specific activities.	Maximizing the number of cases that end with the specific activity is desirable.	maximize	\\(\\mathit{CendAP(g, \\mathit{a)\\)	\\(\\frac{\\mathit{CendAC(g, \\mathit{a)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{CendAC(g, \\mathit{a)}{\\mathit{C(g)}\\)	\\(\\mathit{CendAC(g, \\mathit{a)\\) returns the case count where the end activity is \\(\\mathit{a\\) in group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
45	\N	case-percentage-where-start-activity-is-a-group-of-cases-granularity-q-g	Case Percentage where Start Activity is A (group of cases granularity)	4	3	Percentage of cases in a group of cases where a specific activity is the first one to be instantiated it.	Process is expected to start with specific activities.	Maximizing the number of cases that start with the specific activity is desirable.	maximize	\\(\\mathit{CstartAP(g, \\mathit{a)\\)	\\(\\frac{\\mathit{CstartAC(g, \\mathit{a)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{CstartAC(g, \\mathit{a)}{\\mathit{C(g)}\\)	\\(\\mathit{CstartAC(g, \\mathit{a)\\) returns the case count where the start activity is \\(\\mathit{a\\) in group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
46	\N	case-percentage-with-missed-deadline-group-of-cases-granularity-q-g	Case Percentage with Missed Deadline (group of cases granularity)	4	3	Percentage of cases in a group of cases whose latest event occurs after a given deadline.	Event log is associated with a process in which cases should be completed before a defined deadline.	Exceeding the deadline of interest is undesired.	minimize	\\(\\mathit{CMDP(g, \\mathit{val)\\)	\\(\\frac{|\\{c \\in g \\mid \\mathit{endt(c) > \\mathit{val\\}|}{\\mathit{C(g)}\\)	\\(\\displaystyle \\frac{\n\\sum_{c \\in g}\n\\begin{cases}\n1 & \\text{if } \\mathit{endt(c) > \\mathit{val \\\\\n0 & \\text{otherwise}\n\\end{cases}\n}{\\mathit{C(g)}\\)	\\(\\mathit{endt(c)\\) returns the completion timestamp of case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
47	\N	case-percentage-with-missed-deadline-group-of-cases-granularity-t-g	Case Percentage with Missed Deadline (group of cases granularity)	5	3	Percentage of cases belonging to a group of cases whose latest event occurs after a given deadline.	Event log is associated with a process in which cases should be completed before a defined deadline.	Exceeding the deadline of interest is undesired.	minimize	\\(\\mathit{CMDP(g, \\mathit{val)\\)	\\(\\frac{|\\{c \\in g \\mid \\mathit{endt(c) > \\mathit{val\\}|}{\\mathit{C(g)}\\)	\\(\\displaystyle \\frac{\n\\sum_{c \\in g}\n\\begin{cases}\n1 & \\text{if } \\mathit{endt(c) > \\mathit{val \\\\\n0 & \\text{otherwise}\n\\end{cases}\n}{\\mathit{C(g)}\\)	\\(\\mathit{endt(c)\\) returns the completion timestamp of case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
48	\N	case-percentage-with-rework-group-of-cases-granularity-q-g	Case Percentage with Rework (group of cases granularity)	4	3	Percentage of cases in a group of cases where there is rework.	Process where rework recurrently occurs.	Minimizing the number of cases with rework is desirable.	minimize	\\(\\mathit{CRewP(g)\\)	\\(\\frac{\\mathit{CRewC(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{CRewC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{CRewC(g)\\) returns the case count with rework in group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
49	\N	client-count-activity-granularity-f-a	Client count (activity granularity)	2	1	Number of distinct clients associated with cases where the activity is instantiated in the event log.	Process is executed for different clients.	It is desirable to maximize the number of clients.	maximize	\\(\\mathit{Cli(a)\\)	\\(|\\{#^{}_{\\mathit{cli}(c) \\mid c \\in C[a \\in \\mathit{act(c)]\\}|\\)	\\(\\mathit{count(\\mathit{Cli(a))\\)	\\(\\mathit{Cli(a)\\) returns the set of distinct client identifiers associated with activity $a$. \\\\
50	\N	client-count-group-of-cases-granularity-f-g	Client count (group of cases granularity)	2	3	Number of distinct clients associated with cases in a group of cases.	Process is executed for different clients.	It is desirable to maximize the number of clients.	maximize	\\(\\mathit{Cli(g)\\)	\\(|\\{#^{}_{\\mathit{cli}(c) \\mid c \\in g\\}|\\)	\\(\\mathit{count(\\mathit{Cli(g))\\)	\\(\\mathit{Cli(g)\\) returns the set of distinct client identifiers associated with case group $g$. \\\\
51	\N	client-count-and-total-cost-ratio-activity-granularity-q-a	Client count and Total Cost Ratio (activity granularity)	4	1	Ratio between the number of distinct clients associated with cases where an activity is instantiated in the event log, and the total cost associated with all instantiations of an activity in the event log.	Process is executed for different clients where the event log contains cost information.	It is desirable to execute the specific activity for as many clients at the least cost.	maximize	\\(\\mathit{CliTCR\\mathit{^{\\times(a)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{Cli(a)}{\\mathit{TC\\mathit{^{\\times(a)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{Cli(a)}{\\mathit{TC(a)}\\)	\\(\\mathit{Cli(a)\\) returns the number of distinct clients involved in activity \\(a\\).\n\\newline \\(\\mathit{TC(a)\\) returns the total cost of activity \\(a\\). \\\\
60	\N	directly-follows-relations-and-activity-count-ratio-group-of-cases-granularity-f-g	Directly-Follows Relations and Activity count Ratio (group of cases granularity)	2	3	Ratio between the number of activity pairs where one is instantiated directly after the other in a group of cases, and the number of activities that occur in a group of cases.	Process where several distinct directly-follows relations can occur.	A greater number of directly-follows relations is desirable, as it implies a greater capability to address unexpected situations.	maximize	\\(\\mathit{DFRAR(g)\\)	\\(\\frac{\\mathit{DFR(g)}{\\mathit{A(g)}\\)	\\(\\frac{\\mathit{DFR(g)}{\\mathit{A(g)}\\)	\\(\\mathit{DFR(g)\\) returns the number of unique Directly-Follows Relations (DFR) in group \\(g\\).\n\\newline \\(\\mathit{A(g)\\) returns the number of unique activities in group \\(g\\). \\\\
52	\N	client-count-and-total-cost-ratio-group-of-cases-granularity-q-g	Client count and Total Cost Ratio (group of cases granularity)	4	3	Ratio between the number of distinct clients associated with cases in a group of cases, and the total cost of a group of cases.	Process is executed for different clients where the event log contains cost information.	It is desirable to execute the process for as many clients at the least cost.	maximize	\\(\\mathit{CliTCR\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{Cli(g)}{\\mathit{TC\\mathit{^{\\times(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{Cli(g)}{\\mathit{TC(g)}\\)	\\(\\mathit{Cli(g)\\) returns the number of distinct clients associated with group \\(g\\).\n\\newline \\(\\mathit{TC(g)\\) returns the total cost of case group \\(g\\). \\\\
53	\N	desired-activity-count-case-granularity-c-c	Desired Activity count (case granularity)	1	2	Number of instantiated activities whose occurrence is desirable in a case.	Event log that contains optional activities whose occurrence is desirable.	Desirable activities should be maximized.	maximize	\\(\\mathit{DAC(c)\\)	\\(| \\mathit{Desl \\cap \\mathit{act(c)|\\)	\\(\\mathit{count( \\mathit{Desl \\cap \\mathit{act(c))\\)	\\(\\mathit{Desl\\) returns the set of desired activities.\n\\newline \\(\\mathit{act(c)\\) returns the set of activities that occurred in case \\(c\\). \\\\
54	\N	desired-activity-count-group-of-cases-granularity-c-g	Desired Activity count (group of cases granularity)	1	3	Number of instantiated activities whose occurrence is desirable in a group of cases.	Event log that contains optional activities whose occurrence is desirable.	Desirable activities should be maximized.	maximize	\\(\\mathit{DAC(g)\\)	\\(|\\mathit{Desl \\cap (\\cup_{c \\in g} \\mathit{act(c))|\\)	\\(\\mathit{count(\\mathit{Desl \\cap (\\cup_{c \\in g} \\mathit{act(c)))\\)	\\(\\mathit{Desl\\) returns the set of desired activities.\n\\newline \\(\\mathit{act(c)\\) returns the set of activities that occurred in case \\(c\\). \\\\
55	\N	desired-activity-count-case-granularity-q-c	Desired Activity count (case granularity)	4	2	Number of instantiated activities whose occurrence is desirable in a case.	Event log that contains optional activities whose occurrence is desirable.	Desirable activities should be maximized.	maximize	\\(\\mathit{DAC(c)\\)	\\(| \\mathit{Desl \\cap \\mathit{act(c)|\\)	\\(\\mathit{count(\\mathit{Desl \\cap \\mathit{act(c))\\)	\\(\\mathit{Desl\\) returns the set of desired activities.\n\\newline \\(\\mathit{act(c)\\) returns the set of activities that occurred in case \\(c\\). \\\\
56	\N	desired-activity-count-group-of-cases-granularity-q-g	Desired Activity count (group of cases granularity)	4	3	Number of instantiated activities whose occurrence is desirable in a group of cases.	Event log that contains optional activities whose occurrence is desirable.	Desirable activities should be maximized.	maximize	\\(\\mathit{DAC(g)\\)	\\(|\\mathit{Desl \\cap (\\cup_{c \\in g} \\mathit{act(c))|\\)	\\(\\mathit{count(\\mathit{Desl \\cap (\\cup_{c \\in g} \\mathit{act(c)))\\)	\\(\\mathit{Desl\\) returns the set of desired activities.\n\\newline \\(\\mathit{act(c)\\) returns the set of activities that occurred in case \\(c\\). \\\\
57	\N	direct-cost-case-granularity-c-c	Direct Cost (case granularity)	1	2	Total cost associated with all instantiations of activities that have a direct effect on the outcome of a case.	Event log in which activities can be categorized based on whether they directly contribute to the outcome of the process or not.	Minimizing total cost is desirable.	minimize	\\(\\mathit{DC\\mathit{^{\\times(c)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{i \\in \\mathit{inst(c), \\mathit{act(i) \\in \\mathit{DCl} \\mathit{TC\\mathit{^{\\times(i)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\sum _{i \\in \\mathit{inst(c), \\mathit{act(i) \\in \\mathit{DCl} \\mathit{TC(i)\\)	\\(\\mathit{inst(c)\\) returns the set of all activity instances in case \\(c\\).\n\\newline \\(\\mathit{act(i)\\) returns the activity of activity instance \\(i\\).\n\\newline \\(\\mathit{DCl\\) returns the set of direct cost activities.\n\\newline \\(\\mathit{TC(i)\\) returns the cost of activity instance \\(i\\). \\\\
58	\N	direct-cost-group-of-cases-granularity-c-g	Direct Cost (group of cases granularity)	1	3	Total cost associated with all instantiations of activities that have a direct effect on the outcome of cases in a group of cases.	Event log in which activities can be categorized based on whether they directly contribute to the outcome of the process or not.	Minimizing total cost is desirable.	minimize	\\(\\mathit{DC\\mathit{^{\\times(g)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{c \\in g} \\mathit{DC\\mathit{^{\\times(c)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{DC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{DC\\mathit{^{sum$.	\\(\\sum _{c \\in g} \\mathit{DC(c)\\)	\\(\\mathit{DC(c)\\) returns the direct cost for case \\(c\\). \\\\
59	\N	directly-follows-relations-and-activity-count-ratio-case-granularity-f-c	Directly-Follows Relations and Activity count Ratio (case granularity)	2	2	Ratio between the number of activity pairs where one is instantiated directly after the other in a case, and the number of activities that occur in a case.	Process where several distinct directly-follows relations can occur.	A greater number of directly-follows relations is desirable, as it implies a greater capability to address unexpected situations.	maximize	\\(\\mathit{DFRAR(c)\\)	\\(\\frac{\\mathit{DFR(c)}{\\mathit{A(c)}\\)	\\(\\frac{\\mathit{DFR(c)}{\\mathit{A(c)}\\)	\\(\\mathit{DFR(c)\\) returns the number of unique Directly-Follows Relations (DFR) in case \\(c\\).\n\\newline \\(\\mathit{A(c)\\) returns the number of unique activities in case \\(c\\). \\\\
92	\N	expected-idle-time-t-g	Expected Idle Time	5	3	Expected sum of time periods in which no activity instance is executed during a case belonging to a group of cases.	Event log that contains lifecycle information for activity instances in which the time the case is inactive is of interest.	Minimizing idle time is desirable.	minimize	\\(\\mathit{e\\mathit{IT(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{IT(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum_{c \\in g} \\mathit{IT(c)}{\\mathit{C(g)}\\)	$g$ represents the group of cases under analysis.\n\\newline $\\mathit{IT(c)$ returns the idle time of case $c$.\n\\newline $\\mathit{C(g)$ returns the case count of group of cases $g$.\\\\
61	\N	directly-follows-relations-count-activity-granularity-f-a	Directly-Follows Relations count (activity granularity)	2	1	Number of activities that have been instantiated directly after the activity of interest in the event log.	Process where several distinct directly-follows relations can occur.	A greater number of directly-follows relations is desirable, as it implies a greater capability to address unexpected situations.	maximize	\\(\\mathit{DFR(a)\\)	\\(\\cup_{i \\in \\mathit{inst(a)} \\{\\mathit{act(i') \\mid i' \\in \\mathit{next(i))\\}|\\)	\\(\\sum_{a \\in \\mathit{act(a)} \\mathit{dfrel(a)\\)	\\(\\mathit{inst(a)\\) returns the set of all instances of activity \\(a\\).\n\\newline \\(\\mathit{dfrel(a)\\) returns the set of activities that directly follow activity \\(a\\) in any case. \\\\
62	\N	directly-follows-relations-count-case-granularity-f-c	Directly-Follows Relations count (case granularity)	2	2	Number of activity pairs where one is instantiated directly after the other in a case.	Process where several distinct directly-follows relations can occur.	A greater number of directly-follows relations is desirable, as it implies a greater capability to address unexpected situations.	maximize	\\(\\mathit{DFR(c)\\)	\\(|\\mathit{dfrel(c)|\\)	\\(\\mathit{count(\\mathit{dfrel(c))\\)	\\(\\mathit{dfrel(c)\\) returns the set of unique Directly-Follows Relations (DFR) in case \\(c\\). \\\\
63	\N	directly-follows-relations-count-group-of-cases-granularity-f-g	Directly-Follows Relations count (group of cases granularity)	2	3	Number of activity pairs where one is instantiated directly after the other in a group of cases.	Process where several distinct directly-follows relations can occur.	A greater number of directly-follows relations is desirable, as it implies a greater capability to address unexpected situations.	maximize	\\(\\mathit{DFR(g)\\)	\\(|\\cup_{c \\in g} \\mathit{dfrel(c)|\\)	\\(\\displaystyle \\sum_{r \\in (\\cup_{c \\in g} \\mathit{dfrel(c))} 1\\)	\\(\\mathit{dfrel(c)\\) returns the set of unique Directly-Follows Relations (DFR) in case \\(c\\). \\\\
64	\N	expected-active-time-t-g	Expected Active Time	5	3	Expected difference between the lead time and the idle time of a case belonging to a group of cases.	Event log that contains lifecycle information for activity instances where the actual time that the case is active is of interest.	Maximizing active time is desirable.	maximize	\\(\\mathit{e\\mathit{AT(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{AT(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{AT(c)}{\\mathit{C(g)}\\)	\\(\\mathit{AT(c)\\) returns the Active Time of case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
65	\N	expected-activity-and-role-count-ratio-f-g	Expected Activity and Role count Ratio	2	3	Ratio between the expected number of activities that occur in a case belonging to a group of cases, and the expected number of human resource roles that are involved in the execution of a case belonging to a group of cases.	Process where several roles are involved.	Minimizing the number of human resource roles involved in the execution of a case is desirable.	maximize	\\(\\mathit{e\\mathit{ARoleR(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{A(c)}{\\sum _{c \\in g} \\mathit{Role(c)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{A(c)}{\\sum _{c \\in g} \\mathit{Role(c)}\\)	\\(\\mathit{A(c)\\) returns the number of unique activities in case \\(c\\).\n\\newline \\(\\mathit{Role(c)\\) returns the number of unique roles involved in case \\(c\\). \\\\
66	\N	expected-activity-count-g-g	Expected Activity count	3	3	Expected number of activities that occur in a case belonging to a group of cases.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{e\\mathit{A(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{A(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in \\mathit{cases(g)} \\mathit{A(c)}{\\mathit{C(g)}\\)	$\\mathit{cases(g)$ returns the set of cases in group of cases $g$.\n\\newline $\\mathit{A(c)$ returns the activity count of case $c$.\n\\newline $\\mathit{C(g)$ returns the case count of group of cases $g$. \\\\
67	\N	expected-activity-count-t-g	Expected Activity count	5	3	Expected number of activities that occur in a case belonging to a group of cases.	If the event log does not contain timestamps, Expected Activity count can be used as a proxy for the time performance of a group of cases.	A greater number of activities implies that a case takes longer to complete.	minimize	\\(\\mathit{e\\mathit{A(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{A(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in \\mathit{cases(g)} \\mathit{A(c)}{\\mathit{C(g)}\\)	$\\mathit{cases(g)$ returns the set of cases in group of cases $g$.\n\\newline $\\mathit{A(c)$ returns the activity count of case $c$.\n\\newline $\\mathit{C(g)$ returns the case count of group of cases $g$.\n\\\\
68	\N	expected-activity-instance-and-human-resource-count-ratio-f-g	Expected activity Instance and Human Resource count Ratio	2	3	Ratio between the expected number of times that any activity is instantiated in a case belonging to a group of cases, and the expected number of human resources that are involved in the execution of a case belonging to a group of cases.	Process where several human resources are involved.	Minimizing the number of human resources involved in the execution of a case is desirable.	maximize	\\(\\mathit{e\\mathit{IHRR(g)\\)	\\(\\frac{\\mathit{I(g)}{\\sum _{c \\in g} \\mathit{HR(c)}\\)	\\(\\frac{\\mathit{I(g)}{\\sum _{c \\in g} \\mathit{HR(c)}\\)	\\(\\mathit{I(g)\\) returns the total number of activity instances in group \\(g\\).\n\\newline \\(\\mathit{HR(c)\\) returns the number of unique human resources involved in case \\(c\\). \\\\
69	\N	expected-activity-instance-count-g-g	Expected activity Instance count	3	3	Expected number of times that any activity is instantiated in a case belonging to a group of cases.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{e\\mathit{I(g)\\)	\\(\\frac{\\mathit{I(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{I(g)}{\\mathit{C(g)}\\)	$\\mathit{I(g)$ returns the activity instance count of group of cases $g$.\n\\newline $\\mathit{C(g)$ returns the case count of group of cases $g$.\\\\
70	\N	expected-activity-instance-count-t-g	Expected activity Instance count	5	3	Expected number of times that any activity is instantiated in a case belonging to a group of cases.	If the event log does not contain timestamps, Expected activity Instance count can be used as a proxy for the time performance of a group of cases.	A greater number of activity instances implies that a case takes longer to complete.	minimize	\\(\\mathit{e\\mathit{I(g)\\)	\\(\\frac{\\mathit{I(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{I(g)}{\\mathit{C(g)}\\)	$\\mathit{I(g)$ returns the activity instance count of group of cases $g$.\n\\newline $\\mathit{C(g)$ returns the case count of group of cases $g$.\n\\\\
71	\N	expected-activity-instance-count-by-human-resource-q-g	Expected activity Instance count by Human Resource	4	3	Expected number of times a specific human resource instantiates any activity in a case belonging to a group of cases.	Process where individual performance of human resources is relevant.	Maximizing the number of activities conducted by the same human resource is desirable.	maximize	\\(\\mathit{e\\mathit{IbyHR(g, \\mathit{hr)\\)	\\(\\frac{\\mathit{IbyHR(g, \\mathit{hr)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{IbyHR(g, \\mathit{hr)}{\\mathit{C(g)}\\)	\\(\\mathit{IbyHR(g, \\mathit{hr)\\) returns the total activity instance count by human resource \\(\\mathit{hr\\) in group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
73	\N	expected-automated-activity-cost-c-g	Expected Automated Activity Cost	1	3	Expected total cost associated with all instantiations of automated activities in a case belonging to a group of cases.	Event log that contains automated activities and cost information.	Minimizing total cost is desirable.	minimize	\\(\\mathit{e\\mathit{AutC\\mathit{^{\\times(g)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{AutC\\mathit{^{\\times(g)}{\\mathit{C(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{AutC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{AutC\\mathit{^{sum$.	\\(\\frac{\\mathit{AutC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{AutC(g)\\) returns the total automated activity cost for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
74	\N	expected-automated-activity-count-q-g	Expected Automated Activity count	4	3	Expected number of automated activities that occur in a case belonging to a group of cases.	Event log that contains automated activities.	Automated activities yield more reliable, higher-quality results.	maximize	\\(\\mathit{e\\mathit{Auta(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{Auta(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{Auta(c)}{\\mathit{C(g)}\\)	\\(\\mathit{Auta(c)\\) returns the automated activity count for case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
75	\N	expected-automated-activity-count-t-g	Expected Automated Activity count	5	3	Expected number of automated activities that occur in a case belonging to a group of cases.	Event log that contains automated activities.	Automated activities take less time to be executed.	maximize	\\(\\mathit{e\\mathit{Auta(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{Auta(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum_{c \\in \\mathit{cases(g)} \\mathit{Auta(c)}{\\mathit{C(g)}\\)	$\\mathit{cases(g)$ returns the set of cases in group of cases $g$.\n\\newline $\\mathit{Auta(c)$ returns the automated activity count of case $c$.\n\\newline $\\mathit{C(g)$ returns the case count of group of cases $g$.\\\\
76	\N	expected-automated-activity-instance-count-q-g	Expected Automated activity Instance count	4	3	Expected number of times that an automated activity is instantiated in a case belonging to a group of cases.	Event log that contains automated activities.	Automated activities yield more reliable, higher-quality results.	maximize	\\(\\mathit{e\\mathit{Auti(g)\\)	\\(\\frac{\\mathit{Auti(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{Auti(g)}{\\mathit{C(g)}\\)	\\(\\mathit{Auti(g)\\) returns the total automated activity instance count for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
77	\N	expected-automated-activity-instance-count-t-g	Expected Automated activity Instance count	5	3	Expected number of times that an automated activity is instantiated in a case belonging to a group of cases.	Event log that contains automated activities.	Automated activities take less time to be executed.	maximize	\\(\\mathit{e\\mathit{Auti(g)\\)	\\(\\frac{\\mathit{Auti(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{Auti(g)}{\\mathit{C(g)}\\)	$\\mathit{Auti(g)$ returns the automated activity instance count of group of cases $g$.\n\\newline $\\mathit{C(g)$ returns the case count of group of cases $g$.\\\\
78	\N	expected-automated-activity-service-time-t-g	Expected Automated Activity Service Time	5	3	Expected sum of the service time of all instantiations of automated activities in a case belonging to a group of cases.	Event log that contains automated activities and lifecycle information for activity instances.	Minimizing service time is desirable.	minimize	\\(\\mathit{e\\mathit{AutST(g)\\)	\\(\\frac{\\mathit{AutST(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{AutST(g)}{\\mathit{C(g)}\\)	$\\mathit{AutST(g)$ returns the automated activity service time of group of cases $g$.\n\\newline $\\mathit{C(g)$ returns the case count of group of cases $g$.\\\\
79	\N	expected-client-count-f-g	Expected Client count	2	3	Ratio between the number of distinct clients associated with cases in a group of cases, and the number of cases belonging to a group of cases.	Process is executed for different clients.	It is desirable to maximize the number of clients.	maximize	\\(\\mathit{e\\mathit{Cli(g)\\)	\\(\\frac{\\mathit{Cli(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{Cli(g)}{\\mathit{C(g)}\\)	\\(\\mathit{Cli(g)\\) returns the number of distinct clients associated with group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
80	\N	expected-client-count-and-total-cost-ratio-q-g	Expected Client count and Total Cost Ratio	4	3	Ratio between the number of distinct clients associated with cases in a group of cases, and the total cost of a group of cases.	Process is executed for different clients where the event log contains cost information.	It is desirable to execute the process for as many clients at the least cost.	maximize	\\(\\mathit{e\\mathit{CliTCR\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{Cli(g)}{\\mathit{TC\\mathit{^{\\times(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{Cli(g)}{\\mathit{TC(g)}\\)	\\(\\mathit{Cli(g)\\) returns the number of distinct clients associated with group \\(g\\).\n\\newline \\(\\mathit{TC(g)\\) returns the total cost of case group \\(g\\). \\\\
81	\N	expected-desired-activity-count-c-g	Expected Desired Activity count	1	3	Expected number of instantiated activities whose occurrence is desirable in a case belonging to a group of cases.	Event log that contains optional activities whose occurrence is desirable.	Desirable activities should be maximized.	maximize	\\(\\mathit{e\\mathit{DAC(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{DAC(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{DAC(c)}{\\mathit{C(g)}\\)	\\(\\mathit{DAC(c)\\) returns the desired activity count for case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
82	\N	expected-desired-activity-count-q-g	Expected Desired Activity count	4	3	Expected number of instantiated activities whose occurrence is desirable in a case belonging to a group of cases.	Event log that contains optional activities whose occurrence is desirable.	Desirable activities should be maximized.	maximize	\\(\\mathit{e\\mathit{DAC(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{DAC(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{DAC(c)}{\\mathit{C(g)}\\)	\\(\\mathit{DAC(c)\\) returns the desired activity count for case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
83	\N	expected-direct-cost-c-g	Expected Direct Cost	1	3	Expected total cost associated with all instantiations of activities that have a direct effect on the outcome of a case belonging to a group of cases.	Event log in which activities can be categorized based on whether they directly contribute to the outcome of the process or not.	Minimizing total cost is desirable.	minimize	\\(\\mathit{e\\mathit{DC\\mathit{^{\\times(g)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{DC\\mathit{^{\\times(g)}{\\mathit{C(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{DC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{DC\\mathit{^{sum$.	\\(\\frac{\\mathit{DC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{DC(g)\\) returns the total direct cost for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
84	\N	expected-directly-follows-relations-and-activity-count-ratio-f-g	Expected Directly-Follows Relations and Activity count Ratio	2	3	Ratio between the expected number of activity pairs where one is instantiated directly after the other in a case belonging to a group of cases, and the expected number of activities that occur in a case belonging to a group of cases.	Process where several distinct directly-follows relations can occur.	A greater number of directly-follows relations is desirable, as it implies a greater capability to address unexpected situations.	maximize	\\(\\mathit{e\\mathit{DFRAR(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{DFR(c)}{\\sum _{c \\in g} \\mathit{A(c)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{DFR(c)}{\\sum _{c \\in g} \\mathit{A(c)}\\)	\\(\\mathit{DFR(c)\\) returns the number of unique Directly-Follows Relations (DFR) in case \\(c\\).\n\\newline \\(\\mathit{A(c)\\) returns the number of unique activities in case \\(c\\). \\\\
85	\N	expected-directly-follows-relations-count-f-g	Expected Directly-Follows Relations count	2	3	Expected number of activity pairs where one is instantiated directly after the other in a case belonging to a group of cases.	Process where several distinct directly-follows relations can occur.	A greater number of directly-follows relations is desirable, as it implies a greater capability to address unexpected situations.	maximize	\\(\\mathit{e\\mathit{DFR(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{DFR(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{DFR(c)}{\\mathit{C(g)}\\)	\\(\\mathit{DFR(c)\\) returns the number of unique Directly-Follows Relations (DFR) in case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
86	\N	expected-fixed-cost-c-g	Expected Fixed Cost	1	3	Expected fixed cost of a case belonging to a group of cases.	Event log in which fixed cost information is recorded.	Minimizing fixed cost is desirable.	minimize	\\(\\mathit{e\\mathit{FC\\mathit{^{\\times(g)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{FC\\mathit{^{\\times(g)}{\\mathit{C(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{FC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{FC\\mathit{^{sum$.	\\(\\frac{\\mathit{FC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{FC(g)\\) returns the total fixed cost for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
87	\N	expected-handover-count-t-g	Expected Handover count	5	3	Expected number of times that the human resource associated with an activity instance differs from the human resource associated with the preceding activity instance within a case belonging to a group of cases.	If actual time spent on a case is not of interest, Expected Handover count can be used as a workload estimation within the time dimension.	Reducing the times that work handover occurs is desirable.	minimize	\\(\\mathit{e\\mathit{H(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{H(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum_{c \\in g} \\mathit{H(c)}{\\mathit{C(g)}\\)	$g$ represents the group of cases under analysis.\n\\newline $\\mathit{H(c)$ returns the handover count of case $c$.\n\\newline $\\mathit{C(g)$ returns the case count of group of cases $g$.\\\\
88	\N	expected-human-resource-count-c-g	Expected Human Resource count	1	3	Expected number of human resources that are involved in the execution of a case belonging to a group of cases.	If the event log does not contain cost information, Expected Human Resource count can be used as a proxy for the cost performance of a group of cases.	Minimizing the number of human resources involved is desirable.	minimize	\\(\\mathit{e\\mathit{HR(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{HR(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in \\mathit{cases(g)} \\mathit{HR(c)}{\\mathit{C(g)}\\)	$\\mathit{cases(g)$ returns the set of cases in group of cases $g$.\n\\newline $\\mathit{HR(c)$ returns the human resource count of case $c$.\n\\newline $\\mathit{C(g)$ returns the case count of group of cases $g$. \\\\
89	\N	expected-human-resource-count-f-g	Expected Human Resource count	2	3	Expected number of human resources that are involved in the execution of a case belonging to a group of cases.	Human Resource count can be used as a proxy to measure the flexibility of a process.	Maximizing the number of human resources involved is desirable, as it implies a greater capability to address unexpected situations.	maximize	\\(\\mathit{e\\mathit{HR(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{HR(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in \\mathit{cases(g)} \\mathit{HR(c)}{\\mathit{C(g)}\\)	$\\mathit{cases(g)$ returns the set of cases in group of cases $g$.\n\\newline $\\mathit{HR(c)$ returns the human resource count of case $c$.\n\\newline $\\mathit{C(g)$ returns the case count of group of cases $g$. \\\\
90	\N	expected-human-resource-count-g-g	Expected Human Resource count	3	3	Expected number of human resources that are involved in the execution of a case belonging to a group of cases.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{e\\mathit{HR(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{HR(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in \\mathit{cases(g)} \\mathit{HR(c)}{\\mathit{C(g)}\\)	$\\mathit{cases(g)$ returns the set of cases in group of cases $g$.\n\\newline $\\mathit{HR(c)$ returns the human resource count of case $c$.\n\\newline $\\mathit{C(g)$ returns the case count of group of cases $g$. \\\\
91	\N	expected-human-resource-count-q-g	Expected Human Resource count	4	3	Expected number of human resources that are involved in the execution of a case belonging to a group of cases.	Human Resource count can be used as a proxy to measure the quality of the process.	Minimizing the number of human resources involved is desirable, as it reduces the possibility of errors due to, e.g., handovers of work.	minimize	\\(\\mathit{e\\mathit{HR(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{HR(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in \\mathit{cases(g)} \\mathit{HR(c)}{\\mathit{C(g)}\\)	$\\mathit{cases(g)$ returns the set of cases in group of cases $g$.\n\\newline $\\mathit{HR(c)$ returns the human resource count of case $c$.\n\\newline $\\mathit{C(g)$ returns the case count of group of cases $g$. \\\\
93	\N	expected-inventory-cost-c-g	Expected Inventory Cost	1	3	Expected inventory cost associated with all activity instances of a case belonging to a group of cases.	Event log in which inventory cost information is recorded.	Minimizing inventory cost is desirable.	minimize	\\(\\mathit{e\\mathit{IC\\mathit{^{\\times(g)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{IC\\mathit{^{\\times(g)}{\\mathit{C(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{IC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{IC\\mathit{^{sum$.	\\(\\frac{\\mathit{IC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{IC(g)\\) returns the total inventory cost for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
94	\N	expected-labor-cost-c-g	Expected Labor Cost	1	3	Expected labor cost associated with all activity instances of a case belonging to a group of cases.	Event log in which labor cost information is recorded.	Minimizing labor cost is desirable.	minimize	\\(\\mathit{e\\mathit{LC\\mathit{^{\\times(g)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{LC\\mathit{^{\\times(g)}{\\mathit{C(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sum$.	\\(\\frac{\\mathit{LC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{LC(g)\\) returns the total labor cost for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
95	\N	expected-labor-cost-and-total-cost-ratio-c-g	Expected Labor Cost and Total Cost Ratio	1	3	Expected ratio between the labor cost associated with all activity instances of a group of cases, and the total cost associated with all activity instances of a group of cases.	Event log in which both labor and total cost information are recorded.	Minimizing the cost associated with human resources is desirable.	minimize	\\(\\mathit{e\\mathit{LCTCR\\mathit{^{\\times(g)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{LC\\mathit{^{\\times(g)}{\\mathit{TC\\mathit{^{\\times(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sgl$ and $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sum$ and $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{LC(g)}{\\mathit{TC(g)}\\)	\\(\\mathit{LC(g)\\) returns the total labor cost of case group \\(g\\).\n\\newline \\(\\mathit{TC(g)\\) returns the total cost of case group \\(g\\). \\\\
96	\N	expected-lead-time-t-g	Expected Lead Time	5	3	Expected total elapsed time between the earliest and latest timestamps in a case belonging to a group of cases. Also known as cycle time.	Event log is associated with a process in which the total elapsed time of a case is of relevance.	Minimizing lead time is desirable.	minimize	\\(\\mathit{e\\mathit{LT(g)\\)	\\(\\frac{\\sum _{c\\in g}\\mathit{LT(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum_{c \\in g} \\mathit{LT(c)}{\\mathit{C(g)}\\)	$\\mathit{LT(c)$ returns the lead time of case $c$.\n\\newline $\\mathit{C(g)$ returns the total number of cases in group $g$.\n\\newline The numerator $\\sum_{c \\in g} \\mathit{LT(c)$ sums the lead times of all cases in $g$.\\\\
97	\N	expected-lead-time-deviation-from-expectation-t-g	Expected Lead Time Deviation from Expectation	5	3	Absolute value of the difference between the time that a case in a group of cases is expected to take and its lead time.	Event log is associated with a process in which the lead time of a case should be as close as possible to a specific value.	A lead time that is closer to the expected value is desirable.	minimize	\\(\\mathit{e\\mathit{LTDE(g, \\mathit{val)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{LTDE(c, \\mathit{val)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{LTDE(c, \\mathit{val)}{\\mathit{C(g)}\\)	$\\mathit{LTDE(c, \\mathit{val)$ returns the lead time deviation from expectation of case $c$.\n\\newline $\\mathit{C(g)$ returns the number of cases in group $g$.\\\\
98	\N	expected-lead-time-deviation-from-time-limit-t-g	Expected Lead Time Deviation from time Limit	5	3	Difference between the time that a case in a group of cases is expected to take and its lead time.	Event log is associated with a process in which the lead time of a case should not exceed a specific value.	Exceeding the lead time limit value is undesired.	maximize	\\(\\mathit{e\\mathit{LTDL(g, \\mathit{val)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{LTDL(c, \\mathit{val)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{LTDL(c, \\mathit{val)}{\\mathit{C(g)}\\)	$\\mathit{LTDL(c, \\mathit{val)$ returns the lead time deviation from time Limit for case $c$.\n\\newline $\\mathit{val$ represents the predefined time Limit.\n\\newline $\\mathit{C(g)$ returns the number of cases in group $g$.\\\\
99	\N	expected-lead-time-from-activity-a-t-g	Expected Lead Time from activity A	5	3	Expected total elapsed time between the earliest instantiation of a specific activity and the latest activity event of a case belonging to a group of cases.	Event log is associated with a process in which the total elapsed time of a specific subprocess is of relevance.	Minimizing lead time is desirable.	minimize	\\(\\mathit{e\\mathit{LTfA(g, \\mathit{a)\\)	\\(\\frac{\\sum _{c \\in g} \\begin{cases}\n\\mathit{LTfA(c, \\mathit{a) & \\mathit{if \\  \\mathit{fi\\mathit{^{s(c, \\mathit{a) \\neq \\emptyset \\\\ 0 & \\mathit{if \\  \\mathit{fi\\mathit{^{s(c, \\mathit{a) = \\emptyset\n\\end{cases}}{|\\{c \\in g \\mid \\mathit{fi\\mathit{^{s(c, \\mathit{a) \\neq \\emptyset\\}|}\\)	\\(\\frac{\\sum _{c \\in g} \\begin{cases}\n\\mathit{LTfA(c, \\mathit{a) & \\mathit{if \\  \\mathit{fi\\mathit{^{s(c, \\mathit{a) \\neq \\emptyset \\\\\n0 & \\mathit{if \\  \\mathit{fi\\mathit{^{s(c, \\mathit{a) = \\emptyset\n\\end{cases}}{\n\\sum_{c \\in \\mathit{cases(g)} \n\\begin{cases}\n1 & \\text{if } \\mathit{fi\\mathit{^{s(c, \\mathit{a) \\neq \\emptyset \\\\\n0 & \\text{otherwise}\n\\end{cases}\n}\\)	$\\mathit{fi\\mathit{^{s(c, \\mathit{a)$ returns the set of first started instances of activity $\\mathit{a$ in case $c$.\n\\newline $\\mathit{LTfA(c, \\mathit{a)$ returns the lead time from the first started instance of activity $\\mathit{a$ in case $c$ to the end of case $c$.\n\\\\
162	\N	human-resource-count-group-of-cases-granularity-q-g	Human Resource count (group of cases granularity)	4	3	Number of human resources that are involved in the execution of cases in a group of cases.	Human Resource count can be used as a proxy to measure the quality of the process.	Minimizing the number of human resources involved is desirable, as it reduces the possibility of errors due to, e.g., handovers of work.	minimize	\\(\\mathit{HR(g)\\)	\\(|\\cup_{c \\in g} \\mathit{hres(c)|\\)	\\(\\mathit{count(\\mathit{hres(g))\\)	$\\mathit{hres(g)$ returns the set of human resources that work in group of cases $g$. \\\\
100	\N	expected-lead-time-from-activity-a-to-activity-b-t-g	Expected Lead Time from activity A to activity B	5	3	Expected total elapsed time between the earliest instantiation of a specific activity and the earliest instantiation of another specific activity that occurs after the former one in a case belonging to a group of cases.	Event log is associated with a process in which the total elapsed time of a specific subprocess is of relevance.	Minimizing lead time is desirable.	minimize	\\(\\mathit{e\\mathit{LTAB(g, \\mathit{a, \\mathit{b)\\)	\\(\\frac{\\sum _{c \\in g} \\begin{cases}\n\\mathit{LTAB(c, \\mathit{a, \\mathit{b) & \\mathit{if \\  \\mathit{fi\\mathit{^{sc(c, \\mathit{a, \\mathit{b) \\neq \\emptyset \\\\ 0 & \\mathit{if \\  \\mathit{fi\\mathit{^{sc(c, \\mathit{a, \\mathit{b) = \\emptyset\n\\end{cases}}{|\\{c \\in g \\mid \\mathit{fi\\mathit{^{sc(c, \\mathit{a, \\mathit{b) \\neq \\emptyset)\\}|}\\)	\\[\n\\frac{\n\\sum_{c \\in \\mathit{cases(g)} \n\\begin{cases}\n\\mathit{LTAB(c, a, b) & \\text{if } \\mathit{fi(c, \\mathit{a, \\mathit{b) \\neq \\emptyset \\\\\n0 & \\text{otherwise}\n\\end{cases}\n}{\n\\sum_{c \\in \\mathit{cases(g)} \n\\begin{cases}\n1 & \\text{if } \\mathit{fi(c, \\mathit{a, \\mathit{b)  \\neq \\emptyset \\\\\n0 & \\text{otherwise}\n\\end{cases}\n}\n\\]\n\n\\(\\mathit{cases(g)\\): Set of all cases belonging to group \\(g\\).	\\(\\mathit{LTAB(c, a, b)\\): Lead time between activity \\(a\\) and activity \\(b\\) within case \\(c\\).\n\\newline\n\\(\\mathit{fi(c, \\mathit{a, \\mathit{b)\\): Function that returns the flow instance between \\(a\\) and \\(b\\) in case \\(c\\). If empty, the pair \\((a, b)\\) does not occur in \\(c\\). \\\\
101	\N	expected-lead-time-to-activity-a-t-g	Expected Lead Time to activity A	5	3	Expected total elapsed time between the earliest event and the earliest instantiation of a specific activity in a case belonging to a group of cases.	Event log is associated with a process in which the total elapsed time of a specific is of relevance.	Minimizing lead time is desirable.	minimize	\\(\\mathit{e\\mathit{LTtA(g, \\mathit{a)\\)	\\(\\frac{\\sum _{c \\in g} \\begin{cases}\n\\mathit{LTtA(c, \\mathit{a) & \\mathit{if \\  \\mathit{fi\\mathit{^{c(c, \\mathit{a) \\neq \\emptyset \\\\ 0 & \\mathit{if \\  \\mathit{fi\\mathit{^{c(c, \\mathit{a) = \\emptyset\n\\end{cases}}{|\\{c \\in g \\mid \\mathit{if \\  \\mathit{fi\\mathit{^{c(c, \\mathit{a) \\neq \\emptyset\\}|}\\)	\\(\\displaystyle \\frac{\\sum_{c \\in g} \n\\begin{cases} \n\\mathit{LTtA(c, \\mathit{a) & \\mathit{if \\  \\mathit{fi\\mathit{^{c(c, \\mathit{a) \\neq \\emptyset \\\\ \n0 & \\mathit{if \\  \\mathit{fi\\mathit{^{c(c, \\mathit{a) = \\emptyset \n\\end{cases}}\n{\n\\sum_{c \\in \\mathit{cases(g)} \n\\begin{cases}\n1 & \\text{if } \\mathit{fi\\mathit{^{c(c, \\mathit{a) \\neq \\emptyset \\\\\n0 & \\text{otherwise}\n\\end{cases}\n}\\)	\\(\\mathit{LTtA(c, \\mathit{a)\\) returns the lead time from the start of case \\(c\\) to the first completed instance of activity \\(\\mathit{a\\) in case \\(c\\).\n\\newline \\(\\mathit{fi\\mathit{^{c(c, \\mathit{a)\\) returns the set of first completed instances of activity \\(\\mathit{a\\) in case \\(c\\).\n\\newline \\(\\left| \\{ c \\in g \\mid \\mathit{fi\\mathit{^{c(c, \\mathit{a) \\neq \\emptyset \\} \\right|\\) returns the number of cases in group \\(g\\) where activity \\(\\mathit{a\\) occurs at least once (i.e., cases with a non-empty \\(\\mathit{fi\\mathit{^{c(c, \\mathit{a)\\)).\\\\
102	\N	expected-maintenance-cost-c-g	Expected Maintenance Cost	1	3	Expected maintenance cost associated with a case belonging to a group of cases.	Process where the cost of conducting maintenance is relevant.	Minimizing maintenance cost is desirable.	minimize	\\(\\mathit{e\\mathit{MainC(g)\\)	\\(\\frac{\\mathit{MainC(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{MainC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{MainC(g)\\) returns the total maintenance cost for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
103	\N	expected-missed-deadline-cost-c-g	Expected Missed Deadline Cost	1	3	Expected cost for missing deadlines associated with a case belonging to a group of cases.	Process where missing a deadline incurs in additional costs.	Minimizing missed deadline cost is desirable.	minimize	\\(\\mathit{e\\mathit{MDC(g)\\)	\\(\\frac{\\mathit{MDC(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{MDC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{MDC(g)\\) returns the total missed deadline cost for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
104	\N	expected-non-automated-activity-count-group-of-cases-granularity-q-g	Expected Non-Automated Activity count (group of cases granularity)	4	3	Expected number of non-automated activities that occur in a case belonging to a group of cases.	Event log that contains automated activities.	Non-automated activities are prone to errors, which reduces the quality of the process.	minimize	\\(\\mathit{NAutA(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{NAutA(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{NAutA(c)}{\\mathit{C(g)}\\)	\\(\\mathit{NAutA(c)\\) returns the non-automated activity count for case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
105	\N	expected-non-automated-activity-instance-count-q-g	Expected Non-Automated activity Instance count	4	3	Expected number of times that a non-automated activity is instantiated in a case belonging to a group of cases.	Event log that contains automated activities.	Non-automated activities are prone to errors, which reduces the quality of the process.	minimize	\\(\\mathit{e\\mathit{NAutI(g)\\)	\\(\\frac{\\mathit{NAutI(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{NAutI(g)}{\\mathit{C(g)}\\)	\\(\\mathit{NAutI(g)\\) returns the total non-automated activity instance count for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
106	\N	expected-optional-activity-count-f-g	Expected Optional Activity count	2	3	Expected number of optional activities that are instantiated in a case belonging to a group of cases. \\newline An activity is considered optional if there is at least one case in the event log where it does not occur.	Process with multiple activities that are not instantiated in every case.	A greater number of optional activities is desired, as it implies a greater capability to address unexpected situations.	maximize	\\(\\mathit{e\\mathit{OptA(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{OptA(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{OptA(c)}{\\mathit{C(g)}\\)	\\(\\mathit{OptA(c)\\) returns the optional activity count for case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
107	\N	expected-optionality-f-g	Expected Optionality	2	3	Ratio between the expected number of optional activities that are instantiated in a case belonging to a group of cases, and the expected number of activities that occur in a case belonging to a group of cases. \\newline An activity is considered optional if there is at least one case in the event log where it does not occur.	Process with multiple activities that are not instantiated in every case.	A greater number of optional activities is desired, as it implies a greater capability to address unexpected situations.	maximize	\\(\\mathit{e\\mathit{Opt(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{OptA(c)}{\\sum _{c \\in g} \\mathit{A(c)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{OptA(c)}{\\sum _{c \\in g} \\mathit{A(c)}\\)	\\(\\mathit{OptA(c)\\) returns the optional activity count for case \\(c\\).\n\\newline \\(\\mathit{A(c)\\) returns the number of unique activities in case \\(c\\). \\\\
108	\N	expected-outcome-unit-count-q-g	Expected outcome Unit count	4	3	Expected outcome units associated with all activity instances in a case belonging to a group of cases.	Process where the outcome of activity instances can be measured.	Maximizing outcome unit count is desirable.	maximize	\\(\\mathit{e\\mathit{U\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{U\\mathit{^{\\times(g)}{\\mathit{C(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{U\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{U\\mathit{^{sum$.	\\(\\frac{\\mathit{U(g)}{\\mathit{C(g)}\\)	\\(\\mathit{U(g)\\) returns the total outcome unit count for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
109	\N	expected-overall-quality-q-g	Expected Overall Quality	4	3	Expected overall quality associated with the outcome of a case belonging to a group of cases.	Event log contains information that allows measuring overall quality, such as customer satisfaction or a quantifier of the outcome of the process.	Maximizing the quality of the process is desirable.	maximize	\\(\\mathit{e\\mathit{OQ(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{OQ(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{OQ(c)}{\\mathit{C(g)}\\)	\\(\\mathit{OQ(c)\\) returns the overall quality associated with case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
110	\N	expected-overhead-cost-c-g	Expected Overhead Cost	1	3	Expected total cost associated with all instantiations of activities that do not have a direct effect on the outcome of a case belonging to a group of cases.	Event log in which activities can be categorized based on whether they directly contribute to the outcome of the process or not.	Minimizing total cost is desirable.	minimize	\\(\\mathit{e\\mathit{OC\\mathit{^{\\times(g)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{OC\\mathit{^{\\times(g)}{\\mathit{C(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{OC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{OC\\mathit{^{sum$.	\\(\\frac{\\mathit{OC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{OC(g)\\) returns the total overhead cost for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
111	\N	expected-repeatability-q-g	Expected Repeatability	4	3	One minus the expected ratio between the number of activities that occur in a case belonging to a group of cases, and the number of times that an activity is instantiated in a case belonging to a group of cases.	Process where activity repetition is common.	It is desirable not to repeat activities.	minimize	\\(\\mathit{e\\mathit{Rep(g)\\)	\\(1 - \\frac{\\sum _{c \\in g} \\mathit{A(c)}{\\mathit{I(g)}\\)	\\(1 - \\frac{\\sum _{c \\in g} \\mathit{A(c)}{\\mathit{I(g)}\\)	\\(\\mathit{A(c)\\) returns the number of unique activities in case \\(c\\).\n\\newline \\(\\mathit{I(g)\\) returns the total number of activity instances in group \\(g\\). \\\\
112	\N	expected-resource-count-c-g	Expected Resource count	1	3	Expected number of resources that are involved in the execution of a case belonging to a group of cases.	If the event log does not contain cost information, Expected Resource count can be used as a proxy for the cost performance of a group of cases.	Minimizing the number of resources involved is desirable.	minimize	\\(\\mathit{e\\mathit{R(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{R(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{R(c)}{\\mathit{C(g)}\\)	\\(\\mathit{R(c)\\) returns the resource count for case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
113	\N	expected-resource-count-g-g	Expected Resource count	3	3	Expected number of resources that are involved in the execution of a case belonging to a group of cases.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{e\\mathit{R(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{R(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in \\mathit{cases(g)} \\mathit{R(c)}{\\mathit{C(g)}\\)	$\\mathit{cases(g)$ returns the set of cases in group of cases $g$.\n\\newline $\\mathit{R(c)$ returns the resource count of case $c$.\n\\newline $\\mathit{C(g)$ returns the case count of group of cases $g$. \\\\
114	\N	expected-rework-cost-c-g	Expected Rework Cost	1	3	Expected total cost of all times that any activity is instantiated again, after its first instantiation, in a case belonging to a group of cases.	Event log that contains cost information where measuring rework is of relevance.	Minimizing the cost of rework is desirable.	minimize	\\(\\mathit{e\\mathit{RC\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{RC\\mathit{^{\\times(g)}{\\mathit{C(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{RC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{RC\\mathit{^{sum$.	\\(\\frac{\\mathit{RC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{RC(g)\\) returns the total rework cost for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
115	\N	expected-rework-count-c-g	Expected Rework Count	1	3	Expected number of times that any activity is instantiated again, after its first instantiation, in a case belonging to a group of cases.	If the event log does not contain cost information, Expected Rework Count can be used as a proxy for the cost performance of a group of cases.	Minimizing rework is desirable.	minimize	\\(\\mathit{e\\mathit{RewC(g)\\)	\\(\\frac{\\mathit{RewC(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{RewC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{RewC(g)\\) returns the total rework count for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
116	\N	expected-rework-count-q-g	Expected Rework Count	4	3	Expected number of times that any activity is instantiated again, after its first instantiation, in a case belonging to a group of cases.	Process where rework recurrently occurs.	Minimizing rework is desirable.	minimize	\\(\\mathit{e\\mathit{RewC(g)\\)	\\(\\frac{\\mathit{RewC(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{RewC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{RewC(g)\\) returns the total rework count for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
117	\N	expected-rework-count-by-value-q-g	Expected Rework Count by Value	4	3	Expected number of times that any activity is instantiated again, after it is instantiated a certain number of times, in a case belonging to a group of cases.	Process where rework recurrently occurs.	Minimizing rework is desirable.	minimize	\\(\\mathit{e\\mathit{RewCV(g, \\mathit{val)\\)	\\(\\frac{\\mathit{RewCV(g, \\mathit{val)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{RewCV(g, \\mathit{val)}{\\mathit{C(g)}\\)	\\(\\mathit{RewCV(g, \\mathit{val)\\) returns the total rework count by value \\(\\mathit{val\\) for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
118	\N	expected-rework-of-activities-subset-q-g	Expected Rework of activities Subset	4	3	Expected number of times that any activity belonging to a subset of activities is instantiated again, after its first instantiation, in a case belonging to a group of cases.	Process where rework occurs recurrently, but only the rework of some activities is of interest.	Minimizing rework is desirable.	minimize	\\(\\mathit{e\\mathit{RewSub(g, \\mathit{sub)\\)	\\(\\frac{\\mathit{RewSub(g, \\mathit{sub)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{RewSub(g, \\mathit{sub)}{\\mathit{C(g)}\\)	\\(\\mathit{RewSub(g, \\mathit{sub)\\) returns the total rework count for subset \\(\\mathit{sub\\) in group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
119	\N	expected-rework-percentage-c-g	Expected Rework Percentage	1	3	Expected percentage of times that any activity is instantiated again, after its first instantiation, in a case belonging to a group of cases.	If the event log does not contain cost information, Expected Rework Percentage can be used as a proxy for the cost performance of a group of cases.	Minimizing rework is desirable.	minimize	\\(\\mathit{e\\mathit{RewP(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{RewP(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{RewP(c)}{\\mathit{C(g)}\\)	\\(\\mathit{RewP(c)\\) returns the rework percentage for case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
120	\N	expected-rework-percentage-q-g	Expected Rework Percentage	4	3	Expected percentage of times that any activity is instantiated again, after its first instantiation, in a case belonging to a group of cases.	Process where rework occurs recurrently.	Minimizing rework is desirable.	minimize	\\(\\mathit{e\\mathit{RewP(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{RewP(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{RewP(c)}{\\mathit{C(g)}\\)	\\(\\mathit{RewP(c)\\) returns the rework percentage for case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
121	\N	expected-rework-percentage-by-value-q-g	Expected Rework Percentage by Value	4	3	Expected percentage of times that any activity is instantiated again, after it is instantiated a certain number of times, in a case belonging to a group of cases.	Process where rework occurs recurrently.	Minimizing rework is desirable.	minimize	\\(\\mathit{e\\mathit{RewPV(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{RewPV(c, \\mathit{val)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{RewPV(c, \\mathit{val)}{\\mathit{C(g)}\\)	\\(\\mathit{RewPV(c, \\mathit{val)\\) returns the rework percentage by value \\(\\mathit{val\\) for case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
122	\N	expected-rework-time-q-g	Expected Rework Time	4	3	Expected sum of the elapsed time for all times that any activity is instantiated again, after its first instantiation, in a case belonging to a group of cases.	Process where measuring the time spent on rework activities is of relevance.	Minimizing the time spent on reworking is desirable.	minimize	\\(\\mathit{e\\mathit{RT(g)\\)	\\(\\frac{\\mathit{RT(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{RT(g)}{\\mathit{C(g)}\\)	\\(\\mathit{RT(g)\\) returns the total rework time for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
123	\N	expected-role-count-f-g	Expected Role count	2	3	Expected number of human resource roles that are involved in the execution of a case belonging to a group of cases.	Process where several roles are involved.	A greater number of roles involved in the execution of the process implies greater flexibility.	maximize	\\(\\mathit{e\\mathit{Role(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{Role(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{Role(c)}{\\mathit{C(g)}\\)	\\(\\mathit{Role(c)\\) returns the role count for case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
124	\N	expected-role-count-g-g	Expected Role count	3	3	Expected number of human resource roles that are involved in the execution of a case belonging to a group of cases.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{e\\mathit{Role(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{Role(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum_{c \\in \\mathit{cases(g)} \\mathit{Role(c)}{\\mathit{C(g)}\\)	$\\mathit{cases(g)$ returns the set of cases in group of cases $g$.\n\\newline $\\mathit{Role(c)$ returns the role count of case $c$.\n\\newline$\\mathit{C(g)$ returns the case count of group of cases $g$. \\\\
125	\N	expected-service-and-lead-time-ratio-t-g	Expected Service and Lead Time Ratio	5	3	Expected ratio between the service time and the lead time of a case belonging to a group of cases.	Event log in which the difference between service time and lead time is of relevance.	Ratio between service time and lead time should be as large as possible.	maximize	\\(\\mathit{e\\mathit{SLTR(g)\\)	\\(\\frac{\\mathit{ST(g)}{\\sum _{c \\in g} \\mathit{LT(c)}\\)	\\(\\frac{\\mathit{ST(g)}{\\sum _{c \\in g} \\mathit{LT(c)}\\)	\\(\\mathit{ST(g)\\) returns the total service time accumulated across all cases in group \\(g\\).\n\\newline \\(\\mathit{LT(c)\\) returns the total lead time of case \\(c\\). \\\\
126	\N	expected-service-time-t-g	Expected Service Time	5	3	Expected sum of elapsed time between the start and complete events of all activity instances of a case belonging to a group of cases.	Event log that contains lifecycle information for activity instances where the actual time spent executing them is of interest.	Minimizing service time is desirable.	minimize	\\(\\mathit{e\\mathit{ST(g)\\)	\\(\\frac{\\mathit{ST(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{ST(g)}{\\mathit{C(g)}\\)	\\(\\mathit{ST(g)\\) returns the total service time accumulated across all cases in group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
140	\N	expected-variable-cost-c-g	Expected Variable Cost	1	3	Expected variable cost of a case belonging to a group of cases.	Event log in which variable cost information is recorded.	Minimizing variable cost is desirable.	minimize	\\(\\mathit{e\\mathit{VC\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{VC\\mathit{^{\\times(g)}{\\mathit{C(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{VC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{VC\\mathit{^{sum$.	\\(\\frac{\\mathit{VC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{VC(g)\\) returns the total variable cost for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
127	\N	expected-service-time-from-activity-a-to-activity-b-t-g	Expected Service Time from activity A to activity B	5	3	Expected sum of elapsed time between the start and complete events of all activity instances of a case belonging to a group of cases, which occur between the earliest instantiation of a specific activity, and the earliest instantiation of another specific activity that occurs after the former one, including both.	Event log is associated with a process in which the actual time spent executing a specific subprocess is of relevance.	Minimizing service time is desirable.	minimize	\\(\\mathit{e\\mathit{STAB\\mathit{^{\\times(g, \\mathit{a, \\mathit{b)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{s, \\mathit{c, \\mathit{sc, \\mathit{w\\}\\)	\\(\\frac{\\mathit{STAB\\mathit{^{\\times(g, \\mathit{a, \\mathit{b)}{|\\{c \\in g \\mid \\mathit{fi\\mathit{^{sc(c, \\mathit{a, \\mathit{b) \\neq \\emptyset\\}|}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{s, \\mathit{c, \\mathit{sc, \\mathit{w\\}$. If $\\mathit{\\times = \\mathit{s$, then the function considers activity instances that were started within the start and end activity instances, i.e., it uses $\\mathit{STAB\\mathit{^{s$; if $\\mathit{\\times = \\mathit{c$, then the function considers activity instances that were completed within the start and end activity instances, i.e., it uses $\\mathit{STAB\\mathit{^{c$; if $\\mathit{\\times = \\mathit{sc$, then the function considers activity instances that were either started or completed within the start and end activity instances, i.e., it uses $\\mathit{STAB\\mathit{^{sc$; if $\\mathit{\\times = \\mathit{^{w$, then the function considers all activity instances that were active within the start and end activity instances, i.e., it uses $\\mathit{STAB\\mathit{^{w$.	\\(\\frac{\\mathit{STAB(g, \\mathit{a, \\mathit{b)}{|\\{c \\in g \\mid \\mathit{fi(c, \\mathit{a, \\mathit{b) \\neq \\emptyset\\}|}\\)	\\(\\mathit{STAB\\) returns the total service time from activity \\(\\mathit{a\\) to activity \\(\\mathit{b\\) accumulated across all cases in group \\(g\\).\n\\newline \\(\\mathit{fi\\) returns the set of first instances of activity \\(\\mathit{b\\) that occur after the first instance of \\(\\mathit{a\\) in case \\(c\\). \\\\
128	\N	expected-successful-outcome-unit-count-q-g	Expected Successful outcome Unit Count	4	3	Expected outcome units associated with all activity instances in a case belonging to a group of cases, after deducting those that were unsuccessfully completed.	Process where the outcome of activity instances, as well as whether they are successful or not, can be measured.	Maximizing the number of successful outcome units is desirable.	maximize	\\(\\mathit{e\\mathit{SUC\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{SUC\\mathit{^{\\times(g)}{\\mathit{C(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUC\\mathit{^{sum$.	\\(\\frac{\\mathit{SUC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{SUC(g)\\) returns the total successful outcome unit count for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
129	\N	expected-successful-outcome-unit-percentage-q-g	Expected Successful outcome Unit Percentage	4	3	Expected percentage of outcome units associated with all activity instances of a case belonging to a group of cases that are successfully completed.	Process where the outcome of activity instances, as well as whether they are successful or not, can be measured.	Maximizing the percentage of successful outcome units is desirable.	maximize	\\(\\mathit{e\\mathit{SUP\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{SUP\\mathit{^{\\times(c)}{\\mathit{C(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUP\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUP\\mathit{^{sum$.	\\(\\frac{\\sum _{c \\in g} \\mathit{SUP(c)}{\\mathit{C(g)}\\)	\\(\\mathit{SUP(c)\\) returns the successful outcome unit percentage of case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
130	\N	expected-total-cost-c-g	Expected Total Cost	1	3	Expected total cost associated with all activity instances of a case belonging to a group of cases.	Event log in which total cost information is recorded.	Minimizing total cost is desirable.	minimize	\\(\\mathit{e\\mathit{TC\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(g)}{\\mathit{C(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{TC(g)\\) returns the total cost for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
131	\N	expected-total-cost-and-client-count-ratio-q-g	Expected Total Cost and Client count Ratio	4	3	Ratio between the total cost associated with all activity instances of a group of cases, and the number of distinct clients associated with cases in a group of cases.	Process is executed for different clients, where the event log contains cost information.	It is desirable to execute the process for as many clients at the least cost.	minimize	\\(\\mathit{e\\mathit{TCCliR\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(g)}{\\mathit{Cli(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(g)}{\\mathit{Cli(g)}\\)	\\(\\mathit{TC(g)\\) returns the total cost of case group \\(g\\).\n\\newline \\(\\mathit{Cli(g)\\) returns the number of distinct clients associated with group \\(g\\). \\\\
141	\N	expected-waiting-time-t-g	Expected Waiting Time	5	3	Expected sum of elapsed time between the start event of an activity instance and the complete event of the activity instance that precedes it, for all activity instances in a case belonging to a group of cases.	Event log in which the time spent between every activity instance is of relevance.	Minimizing waiting time is desirable.	minimize	\\(\\mathit{e\\mathit{WT(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{WT(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{WT(c)}{\\mathit{C(g)}\\)	\\(\\mathit{WT(c)\\) returns the total waiting time of case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
223	\N	rework-count-case-granularity-q-c	Rework Count (case granularity)	4	2	Number of times that any activity is instantiated again, after its first instantiation, in a case.	Process where rework recurrently occurs.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewC(c)\\)	\\(\\sum _{a \\in A} \\mathit{max(0, \\mathit{count(c, a) - 1)\\)	\\(\\sum _{a \\in A} \\mathit{max(0, \\mathit{count(c, a) - 1)\\)	\\(\\mathit{count(c, a)\\) returns the number of instances of activity \\(a\\) in case \\(c\\). \\\\
132	\N	expected-total-cost-and-lead-time-ratio-c-g	Expected Total Cost and Lead Time Ratio	1	3	Ratio between the expected total cost of a case belonging to a group of cases and the expected lead time of a case belonging to a group of cases.	Event log in which the total cost in relation to the total time taken for conducting cases is of relevance.	Ratio between total cost and lead time should be as close to 0 as possible.	minimize	\\(\\mathit{e\\mathit{TCLTR\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(g)}{\\sum _{c \\in g} \\mathit{LT(c)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(g)}{\\sum _{c \\in g} \\mathit{LT(c)}\\)	\\(\\mathit{TC(g)\\) returns the total cost of case group \\(g\\).\n\\newline \\(\\mathit{LT(c)\\) returns the total lead time of case \\(c\\). \\\\
133	\N	expected-total-cost-and-outcome-unit-ratio-c-g	Expected Total Cost and outcome Unit Ratio	1	3	Ratio between the expected total cost of a case belonging to a group of cases, and the expected outcome units associated with all activity instances of a case belonging to a group of cases.	Event log in which the total cost in relation to the outcome units of cases is of relevance.	Ratio between total cost and outcome unit count should be as close to 0 as possible.	minimize	\\(\\mathit{e\\mathit{TCUR\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(g)}{\\mathit{U\\mathit{^{\\times(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost and outcome unit calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$ and $\\mathit{U\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost and outcome unit calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$ and $\\mathit{U\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(g)}{\\mathit{U(g)}\\)	\\(\\mathit{TC(g)\\) returns the total cost of case group \\(g\\).\n\\newline \\(\\mathit{U(g)\\) returns the total outcome unit count of case group \\(g\\). \\\\
134	\N	expected-total-cost-and-service-time-ratio-c-g	Expected Total Cost and Service Time Ratio	1	3	Ratio between the expected total cost of a case belonging to a group of cases, and the expected service time of a case belonging to a group of cases.	Event log in which the total cost in relation to the time taken for conducting activity instances is of relevance.	Ratio between total cost and service time should be as close to 0 as possible.	minimize	\\(\\mathit{e\\mathit{TCSTR\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(g)}{\\mathit{ST(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(g)}{\\mathit{ST(g)}\\)	\\(\\mathit{TC(g)\\) returns the total cost of case group \\(g\\).\n\\newline \\(\\mathit{ST(g)\\) returns the total service time of case group \\(g\\). \\\\
135	\N	expected-transportation-cost-c-g	Expected Transportation Cost	1	3	Expected transportation cost of a case belonging to a group of cases.	Process where the cost of transportation is relevant.	Minimizing transportation cost is desirable.	minimize	\\(\\mathit{e\\mathit{TransC(g)\\)	\\(\\frac{\\mathit{TransC(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{TransC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{TransC(g)\\) returns the total transportation cost for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
136	\N	expected-unwanted-activity-count-q-g	Expected Unwanted Activity count	4	3	Expected number of unwanted activities that occur in a case belonging to a group of cases.	Event log that contains activities whose execution is unwanted.	Unwanted activities negatively affect the quality of the process.	minimize	\\(\\mathit{UAC(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{UAC(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{UAC(c)}{\\mathit{C(g)}\\)	\\(\\mathit{UAC(c)\\) returns the unwanted activity count for case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
137	\N	expected-unwanted-activity-instance-count-q-g	Expected Unwanted activity Instance count	4	3	Expected number of times that an unwanted activity is instantiated in a case belonging to a group of cases.	Event log that contains activities whose execution is unwanted.	Unwanted activities negatively affect the quality of the process.	minimize	\\(\\mathit{e\\mathit{UIC(g)\\)	\\(\\frac{\\mathit{UIC(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{UIC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{UIC(g)\\) returns the total unwanted activity instance count for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
138	\N	expected-unwanted-activity-instance-percentage-q-g	Expected Unwanted activity Instance Percentage	4	3	Expected percentage of times that an unwanted activity is instantiated in a case belonging to a group of cases.	Event log that contains activities whose execution is unwanted.	Unwanted activities negatively affect the quality of the process.	minimize	\\(\\mathit{e\\mathit{UIP(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{UIP(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{UIP(c)}{\\mathit{C(g)}\\)	\\(\\mathit{UIP(c)\\) returns the unwanted activity instance percentage for case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
139	\N	expected-unwanted-activity-percentage-q-g	Expected Unwanted Activity Percentage	4	3	Expected percentage of unwanted activities that occur in a case belonging to a group of cases.	Event log that contains activities whose execution is unwanted.	Unwanted activities negatively affect the quality of the process.	minimize	\\(\\mathit{e\\mathit{UAP(g)\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{UAP(c)}{\\mathit{C(g)}\\)	\\(\\frac{\\sum _{c \\in g} \\mathit{UAP(c)}{\\mathit{C(g)}\\)	\\(\\mathit{UAP(c)\\) returns the unwanted activity percentage for case \\(c\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
160	\N	human-resource-count-activity-granularity-q-a	Human Resource count (activity granularity)	4	1	Number of human resources that are involved in the execution of an activity in the event log.	Human Resource count can be used as a proxy to measure the quality of the process.	Minimizing the number of human resources involved is desirable, as it reduces the possibility of errors due to, e.g., handovers of work.	minimize	\\(\\mathit{HR(a)\\)	\\(|\\mathit{hres(a)|\\)	\\(\\mathit{count(\\mathit{hres(a))\\)	$\\mathit{hres(a)$ returns the set of human resources that perform activity $a$ in the event log. \\\\
142	\N	expected-waiting-time-from-activity-a-to-activity-b-t-g	Expected Waiting Time from activity A to activity B	5	3	Expected sum of elapsed time between the start event of an activity instance and the complete event of the activity instance that precedes it, for all activity instances in a case that occurs between the earliest instantiation of a specific activity and the earliest instantiation of another specific activity that occurs after the former one, including both, for all cases belonging to a group of cases.	Event log in which the time spent between every activity instance of a specific subprocess is of relevance.	Minimizing waiting time is desirable.	minimize	\\(\\mathit{e\\mathit{WTAB\\mathit{^{\\times(g, \\mathit{a, \\mathit{b)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{s, \\mathit{c, \\mathit{sc, \\mathit{w\\}\\)	\\(\\frac{\\sum _{c \\in g} \\begin{cases}\n\\mathit{WTAB\\mathit{^{\\times(c, \\mathit{a, \\mathit{b) & \\mathit{if \\  \\mathit{fi\\mathit{^{sc(c, \\mathit{a, \\mathit{b) \\neq \\emptyset \\\\ 0 & \\mathit{if \\  \\mathit{fi\\mathit{^{sc(c, \\mathit{a, \\mathit{b) = \\emptyset\n\\end{cases}}{|\\{c \\in g \\mid \\mathit{fi\\mathit{^{sc(c, \\mathit{a, \\mathit{b) \\neq \\emptyset\\}|}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{s, \\mathit{c, \\mathit{sc, \\mathit{w\\}$. If $\\mathit{\\times = \\mathit{s$, then the function considers activity instances that were started within the start and end activity instances, i.e., it uses $\\mathit{WTAB\\mathit{^{s$; if $\\mathit{\\times = \\mathit{c$, then the function considers activity instances that were completed within the start and end activity instances, i.e., it uses $\\mathit{WTAB\\mathit{^{c$; if $\\mathit{\\times = \\mathit{sc$, then the function considers activity instances that were either started or completed within the start and end activity instances, i.e., it uses $\\mathit{WTAB\\mathit{^{sc$; if $\\mathit{\\times = \\mathit{^{w$, then the function considers all activity instances that were active within the start and end activity instances, i.e., it uses $\\mathit{WTAB\\mathit{^{w$.	\\(\\displaystyle \\frac{\\sum _{c \\in g} \\begin{cases}\n\\mathit{WTAB(c, \\mathit{a, \\mathit{b) & \\mathit{if \\  \\mathit{fi(c, \\mathit{a, \\mathit{b) \\neq \\emptyset \\\\\n0 & \\mathit{if \\  \\mathit{fi(c, \\mathit{a, \\mathit{b) = \\emptyset\n\\end{cases}}{\n\\sum_{c \\in g}\n\\begin{cases}\n1 & \\text{if } \\mathit{fi(c, \\mathit{a, \\mathit{b) \\neq \\emptyset \\\\\n0 & \\text{otherwise}\n\\end{cases}\n}\\)	\\(\\mathit{WTAB\\) returns the waiting time from activity \\(\\mathit{a\\) to activity \\(\\mathit{b\\) in case \\(c\\).\n\\newline \\(\\mathit{fi\\) returns the set of first instances of activity \\(\\mathit{b\\) that occur after the first instance of \\(\\mathit{a\\) in case \\(c\\). \\\\
143	\N	expected-warehousing-cost-c-g	Expected Warehousing Cost	1	3	Expected warehousing cost associated with all activity instances of a case belonging to a group of cases.	Process where the cost of warehousing is relevant.	Minimizing warehousing cost is desirable.	minimize	\\(\\mathit{e\\mathit{WareC(g)\\)	\\(\\frac{\\mathit{WareC(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{WareC(g)}{\\mathit{C(g)}\\)	\\(\\mathit{WareC(g)\\) returns the total warehousing cost for group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
144	\N	fixed-cost-activity-granularity-c-a	Fixed Cost (activity granularity)	1	1	Sum of fixed cost of all instantiations of an activity in the event log.	Event log in which fixed cost information is recorded.	Minimizing fixed cost is desirable.	minimize	\\(\\mathit{FC\\mathit{^{\\times(a)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{FC\\mathit{^{\\times(i)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{FC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{FC\\mathit{^{sum$.	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{FC(i)\\)	\\(\\mathit{inst(a)\\) returns the set of all instances of activity \\(a\\).\n\\newline \\(\\mathit{FC(i)\\) returns the fixed cost of activity instance \\(i\\). \\\\
145	\N	fixed-cost-case-granularity-c-c	Fixed Cost (case granularity)	1	2	Sum of fixed cost of all activity instances of a case.	Event log in which fixed cost information is recorded.	Minimizing fixed cost is desirable.	minimize	\\(\\mathit{FC\\mathit{^{\\times(c)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{FC\\mathit{^{\\times(i)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{FC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{FC\\mathit{^{sum$.	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{FC(i)\\)	\\(\\mathit{inst(c)\\) returns the set of all activity instances in case \\(c\\).\n\\newline \\(\\mathit{FC(i)\\) returns the fixed cost of activity instance \\(i\\). \\\\
146	\N	fixed-cost-group-of-cases-granularity-c-g	Fixed Cost (group of cases granularity)	1	3	Sum of fixed cost of all activity instances of a group of cases.	Event log in which fixed cost information is recorded.	Minimizing fixed cost is desirable.	minimize	\\(\\mathit{FC\\mathit{^{\\times(g)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{c \\in g} \\mathit{FC\\mathit{^{\\times(c)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{FC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{FC\\mathit{^{sum$.	\\(\\sum _{c \\in g} \\mathit{FC(c)\\)	\\(\\mathit{FC(c)\\) returns the fixed cost for case \\(c\\). \\\\
147	\N	fixed-cost-considering-single-events-of-activity-instances-activity-instance-granularity-c-i	Fixed Cost considering single events of activity instances (activity instance granularity)	1	4	Fixed cost associated with an activity instance, measured as the latest recorded value among the events of the activity instance.	Event log in which fixed cost information is recorded.	Minimizing fixed cost is desirable.	minimize	\\(\\mathit{FC\\mathit{^{sgl(i)\\)	\\(\\begin{cases}\n#^{}_{\\mathit{fc}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{fc}(\\mathit{cpl(i)) \\neq \\bot	\\(\\begin{cases} #^{}_{\\mathit{fc}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{fc}(\\mathit{cpl(i)) \\neq undefined \\\\ #^{}_{\\mathit{fc}(\\mathit{str(i)) & \\mathit{if \\  #^{}_{\\mathit{fc}(\\mathit{cpl(i)) = undefined \\land #^{}_{\\mathit{fc}(\\mathit{str(i)) \\neq undefined \\\\ undefined & \\mathit{if \\  #^{}_{\\mathit{fc}(\\mathit{cpl(i)) = undefined \\land #^{}_{\\mathit{fc}(\\mathit{str(i)) = undefined \\\\ \\end{cases}\\)	\\(#^{}_{\\mathit{fc}\\) returns the fixed cost associated with an event.\n\\newline \\(\\mathit{cpl(i)\\) returns the completion event of activity instance \\(i\\).\n\\newline \\(\\mathit{str(i)\\) returns the start event of activity instance \\(i\\). \\\\
161	\N	human-resource-count-case-granularity-q-c	Human Resource count (case granularity)	4	2	Number of human resources that are involved in the execution of a case.	Human Resource count can be used as a proxy to measure the quality of the process.	Minimizing the number of human resources involved is desirable, as it reduces the possibility of errors due to, e.g., handovers of work.	minimize	\\(\\mathit{HR(c)\\)	\\(|\\mathit{hres(c)|\\)	\\(\\mathit{count(\\mathit{hres(c))\\)	$\\mathit{hres(c)$ returns the set of human resources that work in case $c$. \\\\
148	\N	fixed-cost-considering-the-sum-of-all-events-of-activity-instances-activity-instance-granularity-c-i	Fixed Cost considering the sum of all events of activity instances (activity instance granularity)	1	4	Fixed cost associated with an activity instance, measured as the sum of all values among the events of the activity instance.	Event log in which fixed cost information is recorded.	Minimizing fixed cost is desirable.	minimize	\\(\\mathit{FC\\mathit{^{sum(i)\\)	\\(\\begin{cases}\n#^{}_{\\mathit{fc}(\\mathit{str(i)) + & \\\\ #^{}_{\\mathit{fc}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{fc}(\\mathit{cpl(i)) \\neq \\bot \\land #^{}_{\\mathit{fc}(\\mathit{str(i)) \\neq \\bot	\\(\\begin{cases} #^{}_{\\mathit{fc}(\\mathit{str(i)) + & \\\\ #^{}_{\\mathit{fc}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{fc}(\\mathit{cpl(i)) \\neq undefined \\land #^{}_{\\mathit{fc}(\\mathit{str(i)) \\neq undefined \\\\ undefined & \\mathit{if \\  #^{}_{\\mathit{fc}(\\mathit{cpl(i)) = undefined \\lor #^{}_{\\mathit{fc}(\\mathit{str(i)) = undefined \\\\ \\end{cases}\\)	\\(#^{}_{\\mathit{fc}\\) returns the fixed cost associated with an event.\n\\newline \\(\\mathit{str(i)\\) returns the start event of activity instance \\(i\\).\n\\newline \\(\\mathit{cpl(i)\\) returns the completion event of activity instance \\(i\\). \\\\
149	\N	handover-count-case-granularity-t-c	Handover count (case granularity)	5	2	Number of times that the human resource associated with an activity instance differs from the human resource associated with the preceding activity instance within a case.	If actual time spent on a case is not of interest, Handover count can be used as a workload estimation within the time dimension.	Reducing the times that work handover occurs is desirable.	minimize	\\(\\mathit{H(c)\\)	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{dres(i)\\)	\\(\\sum_{i \\in \\mathit{inst(c)} \\mathit{dres(i)\\)	Here, \\(\\mathit{inst(c)\\) is the set of activity instances in case \\(c\\), \\newline \\(\\mathit{dres(i)\\) returns the number of distinct resources involved in the execution of activity instance \\(i\\). \n\\newline The formula sums these values to obtain the total handovers in case \\(c\\). \\\\
150	\N	human-resource-and-case-count-ratio-group-of-cases-granularity-c-g	Human Resource and Case count Ratio (group of cases granularity)	1	3	Ratio between the number of human resources that are involved in the execution of cases in a group of cases, and the number of cases belonging to a group of cases.	Event log in which the optimal allocation of human resources to cases allows an improvement in cost performance.	Minimizing the number of human resources per case is desirable.	minimize	\\(\\mathit{HRCR(g)\\)	\\(\\frac{\\mathit{HR(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{HR(g)}{\\mathit{C(g)}\\)	\\(\\mathit{HR(g)\\) returns the number of unique human resources involved in group \\(g\\).\n\\newline \\(\\mathit{C(g)\\) returns the number of cases in group \\(g\\). \\\\
151	\N	human-resource-count-activity-granularity-c-a	Human Resource count (activity granularity)	1	1	Number of human resources that are involved in the execution of an activity.	If the event log does not contain cost information, Human Resource count can be used as a proxy for the cost performance of an activity.	Minimizing the number of human resources involved is desirable.	minimize	\\(\\mathit{HR(a)\\)	\\(|\\mathit{hres(a)|\\)	\\(\\mathit{count(\\mathit{hres(a))\\)	$\\mathit{hres(a)$ returns the set of human resources that perform activity $a$ in the event log. \\\\
152	\N	human-resource-count-case-granularity-c-c	Human Resource count (case granularity)	1	2	Number of human resources that are involved in the execution of a case.	If the event log does not contain cost information, Human Resource count can be used as a proxy for the cost performance of a case.	Minimizing the number of human resources involved is desirable.	minimize	\\(\\mathit{HR(c)\\)	\\(|\\mathit{hres(c)|\\)	\\(\\mathit{count(\\mathit{hres(c))\\)	$\\mathit{hres(c)$ returns the set of human resources that work in case $c$. \\\\
153	\N	human-resource-count-group-of-cases-granularity-c-g	Human Resource count (group of cases granularity)	1	3	Number of human resources that are involved in the execution of a group of cases.	If the event log does not contain cost information, Human Resource count can be used as a proxy for the cost performance of a group of cases.	Minimizing the number of human resources involved is desirable.	minimize	\\(\\mathit{HR(g)\\)	\\(|\\cup_{c \\in g} \\mathit{hres(c)|\\)	\\(\\mathit{count(\\mathit{hres(g))\\)	$\\mathit{hres(g)$ returns the set of human resources that work in group of cases $g$. \\\\
154	\N	human-resource-count-activity-granularity-f-a	Human Resource count (activity granularity)	2	1	Number of human resources that are involved in the execution of an activity in the event log.	Human Resource count can be used as a proxy to measure the flexibility of a process.	Maximizing the number of human resources involved is desirable, as it implies a greater capability to address unexpected situations.	maximize	\\(\\mathit{HR(a)\\)	\\(|\\mathit{hres(a)|\\)	\\(\\mathit{count(\\mathit{hres(a))\\)	$\\mathit{hres(a)$ returns the set of human resources that perform activity $a$ in the event log. \\\\
155	\N	human-resource-count-case-granularity-f-c	Human Resource count (case granularity)	2	2	Number of human resources that are involved in the execution of a case.	Human Resource count can be used as a proxy to measure the flexibility of a process.	Maximizing the number of human resources involved is desirable, as it implies a greater capability to address unexpected situations.	maximize	\\(\\mathit{HR(c)\\)	\\(|\\mathit{hres(c)|\\)	\\(\\mathit{count(\\mathit{hres(c))\\)	$\\mathit{hres(c)$ returns the set of human resources that work in case $c$. \\\\
156	\N	human-resource-count-group-of-cases-granularity-f-g	Human Resource count (group of cases granularity)	2	3	Number of human resources that are involved in the execution of a group of cases.	Human Resource count can be used as a proxy to measure the flexibility of a process.	Maximizing the number of human resources involved is desirable, as it implies a greater capability to address unexpected situations.	maximize	\\(\\mathit{HR(g)\\)	\\(|\\cup_{c \\in g} \\mathit{hres(c)|\\)	\\(\\mathit{count(\\mathit{hres(g))\\)	$\\mathit{hres(g)$ returns the set of human resources that work in group of cases $g$. \\\\
157	\N	human-resource-count-activity-granularity-g-a	Human Resource count (activity granularity)	3	1	Number of human resources that are involved in the execution of an activity in the event log.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{HR(a)\\)	\\(|\\mathit{hres(a)|\\)	\\(\\mathit{count(\\mathit{hres(a))\\)	$\\mathit{hres(a)$ returns the set of human resources that perform activity $a$ in the event log. \\\\
158	\N	human-resource-count-case-granularity-g-c	Human Resource count (case granularity)	3	2	Number of human resources that are involved in the execution of a case.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{HR(c)\\)	\\(|\\mathit{hres(c)|\\)	\\(\\mathit{count(\\mathit{hres(c))\\)	$\\mathit{hres(c)$ returns the set of human resources that work in case $c$. \\\\
159	\N	human-resource-count-group-of-cases-granularity-g-g	Human Resource count (group of cases granularity)	3	3	Number of human resources that are involved in the execution of a group of cases.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{HR(g)\\)	\\(|\\cup_{c \\in g} \\mathit{hres(c)|\\)	\\(\\mathit{count(\\mathit{hres(g))\\)	$\\mathit{hres(g)$ returns the set of human resources that work in group of cases $g$. \\\\
163	\N	idle-time-case-granularity-t-c	Idle Time (case granularity)	5	2	Sum of time periods in which no activity instance is executed during a case.	Event log that contains lifecycle information for activity instances in which the time the case is inactive is of interest.	Minimizing idle time is desirable.	minimize	\\(\\mathit{IT(c)\\)	\\(\\sum _{i \\in \\mathit{inst(c)} \\begin{cases}\n\\frac{\\mathit{WT(i)}{|\\mathit{concstr(i)|} & \\mathit{if \\  \\mathit{prevstr(i) = \\emptyset	\\(\\sum_{i \\in \\mathit{inst(c)} \n\\begin{cases}\n\\frac{\\mathit{WT(i)}{|\\mathit{concstr(i)|} & \\text{if } \\mathit{prevstr(i) = \\emptyset \\\\\n0 & \\text{if } \\mathit{prevstr(i) \\neq \\emptyset\n\\end{cases}\\)	$\\mathit{inst(c)$ returns the set of activity instances that occur in case $c$.\n\\newline $\\mathit{WT(i)$ returns the waiting time of activity instance $i$.\n\\newline $\\mathit{concstr(i)$ returns the set of concurrent structures (parallel branches) related to instance $i$.\n\\newline $\\mathit{prevstr(i)$ returns the preceding structure of activity instance $i$.\\\\
164	\N	inventory-cost-activity-granularity-c-a	Inventory Cost (activity granularity)	1	1	Inventory cost associated with all instantiations of an activity in the event log.	Event log in which inventory cost information is recorded.	Minimizing inventory cost is desirable.	minimize	\\(\\mathit{IC\\mathit{^{\\times(a)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{IC\\mathit{^{\\times(i)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{IC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{IC\\mathit{^{sum$.	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{IC(i)\\)	\\(\\mathit{inst(a)\\) returns the set of all instances of activity \\(a\\).\n\\newline \\(\\mathit{IC(i)\\) returns the inventory cost of activity instance \\(i\\). \\\\
165	\N	inventory-cost-case-granularity-c-c	Inventory Cost (case granularity)	1	2	Inventory cost associated with all activity instances of a case.	Event log in which inventory cost information is recorded.	Minimizing inventory cost is desirable.	minimize	\\(\\mathit{IC\\mathit{^{\\times(c)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{IC\\mathit{^{\\times(i)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{IC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{IC\\mathit{^{sum$.	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{IC(i)\\)	\\(\\mathit{inst(c)\\) returns the set of all activity instances in case \\(c\\).\n\\newline \\(\\mathit{IC(i)\\) returns the inventory cost of activity instance \\(i\\). \\\\
166	\N	inventory-cost-group-of-cases-granularity-c-g	Inventory Cost (group of cases granularity)	1	3	Inventory cost associated with all activity instances of a group of cases.	Event log in which inventory cost information is recorded.	Minimizing inventory cost is desirable.	minimize	\\(\\mathit{IC\\mathit{^{\\times(g)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{c \\in g} \\mathit{IC\\mathit{^{\\times(c)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{IC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{IC\\mathit{^{sum$.	\\(\\sum _{c \\in g} \\mathit{IC(c)\\)	\\(\\mathit{IC(c)\\) returns the inventory cost for case \\(c\\). \\\\
167	\N	inventory-cost-considering-single-events-of-activity-instances-activity-instance-granularity-c-i	Inventory Cost considering single events of activity instances (activity instance granularity)	1	4	Inventory cost associated with an activity instance, measured as the latest recorded value among the events of the activity instance.	Event log in which inventory cost information is recorded.	Minimizing inventory cost is desirable.	minimize	\\(\\mathit{IC\\mathit{^{sgl(i)\\)	\\(\\begin{cases}\n#^{}_{\\mathit{ic}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{ic}(\\mathit{cpl(i)) \\neq \\bot	\\(\\begin{cases} #^{}_{\\mathit{ic}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{ic}(\\mathit{cpl(i)) \\neq undefined \\\\ #^{}_{\\mathit{ic}(\\mathit{str(i)) & \\mathit{if \\  #^{}_{\\mathit{ic}(\\mathit{cpl(i)) = undefined \\land #^{}_{\\mathit{ic}(\\mathit{str(i)) \\neq undefined \\\\ undefined & \\mathit{if \\  #^{}_{\\mathit{ic}(\\mathit{cpl(i)) = undefined \\land #^{}_{\\mathit{ic}(\\mathit{str(i)) = undefined \\\\ \\end{cases}\\)	\\(#^{}_{\\mathit{ic}\\) returns the inventory cost associated with an event.\n\\newline \\(\\mathit{cpl(i)\\) returns the completion event of activity instance \\(i\\).\n\\newline \\(\\mathit{str(i)\\) returns the start event of activity instance \\(i\\). \\\\
168	\N	inventory-cost-considering-the-sum-of-all-events-of-activity-instances-activity-instance-granularity-c-i	Inventory Cost considering the sum of all events of activity instances (activity instance granularity)	1	4	Inventory cost associated with an activity instance, measured as the sum of all values among the events of the activity instance.	Event log in which inventory cost information is recorded.	Minimizing inventory cost is desirable.	minimize	\\(\\mathit{IC\\mathit{^{sum(i)\\)	\\(\\begin{cases}\n#^{}_{\\mathit{ic}(\\mathit{str(i)) + & \\\\ #^{}_{\\mathit{ic}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{ic}(\\mathit{cpl(i)) \\neq \\bot \\land #^{}_{\\mathit{ic}(\\mathit{str(i)) \\neq \\bot	\\(\\begin{cases} #^{}_{\\mathit{ic}(\\mathit{str(i)) + & \\\\ #^{}_{\\mathit{ic}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{ic}(\\mathit{cpl(i)) \\neq undefined \\land #^{}_{\\mathit{ic}(\\mathit{str(i)) \\neq undefined \\\\ undefined & \\mathit{if \\  #^{}_{\\mathit{ic}(\\mathit{cpl(i)) = undefined \\lor #^{}_{\\mathit{ic}(\\mathit{str(i)) = undefined \\\\ \\end{cases}\\)	\\(#^{}_{\\mathit{ic}\\) returns the inventory cost associated with an event.\n\\newline \\(\\mathit{str(i)\\) returns the start event of activity instance \\(i\\).\n\\newline \\(\\mathit{cpl(i)\\) returns the completion event of activity instance \\(i\\). \\\\
183	\N	lead-time-deviation-from-expectation-case-granularity-t-c	Lead Time Deviation from Expectation (case granularity)	5	2	Absolute value of the difference between the time that a case is expected to take and its lead time.	Event log is associated with a process in which the lead time of a case should be as close as possible to a specific value.	A lead time that is closer to the expected value is desirable.	minimize	\\(\\mathit{LTDE(c, \\mathit{val)\\)	\\(|\\mathit{val - \\mathit{LT(c)|\\)	\\(|val - \\mathit{LT(c)|\\)	\\ $val$ represents the expected time value.\n\\newline $\\mathit{LT(c)$ returns the lead time of case $c$.\\\\
169	\N	labor-cost-activity-granularity-c-a	Labor Cost (activity granularity)	1	1	Labor cost associated with all instantiations of the activity in the event log.	Event log in which labor cost information is recorded.	Minimizing labor cost is desirable.	minimize	\\(\\mathit{LC\\mathit{^{\\times(a)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{LC\\mathit{^{\\times(i)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sum$.	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{LC(i)\\)	\\(\\mathit{inst(a)\\) returns the set of all instances of activity \\(a\\).\n\\newline \\(\\mathit{LC(i)\\) returns the labor cost of activity instance \\(i\\). \\\\
170	\N	labor-cost-case-granularity-c-c	Labor Cost (case granularity)	1	2	Labor cost associated with all activity instances of a case.	Event log in which labor cost information is recorded.	Minimizing labor cost is desirable.	minimize	\\(\\mathit{LC\\mathit{^{\\times(c)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{LC\\mathit{^{\\times(i)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sum$.	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{LC(i)\\)	\\(\\mathit{inst(c)\\) returns the set of all activity instances in case \\(c\\).\n\\newline \\(\\mathit{LC(i)\\) returns the labor cost of activity instance \\(i\\). \\\\
171	\N	labor-cost-group-of-cases-granularity-c-g	Labor Cost (group of cases granularity)	1	3	Labor cost associated with all activity instances of a group of cases.	Event log in which labor cost information is recorded.	Minimizing labor cost is desirable.	minimize	\\(\\mathit{LC\\mathit{^{\\times(g)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{c \\in g} \\mathit{LC\\mathit{^{\\times(c)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sum$.	\\(\\sum _{c \\in g} \\mathit{LC(c)\\)	\\(\\mathit{LC(c)\\) returns the labor cost for case \\(c\\). \\\\
172	\N	labor-cost-and-total-cost-ratio-activity-granularity-c-a	Labor Cost and Total Cost Ratio (activity granularity)	1	1	Ratio between the labor cost associated with all instantiations of an activity in the event log, and the total cost associated with all instantiations of an activity in the event log.	Event log in which both labor and total cost information are recorded.	Minimizing the cost associated with human resources is desirable.	minimize	\\(\\mathit{LCTCR\\mathit{^{\\times(a)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{LC\\mathit{^{\\times(a)}{\\mathit{TC\\mathit{^{\\times(a)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sgl$ and $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sum$ and $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{LC(a)}{\\mathit{TC(a)}\\)	\\(\\mathit{LC(a)\\) returns the total labor cost of activity \\(a\\).\n\\newline \\(\\mathit{TC(a)\\) returns the total cost of activity \\(a\\). \\\\
173	\N	labor-cost-and-total-cost-ratio-case-granularity-c-c	Labor Cost and Total Cost Ratio (case granularity)	1	2	Ratio between the labor cost associated with all activity instances of a case, and the total cost associated with all activity instances of a case.	Event log in which both labor and total cost information are recorded.	Minimizing the cost associated with human resources is desirable.	minimize	\\(\\mathit{LCTCR\\mathit{^{\\times(c)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{LC\\mathit{^{\\times(c)}{\\mathit{TC\\mathit{^{\\times(c)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sgl$ and $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sum$ and $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{LC(c)}{\\mathit{TC(c)}\\)	\\(\\mathit{LC(c)\\) returns the total labor cost of case \\(c\\).\n\\newline \\(\\mathit{TC(c)\\) returns the total cost of case \\(c\\). \\\\
174	\N	labor-cost-and-total-cost-ratio-group-of-cases-granularity-c-g	Labor Cost and Total Cost Ratio (group of cases granularity)	1	3	Ratio between the labor cost associated with all activity instances of a group of cases, and the total cost associated with all activity instances of a group of cases.	Event log in which both labor and total cost information are recorded.	Minimizing the cost associated with human resources is desirable.	minimize	\\(\\mathit{LCTCR\\mathit{^{\\times(g)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{LC\\mathit{^{\\times(g)}{\\mathit{TC\\mathit{^{\\times(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sgl$ and $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sum$ and $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{LC(g)}{\\mathit{TC(g)}\\)	\\(\\mathit{LC(g)\\) returns the total labor cost of case group \\(g\\).\n\\newline \\(\\mathit{TC(g)\\) returns the total cost of case group \\(g\\). \\\\
220	\N	rework-count-case-granularity-c-c	Rework Count (case granularity)	1	2	Number of times that any activity is instantiated again, after its first instantiation, in a case.	If the event log does not contain cost information, Rework Count can be used as a proxy for the cost performance of a case.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewC(c)\\)	\\(\\sum _{a \\in A} \\mathit{max(0, \\mathit{count(c, a) - 1)\\)	\\(\\sum _{a \\in A} \\mathit{max(0, \\mathit{count(c, a) - 1)\\)	\\(\\mathit{count(c, a)\\) returns the number of instances of activity \\(a\\) in case \\(c\\). \\\\
175	\N	labor-cost-and-total-cost-ratio-activity-instance-granularity-c-i	Labor Cost and Total Cost Ratio (activity instance granularity)	1	4	Ratio between the labor cost associated with an activity instance and the total cost associated with an activity instance.	Event log in which both labor and total cost information are recorded.	Minimizing the cost associated with human resources is desirable.	minimize	\\(\\mathit{LCTCR\\mathit{^{\\times(i)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{LC\\mathit{^{\\times(i)}{\\mathit{TC\\mathit{^{\\times(i)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sgl$ and $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{LC\\mathit{^{sum$ and $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{LC(i)}{\\mathit{TC(i)}\\)	\\(\\mathit{LC(i)\\) returns the labor cost of activity instance \\(i\\).\n\\newline \\(\\mathit{TC(i)\\) returns the total cost of activity instance \\(i\\). \\\\
176	\N	labor-cost-considering-single-events-of-activity-instances-activity-instance-granularity-c-i	Labor Cost considering single events of activity instances (activity instance granularity)	1	4	Labor cost associated with an activity instance, measured as the latest recorded value among the events of the activity instance.	Event log in which labor cost information is recorded.	Minimizing labor cost is desirable.	minimize	\\(\\mathit{LC\\mathit{^{sgl(i)\\)	\\(\\begin{cases}\n#^{}_{\\mathit{lc}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{lc}(\\mathit{cpl(i)) \\neq \\bot	\\(\\begin{cases}\n#^{}_{\\mathit{lc}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{lc}(\\mathit{cpl(i)) \\neq undefined \\\\\n#^{}_{\\mathit{lc}(\\mathit{str(i)) & \\mathit{if \\  #^{}_{\\mathit{lc}(\\mathit{cpl(i)) = undefined \\land #^{}_{\\mathit{lc}(\\mathit{str(i)) \\neq undefined \\\\\nundefined & \\mathit{if \\  #^{}_{\\mathit{lc}(\\mathit{cpl(i)) = undefined \\land #^{}_{\\mathit{lc}(\\mathit{str(i)) = undefined \\\\\n\\end{cases}\\)	\\(#^{}_{\\mathit{lc}\\) returns the labor cost associated with an event.\n\\newline \\(\\mathit{cpl(i)\\) returns the completion event of activity instance \\(i\\).\n\\newline \\(\\mathit{str(i)\\) returns the start event of activity instance \\(i\\). \\\\
177	\N	labor-cost-considering-the-sum-of-all-events-of-activity-instances-activity-instance-granularity-c-i	Labor Cost considering the sum of all events of activity instances (activity instance granularity)	1	4	Labor cost associated with an activity instance, measured as the sum of all values among the events of the activity instance.	Event log in which labor cost information is recorded.	Minimizing labor cost is desirable.	minimize	\\(\\mathit{LC\\mathit{^{sum(i)\\)	\\(\\begin{cases}\n#^{}_{\\mathit{lc}(\\mathit{str(i)) + & \\\\ #^{}_{\\mathit{lc}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{lc}(\\mathit{cpl(i)) \\neq \\bot \\land #^{}_{\\mathit{lc}(\\mathit{str(i)) \\neq \\bot	\\(\\begin{cases}\n#^{}_{\\mathit{lc}(\\mathit{str(i)) + & \\\\ #^{}_{\\mathit{lc}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{lc}(\\mathit{cpl(i)) \\neq undefined \\land #^{}_{\\mathit{lc}(\\mathit{str(i)) \\neq undefined \\\\\nundefined & \\mathit{if \\  #^{}_{\\mathit{lc}(\\mathit{cpl(i)) = undefined \\lor #^{}_{\\mathit{lc}(\\mathit{str(i)) = undefined \\\\\n\\end{cases}\\)	\\(#^{}_{\\mathit{lc}\\) returns the labor cost associated with an event.\n\\newline \\(\\mathit{str(i)\\) returns the start event of activity instance \\(i\\).\n\\newline \\(\\mathit{cpl(i)\\) returns the completion event of activity instance \\(i\\). \\\\
178	\N	lead-time-activity-granularity-t-a	Lead Time (activity granularity)	5	1	Sum of the total elapsed time for all instantiations of an activity in the event log. Also known as cycle time.	Event log is associated with a process in which the total elapsed time of activity instances is of relevance.	Minimizing lead time is desirable.	minimize	\\(\\mathit{LT(a)\\)	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{LT(i)\\)	\\(\\sum_{i \\in \\mathit{inst(a)} \\mathit{LT(i)\\)	$\\mathit{inst(a)$ returns the set of activity instances that belong to activity $a$.\n\\newline $\\mathit{LT(i)$ returns the lead time of activity instance $i$.\\\\
179	\N	lead-time-case-granularity-t-c	Lead Time (case granularity)	5	2	Total elapsed time between the earliest and latest timestamps in a case. Also known as cycle time.	Event log is associated with a process in which the total elapsed time of a case is of relevance.	Minimizing lead time is desirable.	minimize	\\(\\mathit{LT(c)\\)	\\(\\mathit{endt(c) - \\mathit{startt(c)\\)	\\(\\mathit{endt(c) - \\mathit{startt(c)\\)	$\\mathit{endt(c)$ returns the end timestamp of case $c$.\n\\newline $\\mathit{startt(c)$ returns the start timestamp of case $c$.\\\\
180	\N	lead-time-group-of-cases-granularity-t-g	Lead Time (group of cases granularity)	5	3	Total elapsed time between the earliest and latest events in a group of cases. Also known as cycle time.	Event log is associated with a process in which the total elapsed time of a group of cases is of relevance.	Minimizing lead time is desirable.	minimize	\\(\\mathit{LT(g)\\)	\\(^{\\mathit{max}_{c \\in g} \\mathit{endt(c) - ^{\\mathit{min}_{c \\in g} \\mathit{startt(c)\\)	\\(^{\\mathit{max}_{c \\in g} \\mathit{endt(c) - ^{\\mathit{min}_{c \\in g} \\mathit{startt(c)\\)	$\\mathit{endt(c)$ returns the end timestamp of case $c$.\n\\newline $\\mathit{startt(c)$ returns the start timestamp of case $c$.\n\\newline  $^{\\mathit{max}_{c \\in g}$ and $^{\\mathit{min}_{c \\in g}$ indicate that the maximum end time and minimum start time are taken across all cases in the group $g$.\\\\
181	\N	lead-time-activity-instance-granularity-t-i	Lead Time (activity instance granularity)	5	4	Sum of the waiting time and the service time of an activity instance. Also known as cycle time.	Event log is associated with a process in which the total elapsed time of activity instances is of relevance.	Minimizing lead time is desirable.	minimize	\\(\\mathit{LT(i)\\)	\\(\\mathit{ST(i) + \\mathit{WT(i)\\)	\\(\\mathit{ST(i) + \\mathit{WT(i)\\)	$\\mathit{ST(i)$ returns the service time of activity instance $i$, representing the time between its start and completion.\n\\newline $\\mathit{WT(i)$ returns the waiting time of activity instance $i$, representing the idle period before the instance starts execution.\\\\
182	\N	lead-time-and-case-count-ratio-group-of-cases-granularity-t-g	Lead Time and Case count Ratio (group of cases granularity)	5	3	Ratio between the lead time of a group of cases and the number of cases belonging to a group of cases.	Event log is associated with a process for which the number of cases executed within a specific period is relevant.	Maximizing the number of cases performed during a specific period is desirable.	minimize	\\(\\mathit{LTCR(g)\\)	\\(\\frac{\\mathit{LT(g)}{\\mathit{C(g)}\\)	\\(\\frac{\\mathit{LT(g)}{\\mathit{C(g)}\\)	$\\mathit{LT(g)$ returns the total lead time of group $g$.\n\\newline $\\mathit{C(g)$ returns the total number of cases in group $g$.\\\\
222	\N	rework-count-activity-granularity-q-a	Rework Count (activity granularity)	4	1	Number of times that an activity is instantiated again, after its first instantiation, in any case of the event log.	Process where rework recurrently occurs.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewC(a)\\)	\\(\\sum _{c \\in C} \\mathit{max(0, \\mathit{count(c, a) - 1)\\)	\\(\\sum _{c \\in C} \\mathit{max(0, \\mathit{count(c, a) - 1)\\)	\\(\\mathit{count(c, a)\\) returns the number of instances of activity \\(a\\) in case \\(c\\). \\\\
184	\N	lead-time-deviation-from-time-limit-case-granularity-t-c	Lead Time Deviation from time Limit (case granularity)	5	2	Difference between the time that a case is expected to take and its lead time.	Event log is associated with a process in which the lead time of a case should not exceed a specific value.	Exceeding the lead time limit value is undesired.	maximize	\\(\\mathit{LTDL(c, \\mathit{val)\\)	\\(\\mathit{val - \\mathit{LT(c)\\)	\\(val - \\mathit{LT(c)\\)	$\\mathit{LT(c)$ returns the lead time of case $c$.\n\\newline $val$ represents the predefined time Limit for the case.\n\\newline The expression $|val - \\mathit{LT(c)|$ measures the absolute deviation of the case lead time from its deadline.\\\\
185	\N	lead-time-from-activity-a-case-granularity-t-c	Lead Time from activity A (case granularity)	5	2	Total elapsed time between the earliest instantiation of a specific activity and the latest event of a case.	Event log is associated with a process in which the total elapsed time of a specific subprocess is of relevance.	Minimizing lead time is desirable.	minimize	\\(\\mathit{LTfA(c, \\mathit{a)\\)	\\(\\begin{cases}\n\\mathit{lt(x, y) & \\mathit{for~any \\  x \\in \\mathit{fi\\mathit{^{s(c, \\mathit{a) \\mathit{\\ and \\  y \\in \\mathit{endin(c) \\\\ \\bot & \\mathit{if \\  \\mathit{fi\\mathit{^{s(c, \\mathit{a) = \\emptyset\n\\end{cases}\\)	\\(\\begin{cases}\n\\mathit{lt(any (\\mathit{fi\\mathit{^{s(c, \\mathit{a), any (\\mathit{endin(c))) & \\mathit{if \\  \\mathit{fi\\mathit{^{s(c, \\mathit{a) \\neq \\emptyset \\\\\nundefined & \\mathit{if \\  \\mathit{fi\\mathit{^{s(c, \\mathit{a) = \\emptyset\n\\end{cases}\\)	$\\mathit{fi\\mathit{^{s(c, \\mathit{a)$ returns the set of first started instances of activity $\\mathit{a$ in case $c$.\n\\newline $\\mathit{endin(c)$ returns the final activity instance of case $c$.\n\\newline $\\mathit{lt(x, y)$ returns the lead time from activity instance $x$ to $y$.\\\\
186	\N	lead-time-from-activity-a-to-activity-b-case-granularity-t-c	Lead Time from activity A to activity B (case granularity)	5	2	Total elapsed time between the earliest instantiation of a specific activity and the earliest instantiation of another specific activity that occurs after the former one in a case.	Event log is associated with a process in which the total elapsed time of a specific subprocess is of relevance.	Minimizing lead time is desirable.	minimize	\\(\\mathit{LTAB(c, \\mathit{a, \\mathit{b)\\)	\\(\\begin{cases}\n\\mathit{lt(x,y) & \\mathit{for~any \\  x \\in \\mathit{fi\\mathit{^{s(c, \\mathit{a) \\mathit{\\ and \\  y \\in \\mathit{fi\\mathit{^{sc(c, \\mathit{a, \\mathit{b)	\\(\\begin{cases}\n\\mathit{lt(x,y) & \\mathit{for~any \\  x \\in \\mathit{fi\\mathit{^{s(c, \\mathit{a) \\mathit{\\ and \\  y \\in \\mathit{fi(c, \\mathit{a, \\mathit{b) \\\\\nundefined & \\mathit{if \\  \\mathit{fi(c, \\mathit{a, \\mathit{b) = \\emptyset\n\\end{cases}\\)	$\\mathit{fi\\mathit{^{s(c, \\mathit{a)$ returns the set of first started instances of activity $\\mathit{a$ in case $c$.\n\\newline $\\mathit{fi(c, \\mathit{a, \\mathit{b)$ returns the first instance of activity $\\mathit{b$ occurring after the first started instance of activity $\\mathit{a$ in case $c$.\n\\newline $\\mathit{lt(x,y)$ returns the lead time between activity instances $x$ and $y$.\\\\
187	\N	lead-time-to-activity-a-case-granularity-t-c	Lead Time to activity A (case granularity)	5	2	Total elapsed time between the earliest event and the earliest instantiation of a specific activity in a case.	Event log is associated with a process in which the total elapsed time of a specific subprocess is of relevance.	Minimizing lead time is desirable.	minimize	\\(\\mathit{LTtA(c, \\mathit{a)\\)	\\(\\begin{cases}\n\\mathit{lt(x, y) & \\mathit{for~any \\  x \\in \\mathit{strin(c) \\mathit{\\ and \\  y \\in \\mathit{fi\\mathit{^{c(c, \\mathit{a) \\\\ \\bot & \\mathit{if \\  \\mathit{fi\\mathit{^{c(c, \\mathit{a) = \\emptyset\n\\end{cases}\\)	\\(\\begin{cases}\n\\mathit{lt(x, y) & \\mathit{for~any \\  x \\in \\mathit{strin(c) \\mathit{\\ and \\  y \\in \\mathit{fi\\mathit{^{c(c, \\mathit{a) \\\\\nundefined & \\mathit{if \\  \\mathit{fi\\mathit{^{c(c, \\mathit{a) = \\emptyset\n\\end{cases}\\)	$\\mathit{strin(c)$ returns the activity instance that starts case $c$.\n\\newline $\\mathit{fi\\mathit{^{c(c, \\mathit{a)$ returns the first completed instance of activity $\\mathit{a$ in case $c$.\n\\newline $\\mathit{lt(x, y)$ returns the lead time between activity instances $x$ and $y$.\\\\
188	\N	maintenance-cost-case-granularity-c-c	Maintenance Cost (case granularity)	1	2	Maintenance cost associated with a case.	Process where the cost of conducting maintenance is relevant.	Minimizing maintenance cost is desirable.	minimize	\\(\\mathit{MainC(c)\\)	\\(#^{}_{\\mathit{mainc}(c)\\)	\\(#^{}_{\\mathit{mainc}(c)\\)	\\(#^{}_{\\mathit{mainc}\\) returns the maintenance cost associated with case \\(c\\). \\\\
189	\N	maintenance-cost-group-of-cases-granularity-c-g	Maintenance Cost (group of cases granularity)	1	3	Maintenance cost associated with all cases in a group of cases.	Process where the cost of conducting maintenance is relevant.	Minimizing maintenance cost is desirable.	minimize	\\(\\mathit{MainC(g)\\)	\\(\\sum _{c \\in g} \\mathit{MainC(c)\\)	\\(\\sum _{c \\in g} \\mathit{MainC(c)\\)	\\(\\mathit{MainC(c)\\) returns the maintenance cost for case \\(c\\). \\\\
190	\N	missed-deadline-cost-case-granularity-c-c	Missed Deadline Cost (case granularity)	1	2	Cost for missing deadlines associated with a case.	Process where missing a deadline incurs in additional costs.	Minimizing missed deadline cost is desirable.	minimize	\\(\\mathit{MDC(c)\\)	\\(#^{}_{\\mathit{mdc}(c)\\)	\\(#^{}_{\\mathit{mdc}(c)\\)	\\(#^{}_{\\mathit{mdc}\\) returns the missed deadline cost associated with case \\(c\\). \\\\
191	\N	missed-deadline-cost-group-of-cases-granularity-c-g	Missed Deadline Cost (group of cases granularity)	1	3	Cost for missing deadlines associated with all cases in a group of cases.	Process where missing a deadline incurs in additional costs.	Minimizing missed deadline cost is desirable.	minimize	\\(\\mathit{MDC(g)\\)	\\(\\sum _{c \\in g} \\mathit{MDC(c)\\)	\\(\\sum _{c \\in g} \\mathit{MDC(c)\\)	\\(\\mathit{MDC(c)\\) returns the missed deadline cost for case \\(c\\). \\\\
192	\N	non-automated-activity-count-case-granularity-q-c	Non-Automated Activity count (case granularity)	4	2	Number of non-automated activities that occur in a case.	Event log that contains automated activities.	Non-automated activities are prone to errors, which reduces the quality of the process.	minimize	\\(\\mathit{NAutA(c)\\)	\\(|\\mathit{act(c) \\backslash \\mathit{Autl|\\)	\\(\\displaystyle \\sum_{a \\in \\mathit{act(c)}\n\\begin{cases}\n1 & \\text{if } a \\notin \\mathit{Autl \\\\\n0 & \\text{otherwise}\n\\end{cases}\n\\)	\\(\\mathit{act(c)\\) returns the set of activities that occurred in case \\(c\\).\n\\newline \\(\\mathit{Autl\\) returns the set of automated activities. \\\\
193	\N	non-automated-activity-count-group-of-cases-granularity-q-g	Non-Automated Activity count (group of cases granularity)	4	3	Number of non-automated activities that occur in a group of cases.	Event log that contains automated activities.	Non-automated activities are prone to errors, which reduces the quality of the process.	minimize	\\(\\mathit{NAutA(g)\\)	\\(|(\\cup _{c \\in g} \\mathit{act(c)) \\backslash \\mathit{Autl|\\)	\\(\\displaystyle \\sum_{a \\in (\\cup _{c \\in g} \\mathit{act(c))}\n\\begin{cases}\n1 & \\text{if } a \\notin \\mathit{Autl \\\\\n0 & \\text{otherwise}\n\\end{cases}\n\\)	\\(\\mathit{act(c)\\) returns the set of activities that occurred in case \\(c\\).\n\\newline \\(\\mathit{Autl\\) returns the set of automated activities. \\\\
194	\N	non-automated-activity-instance-count-case-granularity-q-c	Non-Automated activity Instance count (case granularity)	4	2	Number of times that a non-automated activity is instantiated in a case.	Event log that contains automated activities.	Non-automated activities are prone to errors, which reduces the quality of the process.	minimize	\\(\\mathit{NAutI(c)\\)	\\(|\\{i \\in \\mathit{inst(c) \\mid \\mathit{act(i) \\notin \\mathit{Autl\\}|\\)	\\(\\displaystyle \\sum_{i \\in \\mathit{inst(c)}\n\\begin{cases}\n1 & \\text{if } \\mathit{act(i) \\notin \\mathit{Autl \\\\\n0 & \\text{otherwise}\n\\end{cases}\n\\)	\\(\\mathit{inst(c)\\) returns the set of all activity instances in case \\(c\\).\n\\newline \\(\\mathit{act(i)\\) returns the activity of activity instance \\(i\\).\n\\newline \\(\\mathit{Autl\\) returns the set of automated activities. \\\\
195	\N	non-automated-activity-instance-count-group-of-cases-granularity-q-g	Non-Automated activity Instance count (group of cases granularity)	4	3	Number of times that a non-automated activity is instantiated in a group of cases.	Event log that contains automated activities.	Non-automated activities are prone to errors, which reduces the quality of the process.	minimize	\\(\\mathit{NAutI(g)\\)	\\(\\sum _{c \\in g} \\mathit{NAutI(c)\\)	\\(\\sum _{c \\in g} \\mathit{NAutI(c)\\)	\\(\\mathit{NAutI(c)\\) returns the non-automated activity instance count for case \\(c\\). \\\\
196	\N	optional-activity-count-case-granularity-f-c	Optional Activity count (case granularity)	2	2	Number of optional activities that are instantiated in a case. \\newline An activity is considered optional if there is at least one case in the event log where it does not occur.	fProcess with multiple activities that are not instantiated in every case.	A greater number of optional activities is desired, as it implies a greater capability to address unexpected situations.	maximize	\\(\\mathit{OptA(c)\\)	\\(|\\{a \\in \\mathit{act(c) \\mid \\exists c' \\in C[a \\notin \\mathit{act(c')]\\}|\\)	\\(\\displaystyle \\sum_{a \\in \\mathit{act(c)}\n\\begin{cases}\n1 & \\text{if } a \\in \\mathit{opt(C) \\\\\n0 & \\text{otherwise}\n\\end{cases}\n\\)	\\(\\mathit{act(c)\\) returns the set of activities that occurred in case \\(c\\).\n\\newline \\(\\mathit{opt(C)\\) returns the set of optional activities in the event log \\(C\\). \\\\
197	\N	optional-activity-count-group-of-cases-granularity-f-g	Optional Activity count (group of cases granularity)	2	3	Number of optional activities that are instantiated in a group of cases. \\newline An activity is considered optional if there is at least one case in the event log where it does not occur.	Process with multiple activities that are not instantiated in every case.	A greater number of optional activities is desired, as it implies a greater capability to address unexpected situations.	maximize	\\(\\mathit{OptA(g)\\)	\\(|\\{a \\in \\mathit{act(c) \\mid c \\in g \\land \\exists c' \\in C[a \\notin \\mathit{act(c')]\\}|\\)	\\(\\displaystyle \\sum_{a \\in \\mathit{act(g)}\n\\begin{cases}\n1 & \\text{if } a \\in \\mathit{opt(C) \\\\\n0 & \\text{otherwise}\n\\end{cases}\n\\)	\\(\\mathit{act(c)\\) returns the set of activities that occurred in case \\(c\\).\n\\newline \\(\\mathit{opt(C)\\) returns the set of optional activities in the event log \\(C\\). \\\\
198	\N	optionality-case-granularity-f-c	Optionality (case granularity)	2	2	Ratio between the number of optional activities that are instantiated in a case, and the number of activities that occur in a case. \\newline An activity is considered optional if there is at least one case in the event log where it does not occur.	Process with multiple activities that are not instantiated in every case.	A greater number of optional activities is desired, as it implies a greater capability to address unexpected situations.	maximize	\\(\\mathit{Opt(c)\\)	\\(\\frac{\\mathit{OptA(c)}{\\mathit{A(c)}\\)	\\(\\frac{\\mathit{OptA(c)}{\\mathit{A(c)}\\)	\\(\\mathit{OptA(c)\\) returns the optional activity count for case \\(c\\).\n\\newline \\(\\mathit{A(c)\\) returns the number of unique activities in case \\(c\\). \\\\
199	\N	optionality-group-of-cases-granularity-f-g	Optionality (group of cases granularity)	2	3	Ratio between the number of optional activities that are instantiated in a group of cases, and the number of activities that occur in a group of cases. \\newline An activity is considered optional if there is at least one case in the event log where it does not occur.	Process with multiple activities that are not instantiated in every case.	A greater number of optional activities is desired, as it implies a greater capability to address unexpected situations.	maximize	\\(\\mathit{Opt(g)\\)	\\(\\frac{\\mathit{OptA(g)}{\\mathit{A(g)}\\)	\\(\\frac{\\mathit{OptA(g)}{\\mathit{A(g)}\\)	\\(\\mathit{OptA(g)\\) returns the optional activity count for group \\(g\\).\n\\newline \\(\\mathit{A(g)\\) returns the number of unique activities in group \\(g\\). \\\\
200	\N	outcome-unit-count-activity-granularity-q-a	outcome Unit count (activity granularity)	4	1	Outcome units associated with all instantiations of an activity in the event log.	Process where the outcome of activity instances can be measured.	Maximizing outcome unit count is desirable.	maximize	\\(\\mathit{U\\mathit{^{\\times(a)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{U\\mathit{^{\\times(i)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{U\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{U\\mathit{^{sum$.	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{U(i)\\)	\\(\\mathit{inst(a)\\) returns the set of all instances of activity \\(a\\).\n\\newline \\(\\mathit{U(i)\\) returns the outcome unit count of activity instance \\(i\\). \\\\
201	\N	outcome-unit-count-case-granularity-q-c	outcome Unit count (case granularity)	4	2	Outcome units associated with all activity instances in a case.	Process where the outcome of activity instances can be measured.	Maximizing outcome unit count is desirable.	maximize	\\(\\mathit{U\\mathit{^{\\times(c)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{e \\in \\mathit{inst(c)} \\mathit{U\\mathit{^{\\times(i)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{U\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{U\\mathit{^{sum$.	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{U(i)\\)	\\(\\mathit{inst(c)\\) returns the set of all activity instances in case \\(c\\).\n\\newline \\(\\mathit{U(i)\\) returns the outcome unit count of activity instance \\(i\\). \\\\
221	\N	rework-count-group-of-cases-granularity-c-g	Rework Count (group of cases granularity)	1	3	Number of times that any activity is instantiated again, after its first instantiation, in every case of a group of cases.	If the event log does not contain cost information, Rework Count can be used as a proxy for the cost performance of a group of cases.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewC(g)\\)	\\(\\sum _{c \\in g} \\mathit{RewC(c)\\)	\\(\\sum _{c \\in g} \\mathit{RewC(c)\\)	\\(\\mathit{RewC(c)\\) returns the rework count for case \\(c\\). \\\\
202	\N	outcome-unit-count-group-of-cases-granularity-q-g	outcome Unit count (group of cases granularity)	4	3	Outcome units associated with all activity instances in a group of cases.	Process where the outcome of activity instances can be measured.	Maximizing outcome unit count is desirable.	maximize	\\(\\mathit{U\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{c \\in g} \\mathit{U\\mathit{^{\\times(c)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{U\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{U\\mathit{^{sum$.	\\(\\sum _{c \\in g} \\mathit{U(c)\\)	\\(\\mathit{U(c)\\) returns the outcome unit count of case \\(c\\). \\\\
203	\N	outcome-unit-count-considering-single-events-of-activity-instances-activity-instance-granularity-q-i	outcome Unit count considering single events of activity instances (activity instance granularity)	4	4	Outcome units associated with an activity instance, measured as the latest recorded value among the events of the activity instance.	Process where the outcome of activity instances can be measured.	Maximizing outcome unit count is desirable.	maximize	\\(\\mathit{U\\mathit{^{sgl(i)\\)	\\(\\begin{cases}\n#^{}_{\\mathit{unt}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{unt}(\\mathit{cpl(i)) \\neq \\bot	\\(\\begin{cases}\n#^{}_{\\mathit{unt}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{unt}(\\mathit{cpl(i)) \\neq undefined \\\\\n#^{}_{\\mathit{unt}(\\mathit{str(i)) & \\mathit{if \\  #^{}_{\\mathit{unt}(\\mathit{cpl(i)) = undefined \\land #^{}_{\\mathit{unt}(\\mathit{str(i)) \\neq undefined \\\\\nundefined & \\mathit{if \\  #^{}_{\\mathit{unt}(\\mathit{cpl(i)) = undefined \\land #^{}_{\\mathit{unt}(\\mathit{str(i)) = undefined \\\\\n\\end{cases}\\)	\\(#^{}_{\\mathit{unt}\\) returns the outcome unit count associated with an event.\n\\newline \\(\\mathit{cpl(i)\\) returns the completion event of activity instance \\(i\\).\n\\newline \\(\\mathit{str(i)\\) returns the start event of activity instance \\(i\\). \\\\
204	\N	outcome-unit-count-considering-the-sum-of-all-events-of-activity-instances-activity-instance-granularity-q-i	outcome Unit count considering the sum of all events of activity instances (activity instance granularity)	4	4	Outcome units associated with an activity instance, measured as the sum of all values among the events of the activity instance.	Process where the outcome of activity instances can be measured.	Maximizing outcome unit count is desirable.	maximize	\\(\\mathit{U\\mathit{^{sum(i)\\)	\\(\\begin{cases}\n#^{}_{\\mathit{unt}(\\mathit{str(i)) + & \\mathit{if \\  #^{}_{\\mathit{unt}(\\mathit{cpl(i)) \\neq \\bot \\land \\\\ #^{}_{\\mathit{unt}(\\mathit{cpl(i)) & #^{}_{\\mathit{unt}(\\mathit{str(i)) \\neq \\bot	\\(\\begin{cases}\n#^{}_{\\mathit{unt}(\\mathit{str(i)) + #^{}_{\\mathit{unt}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{unt}(\\mathit{cpl(i)) \\neq undefined \\land \\\\ & #^{}_{\\mathit{unt}(\\mathit{str(i)) \\neq undefined \\\\\nundefined & \\mathit{if \\  #^{}_{\\mathit{unt}(\\ \\mathit{cpl(i)) = undefined \\lor #^{}_{\\mathit{unt}(\\mathit{str(i)) = undefined \\\\\n\\end{cases}\\)	\\(#^{}_{\\mathit{unt}\\) returns the outcome unit count associated with an event.\n\\newline \\(\\mathit{str(i)\\) returns the start event of activity instance \\(i\\).\n\\newline \\(\\mathit{cpl(i)\\) returns the completion event of activity instance \\(i\\). \\\\
205	\N	overall-quality-case-granularity-q-c	Overall Quality (case granularity)	4	2	Overall quality associated with the outcome of a case.	Event log contains information that allows measuring overall quality, such as customer satisfaction or a quantifier of the outcome of the process.	Maximizing the quality of the process is desirable.	maximize	\\(\\mathit{OQ(c)\\)	\\(#^{}_{\\mathit{qual}(c)\\)	\\(#^{}_{\\mathit{qual}(c)\\)	\\(#^{}_{\\mathit{qual}\\) returns the overall quality associated with case \\(c\\). \\\\
206	\N	overhead-cost-case-granularity-c-c	Overhead Cost (case granularity)	1	2	Total cost associated with all instantiations of activities that do not have a direct effect on the outcome of a case.	Event log in which activities can be categorized based on whether they directly contribute to the outcome of the process or not.	Minimizing total cost is desirable.	minimize	\\(\\mathit{OC\\mathit{^{\\times(c)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{i \\in \\mathit{inst(c), \\mathit{act(i) \\notin \\mathit{DCl} \\mathit{TC\\mathit{^{\\times(i)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\sum _{i \\in \\mathit{inst(c), \\mathit{act(i) \\notin \\mathit{DCl} \\mathit{TC(i)\\)	\\(\\mathit{inst(c)\\) returns the set of all activity instances in case \\(c\\).\n\\newline \\(\\mathit{act(i)\\) returns the activity of activity instance \\(i\\).\n\\newline \\(\\mathit{DCl\\) returns the set of direct cost activities.\n\\newline \\(\\mathit{TC(i)\\) returns the total cost of activity instance \\(i\\). \\\\
207	\N	overhead-cost-group-of-cases-granularity-c-g	Overhead Cost (group of cases granularity)	1	3	Total cost associated with all instantiations of activities that do not have a direct effect on the outcome of cases in a group of cases.	Event log in which activities can be categorized based on whether they directly contribute to the outcome of the process or not.	Minimizing total cost is desirable.	minimize	\\(\\mathit{OC\\mathit{^{\\times(g)\\) \n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{c \\in g} \\mathit{OC\\mathit{^{\\times(c)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{OC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{OC\\mathit{^{sum$.	\\(\\sum _{c \\in g} \\mathit{OC(c)\\)	\\(\\mathit{OC(c)\\) returns the overhead cost for case \\(c\\). \\\\
208	\N	repeatability-case-granularity-q-c	Repeatability (case granularity)	4	2	One minus the ratio between the number of activities that occur in a case, and the number of times that an activity is instantiated in a case.	Process where activity repetition is common.	It is desirable not to repeat activities.	minimize	\\(\\mathit{Rep(c)\\)	\\(1 - \\frac{\\mathit{A(c)}{\\mathit{I(c)}\\)	\\(1 - \\frac{\\mathit{A(c)}{\\mathit{I(c)}\\)	\\(\\mathit{A(c)\\) returns the number of unique activities in case \\(c\\).\n\\newline \\(\\mathit{I(c)\\) returns the total number of activity instances in case \\(c\\). \\\\
209	\N	repeatability-group-of-cases-granularity-q-g	Repeatability (group of cases granularity)	4	3	One minus the ratio between the number of activities that occur in a group of cases, and the number of times that an activity is instantiated in a group of cases.	Process where activity repetition is common.	It is desirable not to repeat activities.	minimize	\\(\\mathit{Rep(g)\\)	\\(1 - \\frac{\\mathit{A(g)}{\\mathit{I(g)}\\)	\\(1 - \\frac{\\mathit{A(g)}{\\mathit{I(g)}\\)	\\(\\mathit{A(g)\\) returns the number of unique activities in group \\(g\\).\n\\newline \\(\\mathit{I(g)\\) returns the total number of activity instances in group \\(g\\). \\\\
210	\N	resource-count-activity-granularity-c-a	Resource count (activity granularity)	1	1	Number of resources that are involved in the execution of an activity in the event log.	If the event log does not contain cost information, Resource count can be used as a proxy for the cost performance of an activity.	Minimizing the number of resources involved is desirable.	minimize	\\(\\mathit{R(a)\\)	\\(|\\mathit{res(a)|\\)	\\(\\mathit{count(\\mathit{res(a))\\)	$\\mathit{res(a)$ returns the set of resources used for activity $a$ in the event log. \\\\
211	\N	resource-count-case-granularity-c-c	Resource count (case granularity)	1	2	Number of resources that are involved in the execution of a case.	If the event log does not contain cost information, Resource count can be used as a proxy for the cost performance of a case.	Minimizing the number of resources involved is desirable.	minimize	\\(\\mathit{R(c)\\)	\\(|\\mathit{res(c)|\\)	\\(\\mathit{count(\\mathit{res(c))\\)	$\\mathit{res(c)$ returns the set of resources used in case $c$. \\\\
212	\N	resource-count-group-of-cases-granularity-c-g	Resource count (group of cases granularity)	1	3	Number of resources that are involved in the execution of a group of cases.	If the event log does not contain cost information, Resource count can be used as a proxy for the cost performance of a group of cases.	Minimizing the number of resources involved is desirable.	minimize	\\(\\mathit{R(g)\\)	\\(|\\cup_{c \\in g} \\mathit{res(c)|\\)	\\(\\mathit{count(\\cup_{c \\in g} \\mathit{res(c))\\)	\\(\\mathit{res(c)\\) returns the set of unique resources involved in case \\(c\\). \\\\
213	\N	resource-count-activity-granularity-g-a	Resource count (activity granularity)	3	1	Number of resources that are involved in the execution of an activity in the event log.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{R(a)\\)	\\(|\\mathit{res(a)|\\)	\\(\\mathit{count(\\mathit{res(a))\\)	$\\mathit{res(a)$ returns the set of resources used for activity $a$ in the event log. \\\\
214	\N	resource-count-case-granularity-g-c	Resource count (case granularity)	3	2	Number of resources that are involved in the execution of a case.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{R(c)\\)	\\(|\\mathit{res(c)|\\)	\\(\\mathit{count(\\mathit{res(c))\\)	$\\mathit{res(c)$ returns the set of resources used in case $c$. \\\\
215	\N	resource-count-group-of-cases-granularity-g-g	Resource count (group of cases granularity)	3	3	Number of resources that are involved in the execution of a group of cases.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{R(g)\\)	\\(|\\cup_{c \\in g} \\mathit{res(c)|\\)	\\(\\mathit{count(\\mathit{res(g))\\)	$\\mathit{res(g)$ returns the set of resources used in group of cases $g$. \\\\
216	\N	rework-cost-activity-granularity-c-a	Rework Cost (activity granularity)	1	1	Total cost of all times that an activity is instantiated again, after its first instantiation, in any case of the event log.	Event log that contains cost information where measuring rework is of relevance.	Minimizing the cost of rework is desirable.	minimize	\\(\\mathit{RC\\mathit{^{\\times(a)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\mathit{TC(a) - \\sum _{c \\in C} \\mathit{fitc\\mathit{^{\\times(c, a)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{fitc\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{fitc\\mathit{^{sum$.	\\(\\mathit{TC(a) - \\sum _{c \\in C} \\mathit{fitc(c, a)\\)	\\(\\mathit{TC(a)\\) returns the total cost of activity \\(a\\).\n\\newline \\(\\mathit{fitc\\) returns the cost of the first instance of activity \\(a\\) in case \\(c\\). \\\\
217	\N	rework-cost-case-granularity-c-c	Rework Cost (case granularity)	1	2	Total cost of all times that any activity is instantiated again, after its first instantiation, in a case.	Event log that contains cost information where measuring rework is of relevance.	Minimizing the cost of rework is desirable.	minimize	\\(\\mathit{RC\\mathit{^{\\times(c)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\mathit{TC(c) - \\sum _{a \\in A} \\mathit{fitc\\mathit{^{\\times(c, a)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{fitc\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{fitc\\mathit{^{sum$.	\\(\\mathit{TC(c) - \\sum _{a \\in A} \\mathit{fitc(c, a)\\)	\\(\\mathit{TC(c)\\) returns the total cost of case \\(c\\).\n\\newline \\(\\mathit{fitc\\) returns the cost of the first instance of activity \\(a\\) in case \\(c\\). \\\\
218	\N	rework-cost-group-of-cases-granularity-c-g	Rework Cost (group of cases granularity)	1	3	Sum of total cost of all times that any activity is instantiated again, after its first instantiation, in every case of a group of cases.	Event log that contains cost information where measuring rework is of relevance.	Minimizing the cost of rework is desirable.	minimize	\\(\\mathit{RC\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{c \\in g} \\mathit{RC\\mathit{^{\\times(c)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{RC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{RC\\mathit{^{sum$.	\\(\\sum _{c \\in g} \\mathit{RC(c)\\)	\\(\\mathit{RC(c)\\) returns the rework cost for case \\(c\\). \\\\
219	\N	rework-count-activity-granularity-c-a	Rework Count (activity granularity)	1	1	Number of times that an activity is instantiated again, after its first instantiation, in any case of the event log.	If the event log does not contain cost information, Rework Count can be used as a proxy for the cost performance of an activity.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewC(a)\\)	\\(\\sum _{c \\in C} \\mathit{max(0, \\mathit{count(c, a) - 1)\\)	\\(\\sum _{c \\in C} \\mathit{max(0, \\mathit{count(c, a) - 1)\\)	\\(\\mathit{count(c, a)\\) returns the number of instances of activity \\(a\\) in case \\(c\\). \\\\
224	\N	rework-count-group-of-cases-granularity-q-g	Rework Count (group of cases granularity)	4	3	Sum of the number of times that any activity is instantiated again, after its first instantiation, in every case of a group of cases.	Process where rework recurrently occurs.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewC(g)\\)	\\(\\sum _{c \\in g} \\mathit{RewC(c)\\)	\\(\\sum _{c \\in g} \\mathit{RewC(c)\\)	\\(\\mathit{RewC(c)\\) returns the rework count for case \\(c\\). \\\\
225	\N	rework-count-by-value-activity-granularity-q-a	Rework Count by Value (activity granularity)	4	1	Number of times that an activity is instantiated again, after it is instantiated a certain number of times, in any case of the event log.	Process where rework recurrently occurs.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewCV(a, \\mathit{val)\\)	\\(\\sum _{c \\in C} \\mathit{max(0, \\mathit{count(c, a) - \\mathit{val)\\)	\\(\\sum _{c \\in C} \\mathit{max(0, \\mathit{count(c, a) - \\mathit{val)\\)	\\(\\mathit{count(c, a)\\) returns the number of instances of activity \\(a\\) in case \\(c\\). \\\\
226	\N	rework-count-by-value-case-granularity-q-c	Rework Count by Value (case granularity)	4	2	Number of times that any activity is instantiated again, after it is instantiated a certain number of times, in a case.	Process where rework recurrently occurs.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewCV(c, \\mathit{val)\\)	\\(\\sum _{a \\in A} \\mathit{max(0, \\mathit{count(c, a) - \\mathit{val)\\)	\\(\\sum _{a \\in A} \\mathit{max(0, \\mathit{count(c, a) - \\mathit{val)\\)	\\(\\mathit{count(c, a)\\) returns the number of instances of activity \\(a\\) in case \\(c\\). \\\\
227	\N	rework-count-by-value-group-of-cases-granularity-q-g	Rework Count by Value (group of cases granularity)	4	3	Number of times that any activity is instantiated again, after it is instantiated a certain number of times, in every case of a group of cases.	Process where rework recurrently occurs.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewCV(g, \\mathit{val)\\)	\\(\\sum _{c \\in g} \\mathit{RewCV(c, \\mathit{val)\\)	\\(\\sum _{c \\in g} \\mathit{RewCV(c, \\mathit{val)\\)	\\(\\mathit{RewCV(c, \\mathit{val)\\) returns the rework count by value \\(\\mathit{val\\) for case \\(c\\). \\\\
228	\N	rework-of-activities-subset-case-granularity-q-c	Rework of activities Subset (case granularity)	4	2	Number of times that any activity belonging to a subset of activities is instantiated again, after its first instantiation, in a case.	Process where rework occurs recurrently, but only the rework of some activities is of interest.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewSub(c, \\mathit{sub)\\)	\\(\\sum _{a \\in \\mathit{sub} \\mathit{max(0, \\mathit{count(c, a) - 1)\\)	\\(\\sum _{a \\in \\mathit{sub} \\mathit{max(0, \\mathit{count(c, a) - 1)\\)	\\(\\mathit{count(c, a)\\) returns the number of instances of activity \\(a\\) in case \\(c\\). \\\\
229	\N	rework-of-activities-subset-group-of-cases-granularity-q-g	Rework of activities Subset (group of cases granularity)	4	3	Number of times that any activity belonging to a subset of activities is instantiated again, after its first instantiation, in all case of a group of cases.	Process where rework occurs recurrently, but only the rework of some activities is of interest.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewSub(g, \\mathit{sub)\\)	\\(\\sum _{c \\in g} \\mathit{RewSub(c, \\mathit{sub)\\)	\\(\\sum _{c \\in g} \\mathit{RewSub(c, \\mathit{sub)\\)	\\(\\mathit{RewSub(c, \\mathit{sub)\\) returns the rework count for subset \\(\\mathit{sub\\) in case \\(c\\). \\\\
230	\N	rework-percentage-activity-granularity-c-a	Rework Percentage (activity granularity)	1	1	Percentage of times that an activity is instantiated again, after its first instantiation, in any case of the event log.	If the event log does not contain cost information, Rework Percentage can be used as a proxy for the cost performance of an activity.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewP(a)\\)	\\(\\frac{\\mathit{RewC(a)}{\\mathit{I(a)}\\)	\\(\\frac{\\mathit{RewC(a)}{\\mathit{I(a)}\\)	\\(\\mathit{RewC(a)\\) returns the rework count for activity \\(a\\).\n\\newline \\(\\mathit{I(a)\\) returns the number of instances of activity \\(a\\). \\\\
231	\N	rework-percentage-case-granularity-c-c	Rework Percentage (case granularity)	1	2	Percentage of times that any activity is instantiated again, after its first instantiation, in a case.	If the event log does not contain cost information, Rework Percentage can be used as a proxy for the cost performance of a case.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewP(c)\\)	\\(\\frac{\\mathit{RewC(c)}{\\mathit{I(c)}\\)	\\(\\frac{\\mathit{RewC(c)}{\\mathit{I(c)}\\)	\\(\\mathit{RewC(c)\\) returns the rework count for case \\(c\\).\n\\newline \\(\\mathit{I(c)\\) returns the total number of activity instances in case \\(c\\). \\\\
232	\N	rework-percentage-group-of-cases-granularity-c-g	Rework Percentage (group of cases granularity)	1	3	Percentage of times that any activity is instantiated again, after its first instantiation, in every case of a group of cases.	If the event log does not contain cost information, Rework Percentage can be used as a proxy for the cost performance of a group of cases.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewP(g)\\)	\\(\\frac{\\mathit{RewC(g)}{\\mathit{I(g)}\\)	\\(\\frac{\\mathit{RewC(g)}{\\mathit{I(g)}\\)	\\(\\mathit{RewC(g)\\) returns the rework count for group \\(g\\).\n\\newline \\(\\mathit{I(g)\\) returns the total number of activity instances in group \\(g\\). \\\\
233	\N	rework-percentage-activity-granularity-q-a	Rework Percentage (activity granularity)	4	1	Percentage of times that an activity is instantiated again, after its first instantiation, in any case of the event log.	Process where rework occurs recurrently.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewP(a)\\)	\\(\\frac{\\mathit{RewC(a)}{\\mathit{I(a)}\\)	\\(\\frac{\\mathit{RewC(a)}{\\mathit{I(a)}\\)	\\(\\mathit{RewC(a)\\) returns the rework count for activity \\(a\\).\n\\newline \\(\\mathit{I(a)\\) returns the total number of instances of activity \\(a\\). \\\\
234	\N	rework-percentage-case-granularity-q-c	Rework Percentage (case granularity)	4	2	Percentage of times that any activity is instantiated again, after its first instantiation, in a case.	Process where rework occurs recurrently.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewP(c)\\)	\\(\\frac{\\mathit{RewC(c)}{\\mathit{I(c)}\\)	\\(\\frac{\\mathit{RewC(c)}{\\mathit{I(c)}\\)	\\(\\mathit{RewC(c)\\) returns the rework count for case \\(c\\).\n\\newline \\(\\mathit{I(c)\\) returns the total number of activity instances in case \\(c\\). \\\\
235	\N	rework-percentage-group-of-cases-granularity-q-g	Rework Percentage (group of cases granularity)	4	3	Percentage of times that any activity is instantiated again, after its first instantiation, in every case of a group of cases.	Process where rework occurs recurrently.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewP(g)\\)	\\(\\frac{\\mathit{RewC(g)}{\\mathit{I(g)}\\)	\\(\\frac{\\mathit{RewC(g)}{\\mathit{I(g)}\\)	\\(\\mathit{RewC(g)\\) returns the total rework count for group \\(g\\).\n\\newline \\(\\mathit{I(g)\\) returns the total number of activity instances in group \\(g\\). \\\\
236	\N	rework-percentage-by-value-activity-granularity-q-a	Rework Percentage by Value (activity granularity)	4	1	Percentage of times that an activity is instantiated again, after it is instantiated a certain number of times, in any case in the event log.	Process where rework occurs recurrently.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewPV(a, \\mathit{val)\\)	\\(\\frac{\\mathit{RewCV(a, \\mathit{val)}{\\mathit{I(a)}\\)	\\(\\frac{\\mathit{RewCV(a, \\mathit{val)}{\\mathit{I(a)}\\)	\\(\\mathit{RewCV(a, \\mathit{val)\\) returns the rework count by value \\(\\mathit{val\\) for activity \\(a\\).\n\\newline \\(\\mathit{I(a)\\) returns the total number of instances of activity \\(a\\). \\\\
237	\N	rework-percentage-by-value-case-granularity-q-c	Rework Percentage by Value (case granularity)	4	2	Percentage of times that any activity is instantiated again, after it is instantiated a certain number of times, in a case.	Process where rework occurs recurrently.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewPV(c, \\mathit{val)\\)	\\(\\frac{\\mathit{RewCV(c, \\mathit{val)}{\\mathit{I(c)}\\)	\\(\\frac{\\mathit{RewCV(c, \\mathit{val)}{\\mathit{I(c)}\\)	\\(\\mathit{RewCV(c, \\mathit{val)\\) returns the rework count by value \\(\\mathit{val\\) for case \\(c\\).\n\\newline \\(\\mathit{I(c)\\) returns the total number of activity instances in case \\(c\\). \\\\
238	\N	rework-percentage-by-value-group-of-cases-granularity-q-g	Rework Percentage by Value (group of cases granularity)	4	3	Percentage of times that any activity is instantiated again, after it is instantiated a certain number of times, in every case of a group of cases.	Process where rework occurs recurrently.	Minimizing rework is desirable.	minimize	\\(\\mathit{RewPV(g, \\mathit{val)\\)	\\(\\frac{\\mathit{RewCV(g, \\mathit{val)}{\\mathit{I(g)}\\)	\\(\\frac{\\mathit{RewCV(g, \\mathit{val)}{\\mathit{I(g)}\\)	\\(\\mathit{RewCV(g, \\mathit{val)\\) returns the rework count by value \\(\\mathit{val\\) for group \\(g\\).\n\\newline \\(\\mathit{I(g)\\) returns the total number of activity instances in group \\(g\\). \\\\
239	\N	rework-time-activity-granularity-q-a	Rework Time (activity granularity)	4	1	Sum of the elapsed time for all times an activity is instantiated again, after its first instantiation, in any case in the event log.	Process where measuring the time spent on rework activities is of relevance.	Minimizing the time spent on reworking is desirable.	minimize	\\(\\mathit{RT(a)\\)	\\(\\mathit{LT(a) - \\sum _{c \\in C} \\mathit{filt(c, a)\\)	\\(\\mathit{LT(a) - \\sum _{c \\in C} \\mathit{filt(c, a)\\)	\\(\\mathit{LT(a)\\) returns the total lead time of activity \\(a\\).\n\\newline \\(\\mathit{filt(c, a)\\) returns the lead time of the first instance of activity \\(a\\) in case \\(c\\). \\\\
240	\N	rework-time-case-granularity-q-c	Rework Time (case granularity)	4	2	Sum of the elapsed time for all times that any activity is instantiated again, after its first instantiation, in a case.	Process where measuring the time spent on rework activities is of relevance.	Minimizing the time spent on reworking is desirable.	minimize	\\(\\mathit{RT(c)\\)	\\(\\mathit{LT(c) - \\sum _{a \\in A} \\mathit{filt(c, a)\\)	\\(\\mathit{LT(c) - \\sum _{a \\in A} \\mathit{filt(c, a)\\)	\\(\\mathit{LT(c)\\) returns the total lead time of case \\(c\\).\n\\newline \\(\\mathit{filt(c, a)\\) returns the lead time of the first instance of activity \\(a\\) in case \\(c\\). \\\\
241	\N	rework-time-group-of-cases-granularity-q-g	Rework Time (group of cases granularity)	4	3	Sum of the elapsed time for all times that any activity is instantiated again, after its first instantiation, in every case of a group of cases.	Process where measuring the time spent on rework activities is of relevance.	Minimizing the time spent on reworking is desirable.	minimize	\\(\\mathit{RT(g)\\)	\\(\\sum _{c \\in g} \\mathit{RT(c)\\)	\\(\\sum _{c \\in g} \\mathit{RT(c)\\)	\\(\\mathit{RT(c)\\) returns the rework time for case \\(c\\). \\\\
242	\N	role-and-variant-count-ratio-group-of-cases-granularity-f-g	Role and Variant count Ratio (group of cases granularity)	2	3	Ratio between the number of human resource roles that are involved in the execution of a case, and the number of variants that are observed in a group of cases.	Process where several roles are involved	Maximizing the number of roles involved in the execution of different process variants is desirable.	maximize	\\(\\mathit{RoleVR(g)\\)	\\(\\frac{\\mathit{Role(g)}{\\mathit{V(g)}\\)	\\(\\frac{\\mathit{Role(g)}{\\mathit{V(g)}\\)	\\(\\mathit{Role(g)\\) returns the number of unique roles involved in group \\(g\\).\n\\newline \\(\\mathit{V(g)\\) returns the number of unique variants in group \\(g\\). \\\\
243	\N	role-count-case-granularity-f-c	Role count (case granularity)	2	2	Number of human resource roles that are involved in the execution of a case.	Process where several roles are involved.	A greater number of roles involved in the execution of the process implies greater flexibility.	maximize	\\(\\mathit{Role(c)\\)	\\(|\\mathit{role(c)|\\)	\\(\\mathit{count(\\mathit{role(c))\\)	\\(\\mathit{role(c)\\) returns the set of unique roles involved in case \\(c\\). \\\\
244	\N	role-count-group-of-cases-granularity-f-g	Role count (group of cases granularity)	2	3	Number of human resource roles that are involved in the execution of a group of cases.	Process where several roles are involved.	A greater number of roles involved in the execution of the process implies greater flexibility.	maximize	\\(\\mathit{Role(g)\\)	\\(|\\cup_{c \\in g} \\mathit{role(c)|\\)	\\(\\mathit{count(\\cup_{c \\in g} \\mathit{role(c))\\)	\\(\\mathit{role(c)\\) returns the set of unique roles involved in case \\(c\\). \\\\
245	\N	role-count-case-granularity-g-c	Role count (case granularity)	3	2	Number of human resource roles that are involved in the execution of a case.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{Role(c)\\)	\\(|\\mathit{role(c)|\\)	\\(\\mathit{count(\\mathit{role(c))\\)	$\\mathit{role(c)$ returns all roles involved in case $c$. \\\\
246	\N	role-count-group-of-cases-granularity-g-g	Role count (group of cases granularity)	3	3	Number of human resource roles that are involved in the execution of a group of cases.	Calculation of several other PPIs.	\N	\N	\\(\\mathit{Role(g)\\)	\\(|\\cup_{c \\in g} \\mathit{role(c)|\\)	\\(\\mathit{count(\\mathit{role(g))\\)	$\\mathit{role(g)$ returns the set of roles involved in group of cases \\(g\\). \\\\
247	\N	service-and-lead-time-ratio-activity-granularity-t-a	Service and Lead Time Ratio (activity granularity)	5	1	Ratio between the service time and the lead time of all instantiations of an activity in the event log.	Event log in which the difference between service time and lead time is of relevance.	Ratio between service time and lead time should be as large as possible.	maximize	\\(\\mathit{SLTR(a)\\)	\\(\\frac{\\mathit{ST(a)}{\\mathit{LT(a)}\\)	\\(\\frac{\\mathit{ST(a)}{\\mathit{LT(a)}\\)	\\(\\mathit{ST(a)\\) returns the total service time accumulated across all instances of activity \\(a\\).\n\\newline \\(\\mathit{LT(a)\\) returns the total lead time of activity \\(a\\). \\\\
248	\N	service-and-lead-time-ratio-case-granularity-t-c	Service and Lead Time Ratio (case granularity)	5	2	Ratio between the service time and the lead time of a case.	Event log in which the difference between service time and lead time is of relevance.	Ratio between service time and lead time should be as large as possible.	maximize	\\(\\mathit{SLTR(c)\\)	\\(\\frac{\\mathit{ST(c)}{\\mathit{LT(c)}\\)	\\(\\frac{\\mathit{ST(c)}{\\mathit{LT(c)}\\)	\\(\\mathit{ST(c)\\) returns the total service time of case \\(c\\).\n\\newline \\(\\mathit{LT(c)\\) returns the total lead time of case \\(c\\). \\\\
249	\N	service-and-lead-time-ratio-group-of-cases-granularity-t-g	Service and Lead Time Ratio (group of cases granularity)	5	3	Ratio between the service time and the lead time of all activity instances in a group of cases.	Event log in which the difference between service time and lead time is of relevance.	Ratio between service time and lead time should be as large as possible.	maximize	\\(\\mathit{SLTR(g)\\)	\\(\\frac{\\mathit{ST(g)}{\\mathit{LT(g)}\\)	\\(\\frac{\\mathit{ST(g)}{\\mathit{LT(g)}\\)	\\(\\mathit{ST(g)\\) returns the total service time accumulated across all cases in group \\(g\\).\n\\newline \\(\\mathit{LT(g)\\) returns the total lead time accumulated across all cases in group \\(g\\). \\\\
250	\N	service-and-lead-time-ratio-activity-instance-granularity-t-i	Service and Lead Time Ratio (activity instance granularity)	5	4	Ratio between the service time and the lead time of an activity instance.	Event log in which the difference between service time and lead time is of relevance.	Ratio between service time and lead time should be as large as possible.	maximize	\\(\\mathit{SLTR(i)\\)	\\(\\frac{\\mathit{ST(i)}{\\mathit{LT(i)}\\)	\\(\\frac{\\mathit{ST(i)}{\\mathit{LT(i)}\\)	\\(\\mathit{ST(i)\\) returns the service time of activity instance \\(i\\).\n\\newline \\(\\mathit{LT(i)\\) returns the lead time of activity instance \\(i\\). \\\\
251	\N	service-time-activity-granularity-t-a	Service Time (activity granularity)	5	1	Sum of elapsed time between the start and complete events of all instantiations of an activity in the event log.	Event log that contains lifecycle information for activity instances where the actual time spent executing them is of interest.	Minimizing service time is desirable.	minimize	\\(\\mathit{ST(a)\\)	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{ST(i)\\)	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{ST(i)\\)	\\(\\mathit{inst(a)\\) returns the set of all instances of activity \\(a\\).\n\\newline \\(\\mathit{ST(i)\\) returns the service time of activity instance \\(i\\). \\\\
252	\N	service-time-case-granularity-t-c	Service Time (case granularity)	5	2	Sum of elapsed time between the start and complete events of all activity instances of a case.	Event log that contains lifecycle information for activity instances where the actual time spent executing them is of interest.	Minimizing service time is desirable.	minimize	\\(\\mathit{ST(c)\\)	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{ST(i)\\)	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{ST(i)\\)	\\(\\mathit{inst(c)\\) returns the set of all activity instances in case \\(c\\).\n\\newline \\(\\mathit{ST(i)\\) returns the service time of activity instance \\(i\\). \\\\
253	\N	service-time-group-of-cases-granularity-t-g	Service Time (group of cases granularity)	5	3	Sum of elapsed time between the start and complete events of all activity instances of a group of cases.	Event log that contains lifecycle information for activity instances where the actual time spent executing them is of interest.	Minimizing service time is desirable.	minimize	\\(\\mathit{ST(g)\\)	\\(\\sum _{c \\in g} \\mathit{ST(c)\\)	\\(\\sum _{c \\in g} \\mathit{ST(c)\\)	\\(\\mathit{ST(c)\\) returns the total service time of case \\(c\\). \\\\
254	\N	service-time-activity-instance-granularity-t-i	Service Time (activity instance granularity)	5	4	Elapsed time between the start and complete events of an activity instance.	Event log that contains lifecycle information for activity instances where the actual time spent executing them is of interest.	Minimizing service time is desirable.	minimize	\\(\\mathit{ST(i)\\)	\\(\\mathit{ctime(i) - \\mathit{stime(i)\\)	\\(\\mathit{ctime(i) - \\mathit{stime(i)\\)	\\(\\mathit{ctime(i)\\) returns the completion timestamp of activity instance \\(i\\).\n\\newline \\(\\mathit{stime(i)\\) returns the start timestamp of activity instance \\(i\\). \\\\
255	\N	service-time-from-activity-a-to-activity-b-case-granularity-t-c	Service Time from activity A to activity B (case granularity)	5	2	Sum of elapsed time between the start and complete events of all activity instances of a case, which occur between the earliest instantiation of a specific activity, and the earliest instantiation of another specific activity that occurs after the former one, including both.	Event log is associated with a process in which the actual time spent executing a specific subprocess is of relevance.	Minimizing service time is desirable.	minimize	\\(\\mathit{STAB\\mathit{^{\\times(c, \\mathit{a, \\mathit{b)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{s, \\mathit{c, \\mathit{sc, \\mathit{w\\}\\)	\\(\\begin{cases} \\mathit{st\\mathit{^{\\times(x, y) & \\mathit{for~any \\  x \\in \\mathit{fi\\mathit{^{s(c, \\mathit{a) \\mathit{\\ and \\  y \\in \\mathit{fi\\mathit{^{sc(c, \\mathit{a, \\mathit{b)	\\(\\begin{cases} \\mathit{st(x, y) & \\mathit{for~any \\  x \\in \\mathit{fi\\mathit{^{s(c, \\mathit{a) \\mathit{\\ and \\  y \\in \\mathit{fi(c, \\mathit{a, \\mathit{b) \\\\ undefined & \\mathit{if \\  \\mathit{fi(c, \\mathit{a, \\mathit{b) = \\emptyset \\end{cases}\\)	\\(\\mathit{st\\) returns the service time between activity instance \\(x\\) and activity instance \\(y\\).\n\\newline \\(\\mathit{fi\\mathit{^{s\\) returns the set of first started instances of activity \\(\\mathit{a\\) in case \\(c\\).\n\\newline \\(\\mathit{fi\\) returns the set of first instances of activity \\(\\mathit{b\\) that occur after the first instance of \\(\\mathit{a\\) in case \\(c\\). \\\\
256	\N	service-time-from-activity-a-to-activity-b-group-of-cases-granularity-t-g	Service Time from activity A to activity B (group of cases granularity)	5	3	Sum of elapsed time between the start and complete events of all activity instances of every case belonging to a group of cases, which occur between the earliest instantiation of a specific activity, and the earliest instantiation of another specific activity that occurs after the former one, including both, within each case.	Event log is associated with a process in which the actual time spent executing a specific subprocess is of relevance.	Minimizing service time is desirable.	minimize	\\(\\mathit{STAB\\mathit{^{\\times(g, \\mathit{a, \\mathit{b)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{s, \\mathit{c, \\mathit{sc, \\mathit{w\\}\\)	\\(\\sum _{c \\in g} \\begin{cases}\n\\mathit{STAB\\mathit{^{\\times(c, \\mathit{a, \\mathit{b) & \\mathit{if \\  \\mathit{fi\\mathit{^{sc(c, \\mathit{a, \\mathit{b) \\neq \\emptyset \\\\ 0 & \\mathit{if \\  \\mathit{fi\\mathit{^{sc(c, \\mathit{a, \\mathit{b) = \\emptyset\n\\end{cases}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{s, \\mathit{c, \\mathit{sc, \\mathit{w\\}$. If $\\mathit{\\times = \\mathit{s$, then the function considers activity instances that were started within the start and end activity instances, i.e., it uses $\\mathit{STAB\\mathit{^{s$; if $\\mathit{\\times = \\mathit{c$, then the function considers activity instances that were completed within the start and end activity instances, i.e., it uses $\\mathit{STAB\\mathit{^{c$; if $\\mathit{\\times = \\mathit{sc$, then the function considers activity instances that were either started or completed within the start and end activity instances, i.e., it uses $\\mathit{STAB\\mathit{^{sc$; if $\\mathit{\\times = \\mathit{^{w$, then the function considers all activity instances that were active within the start and end activity instances, i.e., it uses $\\mathit{STAB\\mathit{^{w$.	\\(\\sum _{c \\in g} \\begin{cases} \\mathit{STAB(c, \\mathit{a, \\mathit{b) & \\mathit{if \\  \\mathit{fi(c, \\mathit{a, \\mathit{b) \\neq \\emptyset \\\\ 0 & \\mathit{if \\  \\mathit{fi(c, \\mathit{a, \\mathit{b) = \\emptyset \\end{cases}\\)	\\(\\mathit{STAB\\) returns the service time from activity \\(\\mathit{a\\) to activity \\(\\mathit{b\\) in case \\(c\\).\n\\newline \\(\\mathit{fi\\) returns the set of first instances of activity \\(\\mathit{b\\) that occur after the first instance of \\(\\mathit{a\\) in case \\(c\\). \\\\
289	\N	unwanted-activity-instance-count-group-of-cases-granularity-q-g	Unwanted activity Instance count (group of cases granularity)	4	3	Number of times that an unwanted activity is instantiated in a group of cases.	Event log that contains activities whose execution is unwanted.	Unwanted activities negatively affect the quality of the process.	minimize	\\(\\mathit{UIC(g)\\)	\\(\\sum _{c \\in g} \\mathit{UIC(c)\\)	\\(\\sum _{c \\in g} \\mathit{UIC(c)\\)	\\(\\mathit{UIC(c)\\) returns the unwanted activity instance count for case \\(c\\). \\\\
257	\N	successful-outcome-unit-count-activity-granularity-q-a	Successful outcome Unit Count (activity granularity)	4	1	Outcome units associated with all instantiations of an activity in the event log, after deducting those that were unsuccessfully completed.	Process where the outcome of activity instances, as well as whether they are successful or not, can be measured.	Maximizing the number of successful outcome units is desirable.	maximize	\\(\\mathit{SUC\\mathit{^{\\times(a)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{SUC\\mathit{^{\\times(i)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUC\\mathit{^{sum$.	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{SUC(i)\\)	\\(\\mathit{inst(a)\\) returns the set of all instances of activity \\(a\\).\n\\newline \\(\\mathit{SUC(i)\\) returns the successful outcome unit count of activity instance \\(i\\). \\\\
258	\N	successful-outcome-unit-count-case-granularity-q-c	Successful outcome Unit Count (case granularity)	4	2	Outcome units associated with all activity instances in a case, after deducting those that were unsuccessfully completed.	Process where the outcome of activity instances, as well as whether they are successful or not, can be measured.	Maximizing the number of successful outcome units is desirable.	maximize	\\(\\mathit{SUC\\mathit{^{\\times(c)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{SUC\\mathit{^{\\times(i)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUC\\mathit{^{sum$.	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{SUC(i)\\)	\\(\\mathit{inst(c)\\) returns the set of all activity instances in case \\(c\\).\n\\newline \\(\\mathit{SUC(i)\\) returns the successful outcome unit count of activity instance \\(i\\). \\\\
259	\N	successful-outcome-unit-count-group-of-cases-granularity-q-g	Successful outcome Unit Count (group of cases granularity)	4	3	Outcome units associated with all activity instances in a group of cases, after deducting those that were unsuccessfully completed.	Process where the outcome of activity instances, as well as whether they are successful or not, can be measured.	Maximizing the number of successful outcome units is desirable.	maximize	\\(\\mathit{SUC\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{c \\in G} \\mathit{SUC\\mathit{^{\\times(c)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUC\\mathit{^{sum$.	\\(\\sum _{c \\in G} \\mathit{SUC(c)\\)	\\(\\mathit{SUC(c)\\) returns the successful outcome unit count for case \\(c\\). \\\\
260	\N	successful-outcome-unit-count-activity-instance-granularity-q-i	Successful outcome Unit Count (activity instance granularity)	4	4	Outcome units associated with an activity instance, after deducting those that were unsuccessfully completed.	Process where the outcome of activity instances, as well as whether they are successful or not, can be measured.	Maximizing the number of successful outcome units is desirable.	maximize	\\(\\mathit{SUC\\mathit{^{\\times(i)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\begin{cases}\n\\mathit{U\\mathit{^{\\times(i) - #^{}_{\\mathit{uns}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{uns}(\\mathit{cpl(i)) \\neq \\bot	\\(\\begin{cases}\n\\mathit{U(i) - #^{}_{\\mathit{uns}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{uns}(\\mathit{cpl(i)) \\neq undefined \\\\\n\\mathit{U(i) & \\mathit{if \\  #^{}_{\\mathit{uns}(\\mathit{cpl(i)) = undefined \\\\\n\\end{cases}\\)	\\(\\mathit{U(i)\\) returns the outcome unit count of activity instance \\(i\\).\n\\newline \\(#^{}_{\\mathit{uns}\\) returns the unsuccessful outcome unit count associated with an event.\n\\newline \\(\\mathit{cpl(i)\\) returns the completion event of activity instance \\(i\\). \\\\
261	\N	successful-outcome-unit-percentage-activity-granularity-q-a	Successful outcome Unit Percentage (activity granularity)	4	1	Percentage of outcome units associated with all instantiations of an activity that are successfully completed.	Process where the outcome of activity instances, as well as whether they are successful or not, can be measured.	Maximizing the percentage of successful outcome units is desirable.	maximize	\\(\\mathit{SUP\\mathit{^{\\times(a)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{SUC\\mathit{^{\\times(a)}{\\mathit{U\\mathit{^{\\times(a)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUC\\mathit{^{sgl$ and $\\mathit{U\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUC\\mathit{^{sum$ and $\\mathit{U\\mathit{^{sum$.	\\(\\frac{\\mathit{SUC(a)}{\\mathit{U(a)}\\)	\\(\\mathit{SUC(a)\\) returns the successful outcome unit count of activity \\(a\\).\n\\newline \\(\\mathit{U(a)\\) returns the total outcome unit count of activity \\(a\\). \\\\
262	\N	successful-outcome-unit-percentage-case-granularity-q-c	Successful outcome Unit Percentage (case granularity)	4	2	Percentage of outcome units associated with all activity instances in a case that are successfully completed.	Process where the outcome of activity instances, as well as whether they are successful or not, can be measured.	Maximizing the percentage of successful outcome units is desirable.	maximize	\\(\\mathit{SUP\\mathit{^{\\times(c)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{SUC\\mathit{^{\\times(c)}{\\mathit{U\\mathit{^{\\times(c)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUC\\mathit{^{sgl$ and $\\mathit{U\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUC\\mathit{^{sum$ and $\\mathit{U\\mathit{^{sum$.	\\(\\frac{\\mathit{SUC(c)}{\\mathit{U(c)}\\)	\\(\\mathit{SUC(c)\\) returns the successful outcome unit count of case \\(c\\).\n\\newline \\(\\mathit{U(c)\\) returns the total outcome unit count of case \\(c\\). \\\\
263	\N	successful-outcome-unit-percentage-group-of-cases-granularity-q-g	Successful outcome Unit Percentage (group of cases granularity)	4	3	Percentage outcome units associated with all activity instances in a group of cases that are successfully completed.	Process where the outcome of activity instances, as well as whether they are successful or not, can be measured.	Maximizing the percentage of successful outcome units is desirable.	maximize	\\(\\mathit{SUP\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{SUC\\mathit{^{\\times(g)}{\\mathit{U\\mathit{^{\\times(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUC\\mathit{^{sgl$ and $\\mathit{U\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUC\\mathit{^{sum$ and $\\mathit{U\\mathit{^{sum$.	\\(\\frac{\\mathit{SUC(g)}{\\mathit{U(g)}\\)	\\(\\mathit{SUC(g)\\) returns the total successful outcome unit count of case group \\(g\\).\n\\newline \\(\\mathit{U(g)\\) returns the total outcome unit count of case group \\(g\\). \\\\
264	\N	successful-outcome-unit-percentage-activity-instance-granularity-q-i	Successful outcome Unit Percentage (activity instance granularity)	4	4	Percentage of outcome units associated with an activity instance that are successfully completed.	Process where the outcome of activity instances, as well as whether they are successful or not, can be measured.	Maximizing the percentage of successful outcome units is desirable.	maximize	\\(\\mathit{SUP\\mathit{^{\\times(i)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{SUC\\mathit{^{\\times(i)}{\\mathit{U\\mathit{^{\\times(i)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUC\\mathit{^{sgl$ and $\\mathit{U\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for outcome unit calculations, i.e., it uses $\\mathit{SUC\\mathit{^{sum$ and $\\mathit{U\\mathit{^{sum$.	\\(\\frac{\\mathit{SUC(i)}{\\mathit{U(i)}\\)	\\(\\mathit{SUC(i)\\) returns the successful outcome unit count of activity instance \\(i\\).\n\\newline \\(\\mathit{U(i)\\) returns the outcome unit count of activity instance \\(i\\). \\\\
265	\N	total-cost-activity-granularity-c-a	Total Cost (activity granularity)	1	1	Total cost associated with all instantiations of an activity in the event log.	Event log in which total cost information is recorded.	Minimizing total cost is desirable.	minimize	\\(\\mathit{TC\\mathit{^{\\times(a)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{TC\\mathit{^{\\times(i)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{TC(i)\\)	\\(\\mathit{inst(a)\\) returns the set of all instances of activity \\(a\\).\n\\newline \\(\\mathit{TC(i)\\) returns the total cost of activity instance \\(i\\). \\\\
266	\N	total-cost-case-granularity-c-c	Total Cost (case granularity)	1	2	Total cost associated with all activity instances of a case.	Event log in which total cost information is recorded.	Minimizing total cost is desirable.	minimize	\\(\\mathit{TC\\mathit{^{\\times(c)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{TC\\mathit{^{\\times(i)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{TC(i)\\)	\\(\\mathit{inst(c)\\) returns the set of all activity instances in case \\(c\\).\n\\newline \\(\\mathit{TC(i)\\) returns the total cost of activity instance \\(i\\). \\\\
267	\N	total-cost-group-of-cases-granularity-c-g	Total Cost (group of cases granularity)	1	3	Total cost associated with all activity instances of a group of cases.	Event log in which total cost information is recorded.	Minimizing total cost is desirable.	minimize	\\(\\mathit{TC\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{c \\in g} \\mathit{TC\\mathit{^{\\times(c)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\sum _{c \\in g} \\mathit{TC(c)\\)	\\(\\mathit{TC(c)\\) returns the total cost of case \\(c\\). \\\\
268	\N	total-cost-and-client-count-ratio-activity-granularity-q-a	Total Cost and Client count Ratio (activity granularity)	4	1	Ratio between the total cost associated with all instantiations of an activity in the event log, and the number of distinct clients associated with cases where an activity is instantiated in the event log.	Process is executed for different clients, where the event log contains cost information.	It is desirable to execute the specific activity for as many clients at the least cost.	minimize	\\(\\mathit{TCCliR\\mathit{^{\\times(a)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(a)}{\\mathit{Cli(a)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(a)}{\\mathit{Cli(a)}\\)	\\(\\mathit{TC(a)\\) returns the total cost of activity \\(a\\).\n\\newline \\(\\mathit{Cli(a)\\) returns the number of distinct clients involved in activity \\(a\\). \\\\
306	\N	warehousing-cost-case-granularity-c-c	Warehousing Cost (case granularity)	1	2	Warehousing cost associated with all activity instances of a case.	Process where the cost of warehousing is relevant.	Minimizing warehousing cost is desirable.	minimize	\\(\\mathit{WareC(c)\\)	\\(#^{}_{\\mathit{warec}(c)\\)	\\(#^{}_{\\mathit{warec}(c)\\)	\\(#^{}_{\\mathit{warec}\\) returns the warehousing cost associated with case \\(c\\). \\\\
269	\N	total-cost-and-client-count-ratio-group-of-cases-granularity-q-g	Total Cost and Client count Ratio (group of cases granularity)	4	3	Ratio between the total cost associated with all activity instances of a group of cases, and the number of distinct clients associated with cases in a group of cases.	Process is executed for different clients, where the event log contains cost information.	It is desirable to execute the process for as many clients at the least cost.	minimize	\\(\\mathit{TCCliR\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(g)}{\\mathit{Cli(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(g)}{\\mathit{Cli(g)}\\)	\\(\\mathit{TC(g)\\) returns the total cost of case group \\(g\\).\n\\newline \\(\\mathit{Cli(g)\\) returns the number of distinct clients associated with group \\(g\\). \\\\
270	\N	total-cost-and-lead-time-ratio-activity-granularity-c-a	Total Cost and Lead Time Ratio (activity granularity)	1	1	Ratio between the total cost associated with all instantiations of an activity in the event log, and the sum of lead time for all instantiations of an activity in the event log.	Event log in which the total cost in relation to the total time taken for conducting activity instances is of relevance.	Ratio between total cost and lead time should be as close to 0 as possible.	minimize	\\(\\mathit{TCLTR\\mathit{^{\\times(a)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(a)}{\\mathit{LT(a)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(a)}{\\mathit{LT(a)}\\)	\\(\\mathit{TC(a)\\) returns the total cost of activity \\(a\\).\n\\newline \\(\\mathit{LT(a)\\) returns the total lead time of activity \\(a\\). \\\\
271	\N	total-cost-and-lead-time-ratio-case-granularity-c-c	Total Cost and Lead Time Ratio (case granularity)	1	2	Ratio between the total cost of a case and the lead time of a case.	Event log in which the total cost in relation to the total time taken for conducting cases is of relevance.	Ratio between total cost and lead time should be as close to 0 as possible.	minimize	\\(\\mathit{TCLTR\\mathit{^{\\times(c)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(c)}{\\mathit{LT(c)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(c)}{\\mathit{LT(c)}\\)	\\(\\mathit{TC(c)\\) returns the total cost of case \\(c\\).\n\\newline \\(\\mathit{LT(c)\\) returns the total lead time of case \\(c\\). \\\\
272	\N	total-cost-and-lead-time-ratio-group-of-cases-granularity-c-g	Total Cost and Lead Time Ratio (group of cases granularity)	1	3	Ratio between the total cost of a group of cases and the lead time of a group of cases.	Event log in which the total cost in relation to the total time taken for conducting the cases of a group of cases is of relevance.	Ratio between total cost and lead time should be as close to 0 as possible.	minimize	\\(\\mathit{TCLTR\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(g)}{\\mathit{LT(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(g)}{\\mathit{LT(g)}\\)	\\(\\mathit{TC(g)\\) returns the total cost of case group \\(g\\).\n\\newline \\(\\mathit{LT(g)\\) returns the total lead time of case group \\(g\\). \\\\
273	\N	total-cost-and-lead-time-ratio-activity-instance-granularity-c-i	Total Cost and Lead Time Ratio (activity instance granularity)	1	4	Ratio between the total cost associated with an activity instance and the lead time of an activity instance.	Event log in which the total cost in relation to the total time taken for conducting activity instances is of relevance.	Ratio between total cost and lead time should be as close to 0 as possible.	minimize	\\(\\mathit{TCLTR\\mathit{^{\\times(i)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(i)}{\\mathit{LT(i)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(i)}{\\mathit{LT(i)}\\)	\\(\\mathit{TC(i)\\) returns the total cost of activity instance \\(i\\).\n\\newline \\(\\mathit{LT(i)\\) returns the lead time of activity instance \\(i\\). \\\\
279	\N	total-cost-and-service-time-ratio-case-granularity-c-c	Total Cost and Service Time Ratio (case granularity)	1	2	Ratio between the total cost of a case and the service time of a case.	Event log in which the total cost in relation to the time taken for conducting activity instances is of relevance.	Ratio between total cost and service time should be as close to 0 as possible.	minimize	\\(\\mathit{TCSTR\\mathit{^{\\times(c)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(c)}{\\mathit{ST(c)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(c)}{\\mathit{ST(c)}\\)	\\(\\mathit{TC(c)\\) returns the total cost of case \\(c\\).\n\\newline \\(\\mathit{ST(c)\\) returns the total service time of case \\(c\\). \\\\
274	\N	total-cost-and-outcome-unit-ratio-activity-granularity-c-a	Total Cost and outcome Unit Ratio (activity granularity)	1	1	Ratio between the total cost associated with all instantiations of an activity in the event log, and the outcome units associated with all instantiations of an activity in the event log.	Event log in which the total cost in relation to the outcome units of activity instances is of relevance.	Ratio between total cost and outcome unit count should be as close to 0 as possible.	minimize	\\(\\mathit{TCUR\\mathit{^{\\times(a)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(a)}{\\mathit{U\\mathit{^{\\times(a)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost and outcome unit calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$ and $\\mathit{U\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost and outcome unit calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$ and $\\mathit{U\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(a)}{\\mathit{U(a)}\\)	\\(\\mathit{TC(a)\\) returns the total cost of activity \\(a\\).\n\\newline \\(\\mathit{U(a)\\) returns the total outcome unit count of activity \\(a\\). \\\\
275	\N	total-cost-and-outcome-unit-ratio-case-granularity-c-c	Total Cost and outcome Unit Ratio (case granularity)	1	2	Ratio between the total cost associated with all activity instances of a case, and the outcome units associated with all activity instances of a case.	Event log in which the total cost in relation to the outcome units of cases is of relevance.	Ratio between total cost and outcome unit count should be as close to 0 as possible.	minimize	\\(\\mathit{TCUR\\mathit{^{\\times(c)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(c)}{\\mathit{U\\mathit{^{\\times(c)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost and outcome unit calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$ and $\\mathit{U\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost and outcome unit calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$ and $\\mathit{U\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(c)}{\\mathit{U(c)}\\)	\\(\\mathit{TC(c)\\) returns the total cost of case \\(c\\).\n\\newline \\(\\mathit{U(c)\\) returns the total outcome unit count of case \\(c\\). \\\\
276	\N	total-cost-and-outcome-unit-ratio-group-of-cases-granularity-c-g	Total Cost and outcome Unit Ratio (group of cases granularity)	1	3	Ratio between the total cost associated with all activity instances of a group of cases, and the outcome units associated with all activity instances of a group of cases.	Event log in which the total cost in relation to the outcome units of the cases of a group of cases is of relevance.	Ratio between total cost and outcome unit count should be as close to 0 as possible.	minimize	\\(\\mathit{TCUR\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(g)}{\\mathit{U\\mathit{^{\\times(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost and outcome unit calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$ and $\\mathit{U\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost and outcome unit calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$ and $\\mathit{U\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(g)}{\\mathit{U(g)}\\)	\\(\\mathit{TC(g)\\) returns the total cost of case group \\(g\\).\n\\newline \\(\\mathit{U(g)\\) returns the total outcome unit count of case group \\(g\\). \\\\
277	\N	total-cost-and-outcome-unit-ratio-activity-instance-granularity-c-i	Total Cost and outcome Unit Ratio (activity instance granularity)	1	4	Ratio between the total cost associated with an activity instance and the outcome units associated with an activity instance.	Event log in which the total cost in relation to the outcome units of activity instances is of relevance.	Ratio between total cost and outcome unit count should be as close to 0 as possible.	minimize	\\(\\mathit{TCUR\\mathit{^{\\times(i)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(i)}{\\mathit{U\\mathit{^{\\times(i)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost and outcome unit calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$ and $\\mathit{U\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost and outcome unit calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$ and $\\mathit{U\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(i)}{\\mathit{U(i)}\\)	\\(\\mathit{TC(i)\\) returns the total cost of activity instance \\(i\\).\n\\newline \\(\\mathit{U(i)\\) returns the outcome unit count of activity instance \\(i\\). \\\\
278	\N	total-cost-and-service-time-ratio-activity-granularity-c-a	Total Cost and Service Time Ratio (activity granularity)	1	1	Ratio between the total cost associated with all instantiations of an activity, and the sum of the service time of all instantiations of an activity.	Event log in which the total cost in relation to the time taken for conducting activity instances is of relevance.	Ratio between total cost and service time should be as close to 0 as possible.	minimize	\\(\\mathit{TCSTR\\mathit{^{\\times(a)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(a)}{\\mathit{ST(a)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(a)}{\\mathit{ST(a)}\\)	\\(\\mathit{TC(a)\\) returns the total cost of activity \\(a\\).\n\\newline \\(\\mathit{ST(a)\\) returns the total service time of activity \\(a\\). \\\\
288	\N	unwanted-activity-instance-count-case-granularity-q-c	Unwanted activity Instance count (case granularity)	4	2	Number of times that an unwanted activity is instantiated in a case.	Event log that contains activities whose execution is unwanted.	Unwanted activities negatively affect the quality of the process.	minimize	\\(\\mathit{UIC(c)\\)	\\(|\\{i \\in \\mathit{inst(c) \\mid \\mathit{act(i) \\in \\mathit{Unwl\\}|\\)	\\(\\displaystyle \\sum_{i \\in \\mathit{inst(c)}\n\\begin{cases}\n1 & \\text{if } \\mathit{act(i) \\in \\mathit{Unwl \\\\\n0 & \\text{otherwise}\n\\end{cases}\n\\)	\\(\\mathit{inst(c)\\) returns the set of all activity instances in case \\(c\\).\n\\newline \\(\\mathit{act(i)\\) returns the activity of activity instance \\(i\\).\n\\newline \\(\\mathit{Unwl\\) returns the set of unwanted activities. \\\\
280	\N	total-cost-and-service-time-ratio-group-of-cases-granularity-c-g	Total Cost and Service Time Ratio (group of cases granularity)	1	3	Ratio between the total cost of a group of cases, and the service time of a group of cases.	Event log in which the total cost in relation to the time taken for conducting activity instances is of relevance.	Ratio between total cost and service time should be as close to 0 as possible.	minimize	\\(\\mathit{TCSTR\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(g)}{\\mathit{ST(g)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(g)}{\\mathit{ST(g)}\\)	\\(\\mathit{TC(g)\\) returns the total cost of case group \\(g\\).\n\\newline \\(\\mathit{ST(g)\\) returns the total service time of case group \\(g\\). \\\\
281	\N	total-cost-and-service-time-ratio-activity-instance-granularity-c-i	Total Cost and Service Time Ratio (activity instance granularity)	1	4	Ratio between the total cost associated with an activity instance, and the service time of an activity instance.	Event log in which the total cost in relation to the time taken for conducting activity instances is of relevance.	Ratio between total cost and service time should be as close to 0 as possible.	minimize	\\(\\mathit{TCSTR\\mathit{^{\\times(i)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\frac{\\mathit{TC\\mathit{^{\\times(i)}{\\mathit{ST(i)}\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{TC\\mathit{^{sum$.	\\(\\frac{\\mathit{TC(i)}{\\mathit{ST(i)}\\)	\\(\\mathit{TC(i)\\) returns the total cost of activity instance \\(i\\).\n\\newline \\(\\mathit{ST(i)\\) returns the service time of activity instance \\(i\\). \\\\
282	\N	total-cost-considering-single-events-of-activity-instances-activity-instance-granularity-c-i	Total Cost considering single events of activity instances (activity instance granularity)	1	4	Total cost associated with an activity instance, measured as the latest recorded value among the events of an activity instance.	Event log in which total cost information is recorded.	Minimizing total cost is desirable.	minimize	\\(\\mathit{TC\\mathit{^{sgl(i)\\)	\\(\\begin{cases}\n#^{}_{\\mathit{tc}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{tc}(\\mathit{cpl(i)) \\neq \\bot	\\(\\begin{cases}\n#^{}_{\\mathit{tc}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{tc}(\\mathit{cpl(i)) \\neq undefined \\\\\n#^{}_{\\mathit{tc}(\\mathit{str(i)) & \\mathit{if \\  #^{}_{\\mathit{tc}(\\mathit{cpl(i)) = undefined \\land #^{}_{\\mathit{tc}(\\mathit{str(i)) \\neq undefined \\\\\nundefined & \\mathit{if \\  #^{}_{\\mathit{tc}(\\mathit{cpl(i)) = undefined \\land #^{}_{\\mathit{tc}(\\mathit{str(i)) = undefined \\\\\n\\end{cases}\\)	\\(#^{}_{\\mathit{tc}\\) returns the total cost associated with an event.\n\\newline \\(\\mathit{cpl(i)\\) returns the completion event of activity instance \\(i\\).\n\\newline \\(\\mathit{str(i)\\) returns the start event of activity instance \\(i\\). \\\\
283	\N	total-cost-considering-the-sum-of-all-events-of-activity-instances-activity-instance-granularity-c-i	Total Cost considering the sum of all events of activity instances (activity instance granularity)	1	4	Total cost associated with an activity instance, measured as the sum of all values among the events of an activity instance.	Event log in which total cost information is recorded.	Minimizing total cost is desirable.	minimize	\\(\\mathit{TC\\mathit{^{sum(i)\\)	\\(\\begin{cases}\n#^{}_{\\mathit{tc}(\\mathit{str(i)) + & \\\\ #^{}_{\\mathit{tc}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{tc}(\\mathit{cpl(i)) \\neq \\bot \\land #^{}_{\\mathit{tc}(\\mathit{str(i)) \\neq \\bot	\\(\\begin{cases}\n#^{}_{\\mathit{tc}(\\mathit{str(i)) + & \\\\ #^{}_{\\mathit{tc}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{tc}(\\mathit{cpl(i)) \\neq undefined \\land #^{}_{\\mathit{tc}(\\mathit{str(i)) \\neq undefined \\\\\nundefined & \\mathit{if \\  #^{}_{\\mathit{tc}(\\mathit{cpl(i)) = undefined \\lor #^{}_{\\mathit{tc}(\\mathit{str(i)) = undefined \\\\\n\\end{cases}\\)	\\(#^{}_{\\mathit{tc}\\) returns the total cost associated with an event.\n\\newline \\(\\mathit{str(i)\\) returns the start event of activity instance \\(i\\).\n\\newline \\(\\mathit{cpl(i)\\) returns the completion event of activity instance \\(i\\). \\\\
284	\N	transportation-cost-case-granularity-c-c	Transportation Cost (case granularity)	1	2	Transportation cost associated with a case.	Process where the cost of transportation is relevant.	Minimizing transportation cost is desirable.	minimize	\\(\\mathit{TransC(c)\\)	\\(#^{}_{\\mathit{transc}(c)\\)	\\(#^{}_{\\mathit{transc}(c)\\)	\\(#^{}_{\\mathit{transc}\\) returns the transportation cost associated with case \\(c\\). \\\\
285	\N	transportation-cost-group-of-cases-granularity-c-g	Transportation Cost (group of cases granularity)	1	3	Sum of transportation cost associated with all cases in a group of cases.	Process where the cost of transportation is relevant.	Minimizing transportation cost is desirable.	minimize	\\(\\mathit{TransC(g)\\)	\\(\\sum _{c \\in g} \\mathit{TransC(c)\\)	\\(\\sum _{c \\in g} \\mathit{TransC(c)\\)	\\(\\mathit{TransC(c)\\) returns the transportation cost for case \\(c\\). \\\\
286	\N	unwanted-activity-count-case-granularity-q-c	Unwanted Activity count (case granularity)	4	2	Number of unwanted activities that occur in a case.	Event log that contains activities whose execution is unwanted.	Unwanted activities negatively affect the quality of the process.	minimize	\\(\\mathit{UAC(c)\\)	\\(|\\mathit{Unwl \\cap \\mathit{act(c)|\\)	\\(\\displaystyle \\sum_{a \\in \\mathit{act(c)}\n\\begin{cases}\n1 & \\text{if } a \\in \\mathit{Unwl \\\\\n0 & \\text{otherwise}\n\\end{cases}\n\\)	\\(\\mathit{Unwl\\) returns the set of unwanted activities.\n\\newline \\(\\mathit{act(c)\\) returns the set of activities that occurred in case \\(c\\). \\\\
287	\N	unwanted-activity-count-group-of-cases-granularity-q-g	Unwanted Activity count (group of cases granularity)	4	3	Number of unwanted activities that occur in a group of cases.	Event log that contains activities whose execution is unwanted.	Unwanted activities negatively affect the quality of the process.	minimize	\\(\\mathit{UAC(g)\\)	\\(|\\mathit{Unwl \\cap (\\cup_{c \\in g} \\mathit{act(c))|\\)	\\(\\displaystyle \\sum_{a \\in (\\cup_{c \\in g} \\mathit{act(c))}\n\\begin{cases}\n1 & \\text{if } a \\in \\mathit{Unwl \\\\\n0 & \\text{otherwise}\n\\end{cases}\n\\)	\\(\\mathit{Unwl\\) returns the set of unwanted activities.\n\\newline \\(\\mathit{act(c)\\) returns the set of activities that occurred in case \\(c\\). \\\\
307	\N	warehousing-cost-group-of-cases-granularity-c-g	Warehousing Cost (group of cases granularity)	1	3	Warehousing cost associated with all activity instances of a group of cases.	Process where the cost of warehousing is relevant.	Minimizing warehousing cost is desirable.	minimize	\\(\\mathit{WareC(g)\\)	\\(\\sum _{c \\in g} \\mathit{WareC(c)\\)	\\(\\sum _{c \\in g} \\mathit{WareC(c)\\)	\\(\\mathit{WareC(c)\\) returns the warehousing cost for case \\(c\\). \\\\
290	\N	unwanted-activity-instance-percentage-case-granularity-q-c	Unwanted activity Instance Percentage (case granularity)	4	2	Percentage of times that an unwanted activity is instantiated in a case.	Event log that contains activities whose execution is unwanted.	Unwanted activities negatively affect the quality of the process.	minimize	\\(\\mathit{UIP(c)\\)	\\(\\frac{\\mathit{UIC(c)}{\\mathit{I(c)}\\)	\\(\\frac{\\mathit{UIC(c)}{\\mathit{I(c)}\\)	\\(\\mathit{UIC(c)\\) returns the unwanted activity instance count for case \\(c\\).\n\\newline \\(\\mathit{I(c)\\) returns the total number of activity instances in case \\(c\\). \\\\
291	\N	unwanted-activity-instance-percentage-group-of-cases-granularity-q-g	Unwanted activity Instance Percentage (group of cases granularity)	4	3	Percentage of times that an unwanted activity is instantiated in a group of cases.	Event log that contains activities whose execution is unwanted.	Unwanted activities negatively affect the quality of the process.	minimize	\\(\\mathit{UIP(g)\\)	\\(\\frac{\\mathit{UIC(g)}{\\mathit{I(g)}\\)	\\(\\frac{\\mathit{UIC(g)}{\\mathit{I(g)}\\)	\\(\\mathit{UIC(g)\\) returns the unwanted activity instance count for group \\(g\\).\n\\newline \\(\\mathit{I(g)\\) returns the total number of activity instances in group \\(g\\). \\\\
292	\N	unwanted-activity-percentage-case-granularity-q-c	Unwanted Activity Percentage (case granularity)	4	2	Percentage of unwanted activities that occur in a case.	Event log that contains activities whose execution is unwanted.	Unwanted activities negatively affect the quality of the process.	minimize	\\(\\mathit{UAP(c)\\)	\\(\\frac{\\mathit{UAC(c)}{\\mathit{A(c)}\\)	\\(\\frac{\\mathit{UAC(c)}{\\mathit{A(c)}\\)	\\(\\mathit{UAC(c)\\) returns the unwanted activity count for case \\(c\\).\n\\newline \\(\\mathit{A(c)\\) returns the number of unique activities in case \\(c\\). \\\\
293	\N	unwanted-activity-percentage-group-of-cases-granularity-q-g	Unwanted Activity Percentage (group of cases granularity)	4	3	Percentage of unwanted activities that occur in a group of cases.	Event log that contains activities whose execution is unwanted.	Unwanted activities negatively affect the quality of the process.	minimize	\\(\\mathit{UAP(g)\\)	\\(\\frac{\\mathit{UAC(g)}{\\mathit{A(g)}\\)	\\(\\frac{\\mathit{UAC(g)}{\\mathit{A(g)}\\)	\\(\\mathit{UAC(g)\\) returns the unwanted activity count for group \\(g\\).\n\\newline \\(\\mathit{A(g)\\) returns the number of unique activities in group \\(g\\). \\\\
294	\N	variable-cost-activity-granularity-c-a	Variable Cost (activity granularity)	1	1	Sum of variable cost of all instantiations of an activity in the event log.	Event log in which variable cost information is recorded.	Minimizing variable cost is desirable.	minimize	\\(\\mathit{VC\\mathit{^{\\times(a)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{VC\\mathit{^{\\times(i)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{VC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{VC\\mathit{^{sum$.	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{VC(i)\\)	\\(\\mathit{inst(a)\\) returns the set of all instances of activity \\(a\\).\n\\newline \\(\\mathit{VC(i)\\) returns the variable cost of activity instance \\(i\\). \\\\
295	\N	variable-cost-case-granularity-c-c	Variable Cost (case granularity)	1	2	Sum of variable cost of all activity instances of a case.	Event log in which variable cost information is recorded.	Minimizing variable cost is desirable.	minimize	\\(\\mathit{VC\\mathit{^{\\times(c)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{VC\\mathit{^{\\times(i)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{VC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{VC\\mathit{^{sum$.	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{VC(i)\\)	\\(\\mathit{inst(c)\\) returns the set of all activity instances in case \\(c\\).\n\\newline \\(\\mathit{VC(i)\\) returns the variable cost of activity instance \\(i\\). \\\\
296	\N	variable-cost-group-of-cases-granularity-c-g	Variable Cost (group of cases granularity)	1	3	Sum of variable cost of all activity instances of a group of cases.	Event log in which variable cost information is recorded.	Minimizing variable cost is desirable.	minimize	\\(\\mathit{VC\\mathit{^{\\times(g)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}\\)	\\(\\sum _{c \\in g} \\mathit{VC\\mathit{^{\\times(c)\\)\n\\newline \\newline The $\\mathit{\\times$ indicates that the PPI can take multiple forms, in this case, $\\mathit{\\times \\in \\{\\mathit{sgl, \\mathit{sum\\}$. If $\\mathit{\\times = \\mathit{sgl$, then the function considers single events of activity instances for cost calculations, i.e., it uses $\\mathit{VC\\mathit{^{sgl$; if $\\mathit{\\times = \\mathit{sum$, then the function considers the sum of all events of activity instances for cost calculations, i.e., it uses $\\mathit{VC\\mathit{^{sum$.	\\(\\sum _{c \\in g} \\mathit{VC(c)\\)	\\(\\mathit{VC(c)\\) returns the variable cost for case \\(c\\). \\\\
297	\N	variable-cost-considering-single-events-of-activity-instances-activity-instance-granularity-c-i	Variable Cost considering single events of activity instances (activity instance granularity)	1	4	Variable cost associated with an activity instance, measured as the latest recorded value among the events of the activity instance.	Event log in which variable cost information is recorded.	Minimizing variable cost is desirable.	minimize	\\(\\mathit{VC\\mathit{^{sgl(i)\\)	\\(\\begin{cases}\n#^{}_{\\mathit{vc}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{vc}(\\mathit{cpl(i)) \\neq \\bot	\\(\\begin{cases}\n#^{}_{\\mathit{vc}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{vc}(\\mathit{cpl(i)) \\neq undefined \\\\\n#^{}_{\\mathit{vc}(\\mathit{str(i)) & \\mathit{if \\  #^{}_{\\mathit{vc}(\\mathit{cpl(i)) = undefined \\land #^{}_{\\mathit{vc}(\\mathit{str(i)) \\neq undefined \\\\\nundefined & \\mathit{if \\  #^{}_{\\mathit{vc}(\\mathit{cpl(i)) = undefined \\land #^{}_{\\mathit{vc}(\\mathit{str(i)) = undefined \\\\\n\\end{cases}\\)	\\(#^{}_{\\mathit{vc}\\) returns the variable cost associated with an event.\n\\newline \\(\\mathit{cpl(i)\\) returns the completion event of activity instance \\(i\\).\n\\newline \\(\\mathit{str(i)\\) returns the start event of activity instance \\(i\\). \\\\
298	\N	variable-cost-considering-the-sum-of-all-events-of-activity-instances-activity-instance-granularity-c-i	Variable Cost considering the sum of all events of activity instances (activity instance granularity)	1	4	Variable cost associated with an activity instance, measured as the sum of all values among the events of the activity instance.	Event log in which variable cost information is recorded.	Minimizing variable cost is desirable.	minimize	\\(\\mathit{VC\\mathit{^{sum(i)\\)	\\(\\begin{cases}\n#^{}_{\\mathit{vc}(\\mathit{str(i)) + & \\\\ #^{}_{\\mathit{vc}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{vc}(\\mathit{cpl(i)) \\neq \\bot \\land #^{}_{\\mathit{vc}(\\mathit{str(i)) \\neq \\bot	\\(\\begin{cases}\n#^{}_{\\mathit{vc}(\\mathit{str(i)) + & \\\\ #^{}_{\\mathit{vc}(\\mathit{cpl(i)) & \\mathit{if \\  #^{}_{\\mathit{vc}(\\mathit{cpl(i)) \\neq undefined \\land #^{}_{\\mathit{vc}(\\mathit{str(i)) \\neq undefined \\\\\nundefined & \\mathit{if \\  #^{}_{\\mathit{vc}(\\mathit{cpl(i)) = undefined \\lor #^{}_{\\mathit{vc}(\\mathit{str(i)) = undefined \\\\\n\\end{cases}\\)	\\(#^{}_{\\mathit{vc}\\) returns the variable cost associated with an event.\n\\newline \\(\\mathit{str(i)\\) returns the start event of activity instance \\(i\\).\n\\newline \\(\\mathit{cpl(i)\\) returns the completion event of activity instance \\(i\\). \\\\
299	\N	variant-case-coverage-case-granularity-f-c	Variant Case Coverage (case granularity)	2	2	Percentage of cases in the event log that possess the same variant as a given case.	Process with several possible execution variants.	Smaller coverage implies that the case is executed with higher flexibility than other cases in the event log.	minimize	\\(\\mathit{VCC(c)\\)	\\(\\frac{|\\{c' \\in C \\mid \\exists tr \\in \\mathit{trace(c')[tr \\in \\mathit{trace(c)]\\}|}{|C|}\\)	\\(\\frac{\n\\sum_{c' \\in C}\n\\begin{cases}\n1 & \\text{if } \\exists tr \\in \\mathit{trace(c) \\land tr' \\in \\mathit{trace(c') [tr = tr'] \\\\\n0 & \\text{otherwise}\n\\end{cases}\n}{\\mathit{count(C)}\\)	$\\mathit{trace(c')$ returns the trace (sequence of activities) of case $c'$.\n\\newline $\\mathit{trace(c)$ returns the trace (sequence of activities) of case $c$.\n\\newline $\\mathit{count(C)$ returns the total number of cases in the event log. \\\\
300	\N	variant-case-coverage-group-of-cases-granularity-f-g	Variant Case Coverage (group of cases granularity)	2	3	Percentage of cases in the event log that possess the same variant as any case in a group of cases.	Process with several possible execution variants.	Smaller coverage implies that the cases in a group of cases have been executed with higher flexibility than other cases in the event log.	minimize	\\(\\mathit{VCC(g)\\)	\\(\\frac{|\\{c \\in C \\mid \\exists tr \\in \\mathit{trace(c)[tr \\in \\mathit{variants(g)]|}{|C|}\\)	\\(\\frac{\n\\sum_{c \\in C}\n\\begin{cases}\n1 & \\text{if } \\exists tr \\in \\mathit{trace(c) [tr \\in \\mathit{variants(g)] \\\\\n0 & \\text{otherwise}\n\\end{cases}\n}{\\mathit{count(C)}\\)	$\\mathit{trace(c)$ returns the trace (sequence of activities) of case $c$.\n\\newline $\\mathit{variants(g)$ returns the set of unique traces (variants) present in group $g$.\n\\newline $\\mathit{count(C)$ returns the total number of cases in the event log. \\\\
301	\N	variant-count-group-of-cases-granularity-f-g	Variant count (group of cases granularity)	2	3	Number of variants that are observed in a group of cases.	Process with several possible execution variants.	A greater number of variants implies greater flexibility.	maximize	\\(\\mathit{V(g)\\)	\\(|\\mathit{variants(g)|\\)	\\(\\mathit{count(\\mathit{variants(g))\\)	\\(\\mathit{variants(g)\\) returns the set of unique traces (variants) present in group \\(g\\). \\\\
302	\N	waiting-time-activity-granularity-t-a	Waiting Time (activity granularity)	5	1	Sum of elapsed time between the start event of an activity instance and the complete event of the activity instance that precedes it, for all the instantiations of a specific activity in the event log.	Event log in which the time spent between every activity instance is of relevance.	Minimizing waiting time is desirable.	minimize	\\(\\mathit{WT(a)\\)	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{WT(i)\\)	\\(\\sum _{i \\in \\mathit{inst(a)} \\mathit{WT(i)\\)	\\(\\mathit{inst(a)\\) returns the set of all instances of activity \\(a\\).\n\\newline \\(\\mathit{WT(i)\\) returns the waiting time of activity instance \\(i\\). \\\\
303	\N	waiting-time-case-granularity-t-c	Waiting Time (case granularity)	5	2	Sum of elapsed time between the start event of an activity instance and the complete event of the activity instance that precedes it, for all activity instances in a case.	Event log in which the waiting time between every activity instance is of relevance.	Minimizing waiting time is desirable.	minimize	\\(\\mathit{WT(c)\\)	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{WT(i)\\)	\\(\\sum _{i \\in \\mathit{inst(c)} \\mathit{WT(i)\\)	\\(\\mathit{inst(c)\\) returns the set of all activity instances in case \\(c\\).\n\\newline \\(\\mathit{WT(i)\\) returns the waiting time of activity instance \\(i\\). \\\\
304	\N	waiting-time-activity-instance-granularity-t-i	Waiting Time (activity instance granularity)	5	4	Elapsed time between the start event of an activity instance and the complete event of the activity instance that precedes it.	Event log in which the time spent between every activity instance is of relevance.	Minimizing waiting time is desirable.	minimize	\\(\\mathit{WT(i)\\)	\\(\\begin{cases}\n\\mathit{stime(i) - \\mathit{ctime(x) & \\mathit{for~any \\  x \\in \\mathit{prev(i)	\\(\\begin{cases} \\mathit{stime(i) - \\mathit{ctime(x) & \\mathit{for~any \\  x \\in \\mathit{prev(i) \\\\ 0 & \\mathit{if \\  \\mathit{prev(i) = \\emptyset \\end{cases}\\)	\\(\\mathit{stime(i)\\) returns the start timestamp of activity instance \\(i\\).\n\\newline \\(\\mathit{ctime(x)\\) returns the completion timestamp of activity instance \\(x\\).\n\\newline \\(\\mathit{prev(i)\\) returns the set of preceding activity instances to instance \\(i\\). \\\\
305	\N	waiting-time-from-activity-a-to-activity-b-case-granularity-t-c	Waiting Time from activity A to activity B (case granularity)	5	2	Sum of elapsed time between the start event of an activity instance and the complete event of the activity instance that precedes it, for all activity instances in a case that occur between the earliest instantiation of a specific activity and the earliest instantiation of another specific activity that occurs after the former one, including both.	Event log in which the time spent between every activity instance of a specific subprocess is of relevance.	Minimizing waiting time is desirable.	minimize	\\(\\mathit{WTAB\\mathit{^{\\times(c, \\mathit{a, \\mathit{b)\\)\n\\newline \\newline \\(\\mathit{\\times \\in \\{\\mathit{s, \\mathit{c, \\mathit{sc, \\mathit{w\\}\\)	\\(\\begin{cases} \\mathit{wt\\mathit{^{\\times(x, y) & \\mathit{for~any \\  x \\in \\mathit{fi\\mathit{^{s(c, \\mathit{a) \\mathit{\\ and \\  y \\in \\mathit{fi\\mathit{^{sc(c, \\mathit{a, \\mathit{b)	\\(\\begin{cases} \\mathit{wt(x, y) & \\mathit{for~any \\  x \\in \\mathit{fi\\mathit{^{s(c, \\mathit{a) \\mathit{\\ and \\  y \\in \\mathit{fi(c, \\mathit{a, \\mathit{b) \\\\ undefined & \\mathit{if \\  \\mathit{fi(c, \\mathit{a, \\mathit{b) = \\emptyset \\end{cases}\\)	\\(\\mathit{wt\\) returns the waiting time between activity instance \\(x\\) and activity instance \\(y\\).\n\\newline \\(\\mathit{fi\\mathit{^{s\\) returns the set of first started instances of activity \\(\\mathit{a\\) in case \\(c\\).\n\\newline \\(\\mathit{fi\\) returns the set of first instances of activity \\(\\mathit{b\\) that occur after the first instance of \\(\\mathit{a\\) in case \\(c\\). \\\\
\.


--
-- Data for Name: indicator_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.indicator_attribute (id_indicator, id_attribute) FROM stdin;
1	2
1	3
1	15
1	17
2	1
2	3
2	13
3	1
3	3
3	13
4	1
4	3
5	1
5	3
6	1
6	3
7	1
7	3
8	1
8	2
8	6
9	2
9	3
9	6
10	2
10	3
10	6
11	1
12	3
13	3
14	2
14	3
15	2
15	3
16	1
16	2
16	6
16	17
17	2
17	3
17	6
17	17
18	2
18	3
18	6
18	17
19	2
19	3
19	13
19	17
20	2
20	3
20	13
20	17
21	1
21	2
21	3
21	14
21	17
22	1
22	2
22	3
22	14
22	17
23	1
23	3
24	1
24	3
25	1
25	3
26	1
26	3
27	1
27	2
27	3
27	17
28	1
28	2
28	3
28	17
29	1
29	2
29	3
29	17
30	1
30	2
30	3
30	17
31	1
31	2
31	3
31	15
31	17
32	1
32	2
32	3
32	15
32	17
33	3
33	4
34	3
35	1
35	2
35	3
35	15
35	17
36	1
36	2
36	3
36	15
36	17
37	1
37	2
37	3
37	15
37	17
38	1
38	2
38	3
38	17
39	1
39	2
39	3
39	17
40	1
40	2
40	3
40	17
41	1
41	2
41	3
41	15
41	17
42	1
42	2
42	3
42	15
42	17
43	1
43	2
43	3
43	15
43	17
44	1
44	2
44	3
44	17
45	1
45	2
45	3
45	17
46	2
46	3
46	15
46	17
47	2
47	3
47	15
47	17
48	1
48	2
48	3
48	17
49	1
49	3
49	4
50	3
50	4
51	1
51	2
51	3
51	4
51	14
51	17
52	2
52	3
52	4
52	14
52	17
53	1
53	3
54	1
54	3
55	1
55	3
56	1
56	3
57	1
57	2
57	3
57	14
57	17
58	1
58	2
58	3
58	14
58	17
59	1
59	2
59	3
59	17
60	1
60	2
60	3
60	17
61	1
61	2
61	3
61	17
62	1
62	2
62	3
62	17
63	1
63	2
63	3
63	17
64	2
64	3
64	15
64	17
65	1
65	3
65	13
66	1
66	3
67	1
67	3
68	2
68	3
68	6
69	3
70	2
70	3
71	2
71	3
71	6
71	17
72	2
72	3
72	13
72	17
73	1
73	2
73	3
73	14
73	17
74	1
74	3
75	1
75	3
76	1
76	2
76	3
76	17
77	1
77	2
77	3
77	17
78	1
78	2
78	3
78	15
78	17
79	3
79	4
80	2
80	3
80	4
80	14
80	17
81	1
81	3
82	1
82	3
83	1
83	2
83	3
83	14
83	17
84	1
84	2
84	3
84	17
85	1
85	2
85	3
85	17
86	2
86	3
86	5
86	17
87	2
87	3
87	6
87	17
88	3
88	6
89	3
89	6
90	3
90	6
91	3
91	6
92	2
92	3
92	15
92	17
93	2
93	3
93	7
93	17
94	2
94	3
94	8
94	17
95	2
95	3
95	8
95	14
95	17
96	2
96	3
96	15
96	17
97	2
97	3
97	15
97	17
98	2
98	3
98	15
98	17
99	1
99	2
99	3
99	15
99	17
100	1
100	2
100	3
100	15
100	17
101	1
101	2
101	3
101	15
101	17
102	3
102	9
103	3
103	10
104	1
104	3
105	1
105	2
105	3
105	17
106	1
106	3
107	1
107	3
108	2
108	3
108	17
108	19
109	3
109	11
110	1
110	2
110	3
110	14
110	17
111	1
111	2
111	3
112	3
112	12
113	3
113	12
114	1
114	2
114	3
114	14
114	17
115	1
115	2
115	3
115	17
116	1
116	2
116	3
116	17
117	1
117	2
117	3
117	17
118	1
118	2
118	3
118	17
119	1
119	2
119	3
119	17
120	1
120	2
120	3
120	17
121	1
121	2
121	3
121	17
122	1
122	2
122	3
122	15
122	17
123	3
123	13
124	3
124	13
125	2
125	3
125	15
125	17
126	2
126	3
126	15
126	17
127	1
127	2
127	3
127	15
127	17
128	2
128	3
128	17
128	18
128	19
129	2
129	3
129	17
129	18
129	19
130	2
130	3
130	14
130	17
131	2
131	3
131	4
131	14
131	17
132	2
132	3
132	14
132	15
132	17
133	2
133	3
133	14
133	17
133	19
134	2
134	3
134	14
134	15
134	17
135	3
135	16
136	1
136	3
137	1
137	2
137	3
137	17
138	1
138	2
138	3
138	17
139	1
139	3
140	2
140	3
140	17
140	20
141	2
141	3
141	15
141	17
142	1
142	2
142	3
142	15
142	17
143	3
143	21
144	1
144	2
144	5
144	17
145	2
145	3
145	5
145	17
146	2
146	3
146	5
146	17
147	2
147	5
147	17
148	2
148	5
148	17
149	2
149	3
149	6
149	17
150	3
150	6
151	1
151	6
152	3
152	6
153	3
153	6
154	1
154	6
155	3
155	6
156	3
156	6
157	1
157	6
158	3
158	6
159	3
159	6
160	1
160	6
161	3
161	6
162	3
162	6
163	2
163	3
163	15
163	17
164	1
164	2
164	7
164	17
165	2
165	3
165	7
165	17
166	2
166	3
166	7
166	17
167	2
167	7
167	17
168	2
168	7
168	17
169	1
169	2
169	8
169	17
170	2
170	3
170	8
170	17
171	2
171	3
171	8
171	17
172	1
172	2
172	8
172	14
172	17
173	2
173	3
173	8
173	14
173	17
174	2
174	3
174	8
174	14
174	17
175	2
175	8
175	14
175	17
176	2
176	8
176	17
177	2
177	8
177	17
178	1
178	2
178	3
178	15
178	17
179	2
179	3
179	15
179	17
180	2
180	3
180	15
180	17
181	2
181	3
181	15
181	17
182	2
182	3
182	15
182	17
183	2
183	3
183	15
183	17
184	2
184	3
184	15
184	17
185	1
185	2
185	3
185	15
185	17
186	1
186	2
186	3
186	15
186	17
187	1
187	2
187	3
187	15
187	17
188	3
188	9
189	3
189	9
190	3
190	10
191	3
191	10
192	1
192	3
193	1
193	3
194	1
194	2
194	3
194	17
195	1
195	2
195	3
195	17
196	1
196	3
197	1
197	3
198	1
198	3
199	1
199	3
200	1
200	2
200	17
200	19
201	2
201	3
201	17
201	19
202	2
202	3
202	17
202	19
203	2
203	17
203	19
204	2
204	17
204	19
205	3
205	11
206	1
206	2
206	3
206	14
206	17
207	1
207	2
207	3
207	14
207	17
208	1
208	2
208	3
209	1
209	2
209	3
210	1
210	12
211	3
211	12
212	3
212	12
213	1
213	12
214	3
214	12
215	3
215	12
216	1
216	2
216	3
216	14
216	17
217	1
217	2
217	3
217	14
217	17
218	1
218	2
218	3
218	14
218	17
219	1
219	2
219	3
219	17
220	1
220	2
220	3
220	17
221	1
221	2
221	3
221	17
222	1
222	2
222	3
222	17
223	1
223	2
223	3
223	17
224	1
224	2
224	3
224	17
225	1
225	2
225	3
225	17
226	1
226	2
226	3
226	17
227	1
227	2
227	3
227	17
228	1
228	2
228	3
228	17
229	1
229	2
229	3
229	17
230	1
230	2
230	3
230	17
231	1
231	2
231	3
231	17
232	1
232	2
232	3
232	17
233	1
233	2
233	3
233	17
234	1
234	2
234	3
234	17
235	1
235	2
235	3
235	17
236	1
236	2
236	3
236	17
237	1
237	2
237	3
237	17
238	1
238	2
238	3
238	17
239	1
239	2
239	3
239	15
239	17
240	1
240	2
240	3
240	15
240	17
241	1
241	2
241	3
241	15
241	17
242	1
242	2
242	3
242	13
242	17
243	3
243	13
244	3
244	13
245	3
245	13
246	3
246	13
247	1
247	2
247	3
247	15
247	17
248	2
248	3
248	15
248	17
249	2
249	3
249	15
249	17
250	2
250	3
250	15
250	17
251	1
251	2
251	15
251	17
252	2
252	3
252	15
252	17
253	2
253	3
253	15
253	17
254	2
254	15
254	17
255	1
255	2
255	3
255	15
255	17
256	1
256	2
256	3
256	15
256	17
257	1
257	2
257	17
257	18
257	19
258	2
258	3
258	17
258	18
258	19
259	2
259	3
259	17
259	18
259	19
260	2
260	17
260	18
260	19
261	1
261	2
261	17
261	18
261	19
262	2
262	3
262	17
262	18
262	19
263	2
263	3
263	17
263	18
263	19
264	2
264	17
264	18
264	19
265	1
265	2
265	14
265	17
266	2
266	3
266	14
266	17
267	2
267	3
267	14
267	17
268	1
268	2
268	3
268	4
268	14
268	17
269	2
269	3
269	4
269	14
269	17
270	1
270	2
270	3
270	14
270	15
270	17
271	2
271	3
271	14
271	15
271	17
272	2
272	3
272	14
272	15
272	17
273	2
273	3
273	14
273	15
273	17
274	1
274	2
274	14
274	17
274	19
275	2
275	3
275	14
275	17
275	19
276	2
276	3
276	14
276	17
276	19
277	2
277	14
277	17
277	19
278	1
278	2
278	14
278	15
278	17
279	2
279	3
279	14
279	15
279	17
280	2
280	3
280	14
280	15
280	17
281	2
281	14
281	15
281	17
282	2
282	14
282	17
283	2
283	14
283	17
284	3
284	16
285	3
285	16
286	1
286	3
287	1
287	3
288	1
288	2
288	3
288	17
289	1
289	2
289	3
289	17
290	1
290	2
290	3
290	17
291	1
291	2
291	3
291	17
292	1
292	3
293	1
293	3
294	1
294	2
294	17
294	20
295	2
295	3
295	17
295	20
296	2
296	3
296	17
296	20
297	2
297	17
297	20
298	2
298	17
298	20
299	1
299	2
299	3
299	17
300	1
300	2
300	3
300	17
301	1
301	2
301	3
301	17
302	1
302	2
302	3
302	15
302	17
303	2
303	3
303	15
303	17
304	2
304	3
304	15
304	17
305	1
305	2
305	3
305	15
305	17
306	3
306	21
307	3
307	21
\.


--
-- Data for Name: indicator_parameter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.indicator_parameter (id_indicator, id_parameter, "position") FROM stdin;
1	7	1
2	7	1
3	9	1
4	7	1
5	9	1
6	7	1
7	9	1
8	5	1
9	7	1
10	9	1
11	5	1
12	7	1
13	9	1
14	7	1
15	9	1
16	5	1
16	10	2
17	7	1
17	10	2
18	9	1
18	10	2
19	7	1
19	12	2
20	9	1
20	12	2
21	7	1
21	1	2
22	9	1
22	1	2
23	7	1
23	1	2
24	9	1
24	1	2
25	7	1
25	1	2
26	9	1
26	1	2
27	7	1
27	1	2
28	9	1
28	1	2
29	7	1
29	1	2
30	9	1
30	1	2
31	7	1
31	1	2
32	9	1
32	1	2
33	9	1
34	9	1
35	9	1
35	5	2
35	8	3
36	9	1
36	5	2
36	13	3
37	9	1
37	5	2
37	8	3
37	13	4
38	9	1
38	5	2
39	9	1
39	5	2
40	9	1
41	9	1
41	5	2
41	8	3
42	9	1
42	5	2
42	13	3
43	9	1
43	5	2
43	8	3
43	13	4
44	9	1
44	5	2
45	9	1
45	5	2
46	9	1
46	15	2
47	9	1
47	15	2
48	9	1
49	5	1
50	9	1
51	5	1
52	9	1
53	7	1
53	3	2
54	9	1
54	3	2
55	7	1
55	3	2
56	9	1
56	3	2
57	7	1
57	2	2
58	9	1
58	2	2
59	7	1
60	9	1
61	5	1
62	7	1
63	9	1
64	9	1
65	9	1
66	9	1
67	9	1
68	9	1
69	9	1
70	9	1
71	9	1
71	10	2
72	9	1
72	12	2
73	9	1
73	1	2
74	9	1
74	1	2
75	9	1
75	1	2
76	9	1
76	1	2
77	9	1
77	1	2
78	9	1
78	1	2
79	9	1
80	9	1
81	9	1
81	3	2
82	9	1
82	3	2
83	9	1
83	2	2
84	9	1
85	9	1
86	9	1
87	9	1
88	9	1
89	9	1
90	9	1
91	9	1
92	9	1
93	9	1
94	9	1
95	9	1
96	9	1
97	9	1
97	15	2
98	9	1
98	15	2
99	9	1
99	5	2
100	9	1
100	6	2
100	5	3
101	9	1
101	5	2
102	9	1
103	9	1
104	9	1
104	1	2
105	9	1
105	1	2
106	9	1
107	9	1
108	9	1
109	9	1
110	9	1
110	2	2
111	9	1
112	9	1
113	9	1
114	9	1
115	9	1
116	9	1
117	9	1
117	15	2
118	9	1
118	14	2
119	9	1
120	9	1
121	9	1
121	15	2
122	9	1
123	9	1
124	9	1
125	9	1
126	9	1
127	9	1
127	6	2
127	5	3
128	9	1
129	9	1
130	9	1
131	9	1
132	9	1
133	9	1
134	9	1
135	9	1
136	9	1
136	4	2
137	9	1
137	4	2
138	9	1
138	4	2
139	9	1
139	4	2
140	9	1
141	9	1
142	9	1
142	6	2
142	5	3
143	9	1
144	5	1
145	7	1
146	9	1
147	11	1
148	11	1
149	7	1
150	9	1
151	5	1
152	7	1
153	9	1
154	5	1
155	7	1
156	9	1
157	5	1
158	7	1
159	9	1
160	5	1
161	7	1
162	9	1
163	7	1
164	5	1
165	7	1
166	9	1
167	11	1
168	11	1
169	5	1
170	7	1
171	9	1
172	5	1
173	7	1
174	9	1
175	11	1
176	11	1
177	11	1
178	5	1
179	7	1
180	9	1
181	11	1
182	9	1
183	7	1
183	15	2
184	7	1
184	15	2
185	7	1
185	5	2
186	7	1
186	6	2
186	5	3
187	7	1
187	5	2
188	7	1
189	9	1
190	7	1
191	9	1
192	7	1
192	1	2
193	9	1
193	1	2
194	7	1
194	1	2
195	9	1
195	1	2
196	7	1
197	9	1
198	7	1
199	9	1
200	5	1
201	7	1
202	9	1
203	11	1
204	11	1
205	7	1
206	7	1
206	2	2
207	9	1
207	2	2
208	7	1
209	9	1
210	5	1
211	7	1
212	9	1
213	5	1
214	7	1
215	9	1
216	5	1
217	7	1
218	9	1
219	5	1
220	7	1
221	9	1
222	5	1
223	7	1
224	9	1
225	5	1
225	15	2
226	7	1
226	15	2
227	9	1
227	15	2
228	7	1
228	14	2
229	9	1
229	14	2
230	5	1
231	7	1
232	9	1
233	5	1
234	7	1
235	9	1
236	5	1
236	15	2
237	7	1
237	15	2
238	9	1
238	15	2
239	5	1
240	7	1
241	9	1
242	9	1
243	7	1
244	9	1
245	7	1
246	9	1
247	5	1
248	7	1
249	9	1
250	11	1
251	5	1
252	7	1
253	9	1
254	11	1
255	7	1
255	6	2
255	5	3
256	9	1
256	6	2
256	5	3
257	5	1
258	7	1
259	9	1
260	11	1
261	5	1
262	7	1
263	9	1
264	11	1
265	5	1
266	7	1
267	9	1
268	5	1
269	9	1
270	5	1
271	7	1
272	9	1
273	11	1
274	5	1
275	7	1
276	9	1
277	11	1
278	5	1
279	7	1
280	9	1
281	11	1
282	11	1
283	11	1
284	7	1
285	9	1
286	7	1
286	4	2
287	9	1
287	4	2
288	7	1
288	4	2
289	9	1
289	4	2
290	7	1
290	4	2
291	9	1
291	4	2
292	7	1
292	4	2
293	9	1
293	4	2
294	5	1
295	7	1
296	9	1
297	11	1
298	11	1
299	7	1
300	9	1
301	9	1
302	5	1
303	7	1
304	11	1
305	7	1
305	6	2
305	5	3
306	7	1
307	9	1
\.


--
-- Data for Name: indicator_reference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.indicator_reference (id_indicator, id_reference) FROM stdin;
1	6
1	30
2	5
3	5
4	3
5	3
6	3
7	3
8	5
9	5
10	5
11	26
11	3
12	26
12	3
13	26
13	3
14	26
14	3
15	26
15	3
16	3
17	3
18	3
19	3
20	3
21	26
22	26
23	3
24	3
25	3
26	3
27	3
28	3
29	3
30	3
31	26
32	26
33	3
34	14
34	23
34	29
35	3
36	3
37	3
38	26
38	28
38	17
38	19
38	27
38	20
38	33
38	31
38	13
38	25
38	1
38	21
38	34
40	3
41	3
42	3
43	3
44	26
44	28
44	17
44	19
44	27
44	20
44	33
44	31
44	13
44	25
44	15
44	1
44	21
44	34
46	17
46	19
46	22
46	27
46	18
47	17
47	19
47	22
47	27
47	18
48	3
49	3
50	3
51	3
52	3
53	3
54	3
55	3
56	3
57	4
58	4
59	1
60	1
61	1
62	1
63	1
64	6
64	30
65	5
66	3
67	3
68	5
69	26
69	3
70	26
70	3
71	3
72	3
73	26
74	3
75	3
76	3
77	3
78	26
79	3
80	3
81	3
82	3
83	4
84	1
85	1
86	7
86	4
87	3
88	1
88	8
88	3
89	1
89	8
89	3
90	1
90	8
90	3
91	1
91	8
91	3
92	28
92	5
92	20
93	33
93	31
93	2
93	21
94	3
94	2
94	7
94	8
95	2
96	26
96	14
96	29
96	30
96	3
96	28
96	19
96	27
96	5
96	20
96	11
96	33
96	31
96	16
96	13
96	25
96	35
97	3
97	10
98	3
98	10
100	26
100	14
100	29
100	33
100	25
100	15
100	1
101	15
101	1
102	22
103	3
104	3
105	3
107	3
107	5
107	7
108	27
109	26
109	28
109	17
109	19
109	27
109	5
109	20
109	33
109	31
109	13
109	25
109	1
109	2
109	7
109	21
109	9
109	34
110	31
110	4
111	3
112	1
112	8
113	1
113	8
114	10
115	3
115	1
116	3
116	1
117	3
118	1
119	3
119	1
120	3
120	1
121	3
122	27
122	24
122	32
123	3
124	3
125	30
125	2
126	6
126	30
126	3
126	28
126	5
126	20
126	33
126	35
126	10
126	15
126	1
126	7
128	27
129	27
130	26
130	23
130	6
130	3
130	28
130	17
130	19
130	22
130	27
130	20
130	16
130	13
130	10
130	1
130	21
130	9
131	3
132	19
132	33
133	10
133	4
134	19
134	33
135	31
136	3
136	2
137	3
137	2
138	3
138	2
139	3
139	2
140	7
140	4
141	29
141	30
141	3
141	28
141	13
141	25
141	12
142	1
143	10
144	7
144	4
145	7
145	4
146	7
146	4
147	7
147	4
148	7
148	4
149	3
150	26
151	1
151	8
151	3
152	1
152	8
152	3
153	1
153	8
153	3
154	1
154	8
154	3
155	1
155	8
155	3
156	1
156	8
156	3
157	1
157	8
157	3
158	1
158	8
158	3
159	1
159	8
159	3
160	1
160	8
160	3
161	1
161	8
161	3
162	1
162	8
162	3
163	28
163	5
163	20
164	33
164	31
164	2
164	21
165	33
165	31
165	2
165	21
166	33
166	31
166	2
166	21
167	33
167	31
167	2
167	21
168	33
168	31
168	2
168	21
169	3
169	2
169	7
169	8
170	3
170	2
170	7
170	8
171	3
171	2
171	7
171	8
172	2
173	2
174	2
175	2
176	3
176	2
176	7
176	8
177	3
177	2
177	7
177	8
178	26
178	14
178	29
178	30
178	3
178	28
178	19
178	27
178	5
178	20
178	11
178	33
178	31
178	16
178	13
178	25
178	35
179	26
179	14
179	29
179	30
179	3
179	28
179	19
179	27
179	5
179	20
179	11
179	33
179	31
179	16
179	13
179	25
179	35
180	26
180	14
180	29
180	30
180	3
180	28
180	19
180	27
180	5
180	20
180	11
180	33
180	31
180	16
180	13
180	25
180	35
181	26
181	14
181	29
181	30
181	3
181	28
181	19
181	27
181	5
181	20
181	11
181	33
181	31
181	16
181	13
181	25
181	35
182	18
183	3
183	10
184	3
184	10
186	26
186	14
186	29
186	33
186	25
186	15
186	1
187	15
187	1
188	22
189	22
190	3
191	3
192	3
193	3
194	3
195	3
198	3
198	5
198	7
199	3
199	5
199	7
200	27
201	27
202	27
203	27
204	27
205	26
205	28
205	17
205	19
205	27
205	5
205	20
205	33
205	31
205	13
205	25
205	1
205	2
205	7
205	21
205	9
205	34
206	31
206	4
207	31
207	4
208	3
209	3
210	1
210	8
211	1
211	8
212	1
212	8
213	1
213	8
214	1
214	8
215	1
215	8
216	10
217	10
218	10
219	3
219	1
220	3
220	1
221	3
221	1
222	3
222	1
223	3
223	1
224	3
224	1
225	3
226	3
227	3
228	1
229	1
230	3
230	1
231	3
231	1
232	3
232	1
233	3
233	1
234	3
234	1
235	3
235	1
236	3
237	3
238	3
239	27
239	24
239	32
240	27
240	24
240	32
241	27
241	24
241	32
242	3
243	3
244	3
245	3
246	3
247	30
247	2
248	30
248	2
249	30
249	2
250	30
250	2
251	6
251	30
251	3
251	28
251	5
251	20
251	33
251	35
251	10
251	15
251	1
251	7
252	6
252	30
252	3
252	28
252	5
252	20
252	33
252	35
252	10
252	15
252	1
252	7
253	6
253	30
253	3
253	28
253	5
253	20
253	33
253	35
253	10
253	15
253	1
253	7
254	6
254	30
254	3
254	28
254	5
254	20
254	33
254	35
254	10
254	15
254	1
254	7
257	27
258	27
259	27
260	27
261	27
262	27
263	27
264	27
265	26
265	23
265	6
265	3
265	28
265	17
265	19
265	22
265	27
265	20
265	16
265	13
265	10
265	1
265	21
265	9
266	26
266	23
266	6
266	3
266	28
266	17
266	19
266	22
266	27
266	20
266	16
266	13
266	10
266	1
266	21
266	9
267	26
267	23
267	6
267	3
267	28
267	17
267	19
267	22
267	27
267	20
267	16
267	13
267	10
267	1
267	21
267	9
268	3
269	3
270	19
270	33
271	19
271	33
272	19
272	33
273	19
273	33
274	10
274	4
275	10
275	4
276	10
276	4
277	10
277	4
278	19
278	33
279	19
279	33
280	19
280	33
281	19
281	33
282	26
282	23
282	6
282	3
282	28
282	17
282	19
282	22
282	27
282	20
282	16
282	13
282	10
282	1
282	21
282	9
283	26
283	23
283	6
283	3
283	28
283	17
283	19
283	22
283	27
283	20
283	16
283	13
283	10
283	1
283	21
283	9
284	31
285	31
286	3
286	2
287	3
287	2
288	3
288	2
289	3
289	2
290	3
290	2
291	3
291	2
292	3
292	2
293	3
293	2
294	7
294	4
295	7
295	4
296	7
296	4
297	7
297	4
298	7
298	4
299	3
300	3
301	3
301	31
301	1
302	29
302	30
302	3
302	28
302	13
302	25
302	12
303	29
303	30
303	3
303	28
303	13
303	25
303	12
304	29
304	30
304	3
304	28
304	13
304	25
304	12
305	1
306	10
307	10
\.


--
-- Data for Name: parameter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parameter (id_parameter, symbol, name, domain, "constraint", parameter_type, description) FROM stdin;
1	Autl	list of automated activities	⊆ A	\N	extra_input	\N
2	DCl	list of direct cost activities	⊆ A	\N	extra_input	\N
3	Desl	list of desirable activities	⊆ A	\N	extra_input	\N
4	Unwl	list of unwanted activities	⊆ A	\N	extra_input	\N
5	a	activity	A	\N	extra_input	\N
6	b	activity (second)	A	\\mathit{a \\neq \\mathit{b	extra_input	\N
7	c	case	C	\\mathit{sub \\subseteq A \\colon; \\mathit{sub \\neq \\emptyset	required_attribute	\N
8	et	end timestamp	T	\\mathit{st < \\mathit{et	extra_input	\N
9	g	group of cases	⊆ C	g \\neq \\emptyset	required_attribute	\N
10	hr	human resource	U_hres	\N	extra_input	\N
11	i	activity instance	I	\N	required_attribute	\N
12	rl	role	U_role	\N	extra_input	\N
13	st	start timestamp	T	\N	extra_input	\N
14	sub	subset of activities	⊆ A	\N	extra_input	\N
15	val	numeric value	ℝ	\N	extra_input	\N
\.


--
-- Data for Name: reference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reference (id_reference, citation_key, authors, title, year, source) FROM stdin;
1	RN4125	Cho, Minsu and Song, Minseok and Park, Junhyun and Yeom, Seok-Ran and Wang, Il-Jae and Choi, Byung-Kwan	Process mining-supported emergency room process performance indicators	2020	International Journal of Environmental Research and Public Health
2	RN4131	Kis, Isabella and Bachhofner, Stefan and Di Ciccio, Claudio and Mendling, Jan	Towards a data-driven framework for measuring process performance	2017	International Workshop on Business Process Modeling, Development and Support, International Conference on Evaluation and Modeling Methods of Systems Analysis and Development
3	RN4134	van den Ingh, Lucas O.	Evaluating business process performance based on process mining	2016	Eindhoven University of Technology
4	RN4146	Karadgi, Sachin	A reference architecture for real-time performance measurement	2014	Springer
5	RN4150	de Kort, Jip	Business entity lifecycle modelling in simulation-aided analysis: A case study	2015	Eindhoven University of Technology
6	RN4153	Meier, Christoph and Browning, Tyson R and Yassine, Ali A and Walter, Ulrich	The cost of speed: Work policies for crashing and overlapping in product development projects	2015	IEEE Transactions on Engineering Management
7	RN4155	Haberberger, Nicole	Data linkage of internal sensor data with external data sources and analysis of generated relationships under usage of distributed systems	2019	Technische Universität Wien
8	RN4159	Berk, Joseph	Cost reduction and optimization for manufacturing and industrial companies	2010	John Wiley & Sons
9	RN4161	Lima Junior, Francisco Rodrigues and Carvalho, Giovani Mantovani Roza and Carpinetti, Luiz Cesar Ribeiro	A methodology based on fuzzy inference and SCOR® model for supplier performance evaluation	2016	Gestão & Produção
10	RN4162	Oman, Simon and Leskovar, Robert and Rosi, Bojan and Baggia, Alenka	Integration of MES and ERP in Supply Chains: Effect Assessment in the Case of the Automotive Industry	2017	Tehnicki vjesnik/Technical Gazette
11	RN4187	Bakx, Lonneke	The Final Order Problem for Non-Repairable Items at Vanderlande Industries	2010	Eindhoven University of Technology
12	RN4290	Rinaldi, Marta and Montanari, Roberto and Bottani, Eleonora	Improving the efficiency of public administrations through business process reengineering and simulation	2015	Business Process Management Journal
13	RN4291	Lehnert, Martin and Linhart, Alexander and Röglinger, Maximilian	Chopping down trees vs. sharpening the axe–Balancing the Development of BPM Capabilities with Process Improvement	2014	Business Process Management: 12th International Conference
14	RN4292	del-Río-Ortega, Adela and Resinas, Manuel and Cabanillas, Cristina and Ruiz-Cortés, Antonio	On the definition and design-time analysis of process performance indicators	2013	Information Systems
15	RN4293	Balaban, Neđo and Belić, Katarina and Gudelj, Marko	Business process performance management: Theoretical and methodological approach and implementation	2011	Management Information Systems
16	RN4294	Han, Kwan Hee and Choi, Sang Hyun and Kang, Jin Gu and Lee, Geon	Performance-centric business activity monitoring framework for continuous process improvement	2010	Proc. WSEAS
17	RN4295	Bosilj-Vuksic, Vesna and Milanovic, Ljubica and Indihar-Stemberger, Mojca	Organizational performance measures for business process management: A performance measurement guideline	2008	Tenth International Conference on Computer Modeling and Simulation
18	RN4296	Wetzstein, Branimir and Ma, Zhilei and Leymann, Frank	Towards measuring key performance indicators of semantic business processes	2008	11th International Conference on Business Information Systems
19	RN4297	Glavan, Ljubica Milanović	Understanding process performance measurement systems	2011	Business Systems Research: International journal of the Society for Advancing Innovation and Research in Economy
20	RN4298	Korherr, Birgit and List, Beate	Extending the EPC with performance measures	2007	Proceedings of the 2007 ACM symposium on Applied computing
21	RN4299	Herzog, Vujica	Performance measurement in business process re-engineering	2006	Strojniski Vestnik
22	RN4300	Kutucuoglu, KY and Hamali, J and Sharp, JM and Irani, Z	Enabling BPR in maintenance through a performance measurement system framework	2002	International Journal of Flexible Manufacturing Systems
23	RN4301	Jagdev, H and Bradley, P and Molloy, O	A QFD based performance measurement tool	1997	Computers in industry
24	RN4302	Mirsu, Diana Betina	Monitoring help desk process using KPI	2013	Soft Computing Applications: Proceedings of the 5th International Workshop Soft Computing Applications
25	RN4303	Pourshahid, Alireza and Amyot, Daniel and Peyton, Liam and Ghanavati, Sepideh and Chen, Pengfei and Weiss, Michael and Forster, Alan J	Business process management with the user requirements notation	2009	Electronic Commerce Research
26	RN4304	Longo, Antonella and Motta, Gianmario	Design processes for sustainable performances: a model and a method	2005	Business Process Management Workshops, International Conference on Business Process Management
27	RN4305	Vernadat, François and Shah, Liaqat and Etienne, Alain and Siadat, Ali	VR-PMS: a new approach for performance measurement and management of industrial systems	2013	International Journal of Production Research
28	RN4306	Chimhamhiwa, Dorman and van der Molen, Paul and Mutanga, Onisimo and Rugege, Denis	Towards a framework for measuring end to end performance of land administration business processes–A case study	2009	Computers, environment and urban systems
29	RN4307	Walsh, Paul	Finding key performance drivers: Some new tools	1996	Total Quality Management
30	RN4308	Fogarty, Donald W	Work in process: performance measures	1992	International Journal of Production Economics
31	RN4309	Gunasekaran, Angappa and Kobu, Bulent	Performance measures and metrics in logistics and supply chain management: a review of recent literature (1995–2004) for research and applications	2007	International journal of production research
32	RN4310	Wu, Hung-Yi	Constructing a strategy map for banking institutions with key performance indicators of the balanced scorecard	2012	Evaluation and program planning
33	RN4311	Bhagwat, Rajat and Sharma, Milind Kumar	Performance measurement of supply chain management: A balanced scorecard approach	2007	Computers & industrial engineering
34	RN4312	Spremic, Mario and Zmirak, Zlatan and Kraljevic, Krunoslav	IT and business process performance management: Case study of ITIL implementation in finance service industry	2008	30th International Conference on Information Technology Interfaces
35	RN4313	van Heck, Guido and van den Berg, Jan and Davarynejad, Mohsen and van Duin, Ron and Roskott, Björn	Improving inventory management performance using a process-oriented measurement framework	2010	International Conference on Enterprise Information Systems
\.


--
-- Data for Name: translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.translation (id_translation, command, latex_expansion, category, description) FROM stdin;
\.


--
-- Name: attribute_id_attribute_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attribute_id_attribute_seq', 21, true);


--
-- Name: dimension_id_dimension_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dimension_id_dimension_seq', 5, true);


--
-- Name: extra_input_id_extra_input_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.extra_input_id_extra_input_seq', 12, true);


--
-- Name: granularity_id_granularity_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.granularity_id_granularity_seq', 4, true);


--
-- Name: indicator_id_indicator_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.indicator_id_indicator_seq', 307, true);


--
-- Name: parameter_id_parameter_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parameter_id_parameter_seq', 15, true);


--
-- Name: reference_id_reference_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reference_id_reference_seq', 35, true);


--
-- Name: translation_id_translation_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.translation_id_translation_seq', 1, false);


--
-- Name: attribute attribute_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT attribute_name_key UNIQUE (name);


--
-- Name: attribute attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT attribute_pkey PRIMARY KEY (id_attribute);


--
-- Name: dimension dimension_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dimension
    ADD CONSTRAINT dimension_code_key UNIQUE (code);


--
-- Name: dimension dimension_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dimension
    ADD CONSTRAINT dimension_pkey PRIMARY KEY (id_dimension);


--
-- Name: extra_input extra_input_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extra_input
    ADD CONSTRAINT extra_input_pkey PRIMARY KEY (id_extra_input);


--
-- Name: granularity granularity_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.granularity
    ADD CONSTRAINT granularity_code_key UNIQUE (code);


--
-- Name: granularity granularity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.granularity
    ADD CONSTRAINT granularity_pkey PRIMARY KEY (id_granularity);


--
-- Name: indicator_attribute indicator_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator_attribute
    ADD CONSTRAINT indicator_attribute_pkey PRIMARY KEY (id_indicator, id_attribute);


--
-- Name: indicator_parameter indicator_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator_parameter
    ADD CONSTRAINT indicator_parameter_pkey PRIMARY KEY (id_indicator, id_parameter);


--
-- Name: indicator indicator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator
    ADD CONSTRAINT indicator_pkey PRIMARY KEY (id_indicator);


--
-- Name: indicator_reference indicator_reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator_reference
    ADD CONSTRAINT indicator_reference_pkey PRIMARY KEY (id_indicator, id_reference);


--
-- Name: indicator indicator_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator
    ADD CONSTRAINT indicator_slug_key UNIQUE (slug);


--
-- Name: parameter parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parameter
    ADD CONSTRAINT parameter_pkey PRIMARY KEY (id_parameter);


--
-- Name: reference reference_citation_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reference
    ADD CONSTRAINT reference_citation_key_key UNIQUE (citation_key);


--
-- Name: reference reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reference
    ADD CONSTRAINT reference_pkey PRIMARY KEY (id_reference);


--
-- Name: translation translation_command_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translation
    ADD CONSTRAINT translation_command_key UNIQUE (command);


--
-- Name: translation translation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translation
    ADD CONSTRAINT translation_pkey PRIMARY KEY (id_translation);


--
-- Name: extra_input extra_input_id_parameter_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extra_input
    ADD CONSTRAINT extra_input_id_parameter_fkey FOREIGN KEY (id_parameter) REFERENCES public.parameter(id_parameter);


--
-- Name: indicator_attribute indicator_attribute_id_attribute_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator_attribute
    ADD CONSTRAINT indicator_attribute_id_attribute_fkey FOREIGN KEY (id_attribute) REFERENCES public.attribute(id_attribute);


--
-- Name: indicator_attribute indicator_attribute_id_indicator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator_attribute
    ADD CONSTRAINT indicator_attribute_id_indicator_fkey FOREIGN KEY (id_indicator) REFERENCES public.indicator(id_indicator);


--
-- Name: indicator indicator_id_dimension_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator
    ADD CONSTRAINT indicator_id_dimension_fkey FOREIGN KEY (id_dimension) REFERENCES public.dimension(id_dimension);


--
-- Name: indicator indicator_id_granularity_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator
    ADD CONSTRAINT indicator_id_granularity_fkey FOREIGN KEY (id_granularity) REFERENCES public.granularity(id_granularity);


--
-- Name: indicator indicator_id_parent_indicator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator
    ADD CONSTRAINT indicator_id_parent_indicator_fkey FOREIGN KEY (id_parent_indicator) REFERENCES public.indicator(id_indicator);


--
-- Name: indicator_parameter indicator_parameter_id_indicator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator_parameter
    ADD CONSTRAINT indicator_parameter_id_indicator_fkey FOREIGN KEY (id_indicator) REFERENCES public.indicator(id_indicator);


--
-- Name: indicator_parameter indicator_parameter_id_parameter_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator_parameter
    ADD CONSTRAINT indicator_parameter_id_parameter_fkey FOREIGN KEY (id_parameter) REFERENCES public.parameter(id_parameter);


--
-- Name: indicator_reference indicator_reference_id_indicator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator_reference
    ADD CONSTRAINT indicator_reference_id_indicator_fkey FOREIGN KEY (id_indicator) REFERENCES public.indicator(id_indicator);


--
-- Name: indicator_reference indicator_reference_id_reference_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indicator_reference
    ADD CONSTRAINT indicator_reference_id_reference_fkey FOREIGN KEY (id_reference) REFERENCES public.reference(id_reference);


--
-- PostgreSQL database dump complete
--

