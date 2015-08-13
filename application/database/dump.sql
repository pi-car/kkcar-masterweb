PGDMP     
                    s            kkcar    9.4.4    9.4.4 �    e           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            f           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            g           1262    16638    kkcar    DATABASE     �   CREATE DATABASE kkcar WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE kkcar;
             postgres    false                        2615    16639    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            h           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            i           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6            �            3079    16640    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            j           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    197            �            1259    33086    odbpids    TABLE     �   CREATE TABLE odbpids (
    id integer NOT NULL,
    manufacture integer,
    "PID" integer,
    descriptionlocal text,
    descriptionodb text,
    "PID_MODE" integer
);
    DROP TABLE public.odbpids;
       public         postgres    false    6            k           0    0    odbpids    ACL     �   REVOKE ALL ON TABLE odbpids FROM PUBLIC;
REVOKE ALL ON TABLE odbpids FROM postgres;
GRANT ALL ON TABLE odbpids TO postgres;
GRANT ALL ON TABLE odbpids TO kkcar_webservice;
            public       postgres    false    194            �            1259    33084    ODB_PID_id_seq    SEQUENCE     r   CREATE SEQUENCE "ODB_PID_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."ODB_PID_id_seq";
       public       postgres    false    6    194            l           0    0    ODB_PID_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE "ODB_PID_id_seq" OWNED BY odbpids.id;
            public       postgres    false    193            m           0    0    ODB_PID_id_seq    ACL     �   REVOKE ALL ON SEQUENCE "ODB_PID_id_seq" FROM PUBLIC;
