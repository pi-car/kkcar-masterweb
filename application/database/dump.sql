--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2015-08-07 20:15:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 190 (class 3079 OID 16640)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 190
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 16645)
-- Name: accounts; Type: TABLE; Schema: public; Owner: garikk; Tablespace: 
--

CREATE TABLE accounts (
    id integer NOT NULL,
    uuid text,
    login text,
    pass text
);


ALTER TABLE accounts OWNER TO garikk;

--
-- TOC entry 173 (class 1259 OID 16651)
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: garikk
--

CREATE SEQUENCE accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE accounts_id_seq OWNER TO garikk;

--
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 173
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: garikk
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- TOC entry 174 (class 1259 OID 16653)
-- Name: config_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE config_types (
    id integer NOT NULL,
    type text
);


ALTER TABLE config_types OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 16659)
-- Name: config_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE config_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config_types_id_seq OWNER TO postgres;

--
-- TOC entry 2119 (class 0 OID 0)
-- Dependencies: 175
-- Name: config_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE config_types_id_seq OWNED BY config_types.id;


--
-- TOC entry 176 (class 1259 OID 16661)
-- Name: configurations; Type: TABLE; Schema: public; Owner: garikk; Tablespace: 
--

CREATE TABLE configurations (
    id integer NOT NULL,
    uuid text,
    name text,
    description text,
    configuration json,
    stamp text,
    configurationtype integer,
    ownerconf integer,
    kkcar integer
);


ALTER TABLE configurations OWNER TO garikk;

--
-- TOC entry 177 (class 1259 OID 16667)
-- Name: configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: garikk
--

CREATE SEQUENCE configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE configurations_id_seq OWNER TO garikk;

--
-- TOC entry 2122 (class 0 OID 0)
-- Dependencies: 177
-- Name: configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: garikk
--

ALTER SEQUENCE configurations_id_seq OWNED BY configurations.id;


--
-- TOC entry 189 (class 1259 OID 24897)
-- Name: file_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE file_types (
    id integer NOT NULL,
    name text
);


ALTER TABLE file_types OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 24895)
-- Name: file_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE file_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE file_types_id_seq OWNER TO postgres;

--
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 188
-- Name: file_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE file_types_id_seq OWNED BY file_types.id;


--
-- TOC entry 187 (class 1259 OID 24841)
-- Name: files; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE files (
    id integer NOT NULL,
    url text,
    owner_conf integer,
    name text,
    version integer,
    filetype integer,
    owner_plugin integer
);


ALTER TABLE files OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 24839)
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE files_id_seq OWNER TO postgres;

--
-- TOC entry 2128 (class 0 OID 0)
-- Dependencies: 186
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE files_id_seq OWNED BY files.id;


--
-- TOC entry 178 (class 1259 OID 16669)
-- Name: kkcar; Type: TABLE; Schema: public; Owner: garikk; Tablespace: 
--

CREATE TABLE kkcar (
    id integer NOT NULL,
    name text,
    owner integer,
    vehicle integer,
    uuid text,
    activeconfiguration integer
);


ALTER TABLE kkcar OWNER TO garikk;

--
-- TOC entry 179 (class 1259 OID 16675)
-- Name: kkcar_id_seq; Type: SEQUENCE; Schema: public; Owner: garikk
--

CREATE SEQUENCE kkcar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kkcar_id_seq OWNER TO garikk;

--
-- TOC entry 2131 (class 0 OID 0)
-- Dependencies: 179
-- Name: kkcar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: garikk
--

ALTER SEQUENCE kkcar_id_seq OWNED BY kkcar.id;


--
-- TOC entry 180 (class 1259 OID 16677)
-- Name: liveinfo; Type: TABLE; Schema: public; Owner: garikk; Tablespace: 
--

CREATE TABLE liveinfo (
    id integer NOT NULL,
    kkcar_id integer,
    name text,
    "ODB_PID" integer,
    value double precision,
    "timestamp" timestamp with time zone
);


ALTER TABLE liveinfo OWNER TO garikk;

--
-- TOC entry 181 (class 1259 OID 16683)
-- Name: liveinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: garikk
--

