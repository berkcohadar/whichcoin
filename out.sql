--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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

--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Market_currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Market_currency" (
    id bigint NOT NULL,
    status character varying(1) NOT NULL,
    name character varying(31) NOT NULL,
    first_trade timestamp with time zone NOT NULL,
    market_cap double precision NOT NULL,
    logo character varying(255) NOT NULL
);


ALTER TABLE public."Market_currency" OWNER TO postgres;

--
-- Name: Market_currency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Market_currency_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Market_currency_id_seq" OWNER TO postgres;

--
-- Name: Market_currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Market_currency_id_seq" OWNED BY public."Market_currency".id;


--
-- Name: Market_currencymarket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Market_currencymarket" (
    id bigint NOT NULL,
    currency_type character varying(1) NOT NULL,
    price double precision NOT NULL,
    price_date timestamp with time zone NOT NULL,
    volume_24h double precision NOT NULL,
    "PNL_24h" double precision NOT NULL,
    "current_ATH" double precision NOT NULL,
    "ATH_date" timestamp with time zone NOT NULL,
    currency_id_id bigint NOT NULL,
    market_id_id bigint NOT NULL
);


ALTER TABLE public."Market_currencymarket" OWNER TO postgres;

--
-- Name: Market_currencymarket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Market_currencymarket_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Market_currencymarket_id_seq" OWNER TO postgres;

--
-- Name: Market_currencymarket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Market_currencymarket_id_seq" OWNED BY public."Market_currencymarket".id;


--
-- Name: Market_market; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Market_market" (
    id bigint NOT NULL,
    name character varying(31) NOT NULL,
    total_volume double precision NOT NULL,
    total_trades double precision NOT NULL,
    status character varying(1) NOT NULL
);


ALTER TABLE public."Market_market" OWNER TO postgres;

--
-- Name: Market_market_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Market_market_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Market_market_id_seq" OWNER TO postgres;

--
-- Name: Market_market_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Market_market_id_seq" OWNED BY public."Market_market".id;


--
-- Name: Wallet_wallet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Wallet_wallet" (
    id bigint NOT NULL,
    public_key character varying(255) NOT NULL,
    user_id integer NOT NULL,
    name character varying(31) NOT NULL
);


ALTER TABLE public."Wallet_wallet" OWNER TO postgres;

--
-- Name: Wallet_wallet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Wallet_wallet_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Wallet_wallet_id_seq" OWNER TO postgres;

--
-- Name: Wallet_wallet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Wallet_wallet_id_seq" OWNED BY public."Wallet_wallet".id;


--
-- Name: Wallet_walletitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Wallet_walletitem" (
    id bigint NOT NULL,
    data_created timestamp with time zone NOT NULL,
    first_price double precision,
    "current_PNL" double precision,
    "currencyMarket_id_id" bigint NOT NULL,
    wallet_id_id bigint NOT NULL
);


ALTER TABLE public."Wallet_walletitem" OWNER TO postgres;

--
-- Name: Wallet_walletitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Wallet_walletitem_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Wallet_walletitem_id_seq" OWNER TO postgres;

--
-- Name: Wallet_walletitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Wallet_walletitem_id_seq" OWNED BY public."Wallet_walletitem".id;


