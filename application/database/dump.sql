--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2015-09-04 20:11:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 209 (class 3079 OID 16640)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2231 (class 0 OID 0)
-- Dependencies: 209
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 194 (class 1259 OID 33086)
-- Name: odb_pids; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE odb_pids (
    id integer NOT NULL,
    manufacture integer,
    "PID" integer,
    descriptionlocal text,
    descriptionodb text,
    "PID_MODE" integer
);


ALTER TABLE odb_pids OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 33084)
-- Name: ODB_PID_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "ODB_PID_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ODB_PID_id_seq" OWNER TO postgres;

--
-- TOC entry 2233 (class 0 OID 0)
-- Dependencies: 193
-- Name: ODB_PID_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "ODB_PID_id_seq" OWNED BY odb_pids.id;


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
-- TOC entry 2236 (class 0 OID 0)
-- Dependencies: 173
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: garikk
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- TOC entry 208 (class 1259 OID 41330)
-- Name: confeditor_blockview; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE confeditor_blockview (
    id integer NOT NULL,
    configuration integer,
    plugin integer,
    x integer,
    y integer
);


ALTER TABLE confeditor_blockview OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 41328)
-- Name: confeditor_blockview_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE confeditor_blockview_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE confeditor_blockview_id_seq OWNER TO postgres;

--
-- TOC entry 2239 (class 0 OID 0)
-- Dependencies: 207
-- Name: confeditor_blockview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE confeditor_blockview_id_seq OWNED BY confeditor_blockview.id;


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
-- TOC entry 2242 (class 0 OID 0)
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
-- TOC entry 2245 (class 0 OID 0)
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
-- TOC entry 2248 (class 0 OID 0)
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
-- TOC entry 2251 (class 0 OID 0)
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
-- TOC entry 202 (class 1259 OID 41264)
-- Name: kkcar_commands; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kkcar_commands (
    id integer NOT NULL,
    kkcar integer,
    description text,
    command text,
    status integer,
    "timestamp" integer
);


ALTER TABLE kkcar_commands OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 41262)
-- Name: kkcar_commands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kkcar_commands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kkcar_commands_id_seq OWNER TO postgres;

--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 201
-- Name: kkcar_commands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kkcar_commands_id_seq OWNED BY kkcar_commands.id;


--
-- TOC entry 206 (class 1259 OID 41302)
-- Name: kkcar_confinfo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kkcar_confinfo (
    id integer NOT NULL,
    kkcar integer,
    carinfo text,
    currentconfig integer,
    configversion text,
    kkcontrollerversion text,
    osversion text,
    confstatus text,
    carstatus text,
    "timestamp" integer
);


ALTER TABLE kkcar_confinfo OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 41300)
-- Name: kkcar_confinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kkcar_confinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kkcar_confinfo_id_seq OWNER TO postgres;

--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 205
-- Name: kkcar_confinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kkcar_confinfo_id_seq OWNED BY kkcar_confinfo.id;


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
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 179
-- Name: kkcar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: garikk
--

ALTER SEQUENCE kkcar_id_seq OWNED BY kkcar.id;


--
-- TOC entry 204 (class 1259 OID 41286)
-- Name: kkcar_messages; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kkcar_messages (
    id integer NOT NULL,
    kkcar integer,
    message text,
    "timestamp" integer
);


ALTER TABLE kkcar_messages OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 41284)
-- Name: kkcar_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kkcar_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kkcar_messages_id_seq OWNER TO postgres;

--
-- TOC entry 2263 (class 0 OID 0)
-- Dependencies: 203
-- Name: kkcar_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kkcar_messages_id_seq OWNED BY kkcar_messages.id;


--
-- TOC entry 180 (class 1259 OID 16677)
-- Name: liveinfo; Type: TABLE; Schema: public; Owner: garikk; Tablespace: 
--

CREATE TABLE liveinfo (
    id integer NOT NULL,
    kkcar_id integer,
    name text,
    param_id integer,
    value double precision,
    "timestamp" timestamp with time zone
);


ALTER TABLE liveinfo OWNER TO garikk;

--
-- TOC entry 198 (class 1259 OID 33119)
-- Name: liveinfo_dtc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE liveinfo_dtc (
    id integer NOT NULL,
    dtc_val integer,
    "timestamp" integer,
    kkcar_id integer
);


ALTER TABLE liveinfo_dtc OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 33117)
-- Name: liveinfo_dtc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE liveinfo_dtc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE liveinfo_dtc_id_seq OWNER TO postgres;

--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 197
-- Name: liveinfo_dtc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE liveinfo_dtc_id_seq OWNED BY liveinfo_dtc.id;


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
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 181
-- Name: liveinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: garikk
--

ALTER SEQUENCE liveinfo_id_seq OWNED BY liveinfo.id;


--
-- TOC entry 192 (class 1259 OID 33079)
-- Name: liveinfo_request; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE liveinfo_request (
    id integer NOT NULL,
    configuration_id integer NOT NULL,
    "PID" integer,
    "interval" integer
);


ALTER TABLE liveinfo_request OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 33077)
-- Name: liveinfo_request_configuration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE liveinfo_request_configuration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE liveinfo_request_configuration_id_seq OWNER TO postgres;

--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 191
-- Name: liveinfo_request_configuration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE liveinfo_request_configuration_id_seq OWNED BY liveinfo_request.configuration_id;


--
-- TOC entry 190 (class 1259 OID 33075)
-- Name: liveinfo_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE liveinfo_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE liveinfo_request_id_seq OWNER TO postgres;

--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 190
-- Name: liveinfo_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE liveinfo_request_id_seq OWNED BY liveinfo_request.id;


--
-- TOC entry 196 (class 1259 OID 33095)
-- Name: manufacture; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE manufacture (
    id integer NOT NULL,
    name text
);


ALTER TABLE manufacture OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 33093)
-- Name: manufacture_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE manufacture_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE manufacture_id_seq OWNER TO postgres;

--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 195
-- Name: manufacture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE manufacture_id_seq OWNED BY manufacture.id;


--
-- TOC entry 199 (class 1259 OID 33123)
-- Name: odb_dtc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE odb_dtc (
    id integer NOT NULL,
    manufacture integer,
    dtc integer,
    descriptionlocal text,
    descriptionodb text
);


ALTER TABLE odb_dtc OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 33126)
-- Name: odb_dtc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE odb_dtc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE odb_dtc_id_seq OWNER TO postgres;

--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 200
-- Name: odb_dtc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE odb_dtc_id_seq OWNED BY odb_dtc.id;