CREATE SEQUENCE liveinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE liveinfo_id_seq OWNER TO garikk;

--
-- TOC entry 2134 (class 0 OID 0)
-- Dependencies: 181
-- Name: liveinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: garikk
--

ALTER SEQUENCE liveinfo_id_seq OWNED BY liveinfo.id;


--
-- TOC entry 182 (class 1259 OID 16685)
-- Name: plugins; Type: TABLE; Schema: public; Owner: garikk; Tablespace: 
--

CREATE TABLE plugins (
    id integer NOT NULL,
    uuid text,
    name text,
    description text,
    version integer
);


ALTER TABLE plugins OWNER TO garikk;

--
-- TOC entry 183 (class 1259 OID 16691)
-- Name: plugins_id_seq; Type: SEQUENCE; Schema: public; Owner: garikk
--

CREATE SEQUENCE plugins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plugins_id_seq OWNER TO garikk;

--
-- TOC entry 2137 (class 0 OID 0)
-- Dependencies: 183
-- Name: plugins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: garikk
--

ALTER SEQUENCE plugins_id_seq OWNED BY plugins.id;


--
-- TOC entry 185 (class 1259 OID 16731)
-- Name: system_state; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE system_state (
    id integer NOT NULL,
    name text,
    kkcontroller_version text,
    state integer,
    base_version text
);


ALTER TABLE system_state OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16729)
-- Name: system_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE system_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE system_state_id_seq OWNER TO postgres;

--
-- TOC entry 2140 (class 0 OID 0)
-- Dependencies: 184
-- Name: system_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE system_state_id_seq OWNED BY system_state.id;


--
-- TOC entry 1943 (class 2604 OID 16693)
-- Name: id; Type: DEFAULT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- TOC entry 1944 (class 2604 OID 16694)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY config_types ALTER COLUMN id SET DEFAULT nextval('config_types_id_seq'::regclass);


--
-- TOC entry 1945 (class 2604 OID 16695)
-- Name: id; Type: DEFAULT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY configurations ALTER COLUMN id SET DEFAULT nextval('configurations_id_seq'::regclass);


--
-- TOC entry 1951 (class 2604 OID 24900)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY file_types ALTER COLUMN id SET DEFAULT nextval('file_types_id_seq'::regclass);


--
-- TOC entry 1950 (class 2604 OID 24844)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY files ALTER COLUMN id SET DEFAULT nextval('files_id_seq'::regclass);


--
-- TOC entry 1946 (class 2604 OID 16696)
-- Name: id; Type: DEFAULT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY kkcar ALTER COLUMN id SET DEFAULT nextval('kkcar_id_seq'::regclass);


--
-- TOC entry 1947 (class 2604 OID 16697)
-- Name: id; Type: DEFAULT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY liveinfo ALTER COLUMN id SET DEFAULT nextval('liveinfo_id_seq'::regclass);


--
-- TOC entry 1948 (class 2604 OID 16698)
-- Name: id; Type: DEFAULT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY plugins ALTER COLUMN id SET DEFAULT nextval('plugins_id_seq'::regclass);


--
-- TOC entry 1949 (class 2604 OID 16734)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY system_state ALTER COLUMN id SET DEFAULT nextval('system_state_id_seq'::regclass);


--
-- TOC entry 2089 (class 0 OID 16645)
-- Dependencies: 172
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: garikk
--

COPY accounts (id, uuid, login, pass) FROM stdin;
1	ea8eaad7-317d-4735-b076-842dc9b0c75e\n	garikk	b40fd97e4e19cfa2d7996e82a0b62c8c31d89507
\.


--
-- TOC entry 2142 (class 0 OID 0)
-- Dependencies: 173
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: garikk
--

SELECT pg_catalog.setval('accounts_id_seq', 1, true);


--
-- TOC entry 2091 (class 0 OID 16653)
-- Dependencies: 174
-- Data for Name: config_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY config_types (id, type) FROM stdin;
1	MainConfiguration
2	PluginConfiguration
\.


--
-- TOC entry 2143 (class 0 OID 0)
-- Dependencies: 175
-- Name: config_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('config_types_id_seq', 2, true);