--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailaddress (
    id bigint NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailconfirmation (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id bigint NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialaccount (
    id bigint NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO postgres;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialapp (
    id bigint NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO postgres;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id bigint NOT NULL,
    socialapp_id bigint NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO postgres;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialtoken (
    id bigint NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id bigint NOT NULL,
    app_id bigint NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO postgres;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: Market_currency id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Market_currency" ALTER COLUMN id SET DEFAULT nextval('public."Market_currency_id_seq"'::regclass);


--
-- Name: Market_currencymarket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Market_currencymarket" ALTER COLUMN id SET DEFAULT nextval('public."Market_currencymarket_id_seq"'::regclass);


--
-- Name: Market_market id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Market_market" ALTER COLUMN id SET DEFAULT nextval('public."Market_market_id_seq"'::regclass);


--
-- Name: Wallet_wallet id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wallet_wallet" ALTER COLUMN id SET DEFAULT nextval('public."Wallet_wallet_id_seq"'::regclass);


--
-- Name: Wallet_walletitem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wallet_walletitem" ALTER COLUMN id SET DEFAULT nextval('public."Wallet_walletitem_id_seq"'::regclass);


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Data for Name: Market_currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Market_currency" (id, status, name, first_trade, market_cap, logo) FROM stdin;
1	0	EMRE	2021-06-08 16:20:12+03	500	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtQVDy7AbwCWZkHZE-DAZ6y4sVt7FTglPDLl2h6DX0ubKVhYmU5kc7CtZn2yBeFRWdqPM&usqp=CAU
2	1	BERK	2021-06-01 20:25:00+03	2000	https://productimages.hepsiburada.net/s/54/375/11194916306994.jpg
7	1	Bitcoin	2011-08-18 00:00:00+03	650246843512	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/btc.svg
8	1	Ethereum	2015-08-07 00:00:00+03	247748031487	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/eth.svg
9	1	Binance Coin	2017-07-14 00:00:00+03	45277571735	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/bnb.svg
10	1	Cardano	2017-11-22 00:00:00+03	42652417503	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/ada.svg
11	1	Ripple	2013-05-09 00:00:00+03	31248528326	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/XRP.svg
12	1	Polkadot	2019-08-27 00:00:00+03	15789344736	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/DOT.svg
13	1	Litecoin	2013-03-25 00:00:00+02	9358105045	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/ltc.svg
14	1	Polygon	2019-04-26 00:00:00+03	7065502753	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/matic.png
15	1	Theta Token	2018-01-16 00:00:00+03	6738521124	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/theta.png
16	1	Stellar	2014-08-11 00:00:00+03	6322539918	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/xlm.svg
17	1	VeChain Thor	2018-07-13 00:00:00+03	5657318891	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/vet.png
18	1	Filecoin	2017-11-23 00:00:00+03	5055725682	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/FIL.png
19	1	Algorand	2019-06-21 00:00:00+03	4816207702	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/ALGO.png
20	1	TRON	2017-10-06 00:00:00+03	4696794390	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/TRX.svg
21	1	EOS	2017-06-23 00:00:00+03	3849148779	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/eos.svg
22	1	Tezos	2017-06-23 00:00:00+03	2403578425	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/xtz.svg
23	1	Chiliz	2019-06-29 00:00:00+03	1307110656	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/CHZ.png
24	1	Holo	2018-04-29 00:00:00+03	1062225205	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/hot.png
25	1	Enjin Coin	2017-11-01 00:00:00+03	990766614	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/enj.svg
26	1	Ontology	2018-03-08 00:00:00+03	609657917	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/ONT.png
27	1	Stox	2017-07-25 00:00:00+03	734169	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/stx.svg
28	1	Blocktrade Token	2018-05-23 00:00:00+03	152149	https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/btt.jpeg
\.


--
-- Data for Name: Market_currencymarket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Market_currencymarket" (id, currency_type, price, price_date, volume_24h, "PNL_24h", "current_ATH", "ATH_date", currency_id_id, market_id_id) FROM stdin;
2	0	34689.10613338	2021-06-30 00:00:00+03	38634241149.88	-0.0163	63498.55335819	2021-04-13 00:00:00+03	7	12
3	0	2126.60112097	2021-06-30 00:00:00+03	31300635884.45	-0.0163	4164.78860003	2021-05-11 00:00:00+03	8	12
4	0	292.99489903	2021-06-30 00:00:00+03	2251788683.45	-0.0342	676.62425443	2021-05-03 00:00:00+03	9	12
5	0	1.33012842	2021-06-30 00:00:00+03	3356087773.45	-0.0347	2.33286017	2021-05-16 00:00:00+03	10	12
6	0	0.67715295	2021-06-30 00:00:00+03	4322128133.29	-0.0017	2.77001614	2018-01-07 00:00:00+03	11	12
7	0	15.6970137	2021-06-30 00:00:00+03	1499837107.69	-0.0393	370.64020295	2020-08-12 00:00:00+03	12	12
9	0	1.12089947	2021-06-30 00:00:00+03	1278910670.31	-0.0352	2.44934913	2021-05-18 00:00:00+03	14	12
10	0	6.73852112	2021-06-30 00:00:00+03	311284899.41	-0.0815	14.45668879	2021-04-16 00:00:00+03	15	12
11	0	0.27243818	2021-06-30 00:00:00+03	536891678.85	-0.0286	0.89716306	2018-01-03 00:00:00+03	16	12
12	0	0.08671317	2021-06-30 00:00:00+03	1060721021.85	0.0204	0.25429729	2021-04-18 00:00:00+03	17	12
13	0	60.53147317	2021-06-30 00:00:00+03	1350484496.3	0.0186	190.84473463	2021-03-31 00:00:00+03	18	12
14	0	0.86366515	2021-06-30 00:00:00+03	280444710.11	-0.0487	3.00378162	2019-06-19 00:00:00+03	19	12
15	0	0.06554256	2021-06-30 00:00:00+03	1983470943.17	-0.0376	0.20734901	2018-01-04 00:00:00+03	20	12
16	0	4.01031341	2021-06-30 00:00:00+03	2138409307.3	-0.0245	20.87008492	2018-04-29 00:00:00+03	21	12
17	0	2.87290473	2021-06-30 00:00:00+03	105865906.23	-0.0134	10.34882163	2017-12-17 00:00:00+03	22	12
18	0	0.2445911	2021-06-30 00:00:00+03	254325144.48	-0.0252	0.71542677	2021-04-16 00:00:00+03	23	12
19	0	0.00598034	2021-06-30 00:00:00+03	94316435.75	-0.0273	0.02874109	2021-04-05 00:00:00+03	24	12
20	0	1.06040203	2021-06-30 00:00:00+03	142660476.86	-0.0166	3.5622945	2021-04-09 00:00:00+03	25	12
21	0	0.70068492	2021-06-30 00:00:00+03	257008949.57	-0.0027	9.94104861	2018-05-03 00:00:00+03	26	12
22	0	0.01451406	2021-06-30 00:00:00+03	58.74	-0.0472	2.74129929	2017-08-25 00:00:00+03	27	12
23	0	0.00263477	2021-06-30 00:00:00+03	16803361.44	-0.0433	0.29642153	2018-06-02 00:00:00+03	28	12
1	1	2.42	2021-06-08 16:22:09+03	120	13	2.8	2021-06-01 16:22:42+03	1	1
8	0	180.19125919	2021-06-30 00:00:00+03	2830897280.2	-0.0206	388.11808315	2021-05-09 00:00:00+03	13	12
\.


--
-- Data for Name: Market_market; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Market_market" (id, name, total_volume, total_trades, status) FROM stdin;
1	CryptoEmre	5000000	10000	0
2	CryptoBerk	2000	5	0
12	Deneme	512	16	1
\.


--
-- Data for Name: Wallet_wallet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Wallet_wallet" (id, public_key, user_id, name) FROM stdin;
2	whichCoin-PublicKeyGenerator	2	whichCoin-Deneme1
3	SHIT	1	SHIT
\.


--
-- Data for Name: Wallet_walletitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Wallet_walletitem" (id, data_created, first_price, "current_PNL", "currencyMarket_id_id", wallet_id_id) FROM stdin;
4	2021-06-29 18:36:49.58841+03	2.15	12.558139534883717	1	2
5	2021-06-30 16:31:55.950471+03	140.19125919	28.53244933465384	8	2
6	2021-06-30 16:34:21.75859+03	15.6970137	0	7	2
\.


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add market	7	add_market
26	Can change market	7	change_market
27	Can delete market	7	delete_market
28	Can view market	7	view_market
29	Can add currency market	8	add_currencymarket
30	Can change currency market	8	change_currencymarket
31	Can delete currency market	8	delete_currencymarket
32	Can view currency market	8	view_currencymarket
33	Can add currency	9	add_currency
34	Can change currency	9	change_currency
35	Can delete currency	9	delete_currency
36	Can view currency	9	view_currency
37	Can add wallet item	10	add_walletitem
38	Can change wallet item	10	change_walletitem
39	Can delete wallet item	10	delete_walletitem
40	Can view wallet item	10	view_walletitem
41	Can add wallet	11	add_wallet
42	Can change wallet	11	change_wallet
43	Can delete wallet	11	delete_wallet
44	Can view wallet	11	view_wallet
45	Can add Token	12	add_token
46	Can change Token	12	change_token
47	Can delete Token	12	delete_token
48	Can view Token	12	view_token
49	Can add token	13	add_tokenproxy
50	Can change token	13	change_tokenproxy
51	Can delete token	13	delete_tokenproxy
52	Can view token	13	view_tokenproxy
53	Can add site	14	add_site
54	Can change site	14	change_site
55	Can delete site	14	delete_site
56	Can view site	14	view_site
57	Can add email address	15	add_emailaddress
58	Can change email address	15	change_emailaddress
59	Can delete email address	15	delete_emailaddress
60	Can view email address	15	view_emailaddress
61	Can add email confirmation	16	add_emailconfirmation
62	Can change email confirmation	16	change_emailconfirmation
63	Can delete email confirmation	16	delete_emailconfirmation
64	Can view email confirmation	16	view_emailconfirmation
65	Can add social account	17	add_socialaccount
66	Can change social account	17	change_socialaccount
67	Can delete social account	17	delete_socialaccount
68	Can view social account	17	view_socialaccount
69	Can add social application	18	add_socialapp
70	Can change social application	18	change_socialapp
71	Can delete social application	18	delete_socialapp
72	Can view social application	18	view_socialapp
73	Can add social application token	19	add_socialtoken
74	Can change social application token	19	change_socialtoken
75	Can delete social application token	19	delete_socialtoken
76	Can view social application token	19	view_socialtoken
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$Jt7moIkWZCHETkKJjQe7YP$H25c63sdJt3hZ31tnbM/mw8Cz2FlrKJ9SQacX7mZxhw=	2021-05-30 15:42:44.837803+03	t	admin			admin@admin.com	t	t	2021-05-30 15:40:47.421577+03
2	pbkdf2_sha256$260000$Vj1woYAXeEpI1gtO4SUnzf$p2SfgVgO63GaygRYYbreAzkmpQ50RhjClVSRNkK0QAo=	2021-06-28 17:16:28.117973+03	t	whichcoin			whichcoin@admin.com	t	t	2021-06-08 15:46:27.603111+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-06-08 16:18:57.053136+03	2	whichcoin's whichCoin-Deneme1 wallet	1	[{"added": {}}]	11	2
2	2021-06-08 16:19:32.84616+03	1	CryptoEmre	1	[{"added": {}}]	7	2
3	2021-06-08 16:20:18.390751+03	1	EMRE	1	[{"added": {}}]	9	2
4	2021-06-08 16:22:50.156126+03	1	EMRE/1 on CryptoEmre	1	[{"added": {}}]	8	2
5	2021-06-28 17:17:13.276535+03	1	EMRE/1 on CryptoEmre in whichcoin's whichCoin-Deneme1 wallet	1	[{"added": {}}]	10	2
6	2021-06-28 17:28:57.446182+03	3	admin's SHIT wallet	1	[{"added": {}}]	11	2
7	2021-06-29 18:15:38.766325+03	1	EMRE/1 on CryptoEmre in whichcoin's whichCoin-Deneme1 wallet	3		10	2
8	2021-06-29 18:18:29.651178+03	3	EMRE/1 on CryptoEmre in whichcoin's whichCoin-Deneme1 wallet	3		10	2
9	2021-06-29 18:37:59.707633+03	1	EMRE/1 on CryptoEmre	2	[{"changed": {"fields": ["Price"]}}]	8	2
10	2021-06-29 18:38:22.251315+03	4	EMRE/1 on CryptoEmre in whichcoin's whichCoin-Deneme1 wallet	2	[]	10	2
11	2021-06-29 19:06:23.003917+03	1	EMRE/1 on CryptoEmre	2	[{"changed": {"fields": ["Price"]}}]	8	2
12	2021-06-29 19:06:31.946664+03	1	EMRE/1 on CryptoEmre	2	[{"changed": {"fields": ["Price"]}}]	8	2
13	2021-06-29 19:06:45.195046+03	1	EMRE/1 on CryptoEmre	2	[{"changed": {"fields": ["Price"]}}]	8	2
14	2021-06-29 19:06:52.185611+03	1	EMRE/1 on CryptoEmre	2	[{"changed": {"fields": ["Price"]}}]	8	2
15	2021-06-29 19:07:03.685834+03	1	EMRE/1 on CryptoEmre	2	[{"changed": {"fields": ["Price"]}}]	8	2
16	2021-06-29 19:07:20.498686+03	1	EMRE/1 on CryptoEmre	2	[{"changed": {"fields": ["Price"]}}]	8	2
17	2021-06-29 19:07:30.776463+03	1	EMRE/1 on CryptoEmre	2	[{"changed": {"fields": ["Price"]}}]	8	2
18	2021-06-29 19:07:39.209706+03	1	EMRE/1 on CryptoEmre	2	[{"changed": {"fields": ["Price"]}}]	8	2
19	2021-06-30 16:33:39.605253+03	8	Litecoin/USD on Deneme	2	[{"changed": {"fields": ["Price"]}}]	8	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	Market	market
8	Market	currencymarket
9	Market	currency
10	Wallet	walletitem
11	Wallet	wallet
12	authtoken	token
13	authtoken	tokenproxy
14	sites	site
15	account	emailaddress
16	account	emailconfirmation
17	socialaccount	socialaccount
18	socialaccount	socialapp
19	socialaccount	socialtoken
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-05-26 18:41:00.017476+03
2	auth	0001_initial	2021-05-26 18:41:00.09427+03
3	admin	0001_initial	2021-05-26 18:41:00.115214+03
4	admin	0002_logentry_remove_auto_add	2021-05-26 18:41:00.122197+03
5	admin	0003_logentry_add_action_flag_choices	2021-05-26 18:41:00.129178+03
6	contenttypes	0002_remove_content_type_name	2021-05-26 18:41:00.143168+03
7	auth	0002_alter_permission_name_max_length	2021-05-26 18:41:00.150149+03
8	auth	0003_alter_user_email_max_length	2021-05-26 18:41:00.15711+03
9	auth	0004_alter_user_username_opts	2021-05-26 18:41:00.164085+03
10	auth	0005_alter_user_last_login_null	2021-05-26 18:41:00.171066+03
11	auth	0006_require_contenttypes_0002	2021-05-26 18:41:00.172063+03
12	auth	0007_alter_validators_add_error_messages	2021-05-26 18:41:00.179044+03
13	auth	0008_alter_user_username_max_length	2021-05-26 18:41:00.192009+03
14	auth	0009_alter_user_last_name_max_length	2021-05-26 18:41:00.199987+03
15	auth	0010_alter_group_name_max_length	2021-05-26 18:41:00.208964+03
16	auth	0011_update_proxy_permissions	2021-05-26 18:41:00.214976+03
17	auth	0012_alter_user_first_name_max_length	2021-05-26 18:41:00.221957+03
18	sessions	0001_initial	2021-05-26 18:41:00.234895+03
19	Market	0001_initial	2021-05-30 15:43:38.447624+03
20	Wallet	0001_initial	2021-05-30 15:43:38.489487+03
21	Market	0002_auto_20210608_1513	2021-06-08 15:13:42.265351+03
22	Wallet	0002_wallet_name	2021-06-08 15:44:18.277025+03
23	Market	0003_market_status	2021-06-08 16:14:15.037052+03
24	Market	0004_auto_20210608_1713	2021-06-08 17:14:09.540477+03
25	Wallet	0003_auto_20210608_1713	2021-06-08 17:14:09.565411+03
26	account	0001_initial	2021-06-08 17:14:09.635058+03
27	account	0002_email_max_length	2021-06-08 17:14:09.648049+03
28	account	0003_auto_20210608_1713	2021-06-08 17:14:09.726936+03
29	authtoken	0001_initial	2021-06-08 17:14:09.76192+03
30	authtoken	0002_auto_20160226_1747	2021-06-08 17:14:09.790844+03
31	authtoken	0003_tokenproxy	2021-06-08 17:14:09.793589+03
32	sites	0001_initial	2021-06-08 17:14:09.801581+03
33	sites	0002_alter_domain_unique	2021-06-08 17:14:09.809563+03
34	socialaccount	0001_initial	2021-06-08 17:14:09.900116+03
35	socialaccount	0002_token_max_lengths	2021-06-08 17:14:09.922085+03
36	socialaccount	0003_extra_data_default_dict	2021-06-08 17:14:09.931034+03
37	socialaccount	0004_auto_20210608_1713	2021-06-08 17:14:10.063575+03
38	Wallet	0004_alter_wallet_public_key	2021-06-28 16:48:52.911487+03
39	Wallet	0005_auto_20210629_1826	2021-06-29 18:26:46.3128+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
vowk8jaxz6vae9wcksjtoh0sctzewgmw	.eJxVjEEOwiAQRe_C2hCGgoBL9z0DGTqDVA0kpV0Z765NutDtf-_9l4i4rSVunZc4k7gIEKffLeH04LoDumO9NTm1ui5zkrsiD9rl2Iif18P9OyjYy7f2HpShQOw8Qs501jqYHBQro4JGSuAYDQx20BzAO0CtySqbPPrJsRLvD88QNz4:1lnKmC:GG1bhrENBaChqI8RFyARFKuN-9GXKfDSQO7fKu90ANg	2021-06-13 15:42:44.844594+03
ahlxdqbuqptlza8sh69bl1zjmdy803zz	.eJxVjMsOwiAQRf-FtSEDBQZcuvcbCI9BqgaS0q6M_65NutDtPefcF_NhW6vfBi1-zuzMJDv9bjGkB7Ud5Htot85Tb-syR74r_KCDX3um5-Vw_w5qGPVb2wJZSRDBOSfJTFEBCQcoQFqhMegpGjFZ0iAylgRojSpKK8CCUWvH3h-nfDYo:1lqb8m:zbKGunjh7PWdob6cVzvzfnVFMeYFYjmrPs9liFZ4LCY	2021-06-22 15:47:32.255023+03
vuhq7eo2mg8cdxpc8fx29hg0ytxj5da1	.eJxVjMsOwiAQRf-FtSEDBQZcuvcbCI9BqgaS0q6M_65NutDtPefcF_NhW6vfBi1-zuzMJDv9bjGkB7Ud5Htot85Tb-syR74r_KCDX3um5-Vw_w5qGPVb2wJZSRDBOSfJTFEBCQcoQFqhMegpGjFZ0iAylgRojSpKK8CCUWvH3h-nfDYo:1lxs3o:VuBGwC-W78wyFQd6Ij57cs-t0mBjMk7KyN4v0qsKPTk	2021-07-12 17:16:28.121991+03
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Name: Market_currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Market_currency_id_seq"', 28, true);


--
-- Name: Market_currencymarket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Market_currencymarket_id_seq"', 23, true);


--
-- Name: Market_market_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Market_market_id_seq"', 12, true);


--
-- Name: Wallet_wallet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Wallet_wallet_id_seq"', 3, true);


--
-- Name: Wallet_walletitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Wallet_walletitem_id_seq"', 6, true);


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 76, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 19, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 19, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 39, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: Market_currency Market_currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Market_currency"
    ADD CONSTRAINT "Market_currency_pkey" PRIMARY KEY (id);


--
-- Name: Market_currencymarket Market_currencymarket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Market_currencymarket"
    ADD CONSTRAINT "Market_currencymarket_pkey" PRIMARY KEY (id);


--
-- Name: Market_market Market_market_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Market_market"
    ADD CONSTRAINT "Market_market_pkey" PRIMARY KEY (id);


--
-- Name: Wallet_wallet Wallet_wallet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wallet_wallet"
    ADD CONSTRAINT "Wallet_wallet_pkey" PRIMARY KEY (id);


--
-- Name: Wallet_walletitem Wallet_walletitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wallet_walletitem"
    ADD CONSTRAINT "Wallet_walletitem_pkey" PRIMARY KEY (id);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: Market_currencymarket_currency_id_id_181c8c89; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Market_currencymarket_currency_id_id_181c8c89" ON public."Market_currencymarket" USING btree (currency_id_id);


--
-- Name: Market_currencymarket_market_id_id_fa5ca51c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Market_currencymarket_market_id_id_fa5ca51c" ON public."Market_currencymarket" USING btree (market_id_id);


--
-- Name: Wallet_wallet_user_id_f8c36e73; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Wallet_wallet_user_id_f8c36e73" ON public."Wallet_wallet" USING btree (user_id);


--
-- Name: Wallet_walletitem_currencyMarket_id_id_579f1e43; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Wallet_walletitem_currencyMarket_id_id_579f1e43" ON public."Wallet_walletitem" USING btree ("currencyMarket_id_id");


--
-- Name: Wallet_walletitem_wallet_id_id_c6d48e6c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Wallet_walletitem_wallet_id_id_c6d48e6c" ON public."Wallet_walletitem" USING btree (wallet_id_id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: Market_currencymarket Market_currencymarke_currency_id_id_181c8c89_fk_Market_cu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Market_currencymarket"
    ADD CONSTRAINT "Market_currencymarke_currency_id_id_181c8c89_fk_Market_cu" FOREIGN KEY (currency_id_id) REFERENCES public."Market_currency"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Market_currencymarket Market_currencymarket_market_id_id_fa5ca51c_fk_Market_market_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Market_currencymarket"
    ADD CONSTRAINT "Market_currencymarket_market_id_id_fa5ca51c_fk_Market_market_id" FOREIGN KEY (market_id_id) REFERENCES public."Market_market"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Wallet_wallet Wallet_wallet_user_id_f8c36e73_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wallet_wallet"
    ADD CONSTRAINT "Wallet_wallet_user_id_f8c36e73_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Wallet_walletitem Wallet_walletitem_currencyMarket_id_id_579f1e43_fk_Market_cu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wallet_walletitem"
    ADD CONSTRAINT "Wallet_walletitem_currencyMarket_id_id_579f1e43_fk_Market_cu" FOREIGN KEY ("currencyMarket_id_id") REFERENCES public."Market_currencymarket"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Wallet_walletitem Wallet_walletitem_wallet_id_id_c6d48e6c_fk_Wallet_wallet_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wallet_walletitem"
    ADD CONSTRAINT "Wallet_walletitem_wallet_id_id_c6d48e6c_fk_Wallet_wallet_id" FOREIGN KEY (wallet_id_id) REFERENCES public."Wallet_wallet"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirmation_email_address_id_5b7f8c58_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_email_address_id_5b7f8c58_fk FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_account_id_951f210e_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_account_id_951f210e_fk FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_636a42d7_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_636a42d7_fk FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

