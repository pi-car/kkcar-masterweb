--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2015-07-17 20:02:53

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 184 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2053 (class 0 OID 0)
-- Dependencies: 184
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 16402)
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
-- TOC entry 173 (class 1259 OID 16408)
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
-- TOC entry 2054 (class 0 OID 0)
-- Dependencies: 173
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: garikk
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- TOC entry 183 (class 1259 OID 16460)
-- Name: config_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE config_types (
    id integer NOT NULL,
    type text
);


ALTER TABLE config_types OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16458)
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
-- TOC entry 2055 (class 0 OID 0)
-- Dependencies: 182
-- Name: config_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE config_types_id_seq OWNED BY config_types.id;


--
-- TOC entry 174 (class 1259 OID 16410)
-- Name: configurations; Type: TABLE; Schema: public; Owner: garikk; Tablespace: 
--

CREATE TABLE configurations (
    id integer NOT NULL,
    uuid text,
    name text,
    description text,
    hash text,
    config_type integer
);


ALTER TABLE configurations OWNER TO garikk;

--
-- TOC entry 175 (class 1259 OID 16416)
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
-- TOC entry 2056 (class 0 OID 0)
-- Dependencies: 175
-- Name: configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: garikk
--

ALTER SEQUENCE configurations_id_seq OWNED BY configurations.id;


--
-- TOC entry 176 (class 1259 OID 16418)
-- Name: kkcar; Type: TABLE; Schema: public; Owner: garikk; Tablespace: 
--

CREATE TABLE kkcar (
    id integer NOT NULL,
    name text,
    owner integer,
    vehicle integer
);


ALTER TABLE kkcar OWNER TO garikk;

--
-- TOC entry 177 (class 1259 OID 16424)
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
-- TOC entry 2057 (class 0 OID 0)
-- Dependencies: 177
-- Name: kkcar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: garikk
--

ALTER SEQUENCE kkcar_id_seq OWNED BY kkcar.id;


--
-- TOC entry 178 (class 1259 OID 16426)
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
-- TOC entry 179 (class 1259 OID 16432)
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
-- TOC entry 2058 (class 0 OID 0)
-- Dependencies: 179
-- Name: liveinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: garikk
--

ALTER SEQUENCE liveinfo_id_seq OWNED BY liveinfo.id;


--
-- TOC entry 180 (class 1259 OID 16434)
-- Name: plugins; Type: TABLE; Schema: public; Owner: garikk; Tablespace: 
--

CREATE TABLE plugins (
    id integer NOT NULL,
    uuid text,
    name text,
    description text
);


ALTER TABLE plugins OWNER TO garikk;

--
-- TOC entry 181 (class 1259 OID 16440)
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
-- TOC entry 2059 (class 0 OID 0)
-- Dependencies: 181
-- Name: plugins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: garikk
--

ALTER SEQUENCE plugins_id_seq OWNED BY plugins.id;


--
-- TOC entry 1917 (class 2604 OID 16442)
-- Name: id; Type: DEFAULT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- TOC entry 1922 (class 2604 OID 16463)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY config_types ALTER COLUMN id SET DEFAULT nextval('config_types_id_seq'::regclass);


--
-- TOC entry 1918 (class 2604 OID 16443)
-- Name: id; Type: DEFAULT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY configurations ALTER COLUMN id SET DEFAULT nextval('configurations_id_seq'::regclass);


--
-- TOC entry 1919 (class 2604 OID 16444)
-- Name: id; Type: DEFAULT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY kkcar ALTER COLUMN id SET DEFAULT nextval('kkcar_id_seq'::regclass);


--
-- TOC entry 1920 (class 2604 OID 16445)
-- Name: id; Type: DEFAULT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY liveinfo ALTER COLUMN id SET DEFAULT nextval('liveinfo_id_seq'::regclass);


--
-- TOC entry 1921 (class 2604 OID 16446)
-- Name: id; Type: DEFAULT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY plugins ALTER COLUMN id SET DEFAULT nextval('plugins_id_seq'::regclass);


--
-- TOC entry 1924 (class 2606 OID 16448)
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: garikk; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 1935 (class 2606 OID 16468)
-- Name: config_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY config_types
    ADD CONSTRAINT config_types_pkey PRIMARY KEY (id);


--
-- TOC entry 1926 (class 2606 OID 16450)
-- Name: configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: garikk; Tablespace: 
--

ALTER TABLE ONLY configurations
    ADD CONSTRAINT configurations_pkey PRIMARY KEY (id);


--
-- TOC entry 1929 (class 2606 OID 16452)
-- Name: kkcar_pkey; Type: CONSTRAINT; Schema: public; Owner: garikk; Tablespace: 
--

ALTER TABLE ONLY kkcar
    ADD CONSTRAINT kkcar_pkey PRIMARY KEY (id);


--
-- TOC entry 1931 (class 2606 OID 16454)
-- Name: liveinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: garikk; Tablespace: 
--

ALTER TABLE ONLY liveinfo
    ADD CONSTRAINT liveinfo_pkey PRIMARY KEY (id);


--
-- TOC entry 1933 (class 2606 OID 16456)
-- Name: plugins_pkey; Type: CONSTRAINT; Schema: public; Owner: garikk; Tablespace: 
--

ALTER TABLE ONLY plugins
    ADD CONSTRAINT plugins_pkey PRIMARY KEY (id);


--
-- TOC entry 1927 (class 1259 OID 16474)
-- Name: fki_conf_type; Type: INDEX; Schema: public; Owner: garikk; Tablespace: 
--

CREATE INDEX fki_conf_type ON configurations USING btree (config_type);


--
-- TOC entry 1936 (class 2606 OID 16469)
-- Name: conf_type; Type: FK CONSTRAINT; Schema: public; Owner: garikk
--

ALTER TABLE ONLY configurations
    ADD CONSTRAINT conf_type FOREIGN KEY (config_type) REFERENCES config_types(id);


--
-- TOC entry 2052 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-07-17 20:02:53

--
-- PostgreSQL database dump complete
--