--
-- TOC entry 2093 (class 0 OID 16661)
-- Dependencies: 176
-- Data for Name: configurations; Type: TABLE DATA; Schema: public; Owner: garikk
--

COPY configurations (id, uuid, name, description, configuration, stamp, configurationtype, ownerconf, kkcar) FROM stdin;
5	b5b50412-c02a-4674-a112-ddc5805ea4e5	KKODB2ConnectorConf	KKODB2ConnectorConf	{"ODBAdapter":"ODB2_Emulator","RS232ConnectPort":"none","RS232Speed":0,"RS232AutoFind":false}	57e0cf11-e0b5-42fe-9ab9-f99c6208202d	2	1	1
4	7fbac0f7-6939-4380-bcb0-0ef8b1580fbf	KKLCDDisplayConf	KKLCDDisplayConf	{"ConfName":"Default config","DisplayPages":[{"PageName":"MAIN","HaveDynamicElements":true,"IsDefaultPage":false,"Features":["c01287e6-3e5c-48bb-9eae-680a20210531"],"HWDisplays":["DEBUG"],"UIFrameFiles":["kk_lcddisplay_uiframe_main_1.frame","kk_lcddisplay_uiframe_main_2.frame","kk_lcddisplay_uiframe_main_3.frame","kk_lcddisplay_uiframe_main_4.frame","kk_lcddisplay_uiframe_main_1.frame","kk_lcddisplay_uiframe_main_5.frame","kk_lcddisplay_uiframe_main_3.frame","kk_lcddisplay_uiframe_main_4.frame"]},{"PageName":"DETAIL","HaveDynamicElements":false,"IsDefaultPage":false,"Features":["c01287e6-3e5c-48bb-9eae-680a20210531"],"HWDisplays":["DEBUG"],"UIFrameFiles":["kk_lcddisplay_uiframe_detail_1.frame"]},{"PageName":"WAIT","HaveDynamicElements":false,"IsDefaultPage":true,"Features":["c01287e6-3e5c-48bb-9eae-680a20210531"],"HWDisplays":["DEBUG"],"UIFrameFiles":["kk_lcddisplay_uiframe_wait_1.frame"]},{"PageName":"ERROR","HaveDynamicElements":false,"IsDefaultPage":false,"Features":["c01287e6-3e5c-48bb-9eae-680a20210531"],"HWDisplays":["DEBUG"],"UIFrameFiles":["kk_lcddisplay_uiframe_error_1.frame"]},{"PageName":"SYSMENU_1","HaveDynamicElements":false,"IsDefaultPage":true,"Features":["00000000-0000-0000-0000-100000000000","00000000-0000-0000-0000-200000000001"],"HWDisplays":["DEBUG"],"UIFrameFiles":["kk_sysmenu_p1_uiframe_1.frame"]},{"PageName":"SYSMENU_VI","HaveDynamicElements":false,"IsDefaultPage":false,"Features":["00000000-0000-0000-0000-100000000000"],"HWDisplays":["DEBUG"],"UIFrameFiles":["kk_sysmenu_vi_uiframe_1.frame"]},{"PageName":"CE_READER","HaveDynamicElements":false,"IsDefaultPage":false,"Features":["00000000-0000-0000-0000-100000000000"],"HWDisplays":["DEBUG"],"UIFrameFiles":["kk_sysmenu_sett_uiframe_1.frame"]},{"PageName":"CE_READER","HaveDynamicElements":false,"IsDefaultPage":false,"Features":["c01287e6-3e5c-48bb-9eae-680a20210531"],"HWDisplays":["DEBUG"],"UIFrameFiles":["kk_ddisplay_cereader_uiframe_1.frame"]}],"HWDisplays":[{"HWDisplayName":"DEBUG","HWBoard":"DisplayDebug","HWDisplay":"HostDebug"}],"DefaultFeature":"00000000-0000-0000-0000-100000000000"}	ec65f6ce-24c8-4c79-bca7-e6660f967576	2	1	1
3	b5b50412-c02a-4674-a112-ddc5805ea4e5	KKDataDisplayConf	DataDisplayConf	{"FeatureID":"c01287e6-3e5c-48bb-9eae-680a20210531","Processors":[{"ProcessorName":"ODB_MAIN","ProcessorType":"PROC_BASIC_ODB2_DISPLAY","Pages":[{"PageName":"MAIN","PageCMD":"CHPROCESSOR CE_READER","DiagPIDs":[5,13]},{"PageName":"DETAIL","PageCMD":"CHPROCESSOR CE_READER","DiagPIDs":[5,66,13,12]}]},{"ProcessorName":"CE_READER","ProcessorType":"PROC_BASIC_ODB2_CEREADER","Pages":[{"PageName":"CE_READER","PageCMD":"CHPROCESSOR ODB_MAIN"}]},{"ProcessorName":"ERROR","ProcessorType":"PROC_BASIC_ODB2_ERROR","Pages":[{"PageName":"CE_READER","PageCMD":"CHPROCESSOR ODB_MAIN"}]},{"ProcessorName":"WAIT","ProcessorType":"PROC_BASIC_ODB2_WAIT","Pages":[{"PageName":"WAIT","PageCMD":""}]}]}	0abbdd8a-264e-4c1f-a6fa-0c7ec5d0a100	2	1	1
1	88f220f5-a666-4537-a5bc-96aeb620d9fd	Garikk's car configuration		{"ConfigurationUID":"88f220f5-a666-4537-a5bc-96aeb620d9fd","ConfigurationStamp":"201f7df6-bedc-4942-b295-bd98249e5513","Features":[{"FeatureName":"ODB Diag Displ","FeatureUUID":"c01287e6-3e5c-48bb-9eae-680a20210531","IsSystemFeature":false,"Connections":[{"ConnectionName":"ODB to Data Display processor","SourcePluginName":"KKODB2Reader","TargetPluginName":"KKDataDisplay","SourcePluginUID":"44b5dab1-f596-458a-b09b-d9565b91464e","TargetPluginUID":"b5b50412-c02a-4674-a112-ddc5805ea4e5","PinName":["PIN_KK_ODB2_DATA","PIN_KK_ODB2_RAW"],"Enabled":false},{"ConnectionName":"Data Display processor to ODB","SourcePluginName":"KKDataDisplay","TargetPluginName":"KKODB2Reader","SourcePluginUID":"b5b50412-c02a-4674-a112-ddc5805ea4e5","TargetPluginUID":"44b5dab1-f596-458a-b09b-d9565b91464e","PinName":["PIN_KK_ODB2_COMMAND"],"Enabled":false},{"ConnectionName":"Data Display processor to LED","SourcePluginName":"KKDataDisplay","TargetPluginName":"KKLEDDisplay","SourcePluginUID":"b5b50412-c02a-4674-a112-ddc5805ea4e5","TargetPluginUID":"7fbac0f7-6939-4380-bcb0-0ef8b1580fbf","PinName":["PIN_KK_LED_COMMAND","PIN_KK_LED_DATA"],"Enabled":false},{"ConnectionName":"LED to DataProcessor","SourcePluginName":"KKLEDDisplay","TargetPluginName":"KKDataDisplay","SourcePluginUID":"7fbac0f7-6939-4380-bcb0-0ef8b1580fbf","TargetPluginUID":"b5b50412-c02a-4674-a112-ddc5805ea4e5","PinName":["PIN_KK_LED_DATA"],"Enabled":false},{"ConnectionName":"Controls to DataProcessor","SourcePluginName":"KKControls","TargetPluginName":"KKDataDisplay","SourcePluginUID":"62d1026f-5297-4951-890d-61d75ae67d02","TargetPluginUID":"b5b50412-c02a-4674-a112-ddc5805ea4e5","PinName":["PIN_KK_CTRL_DATA"],"Enabled":false}],"MinVersion":0},{"FeatureName":"Version info","FeatureUUID":"00000000-0000-0000-0000-100000000002","IsSystemFeature":true,"MinVersion":0},{"FeatureName":"Settings","FeatureUUID":"00000000-0000-0000-0000-100000000001","IsSystemFeature":true,"MinVersion":0}],"SystemDisplay_UID":"7fbac0f7-6939-4380-bcb0-0ef8b1580fbf","SystemHID_UID":"62d1026f-5297-4951-890d-61d75ae67d02","SystemMenuItems":[{"DisplayName":"Settings","ItemCommand":"KK_SUBMENU","SubItems":[{"DisplayName":"Test Prm11","ItemCommand":""},{"DisplayName":"Test Prm12","ItemCommand":""},{"DisplayName":"Test Prm13","ItemCommand":""},{"DisplayName":"test submenu","ItemCommand":"KK_SUBMENU","SubItems":[{"DisplayName":"Test Prm21","ItemCommand":""},{"DisplayName":"Test Prm22","ItemCommand":""}]}]},{"DisplayName":"Board tools","ItemCommand":"KK_SUBMENU","SubItems":[{"DisplayName":"System Info","ItemCommand":"KKSYSCMD TOOLS BOARDINFO"},{"DisplayName":"Reboot","ItemCommand":"KKSYSCMD TOOLS REBOOT"},{"DisplayName":"Power Off","ItemCommand":"KKSYSCMD TOOLS POWEROFF"}]},{"DisplayName":"KK Info","ItemCommand":"KK_SUBMENU","SubItems":[{"DisplayName":"Plugins","ItemCommand":"KKSYSCMD INFO PLUGINS"},{"DisplayName":"Version","ItemCommand":"KKSYSCMD INFO VERSION"}]}]}	201f7df6-bedc-4942-b295-bd98249e5513	1	1	1
2	62d1026f-5297-4951-890d-61d75ae67d02	KKControlsConf	Controls plugin configuration	{"Adapters":[{"Name":"Raspberry","ID":"KK_RPI_Adapter","Type":"RaspberryPI_B"},{"Name":"Debug","ID":"DBG_Adapter","Type":"Debug"}],"Controls":[{"Name":"SelectUP","ID":"BTN_UP","AdapterID":"DBG_Adapter","AdapterSource":"3","Global":false,"FixedFeature":false},{"Name":"SelectDown","ID":"BTN_DOWN","AdapterID":"DBG_Adapter","AdapterSource":"12","Global":false,"FixedFeature":false},{"Name":"Enter","ID":"BTN_ENTER","AdapterID":"DBG_Adapter","AdapterSource":"13","Global":false,"FixedFeature":false},{"Name":"Back","ID":"BTN_BACK","AdapterID":"DBG_Adapter","AdapterSource":"14","Global":true,"FixedFeature":false}]}	21e0c350-515f-4207-8ab6-372b6d901020	2	1	1
\.