--
-- TOC entry 182 (class 1259 OID 16685)
-- Name: plugins; Type: TABLE; Schema: public; Owner: garikk; Tablespace: 
--

CREATE TABLE plugins (
    id integer NOT NULL,
    uuid text,
    name text,
    description text,
    version integer,
    pins_in text,
    pins_out text
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
-- TOC entry 2283 (class 0 OID 0)
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
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 184
-- Name: system_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE system_state_id_seq OWNED BY system_state.id;


--
-- TOC entry 2005 (class 2604 OID 16693)
-- Name: id; Type: DEFAULT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- TOC entry 2023 (class 2604 OID 41333)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY confeditor_blockview ALTER COLUMN id SET DEFAULT nextval('confeditor_blockview_id_seq'::regclass);


--
-- TOC entry 2006 (class 2604 OID 16694)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY config_types ALTER COLUMN id SET DEFAULT nextval('config_types_id_seq'::regclass);


--
-- TOC entry 2007 (class 2604 OID 16695)
-- Name: id; Type: DEFAULT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY configurations ALTER COLUMN id SET DEFAULT nextval('configurations_id_seq'::regclass);


--
-- TOC entry 2013 (class 2604 OID 24900)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY file_types ALTER COLUMN id SET DEFAULT nextval('file_types_id_seq'::regclass);


--
-- TOC entry 2012 (class 2604 OID 24844)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY files ALTER COLUMN id SET DEFAULT nextval('files_id_seq'::regclass);


--
-- TOC entry 2008 (class 2604 OID 16696)
-- Name: id; Type: DEFAULT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY kkcar ALTER COLUMN id SET DEFAULT nextval('kkcar_id_seq'::regclass);


--
-- TOC entry 2020 (class 2604 OID 41267)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kkcar_commands ALTER COLUMN id SET DEFAULT nextval('kkcar_commands_id_seq'::regclass);


--
-- TOC entry 2022 (class 2604 OID 41305)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kkcar_confinfo ALTER COLUMN id SET DEFAULT nextval('kkcar_confinfo_id_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 41289)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kkcar_messages ALTER COLUMN id SET DEFAULT nextval('kkcar_messages_id_seq'::regclass);


--
-- TOC entry 2009 (class 2604 OID 16697)
-- Name: id; Type: DEFAULT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY liveinfo ALTER COLUMN id SET DEFAULT nextval('liveinfo_id_seq'::regclass);


--
-- TOC entry 2018 (class 2604 OID 33122)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY liveinfo_dtc ALTER COLUMN id SET DEFAULT nextval('liveinfo_dtc_id_seq'::regclass);


--
-- TOC entry 2014 (class 2604 OID 33082)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY liveinfo_request ALTER COLUMN id SET DEFAULT nextval('liveinfo_request_id_seq'::regclass);


--
-- TOC entry 2015 (class 2604 OID 33083)
-- Name: configuration_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY liveinfo_request ALTER COLUMN configuration_id SET DEFAULT nextval('liveinfo_request_configuration_id_seq'::regclass);


--
-- TOC entry 2017 (class 2604 OID 33098)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manufacture ALTER COLUMN id SET DEFAULT nextval('manufacture_id_seq'::regclass);


--
-- TOC entry 2019 (class 2604 OID 33128)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY odb_dtc ALTER COLUMN id SET DEFAULT nextval('odb_dtc_id_seq'::regclass);


--
-- TOC entry 2016 (class 2604 OID 33089)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY odb_pids ALTER COLUMN id SET DEFAULT nextval('"ODB_PID_id_seq"'::regclass);


--
-- TOC entry 2010 (class 2604 OID 16698)
-- Name: id; Type: DEFAULT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY plugins ALTER COLUMN id SET DEFAULT nextval('plugins_id_seq'::regclass);


--
-- TOC entry 2011 (class 2604 OID 16734)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY system_state ALTER COLUMN id SET DEFAULT nextval('system_state_id_seq'::regclass);


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 193
-- Name: ODB_PID_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"ODB_PID_id_seq"', 1, true);


--
-- TOC entry 2187 (class 0 OID 16645)
-- Dependencies: 172
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: garikk
--

COPY accounts (id, uuid, login, pass) FROM stdin;
1	ea8eaad7-317d-4735-b076-842dc9b0c75e\n	garikk	b40fd97e4e19cfa2d7996e82a0b62c8c31d89507
\.


--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 173
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: garikk
--

SELECT pg_catalog.setval('accounts_id_seq', 1, true);


--
-- TOC entry 2223 (class 0 OID 41330)
-- Dependencies: 208
-- Data for Name: confeditor_blockview; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY confeditor_blockview (id, configuration, plugin, x, y) FROM stdin;
\.


--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 207
-- Name: confeditor_blockview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('confeditor_blockview_id_seq', 1, false);


--
-- TOC entry 2189 (class 0 OID 16653)
-- Dependencies: 174
-- Data for Name: config_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY config_types (id, type) FROM stdin;
1	MainConfiguration
2	PluginConfiguration
\.


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 175
-- Name: config_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('config_types_id_seq', 2, true);


--
-- TOC entry 2191 (class 0 OID 16661)
-- Dependencies: 176
-- Data for Name: configurations; Type: TABLE DATA; Schema: public; Owner: garikk
--

COPY configurations (id, uuid, name, description, configuration, stamp, configurationtype, ownerconf, kkcar) FROM stdin;
5	b5b50412-c02a-4674-a112-ddc5805ea4e5	KKODB2ConnectorConf	KKODB2ConnectorConf	{"ODBAdapter":"ODB2_Emulator","RS232ConnectPort":"none","RS232Speed":0,"RS232AutoFind":false}	57e0cf11-e0b5-42fe-9ab9-f99c6208202d	2	1	1
4	7fbac0f7-6939-4380-bcb0-0ef8b1580fbf	KKLCDDisplayConf	KKLCDDisplayConf	{"ConfName":"Default config","DisplayPages":[{"PageName":"MAIN","HaveDynamicElements":true,"IsDefaultPage":false,"Features":["c01287e6-3e5c-48bb-9eae-680a20210531"],"HWDisplays":["DEBUG"],"UIFrameFiles":["kk_lcddisplay_uiframe_main_1.frame","kk_lcddisplay_uiframe_main_2.frame","kk_lcddisplay_uiframe_main_3.frame","kk_lcddisplay_uiframe_main_4.frame","kk_lcddisplay_uiframe_main_1.frame","kk_lcddisplay_uiframe_main_5.frame","kk_lcddisplay_uiframe_main_3.frame","kk_lcddisplay_uiframe_main_4.frame"]},{"PageName":"DETAIL","HaveDynamicElements":false,"IsDefaultPage":false,"Features":["c01287e6-3e5c-48bb-9eae-680a20210531"],"HWDisplays":["DEBUG"],"UIFrameFiles":["kk_lcddisplay_uiframe_detail_1.frame"]},{"PageName":"WAIT","HaveDynamicElements":false,"IsDefaultPage":true,"Features":["c01287e6-3e5c-48bb-9eae-680a20210531"],"HWDisplays":["DEBUG"],"UIFrameFiles":["kk_lcddisplay_uiframe_wait_1.frame"]},{"PageName":"ERROR","HaveDynamicElements":false,"IsDefaultPage":false,"Features":["c01287e6-3e5c-48bb-9eae-680a20210531"],"HWDisplays":["DEBUG"],"UIFrameFiles":["kk_lcddisplay_uiframe_error_1.frame"]},{"PageName":"SYSMENU_1","HaveDynamicElements":false,"IsDefaultPage":true,"Features":["00000000-0000-0000-0000-100000000000","00000000-0000-0000-0000-200000000001"],"HWDisplays":["DEBUG"],"UIFrameFiles":["kk_sysmenu_p1_uiframe_1.frame"]},{"PageName":"SYSMENU_VI","HaveDynamicElements":false,"IsDefaultPage":false,"Features":["00000000-0000-0000-0000-100000000000"],"HWDisplays":["DEBUG"],"UIFrameFiles":["kk_sysmenu_vi_uiframe_1.frame"]},{"PageName":"CE_READER","HaveDynamicElements":false,"IsDefaultPage":false,"Features":["00000000-0000-0000-0000-100000000000"],"HWDisplays":["DEBUG"],"UIFrameFiles":["kk_sysmenu_sett_uiframe_1.frame"]},{"PageName":"CE_READER","HaveDynamicElements":false,"IsDefaultPage":false,"Features":["c01287e6-3e5c-48bb-9eae-680a20210531"],"HWDisplays":["DEBUG"],"UIFrameFiles":["kk_ddisplay_cereader_uiframe_1.frame"]}],"HWDisplays":[{"HWDisplayName":"DEBUG","HWBoard":"DisplayDebug","HWDisplay":"HostDebug"}],"DefaultFeature":"00000000-0000-0000-0000-100000000000"}	ec65f6ce-24c8-4c79-bca7-e6660f967576	2	1	1
3	b5b50412-c02a-4674-a112-ddc5805ea4e5	KKDataDisplayConf	DataDisplayConf	{"FeatureID":"c01287e6-3e5c-48bb-9eae-680a20210531","Processors":[{"ProcessorName":"ODB_MAIN","ProcessorType":"PROC_BASIC_ODB2_DISPLAY","Pages":[{"PageName":"MAIN","PageCMD":"CHPROCESSOR CE_READER","DiagPIDs":[5,13]},{"PageName":"DETAIL","PageCMD":"CHPROCESSOR CE_READER","DiagPIDs":[5,66,13,12]}]},{"ProcessorName":"CE_READER","ProcessorType":"PROC_BASIC_ODB2_CEREADER","Pages":[{"PageName":"CE_READER","PageCMD":"CHPROCESSOR ODB_MAIN"}]},{"ProcessorName":"ERROR","ProcessorType":"PROC_BASIC_ODB2_ERROR","Pages":[{"PageName":"CE_READER","PageCMD":"CHPROCESSOR ODB_MAIN"}]},{"ProcessorName":"WAIT","ProcessorType":"PROC_BASIC_ODB2_WAIT","Pages":[{"PageName":"WAIT","PageCMD":""}]}]}	0abbdd8a-264e-4c1f-a6fa-0c7ec5d0a100	2	1	1
2	62d1026f-5297-4951-890d-61d75ae67d02	KKControlsConf	Controls plugin configuration	{"Adapters":[{"Name":"Raspberry","ID":"KK_RPI_Adapter","Type":"RaspberryPI_B"},{"Name":"Debug","ID":"DBG_Adapter","Type":"Debug"}],"Controls":[{"Name":"SelectUP","ID":"BTN_UP","AdapterID":"DBG_Adapter","AdapterSource":"3","Global":false,"FixedFeature":false},{"Name":"SelectDown","ID":"BTN_DOWN","AdapterID":"DBG_Adapter","AdapterSource":"12","Global":false,"FixedFeature":false},{"Name":"Enter","ID":"BTN_ENTER","AdapterID":"DBG_Adapter","AdapterSource":"13","Global":false,"FixedFeature":false},{"Name":"Back","ID":"BTN_BACK","AdapterID":"DBG_Adapter","AdapterSource":"14","Global":true,"FixedFeature":false}]}	21e0c350-515f-4207-8ab6-372b6d901020	2	1	1
1	c44bcdfc-d72b-4db7-ab99-37916cc55bd1	Garikk's car configuration		{"ConfigurationUID":"c44bcdfc-d72b-4db7-ab99-37916cc55bd1","ConfigurationStamp":"201f7df6-bedc-4942-b295-bd98249e5514","Features":[{"FeatureName":"ODB Diag Displ","FeatureUUID":"c01287e6-3e5c-48bb-9eae-680a20210531","IsSystemFeature":false,"Connections":[{"ConnectionName":"ODB to Data Display processor","SourcePluginName":"KKODB2Reader","TargetPluginName":"KKDataDisplay","SourcePluginUID":"44b5dab1-f596-458a-b09b-d9565b91464e","TargetPluginUID":"b5b50412-c02a-4674-a112-ddc5805ea4e5","PinName":["PIN_KK_ODB2_DATA","PIN_KK_ODB2_RAW"],"Enabled":false},{"ConnectionName":"Data Display processor to ODB","SourcePluginName":"KKDataDisplay","TargetPluginName":"KKODB2Reader","SourcePluginUID":"b5b50412-c02a-4674-a112-ddc5805ea4e5","TargetPluginUID":"44b5dab1-f596-458a-b09b-d9565b91464e","PinName":["PIN_KK_ODB2_COMMAND"],"Enabled":false},{"ConnectionName":"Data Display processor to LED","SourcePluginName":"KKDataDisplay","TargetPluginName":"KKLEDDisplay","SourcePluginUID":"b5b50412-c02a-4674-a112-ddc5805ea4e5","TargetPluginUID":"7fbac0f7-6939-4380-bcb0-0ef8b1580fbf","PinName":["PIN_KK_LED_COMMAND","PIN_KK_LED_DATA"],"Enabled":false},{"ConnectionName":"LED to DataProcessor","SourcePluginName":"KKLEDDisplay","TargetPluginName":"KKDataDisplay","SourcePluginUID":"7fbac0f7-6939-4380-bcb0-0ef8b1580fbf","TargetPluginUID":"b5b50412-c02a-4674-a112-ddc5805ea4e5","PinName":["PIN_KK_LED_DATA"],"Enabled":false},{"ConnectionName":"Controls to DataProcessor","SourcePluginName":"KKControls","TargetPluginName":"KKDataDisplay","SourcePluginUID":"62d1026f-5297-4951-890d-61d75ae67d02","TargetPluginUID":"b5b50412-c02a-4674-a112-ddc5805ea4e5","PinName":["PIN_KK_CTRL_DATA"],"Enabled":false}],"MinVersion":0},{"FeatureName":"Version info","FeatureUUID":"00000000-0000-0000-0000-100000000002","IsSystemFeature":true,"MinVersion":0},{"FeatureName":"Settings","FeatureUUID":"00000000-0000-0000-0000-100000000001","IsSystemFeature":true,"MinVersion":0}],"SystemDisplay_UID":"7fbac0f7-6939-4380-bcb0-0ef8b1580fbf","SystemHID_UID":"62d1026f-5297-4951-890d-61d75ae67d02","SystemMenuItems":[{"DisplayName":"Settings","ItemCommand":"KK_SUBMENU","SubItems":[{"DisplayName":"Test Prm11","ItemCommand":""},{"DisplayName":"Test Prm12","ItemCommand":""},{"DisplayName":"Test Prm13","ItemCommand":""},{"DisplayName":"test submenu","ItemCommand":"KK_SUBMENU","SubItems":[{"DisplayName":"Test Prm21","ItemCommand":""},{"DisplayName":"Test Prm22","ItemCommand":""}]}]},{"DisplayName":"Board tools","ItemCommand":"KK_SUBMENU","SubItems":[{"DisplayName":"System Info","ItemCommand":"KKSYSCMD TOOLS BOARDINFO"},{"DisplayName":"Reboot","ItemCommand":"KKSYSCMD TOOLS REBOOT"},{"DisplayName":"Power Off","ItemCommand":"KKSYSCMD TOOLS POWEROFF"}]},{"DisplayName":"KK Info","ItemCommand":"KK_SUBMENU","SubItems":[{"DisplayName":"Plugins","ItemCommand":"KKSYSCMD INFO PLUGINS"},{"DisplayName":"Version","ItemCommand":"KKSYSCMD INFO VERSION"}]}]}	201f7df6-bedc-4942-b295-bd98249e5514	1	1	1
\.


--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 177
-- Name: configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: garikk
--

SELECT pg_catalog.setval('configurations_id_seq', 5, true);


--
-- TOC entry 2204 (class 0 OID 24897)
-- Dependencies: 189
-- Data for Name: file_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY file_types (id, name) FROM stdin;
1	JarFile
2	ExternalConf
\.


--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 188
-- Name: file_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('file_types_id_seq', 1, false);


--
-- TOC entry 2202 (class 0 OID 24841)
-- Dependencies: 187
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY files (id, url, owner_conf, name, version, filetype, owner_plugin) FROM stdin;
5	http://localhost/rep/extconf/datadisplay/kk_display_cereader_uiframe_1.frame	4	kk_display_cereader_uiframe_1.frame	1	2	\N
6	http://localhost/rep/extconf/datadisplay/kk_lcddisplay_uiframe_error_1.frame	4	kk_lcddisplay_uiframe_error_1.frame	1	2	\N
7	http://localhost/rep/extconf/datadisplay/kk_lcddisplay_uiframe_detail_1.frame	4	kk_lcddisplay_uiframe_detail_1.frame	1	2	\N
8	http://localhost/rep/extconf/datadisplay/kk_lcddisplay_uiframe_main_1.frame	4	kk_lcddisplay_uiframe_main_1.frame	1	2	\N
9	http://localhost/rep/extconf/datadisplay/kk_lcddisplay_uiframe_main_2.frame	4	kk_lcddisplay_uiframe_main_2.frame	1	2	\N
10	http://localhost/rep/extconf/datadisplay/kk_lcddisplay_uiframe_main_3.frame	4	kk_lcddisplay_uiframe_main_3.frame	1	2	\N
11	http://localhost/rep/extconf/datadisplay/kk_lcddisplay_uiframe_main_4.frame	4	kk_lcddisplay_uiframe_main_4.frame	1	2	\N
12	http://localhost/rep/extconf/datadisplay/kk_lcddisplay_uiframe_main_5.frame	4	kk_lcddisplay_uiframe_main_5.frame	1	2	\N
13	http://localhost/rep/extconf/datadisplay/kk_lcddisplay_uiframe_wait_1.frame	4	kk_lcddisplay_uiframe_wait_1.frame	1	2	\N
14	http://localhost/rep/extconf/datadisplay/kk_sysmenu_sett_uiframe_1.frame	4	kk_sysmenu_sett_uiframe_1.frame	1	2	\N
15	http://localhost/rep/extconf/datadisplay/kk_sysmenu_vi_uiframe_1.frame	4	kk_sysmenu_vi_uiframe_1.frame	1	2	\N
\.


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 186
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('files_id_seq', 8, true);


--
-- TOC entry 2193 (class 0 OID 16669)
-- Dependencies: 178
-- Data for Name: kkcar; Type: TABLE DATA; Schema: public; Owner: garikk
--

COPY kkcar (id, name, owner, vehicle, uuid, activeconfiguration) FROM stdin;
1	Garikk's Chrysler	1	1	2e2efd7b-ab83-42fa-9c00-2e45bb4b3ba1	1
\.


--
-- TOC entry 2217 (class 0 OID 41264)
-- Dependencies: 202
-- Data for Name: kkcar_commands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kkcar_commands (id, kkcar, description, command, status, "timestamp") FROM stdin;
1	1	test ommand23213	{}	1	12321313
2	1	update DTC	{}	1	1234324
\.


--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 201
-- Name: kkcar_commands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kkcar_commands_id_seq', 1, false);


--
-- TOC entry 2221 (class 0 OID 41302)
-- Dependencies: 206
-- Data for Name: kkcar_confinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kkcar_confinfo (id, kkcar, carinfo, currentconfig, configversion, kkcontrollerversion, osversion, confstatus, carstatus, "timestamp") FROM stdin;
1	1	Chrysler Concorde 3.2	1	test	---not active--	Raspberry	Ok	Sleep	1111111
\.


--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 205
-- Name: kkcar_confinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kkcar_confinfo_id_seq', 1, false);


--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 179
-- Name: kkcar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: garikk
--

SELECT pg_catalog.setval('kkcar_id_seq', 1, true);


--
-- TOC entry 2219 (class 0 OID 41286)
-- Dependencies: 204
-- Data for Name: kkcar_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY kkcar_messages (id, kkcar, message, "timestamp") FROM stdin;
\.


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 203
-- Name: kkcar_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('kkcar_messages_id_seq', 1, false);


--
-- TOC entry 2195 (class 0 OID 16677)
-- Dependencies: 180
-- Data for Name: liveinfo; Type: TABLE DATA; Schema: public; Owner: garikk
--

COPY liveinfo (id, kkcar_id, name, param_id, value, "timestamp") FROM stdin;
3	1	\N	3	0	\N
4	1	\N	4	12.1	\N
2	1	\N	2	222	\N
1	1	\N	1	92	\N
\.


--
-- TOC entry 2213 (class 0 OID 33119)
-- Dependencies: 198
-- Data for Name: liveinfo_dtc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY liveinfo_dtc (id, dtc_val, "timestamp", kkcar_id) FROM stdin;
1	1	0	1
2	2	0	1
3	3	0	1
\.


--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 197
-- Name: liveinfo_dtc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('liveinfo_dtc_id_seq', 3, true);


--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 181
-- Name: liveinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: garikk
--

SELECT pg_catalog.setval('liveinfo_id_seq', 1, false);


--
-- TOC entry 2207 (class 0 OID 33079)
-- Dependencies: 192
-- Data for Name: liveinfo_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY liveinfo_request (id, configuration_id, "PID", "interval") FROM stdin;
\.


--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 191
-- Name: liveinfo_request_configuration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('liveinfo_request_configuration_id_seq', 1, false);


--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 190
-- Name: liveinfo_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('liveinfo_request_id_seq', 1, false);


--
-- TOC entry 2211 (class 0 OID 33095)
-- Dependencies: 196
-- Data for Name: manufacture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY manufacture (id, name) FROM stdin;
1	Chrysler
0	Generic ODB2
\.


--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 195
-- Name: manufacture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('manufacture_id_seq', 1, false);


--
-- TOC entry 2214 (class 0 OID 33123)
-- Dependencies: 199
-- Data for Name: odb_dtc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY odb_dtc (id, manufacture, dtc, descriptionlocal, descriptionodb) FROM stdin;
1	0	0	Fuel Volume Regulator Control Circuit/Open	Fuel Volume Regulator Control Circuit/Open
2	1	1684	В течении последних 50 запусков двигателя, была отключена аккумуляторная батарея	Battery Disconnected Within Last 50 Starts
3	1	1486	Evap Leak Monitor Pinched Hose	Evap Leak Monitor Pinched Hose\r\n
\.


--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 200
-- Name: odb_dtc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odb_dtc_id_seq', 3, true);


--
-- TOC entry 2209 (class 0 OID 33086)
-- Dependencies: 194
-- Data for Name: odb_pids; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY odb_pids (id, manufacture, "PID", descriptionlocal, descriptionodb, "PID_MODE") FROM stdin;
1	0	5	Температура охлаждающей жидкости	Engine coolant temperature	1
4	0	66	Напряжение контрольного модуля	Control Module Voltage	\N
2	0	12	Обороты двигателя!!	Engine RPM	1
3	0	13	Скорость автомобиля	Vehicle speed	1
\.


--
-- TOC entry 2197 (class 0 OID 16685)
-- Dependencies: 182
-- Data for Name: plugins; Type: TABLE DATA; Schema: public; Owner: garikk
--

COPY plugins (id, uuid, name, description, version, pins_in, pins_out) FROM stdin;
5	10000000-0000-0000-0000-000000000000	KKController	KKController	1	\N	\N
1	44b5dab1-f596-458a-b09b-d9565b91464e	KKODB2Reader	Basic ODB2 Reader	1	{\n  "pins": [\n    "PIN_KK_ODB2_COMMAND"\n    ]\n }	{\n  "pins": [\n    "KK_PLUGIN_BASE_ODB2_DATA",\n   "KK_PLUGIN_BASE_ODB2_RAW"\n    ]\n }
2	7fbac0f7-6939-4380-bcb0-0ef8b1580fbf	KKLEDDisplay	Basic LED Display	1	{\n  "pins": [\n    "PIN_KK_LED_COMMAND",\n    "PIN_KK_LED_DATA",\n    "PIN_KK_LED_RAW"\n    ]\n }	{\r\n  "pins": [\r\n    "PIN_KK_LED_DATA"\r\n    ]\r\n }
3	b5b50412-c02a-4674-a112-ddc5805ea4e5	KKDataDisplay	Simple ODB diag display processor	1	{\n  "pins": [\n    "PIN_KK_LED_DATA","PIN_KK_ODB2_DATA","PIN_KK_CTRL_DATA"\n    ]}	{\n  "pins": [\n    "PIN_KK_LED_COMMAND",\n    "PIN_KK_LED_DATA"\n    ]}
4	62d1026f-5297-4951-890d-61d75ae67d02	KKControls	hardware buttons plugin	1	\N	{\n  "pins": [\n    "PIN_KK_CTRL_DATA"\n    ]}
\.


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 183
-- Name: plugins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: garikk
--

SELECT pg_catalog.setval('plugins_id_seq', 5, true);


--
-- TOC entry 2200 (class 0 OID 16731)
-- Dependencies: 185
-- Data for Name: system_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY system_state (id, name, kkcontroller_version, state, base_version) FROM stdin;
1	Testing	0.9	1	0.9
2	Production	1.0	0	1.0
\.


--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 184
-- Name: system_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('system_state_id_seq', 1, true);


--
-- TOC entry 2048 (class 2606 OID 33105)
-- Name: ODB_PID_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY odb_pids
    ADD CONSTRAINT "ODB_PID_pkey" PRIMARY KEY (id);


--
-- TOC entry 2025 (class 2606 OID 16700)
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: garikk; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 2027 (class 2606 OID 16702)
-- Name: config_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY config_types
    ADD CONSTRAINT config_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2030 (class 2606 OID 16704)
-- Name: configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: garikk; Tablespace: 
--

ALTER TABLE ONLY configurations
    ADD CONSTRAINT configurations_pkey PRIMARY KEY (id);


--
-- TOC entry 2042 (class 2606 OID 24849)
-- Name: fk_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY files
    ADD CONSTRAINT fk_id PRIMARY KEY (id);


--
-- TOC entry 2040 (class 2606 OID 16740)
-- Name: id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY system_state
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- TOC entry 2046 (class 2606 OID 24905)
-- Name: k_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY file_types
    ADD CONSTRAINT k_id PRIMARY KEY (id);


--
-- TOC entry 2059 (class 2606 OID 41272)
-- Name: kkcar_commands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kkcar_commands
    ADD CONSTRAINT kkcar_commands_pkey PRIMARY KEY (id);


--
-- TOC entry 2065 (class 2606 OID 41310)
-- Name: kkcar_confinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kkcar_confinfo
    ADD CONSTRAINT kkcar_confinfo_pkey PRIMARY KEY (id);


--
-- TOC entry 2061 (class 2606 OID 41294)
-- Name: kkcar_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kkcar_messages
    ADD CONSTRAINT kkcar_messages_pkey PRIMARY KEY (id);


--
-- TOC entry 2032 (class 2606 OID 16706)
-- Name: kkcar_pkey; Type: CONSTRAINT; Schema: public; Owner: garikk; Tablespace: 
--

ALTER TABLE ONLY kkcar
    ADD CONSTRAINT kkcar_pkey PRIMARY KEY (id);


--
-- TOC entry 2054 (class 2606 OID 33138)
-- Name: liveinfo_dtc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY liveinfo_dtc
    ADD CONSTRAINT liveinfo_dtc_pkey PRIMARY KEY (id);


--
-- TOC entry 2034 (class 2606 OID 16708)
-- Name: liveinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: garikk; Tablespace: 
--

ALTER TABLE ONLY liveinfo
    ADD CONSTRAINT liveinfo_pkey PRIMARY KEY (id);


--
-- TOC entry 2051 (class 2606 OID 33103)
-- Name: manufacture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY manufacture
    ADD CONSTRAINT manufacture_pkey PRIMARY KEY (id);


--
-- TOC entry 2056 (class 2606 OID 33136)
-- Name: odb_dtc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY odb_dtc
    ADD CONSTRAINT odb_dtc_pkey PRIMARY KEY (id);


--
-- TOC entry 2036 (class 2606 OID 16710)
-- Name: plugins_pkey; Type: CONSTRAINT; Schema: public; Owner: garikk; Tablespace: 
--

ALTER TABLE ONLY plugins
    ADD CONSTRAINT plugins_pkey PRIMARY KEY (id);


--
-- TOC entry 2038 (class 2606 OID 24879)
-- Name: plugins_uuid_key; Type: CONSTRAINT; Schema: public; Owner: garikk; Tablespace: 
--

ALTER TABLE ONLY plugins
    ADD CONSTRAINT plugins_uuid_key UNIQUE (uuid);


--
-- TOC entry 2028 (class 1259 OID 24877)
-- Name: FKI_kkcar; Type: INDEX; Schema: public; Owner: garikk; Tablespace: 
--

CREATE INDEX "FKI_kkcar" ON configurations USING btree (kkcar);


--
-- TOC entry 2062 (class 1259 OID 41327)
-- Name: fki_currconf; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_currconf ON kkcar_confinfo USING btree (currentconfig);


--
-- TOC entry 2052 (class 1259 OID 33149)
-- Name: fki_kkcar; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_kkcar ON liveinfo_dtc USING btree (kkcar_id);


--
-- TOC entry 2057 (class 1259 OID 41283)
-- Name: fki_kkcar_cmd; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_kkcar_cmd ON kkcar_commands USING btree (kkcar);


--
-- TOC entry 2063 (class 1259 OID 41321)
-- Name: fki_kkcar_confinfo; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_kkcar_confinfo ON kkcar_confinfo USING btree (kkcar);


--
-- TOC entry 2049 (class 1259 OID 33111)
-- Name: fki_manufacture; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_manufacture ON odb_pids USING btree (manufacture);


--
-- TOC entry 2043 (class 1259 OID 24855)
-- Name: fki_owconf; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_owconf ON files USING btree (owner_conf);


--
-- TOC entry 2044 (class 1259 OID 24911)
-- Name: fki_plugin; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_plugin ON files USING btree (owner_plugin);


--
-- TOC entry 2067 (class 2606 OID 24872)
-- Name: FK_kkcar; Type: FK CONSTRAINT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY configurations
    ADD CONSTRAINT "FK_kkcar" FOREIGN KEY (kkcar) REFERENCES kkcar(id);


--
-- TOC entry 2066 (class 2606 OID 16711)
-- Name: configurations_configurationtype_fkey; Type: FK CONSTRAINT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY configurations
    ADD CONSTRAINT configurations_configurationtype_fkey FOREIGN KEY (configurationtype) REFERENCES config_types(id);


--
-- TOC entry 2071 (class 2606 OID 33070)
-- Name: files_owner_conf_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_owner_conf_fkey FOREIGN KEY (owner_conf) REFERENCES configurations(id);


--
-- TOC entry 2077 (class 2606 OID 41322)
-- Name: fk_currconf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kkcar_confinfo
    ADD CONSTRAINT fk_currconf FOREIGN KEY (currentconfig) REFERENCES kkcar_confinfo(id);


--
-- TOC entry 2073 (class 2606 OID 33144)
-- Name: fk_kkcar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY liveinfo_dtc
    ADD CONSTRAINT fk_kkcar FOREIGN KEY (kkcar_id) REFERENCES kkcar(id);


--
-- TOC entry 2074 (class 2606 OID 41278)
-- Name: fk_kkcar_cmd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kkcar_commands
    ADD CONSTRAINT fk_kkcar_cmd FOREIGN KEY (kkcar) REFERENCES kkcar(id);


--
-- TOC entry 2076 (class 2606 OID 41316)
-- Name: fk_kkcar_confinfo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kkcar_confinfo
    ADD CONSTRAINT fk_kkcar_confinfo FOREIGN KEY (kkcar) REFERENCES kkcar(id);


--
-- TOC entry 2072 (class 2606 OID 33106)
-- Name: fk_manufacture; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY odb_pids
    ADD CONSTRAINT fk_manufacture FOREIGN KEY (manufacture) REFERENCES manufacture(id);


--
-- TOC entry 2070 (class 2606 OID 24906)
-- Name: fk_plugin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY files
    ADD CONSTRAINT fk_plugin FOREIGN KEY (owner_plugin) REFERENCES plugins(id);


--
-- TOC entry 2068 (class 2606 OID 16716)
-- Name: kkcar_ActiveConfiguration_fkey; Type: FK CONSTRAINT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY kkcar
    ADD CONSTRAINT "kkcar_ActiveConfiguration_fkey" FOREIGN KEY (activeconfiguration) REFERENCES configurations(id);


--
-- TOC entry 2075 (class 2606 OID 41295)
-- Name: kkcar_messages_kkcar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kkcar_messages
    ADD CONSTRAINT kkcar_messages_kkcar_fkey FOREIGN KEY (kkcar) REFERENCES kkcar(id);


--
-- TOC entry 2069 (class 2606 OID 33112)
-- Name: liveinfo_ODB_PID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY liveinfo
    ADD CONSTRAINT "liveinfo_ODB_PID_fkey" FOREIGN KEY (param_id) REFERENCES odb_pids(id);


--
-- TOC entry 2230 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 194
-- Name: odb_pids; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE odb_pids FROM PUBLIC;
REVOKE ALL ON TABLE odb_pids FROM postgres;
GRANT ALL ON TABLE odb_pids TO postgres;
GRANT ALL ON TABLE odb_pids TO kkcar_webservice;


--
-- TOC entry 2234 (class 0 OID 0)
-- Dependencies: 193
-- Name: ODB_PID_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE "ODB_PID_id_seq" FROM PUBLIC;
REVOKE ALL ON SEQUENCE "ODB_PID_id_seq" FROM postgres;
GRANT ALL ON SEQUENCE "ODB_PID_id_seq" TO postgres;
GRANT ALL ON SEQUENCE "ODB_PID_id_seq" TO kkcar_webservice;


--
-- TOC entry 2235 (class 0 OID 0)
-- Dependencies: 172
-- Name: accounts; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON TABLE accounts FROM PUBLIC;
REVOKE ALL ON TABLE accounts FROM garikk;
GRANT ALL ON TABLE accounts TO garikk;


--
-- TOC entry 2237 (class 0 OID 0)
-- Dependencies: 173
-- Name: accounts_id_seq; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON SEQUENCE accounts_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE accounts_id_seq FROM garikk;
GRANT ALL ON SEQUENCE accounts_id_seq TO garikk;


--
-- TOC entry 2238 (class 0 OID 0)
-- Dependencies: 208
-- Name: confeditor_blockview; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE confeditor_blockview FROM PUBLIC;
REVOKE ALL ON TABLE confeditor_blockview FROM postgres;
GRANT ALL ON TABLE confeditor_blockview TO postgres;
GRANT ALL ON TABLE confeditor_blockview TO kkcar_webservice;


--
-- TOC entry 2240 (class 0 OID 0)
-- Dependencies: 207
-- Name: confeditor_blockview_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE confeditor_blockview_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE confeditor_blockview_id_seq FROM postgres;
GRANT ALL ON SEQUENCE confeditor_blockview_id_seq TO postgres;
GRANT ALL ON SEQUENCE confeditor_blockview_id_seq TO kkcar_webservice;


--
-- TOC entry 2241 (class 0 OID 0)
-- Dependencies: 174
-- Name: config_types; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE config_types FROM PUBLIC;
REVOKE ALL ON TABLE config_types FROM postgres;
GRANT ALL ON TABLE config_types TO postgres;


--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 175
-- Name: config_types_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE config_types_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE config_types_id_seq FROM postgres;
GRANT ALL ON SEQUENCE config_types_id_seq TO postgres;


--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 176
-- Name: configurations; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON TABLE configurations FROM PUBLIC;
REVOKE ALL ON TABLE configurations FROM garikk;
GRANT ALL ON TABLE configurations TO garikk;


--
-- TOC entry 2246 (class 0 OID 0)
-- Dependencies: 177
-- Name: configurations_id_seq; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON SEQUENCE configurations_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE configurations_id_seq FROM garikk;
GRANT ALL ON SEQUENCE configurations_id_seq TO garikk;


--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 189
-- Name: file_types; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE file_types FROM PUBLIC;
REVOKE ALL ON TABLE file_types FROM postgres;
GRANT ALL ON TABLE file_types TO postgres;
GRANT ALL ON TABLE file_types TO kkcar_webservice;


--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 188
-- Name: file_types_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE file_types_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE file_types_id_seq FROM postgres;
GRANT ALL ON SEQUENCE file_types_id_seq TO postgres;
GRANT ALL ON SEQUENCE file_types_id_seq TO kkcar_webservice;


--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 187
-- Name: files; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE files FROM PUBLIC;
REVOKE ALL ON TABLE files FROM postgres;
GRANT ALL ON TABLE files TO postgres;
GRANT ALL ON TABLE files TO kkcar_webservice;


--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 186
-- Name: files_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE files_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE files_id_seq FROM postgres;
GRANT ALL ON SEQUENCE files_id_seq TO postgres;
GRANT ALL ON SEQUENCE files_id_seq TO kkcar_webservice;


--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 178
-- Name: kkcar; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON TABLE kkcar FROM PUBLIC;
REVOKE ALL ON TABLE kkcar FROM garikk;
GRANT ALL ON TABLE kkcar TO garikk;


--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 202
-- Name: kkcar_commands; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE kkcar_commands FROM PUBLIC;
REVOKE ALL ON TABLE kkcar_commands FROM postgres;
GRANT ALL ON TABLE kkcar_commands TO postgres;
GRANT ALL ON TABLE kkcar_commands TO kkcar_webservice;


--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 201
-- Name: kkcar_commands_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE kkcar_commands_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE kkcar_commands_id_seq FROM postgres;
GRANT ALL ON SEQUENCE kkcar_commands_id_seq TO postgres;
GRANT ALL ON SEQUENCE kkcar_commands_id_seq TO kkcar_webservice;


--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 206
-- Name: kkcar_confinfo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE kkcar_confinfo FROM PUBLIC;
REVOKE ALL ON TABLE kkcar_confinfo FROM postgres;
GRANT ALL ON TABLE kkcar_confinfo TO postgres;
GRANT ALL ON TABLE kkcar_confinfo TO kkcar_webservice;


--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 205
-- Name: kkcar_confinfo_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE kkcar_confinfo_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE kkcar_confinfo_id_seq FROM postgres;
GRANT ALL ON SEQUENCE kkcar_confinfo_id_seq TO postgres;
GRANT ALL ON SEQUENCE kkcar_confinfo_id_seq TO kkcar_webservice;


--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 179
-- Name: kkcar_id_seq; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON SEQUENCE kkcar_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE kkcar_id_seq FROM garikk;
GRANT ALL ON SEQUENCE kkcar_id_seq TO garikk;


--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 204
-- Name: kkcar_messages; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE kkcar_messages FROM PUBLIC;
REVOKE ALL ON TABLE kkcar_messages FROM postgres;
GRANT ALL ON TABLE kkcar_messages TO postgres;
GRANT ALL ON TABLE kkcar_messages TO kkcar_webservice;


--
-- TOC entry 2264 (class 0 OID 0)
-- Dependencies: 203
-- Name: kkcar_messages_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE kkcar_messages_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE kkcar_messages_id_seq FROM postgres;
GRANT ALL ON SEQUENCE kkcar_messages_id_seq TO postgres;
GRANT ALL ON SEQUENCE kkcar_messages_id_seq TO kkcar_webservice;


--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 180
-- Name: liveinfo; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON TABLE liveinfo FROM PUBLIC;
REVOKE ALL ON TABLE liveinfo FROM garikk;
GRANT ALL ON TABLE liveinfo TO garikk;


--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 198
-- Name: liveinfo_dtc; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE liveinfo_dtc FROM PUBLIC;
REVOKE ALL ON TABLE liveinfo_dtc FROM postgres;
GRANT ALL ON TABLE liveinfo_dtc TO postgres;
GRANT ALL ON TABLE liveinfo_dtc TO kkcar_webservice;


--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 197
-- Name: liveinfo_dtc_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE liveinfo_dtc_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE liveinfo_dtc_id_seq FROM postgres;
GRANT ALL ON SEQUENCE liveinfo_dtc_id_seq TO postgres;
GRANT ALL ON SEQUENCE liveinfo_dtc_id_seq TO kkcar_webservice;


--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 181
-- Name: liveinfo_id_seq; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON SEQUENCE liveinfo_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE liveinfo_id_seq FROM garikk;
GRANT ALL ON SEQUENCE liveinfo_id_seq TO garikk;


--
-- TOC entry 2271 (class 0 OID 0)
-- Dependencies: 192
-- Name: liveinfo_request; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE liveinfo_request FROM PUBLIC;
REVOKE ALL ON TABLE liveinfo_request FROM postgres;
GRANT ALL ON TABLE liveinfo_request TO postgres;
GRANT ALL ON TABLE liveinfo_request TO kkcar_webservice;


--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 191
-- Name: liveinfo_request_configuration_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE liveinfo_request_configuration_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE liveinfo_request_configuration_id_seq FROM postgres;
GRANT ALL ON SEQUENCE liveinfo_request_configuration_id_seq TO postgres;
GRANT ALL ON SEQUENCE liveinfo_request_configuration_id_seq TO kkcar_webservice;


--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 190
-- Name: liveinfo_request_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE liveinfo_request_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE liveinfo_request_id_seq FROM postgres;
GRANT ALL ON SEQUENCE liveinfo_request_id_seq TO postgres;
GRANT ALL ON SEQUENCE liveinfo_request_id_seq TO kkcar_webservice;


--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 196
-- Name: manufacture; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE manufacture FROM PUBLIC;
REVOKE ALL ON TABLE manufacture FROM postgres;
GRANT ALL ON TABLE manufacture TO postgres;
GRANT ALL ON TABLE manufacture TO kkcar_webservice;


--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 195
-- Name: manufacture_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE manufacture_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE manufacture_id_seq FROM postgres;
GRANT ALL ON SEQUENCE manufacture_id_seq TO postgres;
GRANT ALL ON SEQUENCE manufacture_id_seq TO kkcar_webservice;


--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 199
-- Name: odb_dtc; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE odb_dtc FROM PUBLIC;
REVOKE ALL ON TABLE odb_dtc FROM postgres;
GRANT ALL ON TABLE odb_dtc TO postgres;
GRANT ALL ON TABLE odb_dtc TO kkcar_webservice;


--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 200
-- Name: odb_dtc_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE odb_dtc_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE odb_dtc_id_seq FROM postgres;
GRANT ALL ON SEQUENCE odb_dtc_id_seq TO postgres;
GRANT ALL ON SEQUENCE odb_dtc_id_seq TO kkcar_webservice;


--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 182
-- Name: plugins; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON TABLE plugins FROM PUBLIC;
REVOKE ALL ON TABLE plugins FROM garikk;
GRANT ALL ON TABLE plugins TO garikk;


--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 183
-- Name: plugins_id_seq; Type: ACL; Schema: public; Owner: garikk
--

REVOKE ALL ON SEQUENCE plugins_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE plugins_id_seq FROM garikk;
GRANT ALL ON SEQUENCE plugins_id_seq TO garikk;


--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 185
-- Name: system_state; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE system_state FROM PUBLIC;
REVOKE ALL ON TABLE system_state FROM postgres;
GRANT ALL ON TABLE system_state TO postgres;
GRANT ALL ON TABLE system_state TO kkcar_webservice;


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 184
-- Name: system_state_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE system_state_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE system_state_id_seq FROM postgres;
GRANT ALL ON SEQUENCE system_state_id_seq TO postgres;
GRANT ALL ON SEQUENCE system_state_id_seq TO kkcar_webservice;


--
-- TOC entry 1669 (class 826 OID 16723)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON SEQUENCES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON SEQUENCES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO kkcar_webservice;


--
-- TOC entry 1671 (class 826 OID 16725)
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TYPES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TYPES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO kkcar_webservice;


--
-- TOC entry 1670 (class 826 OID 16724)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON FUNCTIONS  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON FUNCTIONS  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO kkcar_webservice;


--
-- TOC entry 1667 (class 826 OID 16721)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: garikk
--

ALTER DEFAULT PRIVILEGES FOR ROLE garikk IN SCHEMA public REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE garikk IN SCHEMA public REVOKE ALL ON TABLES  FROM garikk;
ALTER DEFAULT PRIVILEGES FOR ROLE garikk IN SCHEMA public GRANT ALL ON TABLES  TO PUBLIC;


--
-- TOC entry 1668 (class 826 OID 16722)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO kkcar_webservice;


-- Completed on 2015-09-04 20:11:25

--
-- PostgreSQL database dump complete
--