REVOKE ALL ON SEQUENCE "ODB_PID_id_seq" FROM postgres;
GRANT ALL ON SEQUENCE "ODB_PID_id_seq" TO postgres;
GRANT ALL ON SEQUENCE "ODB_PID_id_seq" TO kkcar_webservice;
            public       postgres    false    193            �            1259    16645    accounts    TABLE     a   CREATE TABLE accounts (
    id integer NOT NULL,
    uuid text,
    login text,
    pass text
);
    DROP TABLE public.accounts;
       public         garikk    false    6            n           0    0    accounts    ACL     {   REVOKE ALL ON TABLE accounts FROM PUBLIC;
REVOKE ALL ON TABLE accounts FROM garikk;
GRANT ALL ON TABLE accounts TO garikk;
            public       garikk    false    172            �            1259    16651    accounts_id_seq    SEQUENCE     q   CREATE SEQUENCE accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.accounts_id_seq;
       public       garikk    false    6    172            o           0    0    accounts_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;
            public       garikk    false    173            p           0    0    accounts_id_seq    ACL     �   REVOKE ALL ON SEQUENCE accounts_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE accounts_id_seq FROM garikk;
GRANT ALL ON SEQUENCE accounts_id_seq TO garikk;
            public       garikk    false    173            �            1259    16653    config_types    TABLE     F   CREATE TABLE config_types (
    id integer NOT NULL,
    type text
);
     DROP TABLE public.config_types;
       public         postgres    false    6            q           0    0    config_types    ACL     �   REVOKE ALL ON TABLE config_types FROM PUBLIC;
REVOKE ALL ON TABLE config_types FROM postgres;
GRANT ALL ON TABLE config_types TO postgres;
            public       postgres    false    174            �            1259    16659    config_types_id_seq    SEQUENCE     u   CREATE SEQUENCE config_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.config_types_id_seq;
       public       postgres    false    6    174            r           0    0    config_types_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE config_types_id_seq OWNED BY config_types.id;
            public       postgres    false    175            s           0    0    config_types_id_seq    ACL     �   REVOKE ALL ON SEQUENCE config_types_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE config_types_id_seq FROM postgres;
GRANT ALL ON SEQUENCE config_types_id_seq TO postgres;
            public       postgres    false    175            �            1259    16661    configurations    TABLE     �   CREATE TABLE configurations (
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
 "   DROP TABLE public.configurations;
       public         garikk    false    6            t           0    0    configurations    ACL     �   REVOKE ALL ON TABLE configurations FROM PUBLIC;
REVOKE ALL ON TABLE configurations FROM garikk;
GRANT ALL ON TABLE configurations TO garikk;
            public       garikk    false    176            �            1259    16667    configurations_id_seq    SEQUENCE     w   CREATE SEQUENCE configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.configurations_id_seq;
       public       garikk    false    6    176            u           0    0    configurations_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE configurations_id_seq OWNED BY configurations.id;
            public       garikk    false    177            v           0    0    configurations_id_seq    ACL     �   REVOKE ALL ON SEQUENCE configurations_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE configurations_id_seq FROM garikk;
GRANT ALL ON SEQUENCE configurations_id_seq TO garikk;
            public       garikk    false    177            �            1259    24897 
   file_types    TABLE     D   CREATE TABLE file_types (
    id integer NOT NULL,
    name text
);
    DROP TABLE public.file_types;
       public         postgres    false    6            w           0    0 
   file_types    ACL     �   REVOKE ALL ON TABLE file_types FROM PUBLIC;
REVOKE ALL ON TABLE file_types FROM postgres;
GRANT ALL ON TABLE file_types TO postgres;
GRANT ALL ON TABLE file_types TO kkcar_webservice;
            public       postgres    false    189            �            1259    24895    file_types_id_seq    SEQUENCE     s   CREATE SEQUENCE file_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.file_types_id_seq;
       public       postgres    false    189    6            x           0    0    file_types_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE file_types_id_seq OWNED BY file_types.id;
            public       postgres    false    188            y           0    0    file_types_id_seq    ACL     �   REVOKE ALL ON SEQUENCE file_types_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE file_types_id_seq FROM postgres;
GRANT ALL ON SEQUENCE file_types_id_seq TO postgres;
GRANT ALL ON SEQUENCE file_types_id_seq TO kkcar_webservice;
            public       postgres    false    188            �            1259    24841    files    TABLE     �   CREATE TABLE files (
    id integer NOT NULL,
    url text,
    owner_conf integer,
    name text,
    version integer,
    filetype integer,
    owner_plugin integer
);
    DROP TABLE public.files;
       public         postgres    false    6            z           0    0    files    ACL     �   REVOKE ALL ON TABLE files FROM PUBLIC;
REVOKE ALL ON TABLE files FROM postgres;
GRANT ALL ON TABLE files TO postgres;
GRANT ALL ON TABLE files TO kkcar_webservice;
            public       postgres    false    187            �            1259    24839    files_id_seq    SEQUENCE     n   CREATE SEQUENCE files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.files_id_seq;
       public       postgres    false    187    6            {           0    0    files_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE files_id_seq OWNED BY files.id;
            public       postgres    false    186            |           0    0    files_id_seq    ACL     �   REVOKE ALL ON SEQUENCE files_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE files_id_seq FROM postgres;
GRANT ALL ON SEQUENCE files_id_seq TO postgres;
GRANT ALL ON SEQUENCE files_id_seq TO kkcar_webservice;
            public       postgres    false    186            �            1259    16669    kkcar    TABLE     �   CREATE TABLE kkcar (
    id integer NOT NULL,
    name text,
    owner integer,
    vehicle integer,
    uuid text,
    activeconfiguration integer
);
    DROP TABLE public.kkcar;
       public         garikk    false    6            }           0    0    kkcar    ACL     r   REVOKE ALL ON TABLE kkcar FROM PUBLIC;
REVOKE ALL ON TABLE kkcar FROM garikk;
GRANT ALL ON TABLE kkcar TO garikk;
            public       garikk    false    178            �            1259    16675    kkcar_id_seq    SEQUENCE     n   CREATE SEQUENCE kkcar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.kkcar_id_seq;
       public       garikk    false    6    178            ~           0    0    kkcar_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE kkcar_id_seq OWNED BY kkcar.id;
            public       garikk    false    179                       0    0    kkcar_id_seq    ACL     �   REVOKE ALL ON SEQUENCE kkcar_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE kkcar_id_seq FROM garikk;
GRANT ALL ON SEQUENCE kkcar_id_seq TO garikk;
            public       garikk    false    179            �            1259    16677    liveinfo    TABLE     �   CREATE TABLE liveinfo (
    id integer NOT NULL,
    kkcar_id integer,
    name text,
    param_id integer,
    value double precision,
    "timestamp" timestamp with time zone
);
    DROP TABLE public.liveinfo;
       public         garikk    false    6            �           0    0    liveinfo    ACL     {   REVOKE ALL ON TABLE liveinfo FROM PUBLIC;
REVOKE ALL ON TABLE liveinfo FROM garikk;
GRANT ALL ON TABLE liveinfo TO garikk;
            public       garikk    false    180            �            1259    16683    liveinfo_id_seq    SEQUENCE     q   CREATE SEQUENCE liveinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.liveinfo_id_seq;
       public       garikk    false    180    6            �           0    0    liveinfo_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE liveinfo_id_seq OWNED BY liveinfo.id;
            public       garikk    false    181            �           0    0    liveinfo_id_seq    ACL     �   REVOKE ALL ON SEQUENCE liveinfo_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE liveinfo_id_seq FROM garikk;
GRANT ALL ON SEQUENCE liveinfo_id_seq TO garikk;
            public       garikk    false    181            �            1259    33079    liveinfo_request    TABLE     �   CREATE TABLE liveinfo_request (
    id integer NOT NULL,
    configuration_id integer NOT NULL,
    "PID" integer,
    "interval" integer
);
 $   DROP TABLE public.liveinfo_request;
       public         postgres    false    6            �           0    0    liveinfo_request    ACL     �   REVOKE ALL ON TABLE liveinfo_request FROM PUBLIC;
REVOKE ALL ON TABLE liveinfo_request FROM postgres;
GRANT ALL ON TABLE liveinfo_request TO postgres;
GRANT ALL ON TABLE liveinfo_request TO kkcar_webservice;
            public       postgres    false    192            �            1259    33077 %   liveinfo_request_configuration_id_seq    SEQUENCE     �   CREATE SEQUENCE liveinfo_request_configuration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.liveinfo_request_configuration_id_seq;
       public       postgres    false    6    192            �           0    0 %   liveinfo_request_configuration_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE liveinfo_request_configuration_id_seq OWNED BY liveinfo_request.configuration_id;
            public       postgres    false    191            �           0    0 %   liveinfo_request_configuration_id_seq    ACL     0  REVOKE ALL ON SEQUENCE liveinfo_request_configuration_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE liveinfo_request_configuration_id_seq FROM postgres;
GRANT ALL ON SEQUENCE liveinfo_request_configuration_id_seq TO postgres;
GRANT ALL ON SEQUENCE liveinfo_request_configuration_id_seq TO kkcar_webservice;
            public       postgres    false    191            �            1259    33075    liveinfo_request_id_seq    SEQUENCE     y   CREATE SEQUENCE liveinfo_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.liveinfo_request_id_seq;
       public       postgres    false    192    6            �           0    0    liveinfo_request_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE liveinfo_request_id_seq OWNED BY liveinfo_request.id;
            public       postgres    false    190            �           0    0    liveinfo_request_id_seq    ACL     �   REVOKE ALL ON SEQUENCE liveinfo_request_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE liveinfo_request_id_seq FROM postgres;
GRANT ALL ON SEQUENCE liveinfo_request_id_seq TO postgres;
GRANT ALL ON SEQUENCE liveinfo_request_id_seq TO kkcar_webservice;
            public       postgres    false    190            �            1259    33095    manufacture    TABLE     E   CREATE TABLE manufacture (
    id integer NOT NULL,
    name text
);
    DROP TABLE public.manufacture;
       public         postgres    false    6            �           0    0    manufacture    ACL     �   REVOKE ALL ON TABLE manufacture FROM PUBLIC;
REVOKE ALL ON TABLE manufacture FROM postgres;
GRANT ALL ON TABLE manufacture TO postgres;
GRANT ALL ON TABLE manufacture TO kkcar_webservice;
            public       postgres    false    196            �            1259    33093    manufacture_id_seq    SEQUENCE     t   CREATE SEQUENCE manufacture_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.manufacture_id_seq;
       public       postgres    false    196    6            �           0    0    manufacture_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE manufacture_id_seq OWNED BY manufacture.id;
            public       postgres    false    195            �           0    0    manufacture_id_seq    ACL     �   REVOKE ALL ON SEQUENCE manufacture_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE manufacture_id_seq FROM postgres;
GRANT ALL ON SEQUENCE manufacture_id_seq TO postgres;
GRANT ALL ON SEQUENCE manufacture_id_seq TO kkcar_webservice;
            public       postgres    false    195            �            1259    16685    plugins    TABLE     {   CREATE TABLE plugins (
    id integer NOT NULL,
    uuid text,
    name text,
    description text,
    version integer
);
    DROP TABLE public.plugins;
       public         garikk    false    6            �           0    0    plugins    ACL     x   REVOKE ALL ON TABLE plugins FROM PUBLIC;
REVOKE ALL ON TABLE plugins FROM garikk;
GRANT ALL ON TABLE plugins TO garikk;
            public       garikk    false    182            �            1259    16691    plugins_id_seq    SEQUENCE     p   CREATE SEQUENCE plugins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.plugins_id_seq;
       public       garikk    false    182    6            �           0    0    plugins_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE plugins_id_seq OWNED BY plugins.id;
            public       garikk    false    183            �           0    0    plugins_id_seq    ACL     �   REVOKE ALL ON SEQUENCE plugins_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE plugins_id_seq FROM garikk;
GRANT ALL ON SEQUENCE plugins_id_seq TO garikk;
            public       garikk    false    183            �            1259    16731    system_state    TABLE     �   CREATE TABLE system_state (
    id integer NOT NULL,
    name text,
    kkcontroller_version text,
    state integer,
    base_version text
);
     DROP TABLE public.system_state;
       public         postgres    false    6            �           0    0    system_state    ACL     �   REVOKE ALL ON TABLE system_state FROM PUBLIC;
REVOKE ALL ON TABLE system_state FROM postgres;
GRANT ALL ON TABLE system_state TO postgres;
GRANT ALL ON TABLE system_state TO kkcar_webservice;
            public       postgres    false    185            �            1259    16729    system_state_id_seq    SEQUENCE     u   CREATE SEQUENCE system_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.system_state_id_seq;
       public       postgres    false    6    185            �           0    0    system_state_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE system_state_id_seq OWNED BY system_state.id;
            public       postgres    false    184            �           0    0    system_state_id_seq    ACL     �   REVOKE ALL ON SEQUENCE system_state_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE system_state_id_seq FROM postgres;
GRANT ALL ON SEQUENCE system_state_id_seq TO postgres;
GRANT ALL ON SEQUENCE system_state_id_seq TO kkcar_webservice;
            public       postgres    false    184            �           2604    16693    id    DEFAULT     \   ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);
 :   ALTER TABLE public.accounts ALTER COLUMN id DROP DEFAULT;
       public       garikk    false    173    172            �           2604    16694    id    DEFAULT     d   ALTER TABLE ONLY config_types ALTER COLUMN id SET DEFAULT nextval('config_types_id_seq'::regclass);
 >   ALTER TABLE public.config_types ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    175    174            �           2604    16695    id    DEFAULT     h   ALTER TABLE ONLY configurations ALTER COLUMN id SET DEFAULT nextval('configurations_id_seq'::regclass);
 @   ALTER TABLE public.configurations ALTER COLUMN id DROP DEFAULT;
       public       garikk    false    177    176            �           2604    24900    id    DEFAULT     `   ALTER TABLE ONLY file_types ALTER COLUMN id SET DEFAULT nextval('file_types_id_seq'::regclass);
 <   ALTER TABLE public.file_types ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    189    188    189            �           2604    24844    id    DEFAULT     V   ALTER TABLE ONLY files ALTER COLUMN id SET DEFAULT nextval('files_id_seq'::regclass);
 7   ALTER TABLE public.files ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    187    186    187            �           2604    16696    id    DEFAULT     V   ALTER TABLE ONLY kkcar ALTER COLUMN id SET DEFAULT nextval('kkcar_id_seq'::regclass);
 7   ALTER TABLE public.kkcar ALTER COLUMN id DROP DEFAULT;
       public       garikk    false    179    178            �           2604    16697    id    DEFAULT     \   ALTER TABLE ONLY liveinfo ALTER COLUMN id SET DEFAULT nextval('liveinfo_id_seq'::regclass);
 :   ALTER TABLE public.liveinfo ALTER COLUMN id DROP DEFAULT;
       public       garikk    false    181    180            �           2604    33082    id    DEFAULT     l   ALTER TABLE ONLY liveinfo_request ALTER COLUMN id SET DEFAULT nextval('liveinfo_request_id_seq'::regclass);
 B   ALTER TABLE public.liveinfo_request ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    192    190    192            �           2604    33083    configuration_id    DEFAULT     �   ALTER TABLE ONLY liveinfo_request ALTER COLUMN configuration_id SET DEFAULT nextval('liveinfo_request_configuration_id_seq'::regclass);
 P   ALTER TABLE public.liveinfo_request ALTER COLUMN configuration_id DROP DEFAULT;
       public       postgres    false    191    192    192            �           2604    33098    id    DEFAULT     b   ALTER TABLE ONLY manufacture ALTER COLUMN id SET DEFAULT nextval('manufacture_id_seq'::regclass);
 =   ALTER TABLE public.manufacture ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    195    196    196            �           2604    33089    id    DEFAULT     \   ALTER TABLE ONLY odbpids ALTER COLUMN id SET DEFAULT nextval('"ODB_PID_id_seq"'::regclass);
 9   ALTER TABLE public.odbpids ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    193    194    194            �           2604    16698    id    DEFAULT     Z   ALTER TABLE ONLY plugins ALTER COLUMN id SET DEFAULT nextval('plugins_id_seq'::regclass);
 9   ALTER TABLE public.plugins ALTER COLUMN id DROP DEFAULT;
       public       garikk    false    183    182            �           2604    16734    id    DEFAULT     d   ALTER TABLE ONLY system_state ALTER COLUMN id SET DEFAULT nextval('system_state_id_seq'::regclass);
 >   ALTER TABLE public.system_state ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    185    184    185            �           0    0    ODB_PID_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('"ODB_PID_id_seq"', 1, true);
            public       postgres    false    193            J          0    16645    accounts 
   TABLE DATA               2   COPY accounts (id, uuid, login, pass) FROM stdin;
    public       garikk    false    172   V�       �           0    0    accounts_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('accounts_id_seq', 1, true);
            public       garikk    false    173            L          0    16653    config_types 
   TABLE DATA               )   COPY config_types (id, type) FROM stdin;
    public       postgres    false    174   ��       �           0    0    config_types_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('config_types_id_seq', 2, true);
            public       postgres    false    175            N          0    16661    configurations 
   TABLE DATA               y   COPY configurations (id, uuid, name, description, configuration, stamp, configurationtype, ownerconf, kkcar) FROM stdin;
    public       garikk    false    176   ��       �           0    0    configurations_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('configurations_id_seq', 5, true);
            public       garikk    false    177            [          0    24897 
   file_types 
   TABLE DATA               '   COPY file_types (id, name) FROM stdin;
    public       postgres    false    189   s�       �           0    0    file_types_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('file_types_id_seq', 1, false);
            public       postgres    false    188            Y          0    24841    files 
   TABLE DATA               T   COPY files (id, url, owner_conf, name, version, filetype, owner_plugin) FROM stdin;
    public       postgres    false    187   ��       �           0    0    files_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('files_id_seq', 8, true);
            public       postgres    false    186            P          0    16669    kkcar 
   TABLE DATA               M   COPY kkcar (id, name, owner, vehicle, uuid, activeconfiguration) FROM stdin;
    public       garikk    false    178   ��       �           0    0    kkcar_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('kkcar_id_seq', 1, true);
            public       garikk    false    179            R          0    16677    liveinfo 
   TABLE DATA               M   COPY liveinfo (id, kkcar_id, name, param_id, value, "timestamp") FROM stdin;
    public       garikk    false    180   �       �           0    0    liveinfo_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('liveinfo_id_seq', 1, false);
            public       garikk    false    181            ^          0    33079    liveinfo_request 
   TABLE DATA               L   COPY liveinfo_request (id, configuration_id, "PID", "interval") FROM stdin;
    public       postgres    false    192   )�       �           0    0 %   liveinfo_request_configuration_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('liveinfo_request_configuration_id_seq', 1, false);
            public       postgres    false    191            �           0    0    liveinfo_request_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('liveinfo_request_id_seq', 1, false);
            public       postgres    false    190            b          0    33095    manufacture 
   TABLE DATA               (   COPY manufacture (id, name) FROM stdin;
    public       postgres    false    196   F�       �           0    0    manufacture_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('manufacture_id_seq', 1, false);
            public       postgres    false    195            `          0    33086    odbpids 
   TABLE DATA               `   COPY odbpids (id, manufacture, "PID", descriptionlocal, descriptionodb, "PID_MODE") FROM stdin;
    public       postgres    false    194   }�       T          0    16685    plugins 
   TABLE DATA               @   COPY plugins (id, uuid, name, description, version) FROM stdin;
    public       garikk    false    182   ��       �           0    0    plugins_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('plugins_id_seq', 5, true);
            public       garikk    false    183            W          0    16731    system_state 
   TABLE DATA               T   COPY system_state (id, name, kkcontroller_version, state, base_version) FROM stdin;
    public       postgres    false    185   ��       �           0    0    system_state_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('system_state_id_seq', 1, true);
            public       postgres    false    184            �           2606    33105    ODB_PID_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY odbpids
    ADD CONSTRAINT "ODB_PID_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.odbpids DROP CONSTRAINT "ODB_PID_pkey";
       public         postgres    false    194    194            �           2606    16700    accounts_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public         garikk    false    172    172            �           2606    16702    config_types_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY config_types
    ADD CONSTRAINT config_types_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.config_types DROP CONSTRAINT config_types_pkey;
       public         postgres    false    174    174            �           2606    16704    configurations_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY configurations
    ADD CONSTRAINT configurations_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.configurations DROP CONSTRAINT configurations_pkey;
       public         garikk    false    176    176            �           2606    24849    fk_id 
   CONSTRAINT     B   ALTER TABLE ONLY files
    ADD CONSTRAINT fk_id PRIMARY KEY (id);
 5   ALTER TABLE ONLY public.files DROP CONSTRAINT fk_id;
       public         postgres    false    187    187            �           2606    16740    id 
   CONSTRAINT     F   ALTER TABLE ONLY system_state
    ADD CONSTRAINT id PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.system_state DROP CONSTRAINT id;
       public         postgres    false    185    185            �           2606    24905    k_id 
   CONSTRAINT     F   ALTER TABLE ONLY file_types
    ADD CONSTRAINT k_id PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.file_types DROP CONSTRAINT k_id;
       public         postgres    false    189    189            �           2606    16706 
   kkcar_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY kkcar
    ADD CONSTRAINT kkcar_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.kkcar DROP CONSTRAINT kkcar_pkey;
       public         garikk    false    178    178            �           2606    16708    liveinfo_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY liveinfo
    ADD CONSTRAINT liveinfo_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.liveinfo DROP CONSTRAINT liveinfo_pkey;
       public         garikk    false    180    180            �           2606    33103    manufacture_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY manufacture
    ADD CONSTRAINT manufacture_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.manufacture DROP CONSTRAINT manufacture_pkey;
       public         postgres    false    196    196            �           2606    16710    plugins_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY plugins
    ADD CONSTRAINT plugins_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.plugins DROP CONSTRAINT plugins_pkey;
       public         garikk    false    182    182            �           2606    24879    plugins_uuid_key 
   CONSTRAINT     L   ALTER TABLE ONLY plugins
    ADD CONSTRAINT plugins_uuid_key UNIQUE (uuid);
 B   ALTER TABLE ONLY public.plugins DROP CONSTRAINT plugins_uuid_key;
       public         garikk    false    182    182            �           1259    24877 	   FKI_kkcar    INDEX     @   CREATE INDEX "FKI_kkcar" ON configurations USING btree (kkcar);
    DROP INDEX public."FKI_kkcar";
       public         garikk    false    176            �           1259    33111    fki_manufacture    INDEX     C   CREATE INDEX fki_manufacture ON odbpids USING btree (manufacture);
 #   DROP INDEX public.fki_manufacture;
       public         postgres    false    194            �           1259    24855 
   fki_owconf    INDEX     ;   CREATE INDEX fki_owconf ON files USING btree (owner_conf);
    DROP INDEX public.fki_owconf;
       public         postgres    false    187            �           1259    24911 
   fki_plugin    INDEX     =   CREATE INDEX fki_plugin ON files USING btree (owner_plugin);
    DROP INDEX public.fki_plugin;
       public         postgres    false    187            �           2606    24872    FK_kkcar    FK CONSTRAINT     h   ALTER TABLE ONLY configurations
    ADD CONSTRAINT "FK_kkcar" FOREIGN KEY (kkcar) REFERENCES kkcar(id);
 C   ALTER TABLE ONLY public.configurations DROP CONSTRAINT "FK_kkcar";
       public       garikk    false    176    178    1986            �           2606    16711 %   configurations_configurationtype_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY configurations
    ADD CONSTRAINT configurations_configurationtype_fkey FOREIGN KEY (configurationtype) REFERENCES config_types(id);
 ^   ALTER TABLE ONLY public.configurations DROP CONSTRAINT configurations_configurationtype_fkey;
       public       garikk    false    176    174    1981            �           2606    33070    files_owner_conf_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY files
    ADD CONSTRAINT files_owner_conf_fkey FOREIGN KEY (owner_conf) REFERENCES configurations(id);
 E   ALTER TABLE ONLY public.files DROP CONSTRAINT files_owner_conf_fkey;
       public       postgres    false    187    1984    176            �           2606    33106    fk_manufacture    FK CONSTRAINT     q   ALTER TABLE ONLY odbpids
    ADD CONSTRAINT fk_manufacture FOREIGN KEY (manufacture) REFERENCES manufacture(id);
 @   ALTER TABLE ONLY public.odbpids DROP CONSTRAINT fk_manufacture;
       public       postgres    false    194    196    2005            �           2606    24906 	   fk_plugin    FK CONSTRAINT     g   ALTER TABLE ONLY files
    ADD CONSTRAINT fk_plugin FOREIGN KEY (owner_plugin) REFERENCES plugins(id);
 9   ALTER TABLE ONLY public.files DROP CONSTRAINT fk_plugin;
       public       postgres    false    182    187    1990            �           2606    16716    kkcar_ActiveConfiguration_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY kkcar
    ADD CONSTRAINT "kkcar_ActiveConfiguration_fkey" FOREIGN KEY (activeconfiguration) REFERENCES configurations(id);
 P   ALTER TABLE ONLY public.kkcar DROP CONSTRAINT "kkcar_ActiveConfiguration_fkey";
       public       garikk    false    178    1984    176            �           2606    33112    liveinfo_ODB_PID_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY liveinfo
    ADD CONSTRAINT "liveinfo_ODB_PID_fkey" FOREIGN KEY (param_id) REFERENCES odbpids(id);
 J   ALTER TABLE ONLY public.liveinfo DROP CONSTRAINT "liveinfo_ODB_PID_fkey";
       public       garikk    false    2002    194    180            ]           826    16723     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     L  ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON SEQUENCES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON SEQUENCES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO kkcar_webservice;
                  postgres    false            _           826    16725    DEFAULT PRIVILEGES FOR TYPES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TYPES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TYPES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO kkcar_webservice;
                  postgres    false            ^           826    16724     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON FUNCTIONS  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON FUNCTIONS  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO kkcar_webservice;
                  postgres    false            [           826    16721    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL       ALTER DEFAULT PRIVILEGES FOR ROLE garikk IN SCHEMA public REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE garikk IN SCHEMA public REVOKE ALL ON TABLES  FROM garikk;
ALTER DEFAULT PRIVILEGES FOR ROLE garikk IN SCHEMA public GRANT ALL ON TABLES  TO PUBLIC;
            public       garikk    false    6            \           826    16722    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     @  ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO kkcar_webservice;
                  postgres    false            J   W   x��;�  �Y�b�_�..�4&z�����B.b�jFKkOp$jŔ(v�o��{�	��6Fo�Y�C��T�(JZ�w�8���,�      L   )   x�3��M��s��K�L/-J,����2��)MG����� ���      N   m  x��X[o�8~��
�˾�# \Bߒ@;�m� �j4;BL��@df���}��!$%i;��>��}n�g�c����� �
	#Y�d�E�a��`�(��k�K�4IHP����=�07
� A�g�6K|�w\i�՘�Y"I��튻&$�/6m��2N`&�˜<��A$����d)"HǾ�"]TIJ�����?�=-�q DR�����P@~�H ��Z�S7È��?2PO<�3�+�$e�0�C�Lr��I�_|��L�vdMA��I�����\�I
�,���V�R-���_\l���4Ԉ�D	�<�}�L�:0�e �?�����2���N/���������o�a%�m∮z+'���@��I]�]��.B�bR><�����4��Ⱥ9��l��#{��˚�C(w#k~���q�p\Ea:���?��dY��~so���߻'�A�Da�>��I;�3!�9����b�دֻ���7����11=���O�����@>>��D
HFpH�4��v�����8�YHg�u���{��K_Ҽ��e����N���#��Dj@�$C$�m�QUU�tUS4��(�������I�O�Ͱ��f��Y�$�ӌ5.�!�Z7�u0���qM�f�=��#ךxe�gX��f�J��љ�-p�Z0]�v��4b|?�j@鋃�e�LK�
�����x ��w
��܉�Aݳ�eMk{0��v*�Z�D���SAl��bh�U�=�~1�T�@z��j��h$PBC:���z����FH�tɺ"��.�HCM�D�BA��(�t����p���>NX���p�	d
{�T�`��}�ԏq�B�מ3���C��3jAX��aP�'��1�z���Y�6#p��D����x>����b��禛,�&0w�L}��]��?$�o���?�i����Wþ���W��ul&��ڧ9�����g����s<�\��Rn�dX�G8��ԁ" ET"x�
b�cM��P�Loϸ�d��(@!�"9�5OZ�uQE�C�w����ᯜpvp����XT5��U����x�]I#-�T��.Kȗt��>�d�(JIE����gW;8zse���.�(+w��	.��� ���n�p_���+��z{���jKg���T�oN�iМ��=)$U��H(WB�(Rt�
\r���(�U�uQ���v�إ�w�6���̚zpGU�w4��Ɣ3��m��`I�F.����#�:F�>�\�������_RՑ�#TM�����x777��n@��c�fn�|�j����7'ˣՍ,����T���T��S�L:�.�+'uS�FF��J��d���fn��+�Y@	!P��K[��$J_�O-��@TU��g��qr���kkYj�
TRlϼ��m���2��6�R�������n`�"�t����:mx�Ř~��v6�1s��,[��e;|DZ:Kz�E����Ƨ�;�G:����.�5ʯpT����]�*Qm��\x_qs۾q��=rkzi��?M�Ssl���Y��d�E�,��;ӱ//�6>������Euq�q�b�����ʚ�-(����W�q-{�^�]�a��C7���O�>��Y�      [   &   x�3��J,r��I�2�t�(I-�K�q��K����� ���      Y   �   x���K
�0��u<LS_}�'�`F�����/��PD��*��̷	�����q��t�X�[�oʛ�������?�]E�A��*T(���d	�B���~�u.���<4�1c{�r�y�-�@�U|�9��U�@ի�(r�u9򑣱w�c:���.t�C':څN}�tB�[�(Z�e�h���h��
�NX$�_)�ŀ��O�Lμ;0;A����      P   I   x�3�tO,���V/Vp�(�,�I-�4B�T�Դ�$��$c]��D]�d]�TӤ$�$�D�2�=... ��       R   1   x�3�4���@���5�43 �!|cN0��RFz W� |�      ^      x������ � �      b   '   x�3�t�(�,�I-�2�tO�K-�LV�wq2����� ��`      `   �   x�5�ANAE�ݧ�����	T�d�&c���08$zDƌ"��n�1.:������L�\y�R~�$���B��M�I��O�c��g�}���~�B*s��')�й$N=y��r�Y�&�m$Dm#y���B�w�|�i�t�o�����T��k��E�Pf"�m��j�>�M�	�Ôy�p�kd���B�R��.���.8/0��1�u�/]�3�Pύf�]��1����Yk~���      T   �   x�m��J�0���S�F2�L�\�zZAЫ��&Y�-m��Mu�����|�*�"B���Q� &�@�$��.���=���1-��k���+�ʪ:w&���!�;4�&�F��%��C���<���S���JH�8����|퀱��"��.Q�������7ұ�sY�\��ԥu���Ny�X��l��Bh���1������"���m��U��?xIZ.�6����˹������m~]Cyџ���]UU_�aj*      W   3   x�3�I-.��K�4г�4�\F�E�)��%��y��z� �+F��� +s     