--
-- TOC entry 2144 (class 0 OID 0)
-- Dependencies: 177
-- Name: configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: garikk
--

SELECT pg_catalog.setval('configurations_id_seq', 5, true);


--
-- TOC entry 2106 (class 0 OID 24897)
-- Dependencies: 189
-- Data for Name: file_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY file_types (id, name) FROM stdin;
1	JarFile
2	ExternalConf
\.


--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 188
-- Name: file_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('file_types_id_seq', 1, false);


--
-- TOC entry 2104 (class 0 OID 24841)
-- Dependencies: 187
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY files (id, url, owner_conf, name, version, filetype, owner_plugin) FROM stdin;
1	https://github.com/Garikk/kkcar-controller/archive/0.9-testing.zip	\N	bintest.zip	1	1	3
2	https://github.com/Garikk/kkcar-controller/archive/0.9-testing.zip	\N	bintest2.zip	1	1	2
3	https://github.com/Garikk/kkcar-controller/archive/0.9-testing.zip	1	pluginconf2	1	2	\N
4	https://github.com/Garikk/kkcar-controller/archive/0.9-testing.zip	1	pluginbin	1	2	\N
\.


--
-- TOC entry 2146 (class 0 OID 0)
-- Dependencies: 186
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('files_id_seq', 2, true);


--
-- TOC entry 2095 (class 0 OID 16669)
-- Dependencies: 178
-- Data for Name: kkcar; Type: TABLE DATA; Schema: public; Owner: garikk
--

COPY kkcar (id, name, owner, vehicle, uuid, activeconfiguration) FROM stdin;
1	Garikk's Chrysler	1	1	2e2efd7b-ab83-42fa-9c00-2e45bb4b3ba1	1
\.


--
-- TOC entry 2147 (class 0 OID 0)
-- Dependencies: 179
-- Name: kkcar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: garikk
--

SELECT pg_catalog.setval('kkcar_id_seq', 1, true);


--
-- TOC entry 2097 (class 0 OID 16677)
-- Dependencies: 180
-- Data for Name: liveinfo; Type: TABLE DATA; Schema: public; Owner: garikk
--

COPY liveinfo (id, kkcar_id, name, "ODB_PID", value, "timestamp") FROM stdin;
\.


--
-- TOC entry 2148 (class 0 OID 0)
-- Dependencies: 181
-- Name: liveinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: garikk
--

SELECT pg_catalog.setval('liveinfo_id_seq', 1, false);


--
-- TOC entry 2099 (class 0 OID 16685)
-- Dependencies: 182
-- Data for Name: plugins; Type: TABLE DATA; Schema: public; Owner: garikk
--

COPY plugins (id, uuid, name, description, version) FROM stdin;
1	44b5dab1-f596-458a-b09b-d9565b91464e	KKODB2Reader	Basic ODB2 Reader	1
2	7fbac0f7-6939-4380-bcb0-0ef8b1580fbf	KKLEDDisplay	Basic LED Display	1
3	b5b50412-c02a-4674-a112-ddc5805ea4e5	KKDataDisplay	Simple ODB diag display processor	1
4	62d1026f-5297-4951-890d-61d75ae67d02	KKControls	hardware buttons plugin	1
5	10000000-0000-0000-0000-000000000000	KKController	KKController	1
\.


--
-- TOC entry 2149 (class 0 OID 0)
-- Dependencies: 183
-- Name: plugins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: garikk
--

SELECT pg_catalog.setval('plugins_id_seq', 5, true);


--
-- TOC entry 2102 (class 0 OID 16731)
-- Dependencies: 185
-- Data for Name: system_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY system_state (id, name, kkcontroller_version, state, base_version) FROM stdin;
1	Testing	0.9	1	0.9
2	Production	1.0	0	1.0
\.


--
-- TOC entry 2150 (class 0 OID 0)
-- Dependencies: 184
-- Name: system_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('system_state_id_seq', 1, true);


--
-- TOC entry 1953 (class 2606 OID 16700)
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: garikk; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 1955 (class 2606 OID 16702)
-- Name: config_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY config_types
    ADD CONSTRAINT config_types_pkey PRIMARY KEY (id);


--
-- TOC entry 1958 (class 2606 OID 16704)
-- Name: configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: garikk; Tablespace: 
--

ALTER TABLE ONLY configurations
    ADD CONSTRAINT configurations_pkey PRIMARY KEY (id);


--
-- TOC entry 1970 (class 2606 OID 24849)
-- Name: fk_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY files
    ADD CONSTRAINT fk_id PRIMARY KEY (id);


--
-- TOC entry 1968 (class 2606 OID 16740)
-- Name: id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY system_state
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- TOC entry 1974 (class 2606 OID 24905)
-- Name: k_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY file_types
    ADD CONSTRAINT k_id PRIMARY KEY (id);


--
-- TOC entry 1960 (class 2606 OID 16706)
-- Name: kkcar_pkey; Type: CONSTRAINT; Schema: public; Owner: garikk; Tablespace: 
--

ALTER TABLE ONLY kkcar
    ADD CONSTRAINT kkcar_pkey PRIMARY KEY (id);


--
-- TOC entry 1962 (class 2606 OID 16708)
-- Name: liveinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: garikk; Tablespace: 
--

ALTER TABLE ONLY liveinfo
    ADD CONSTRAINT liveinfo_pkey PRIMARY KEY (id);


--
-- TOC entry 1964 (class 2606 OID 16710)
-- Name: plugins_pkey; Type: CONSTRAINT; Schema: public; Owner: garikk; Tablespace: 
--

ALTER TABLE ONLY plugins
    ADD CONSTRAINT plugins_pkey PRIMARY KEY (id);


--
-- TOC entry 1966 (class 2606 OID 24879)
-- Name: plugins_uuid_key; Type: CONSTRAINT; Schema: public; Owner: garikk; Tablespace: 
--

ALTER TABLE ONLY plugins
    ADD CONSTRAINT plugins_uuid_key UNIQUE (uuid);


--
-- TOC entry 1956 (class 1259 OID 24877)
-- Name: FKI_kkcar; Type: INDEX; Schema: public; Owner: garikk; Tablespace: 
--

CREATE INDEX "FKI_kkcar" ON configurations USING btree (kkcar);


--
-- TOC entry 1971 (class 1259 OID 24855)
-- Name: fki_owconf; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_owconf ON files USING btree (owner_conf);


--
-- TOC entry 1972 (class 1259 OID 24911)
-- Name: fki_plugin; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_plugin ON files USING btree (owner_plugin);


--
-- TOC entry 1976 (class 2606 OID 24872)
-- Name: FK_kkcar; Type: FK CONSTRAINT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY configurations
    ADD CONSTRAINT "FK_kkcar" FOREIGN KEY (kkcar) REFERENCES kkcar(id);


--
-- TOC entry 1975 (class 2606 OID 16711)
-- Name: configurations_configurationtype_fkey; Type: FK CONSTRAINT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY configurations
    ADD CONSTRAINT configurations_configurationtype_fkey FOREIGN KEY (configurationtype) REFERENCES config_types(id);


--
-- TOC entry 1978 (class 2606 OID 24890)
-- Name: files_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_id_fkey FOREIGN KEY (id) REFERENCES configurations(id);


--
-- TOC entry 1979 (class 2606 OID 24906)
-- Name: fk_plugin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY files
    ADD CONSTRAINT fk_plugin FOREIGN KEY (owner_plugin) REFERENCES plugins(id);


--
-- TOC entry 1977 (class 2606 OID 16716)
-- Name: kkcar_ActiveConfiguration_fkey; Type: FK CONSTRAINT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY kkcar
    ADD CONSTRAINT "kkcar_ActiveConfiguration_fkey" FOREIGN KEY (activeconfiguration) REFERENCES configurations(id);


--
-- TOC entry 2113 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 172
-- Name: accounts; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON TABLE accounts FROM PUBLIC;
REVOKE ALL ON TABLE accounts FROM garikk;
GRANT ALL ON TABLE accounts TO garikk;


--
-- TOC entry 2117 (class 0 OID 0)
-- Dependencies: 173
-- Name: accounts_id_seq; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON SEQUENCE accounts_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE accounts_id_seq FROM garikk;
GRANT ALL ON SEQUENCE accounts_id_seq TO garikk;


--
-- TOC entry 2118 (class 0 OID 0)
-- Dependencies: 174
-- Name: config_types; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE config_types FROM PUBLIC;
REVOKE ALL ON TABLE config_types FROM postgres;
GRANT ALL ON TABLE config_types TO postgres;


--
-- TOC entry 2120 (class 0 OID 0)
-- Dependencies: 175
-- Name: config_types_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE config_types_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE config_types_id_seq FROM postgres;
GRANT ALL ON SEQUENCE config_types_id_seq TO postgres;


--
-- TOC entry 2121 (class 0 OID 0)
-- Dependencies: 176
-- Name: configurations; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON TABLE configurations FROM PUBLIC;
REVOKE ALL ON TABLE configurations FROM garikk;
GRANT ALL ON TABLE configurations TO garikk;


--
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 177
-- Name: configurations_id_seq; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON SEQUENCE configurations_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE configurations_id_seq FROM garikk;
GRANT ALL ON SEQUENCE configurations_id_seq TO garikk;


--
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 189
-- Name: file_types; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE file_types FROM PUBLIC;
REVOKE ALL ON TABLE file_types FROM postgres;
GRANT ALL ON TABLE file_types TO postgres;
GRANT ALL ON TABLE file_types TO kkcar_webservice;


--
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 188
-- Name: file_types_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE file_types_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE file_types_id_seq FROM postgres;
GRANT ALL ON SEQUENCE file_types_id_seq TO postgres;
GRANT ALL ON SEQUENCE file_types_id_seq TO kkcar_webservice;


--
-- TOC entry 2127 (class 0 OID 0)
-- Dependencies: 187
-- Name: files; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE files FROM PUBLIC;
REVOKE ALL ON TABLE files FROM postgres;
GRANT ALL ON TABLE files TO postgres;
GRANT ALL ON TABLE files TO kkcar_webservice;


--
-- TOC entry 2129 (class 0 OID 0)
-- Dependencies: 186
-- Name: files_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE files_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE files_id_seq FROM postgres;
GRANT ALL ON SEQUENCE files_id_seq TO postgres;
GRANT ALL ON SEQUENCE files_id_seq TO kkcar_webservice;


--
-- TOC entry 2130 (class 0 OID 0)
-- Dependencies: 178
-- Name: kkcar; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON TABLE kkcar FROM PUBLIC;
REVOKE ALL ON TABLE kkcar FROM garikk;
GRANT ALL ON TABLE kkcar TO garikk;


--
-- TOC entry 2132 (class 0 OID 0)
-- Dependencies: 179
-- Name: kkcar_id_seq; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON SEQUENCE kkcar_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE kkcar_id_seq FROM garikk;
GRANT ALL ON SEQUENCE kkcar_id_seq TO garikk;


--
-- TOC entry 2133 (class 0 OID 0)
-- Dependencies: 180
-- Name: liveinfo; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON TABLE liveinfo FROM PUBLIC;
REVOKE ALL ON TABLE liveinfo FROM garikk;
GRANT ALL ON TABLE liveinfo TO garikk;


--
-- TOC entry 2135 (class 0 OID 0)
-- Dependencies: 181
-- Name: liveinfo_id_seq; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON SEQUENCE liveinfo_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE liveinfo_id_seq FROM garikk;
GRANT ALL ON SEQUENCE liveinfo_id_seq TO garikk;


--
-- TOC entry 2136 (class 0 OID 0)
-- Dependencies: 182
-- Name: plugins; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON TABLE plugins FROM PUBLIC;
REVOKE ALL ON TABLE plugins FROM garikk;
GRANT ALL ON TABLE plugins TO garikk;


--
-- TOC entry 2138 (class 0 OID 0)
-- Dependencies: 183
-- Name: plugins_id_seq; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON SEQUENCE plugins_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE plugins_id_seq FROM garikk;
GRANT ALL ON SEQUENCE plugins_id_seq TO garikk;


--
-- TOC entry 2139 (class 0 OID 0)
-- Dependencies: 185
-- Name: system_state; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE system_state FROM PUBLIC;
REVOKE ALL ON TABLE system_state FROM postgres;
GRANT ALL ON TABLE system_state TO postgres;
GRANT ALL ON TABLE system_state TO kkcar_webservice;


--
-- TOC entry 2141 (class 0 OID 0)
-- Dependencies: 184
-- Name: system_state_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE system_state_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE system_state_id_seq FROM postgres;
GRANT ALL ON SEQUENCE system_state_id_seq TO postgres;
GRANT ALL ON SEQUENCE system_state_id_seq TO kkcar_webservice;


--
-- TOC entry 1607 (class 826 OID 16723)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON SEQUENCES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON SEQUENCES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO kkcar_webservice;


--
-- TOC entry 1609 (class 826 OID 16725)
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TYPES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TYPES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO kkcar_webservice;


--
-- TOC entry 1608 (class 826 OID 16724)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON FUNCTIONS  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON FUNCTIONS  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO kkcar_webservice;


--
-- TOC entry 1605 (class 826 OID 16721)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: garikk
--

ALTER DEFAULT PRIVILEGES FOR ROLE garikk IN SCHEMA public REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE garikk IN SCHEMA public REVOKE ALL ON TABLES  FROM garikk;
ALTER DEFAULT PRIVILEGES FOR ROLE garikk IN SCHEMA public GRANT ALL ON TABLES  TO PUBLIC;


--
-- TOC entry 1606 (class 826 OID 16722)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO kkcar_webservice;


-- Completed on 2015-08-07 20:15:40

--
-- PostgreSQL database dump complete
--

