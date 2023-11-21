--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: sam
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO sam;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO sam;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO sam;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO sam;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO sam;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO sam;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO sam;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO sam;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO sam;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO sam;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO sam;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: sam
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


ALTER TABLE public.auth_user OWNER TO sam;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO sam;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO sam;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO sam;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO sam;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO sam;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: cars_car; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.cars_car (
    id integer NOT NULL,
    car_title character varying(255) NOT NULL,
    state character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    color character varying(100) NOT NULL,
    model character varying(100) NOT NULL,
    year integer NOT NULL,
    condition character varying(31) NOT NULL,
    price integer NOT NULL,
    description text NOT NULL,
    car_photo character varying(100) NOT NULL,
    car_photo_1 character varying(100) NOT NULL,
    car_photo_2 character varying(100) NOT NULL,
    car_photo_3 character varying(100) NOT NULL,
    car_photo_4 character varying(100) NOT NULL,
    features character varying(195) NOT NULL,
    body_style character varying(32) NOT NULL,
    engine character varying(100) NOT NULL,
    transmission character varying(20) NOT NULL,
    interior character varying(100) NOT NULL,
    miles double precision NOT NULL,
    doors character varying(9) NOT NULL,
    passengers integer NOT NULL,
    vin_no character varying(100) NOT NULL,
    milage double precision NOT NULL,
    fuel_type character varying(22) NOT NULL,
    no_of_owners character varying(100) NOT NULL,
    is_featured boolean NOT NULL,
    created_date timestamp with time zone NOT NULL
);


ALTER TABLE public.cars_car OWNER TO sam;

--
-- Name: cars_car_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.cars_car_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cars_car_id_seq OWNER TO sam;

--
-- Name: cars_car_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.cars_car_id_seq OWNED BY public.cars_car.id;


--
-- Name: contacts_contact; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.contacts_contact (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    car_id integer NOT NULL,
    customer_need character varying(100) NOT NULL,
    car_title character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(100) NOT NULL,
    message text NOT NULL,
    user_id integer NOT NULL,
    create_date timestamp with time zone NOT NULL
);


ALTER TABLE public.contacts_contact OWNER TO sam;

--
-- Name: contacts_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.contacts_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_contact_id_seq OWNER TO sam;

--
-- Name: contacts_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.contacts_contact_id_seq OWNED BY public.contacts_contact.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: sam
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


ALTER TABLE public.django_admin_log OWNER TO sam;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO sam;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO sam;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO sam;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO sam;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO sam;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO sam;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO sam;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO sam;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: pages_team; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.pages_team (
    id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    designation character varying(255) NOT NULL,
    photo character varying(100) NOT NULL,
    facebook_link character varying(100) NOT NULL,
    twitter_link character varying(100) NOT NULL,
    created_date timestamp with time zone NOT NULL
);


ALTER TABLE public.pages_team OWNER TO sam;

--
-- Name: pages_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.pages_teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_teams_id_seq OWNER TO sam;

--
-- Name: pages_teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.pages_teams_id_seq OWNED BY public.pages_team.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO sam;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO sam;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO sam;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO sam;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO sam;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO sam;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: sam
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO sam;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: sam
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO sam;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sam
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: cars_car id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.cars_car ALTER COLUMN id SET DEFAULT nextval('public.cars_car_id_seq'::regclass);


--
-- Name: contacts_contact id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.contacts_contact ALTER COLUMN id SET DEFAULT nextval('public.contacts_contact_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: pages_team id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.pages_team ALTER COLUMN id SET DEFAULT nextval('public.pages_teams_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: sam
--



--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: sam
--



--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: sam
--



--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: sam
--



--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: sam
--

INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add car', 1, 'add_car');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change car', 1, 'change_car');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete car', 1, 'delete_car');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view car', 1, 'view_car');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add team', 2, 'add_team');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change team', 2, 'change_team');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete team', 2, 'delete_team');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view team', 2, 'view_team');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add contact', 3, 'add_contact');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change contact', 3, 'change_contact');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete contact', 3, 'delete_contact');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view contact', 3, 'view_contact');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add log entry', 4, 'add_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change log entry', 4, 'change_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete log entry', 4, 'delete_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view log entry', 4, 'view_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add permission', 5, 'add_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change permission', 5, 'change_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete permission', 5, 'delete_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view permission', 5, 'view_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add group', 6, 'add_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change group', 6, 'change_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete group', 6, 'delete_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view group', 6, 'view_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add user', 7, 'add_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change user', 7, 'change_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete user', 7, 'delete_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view user', 7, 'view_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add content type', 8, 'add_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change content type', 8, 'change_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete content type', 8, 'delete_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view content type', 8, 'view_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can add session', 9, 'add_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can change session', 9, 'change_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can delete session', 9, 'delete_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can view session', 9, 'view_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add site', 10, 'add_site');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change site', 10, 'change_site');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete site', 10, 'delete_site');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can view site', 10, 'view_site');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can add email address', 11, 'add_emailaddress');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can change email address', 11, 'change_emailaddress');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can delete email address', 11, 'delete_emailaddress');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can view email address', 11, 'view_emailaddress');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can add email confirmation', 12, 'add_emailconfirmation');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can change email confirmation', 12, 'change_emailconfirmation');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can delete email confirmation', 12, 'delete_emailconfirmation');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can view email confirmation', 12, 'view_emailconfirmation');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add social account', 13, 'add_socialaccount');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change social account', 13, 'change_socialaccount');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete social account', 13, 'delete_socialaccount');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can view social account', 13, 'view_socialaccount');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (53, 'Can add social application', 14, 'add_socialapp');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (54, 'Can change social application', 14, 'change_socialapp');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (55, 'Can delete social application', 14, 'delete_socialapp');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (56, 'Can view social application', 14, 'view_socialapp');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (57, 'Can add social application token', 15, 'add_socialtoken');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (58, 'Can change social application token', 15, 'change_socialtoken');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (59, 'Can delete social application token', 15, 'delete_socialtoken');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (60, 'Can view social application token', 15, 'view_socialtoken');


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: sam
--

INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (3, '!GXqX1Z3Nk7vpVP9DeZgyEraBlpsI321uRGw8I0mk', '2022-04-27 18:06:13.838446+00', false, 'somvit8', 'Somvit', 'Maity', '', false, true, '2022-04-27 18:06:09.309493+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (4, 'pbkdf2_sha256$320000$Vh0UPUyzTxrFARVQX6OIr4$zxYTK+kJyelxsrdz61B2sp8Ks/1O07PMEV5WU42oiRA=', '2022-04-27 18:09:24.909751+00', false, 'sam09', 'SOMVIT', 'MAITY', 'maitysomvit@gmail.com', false, true, '2022-04-27 18:09:22.944847+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (5, 'pbkdf2_sha256$320000$bECssx9FQ1OUDSTwgYzYEQ$EPzxkqupc7pFP4iMEZxKHQiHooG3mkvf9HduBjnniL8=', '2022-09-29 07:34:17.136724+00', false, 'd', 'd', 'parker', 'd@gmail.com', false, true, '2022-09-29 07:31:27.614231+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (6, '!mz7jA5EaOCBRUeGlc8SpckkELvBgXf25sIaBiIvI', '2022-09-29 07:55:43.481788+00', false, 'somvit4', 'Somvit', 'Maity', '', false, true, '2022-09-29 07:55:43.447268+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$320000$abSTZRa8zSSgIi7560Mt0y$QOKfFhK8suc26O8Lf88b5pqOppLSwsUaa43HC5V9S6U=', '2023-01-05 05:54:18.989175+00', true, 'sam', '', '', 'developer.09.sam@gmail.com', true, true, '2022-04-27 06:42:06.804519+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (2, '!J4THxRLYy4E0xbhB7nRqzT60WlNwABcxsutOlXUF', '2023-01-05 18:29:35.75355+00', false, 'somvit', 'SOMVIT', 'MAITY', '', false, true, '2022-04-27 11:22:21.597828+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (7, '!WoFMdUFl9L3StMf6NX65JRq77cbZ6T0lm2nNmelA', '2023-02-24 13:10:11.061288+00', false, 'somvit1', 'Somvit', 'Maity', '', false, true, '2023-01-05 06:19:22.437736+00');


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: sam
--



--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: sam
--



--
-- Data for Name: cars_car; Type: TABLE DATA; Schema: public; Owner: sam
--

INSERT INTO public.cars_car (id, car_title, state, city, color, model, year, condition, price, description, car_photo, car_photo_1, car_photo_2, car_photo_3, car_photo_4, features, body_style, engine, transmission, interior, miles, doors, passengers, vin_no, milage, fuel_type, no_of_owners, is_featured, created_date) VALUES (1, 'Ferrari 488 GTB', 'CO', 'Moscow', 'White', '488 GTB', 2022, 'Excellent,New', 479858, '<p>Ferrari 488 GTB is the top model in the 488 lineup and the price of 488 top model is ₹ 3.68 Crore.It returns a certified mileage of 8.77 kmpl. This GTB variant comes with an engine putting out 660 bhp @ 8000 rpm and 760 Nm @ 3000 rpm of max power and max torque respectively. Ferrari 488 GTB is available in Automatic transmission and offered in 8 colours: Blu Tour De France, Nero, Rosso Mugello, Grigio Silverstone, Grigio Titanio, Giallo Modena, Rosso Corsa and Bianco Avus.</p>', 'photos/2022/04/28/1902536891.jpg', 'photos/2022/04/28/1902536917.jpg', 'photos/2022/04/28/1902537043.jpg', 'photos/2022/04/28/1902537077.jpg', 'photos/2022/04/28/1902537082.jpg', 'Cruise Control,Audio Interface,Airbags,Air Conditioning,Seat Heating,Alarm System,ParkAssist,Power Steering,Reversing Camera,Direct Fuel Injection,Auto Start/Stop,Wind Deflector,Bluetooth Handset', 'Sport,Royal', '4.0L V6 Engine', 'Automatic,CVT', 'Black and Grey', 0, '4', 2, 'WTDD55647525665', 15, 'Electric', '0', true, '2022-04-27 20:10:09+00');
INSERT INTO public.cars_car (id, car_title, state, city, color, model, year, condition, price, description, car_photo, car_photo_1, car_photo_2, car_photo_3, car_photo_4, features, body_style, engine, transmission, interior, miles, doors, passengers, vin_no, milage, fuel_type, no_of_owners, is_featured, created_date) VALUES (2, 'Jaguar F-PACE', 'IA', 'California', 'Nevy Blue', 'F-PACE', 2021, 'Excellent,Used', 145650, '<p>2021&nbsp;<a href="https://www.carwale.com/jaguar-cars/" title="Jaguar">Jaguar</a>&nbsp;F-Pace arrives in India with a fresh set of cosmetic and feature updates. For the first time in India, the British marque is offering the F-Pace in the R-Dynamic S variant. The SUV is now available in two new colour options &ndash; Mars Red and Siena Tan. Apart from the petrol engine option, the company has also introduced a next-generation turbocharged Ingenium diesel engine. &nbsp;</p>

<p>Engine&nbsp;</p>

<p>Under the hood, the new F-Pace is powered by 2.0-litre petrol and diesel powertrain options. The 2.0-litre petrol engine generates 247bhp and 365Nm of torque, while the 2.0-litre diesel engine produces 201bhp and 430Nm of torque. Both the engine options come mated to an eight-speed automatic transmission with an all-wheel-drive setup.&nbsp;</p>

<p>Exterior&nbsp;</p>

<p>The 2021 Jaguar F-Pace gets a large grille with the familiar Jaguar heritage logo. The side fender vents feature the Leaper emblem. The fascia is further accentuated by all-LED quad headlamps with &lsquo;Double J&rsquo; DRL signatures, redesigned air intakes, and a dark mesh to offer a dynamic presence. The rear section features a distinctive LED light setup which was last seen in the all-electric I-Pace. Additionally, it gets a sculpted tailgate and a tweaked rear bumper for freshness. &nbsp;</p>

<p>Interior</p>

<p>The updated Jaguar F-Pace gets a driver-focussed cabin. Jaguar has redesigned the centre console and it now incorporates a wireless device charging feature. The aluminium finisher in the upper door insert and full width &lsquo;Piano lid&rsquo; across the width of the instrument panel further enhances the premium quotient. In terms of features, the vehicle gets an 11.4-inch curved glass HD touchscreen with Pivi Pro technology, four-zone climate control, interactive driver display, and a panoramic roof.</p>', 'photos/2022/04/28/1902932503.jpg', 'photos/2022/04/28/1902932514.jpg', 'photos/2022/04/28/1902932528.jpg', 'photos/2022/04/28/1902932542.jpg', 'photos/2022/04/28/1902932503_VHx0O3O.jpg', 'Cruise Control,Audio Interface,Airbags,Air Conditioning,Seat Heating,Alarm System,ParkAssist,Power Steering,Reversing Camera,Direct Fuel Injection,Auto Start/Stop,Wind Deflector,Bluetooth Handset', 'SUV', 'F40''s 2.9L twin-turbo V8', 'Automatic,CVT', 'Black and Grey', 20.2, '5', 4, 'WTDD5564925665', 14.3, 'Diesel,Electric', '1', true, '2022-04-27 20:42:04+00');
INSERT INTO public.cars_car (id, car_title, state, city, color, model, year, condition, price, description, car_photo, car_photo_1, car_photo_2, car_photo_3, car_photo_4, features, body_style, engine, transmission, interior, miles, doors, passengers, vin_no, milage, fuel_type, no_of_owners, is_featured, created_date) VALUES (3, 'Toyota 4Runner', 'WI', 'Berlin', 'White', '4Runner', 2020, 'Excellent,New', 90540, '<p>The&nbsp;<strong>Toyota 4Runner</strong>&nbsp;is a&nbsp;<a href="https://en.wikipedia.org/wiki/Compact_SUV" title="Compact SUV">compact</a>, later a&nbsp;<a href="https://en.wikipedia.org/wiki/Mid-size_sport_utility_vehicle" title="Mid-size sport utility vehicle">mid-size sport utility vehicle</a>&nbsp;produced by the Japanese manufacturer&nbsp;<a href="https://en.wikipedia.org/wiki/Toyota" title="Toyota">Toyota</a>&nbsp;and sold throughout the world from 1984 to the present. In Japan, it is known as the&nbsp;<strong>Toyota Hilux Surf</strong>&nbsp;(<a href="https://en.wikipedia.org/wiki/Japanese_language" title="Japanese language">Japanese</a>:&nbsp;トヨタ・ハイラックスサーフ,&nbsp;<a href="https://en.wikipedia.org/wiki/Hepburn_romanization" title="Hepburn romanization">Hepburn</a>:&nbsp;<em>Toyota Hairakkususāfu</em>)&nbsp;which was withdrawn from the market in 2009. The original 4Runner was a&nbsp;<a href="https://en.wikipedia.org/wiki/Compact_SUV" title="Compact SUV">compact SUV</a>&nbsp;and little more than a Toyota pickup truck with a fiberglass shell over the bed, but the model has since undergone significant independent development into a cross between a compact and a mid-size SUV. All 4Runners have been built in Japan at Toyota&#39;s&nbsp;<a href="https://en.wikipedia.org/wiki/Tahara_plant" title="Tahara plant">plant</a>&nbsp;in&nbsp;<a href="https://en.wikipedia.org/wiki/Tahara,_Aichi" title="Tahara, Aichi">Tahara, Aichi</a>, or at the&nbsp;<a href="https://en.wikipedia.org/wiki/Hino_Motors" title="Hino Motors">Hino Motors</a>&nbsp;(a Toyota subsidiary) plant in&nbsp;<a href="https://en.wikipedia.org/wiki/Hamura" title="Hamura">Hamura</a>.</p>

<p>The name &quot;4Runner&quot; was created by a copywriter named Robert Nathan who was working for the advertising agency&nbsp;<a href="https://en.wikipedia.org/wiki/Saatchi_%26_Saatchi" title="Saatchi &amp; Saatchi">Saatchi &amp; Saatchi</a>. The agency held contests to invent new vehicle names before the introduction of new Toyota models. The name 4Runner was created as a play on the term &quot;forerunner,&quot; since the sport utility vehicle was the first of its kind for Toyota with an emphasis on its 4x4 capability and seating for four.[<em><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" title="Wikipedia:Citation needed">citation needed</a></em>]</p>

<p>For some markets, the Hilux Surf was replaced in 2005 by the similar&nbsp;<a href="https://en.wikipedia.org/wiki/Toyota_Fortuner" title="Toyota Fortuner">Fortuner</a>, which is based on the&nbsp;<a href="https://en.wikipedia.org/wiki/Toyota_Hilux" title="Toyota Hilux">Hilux</a>&nbsp;platform.</p>

<p>As of 2021, the 4Runner is sold in the Bahamas, Bolivia, Canada, Chile, Colombia, Costa Rica, El Salvador, Guatemala, Panama, Peru, the United States and Venezuela.</p>

<p>The 4Runner came in at number five in a 2019 study by&nbsp;<a href="https://en.wikipedia.org/wiki/ISeeCars.com" title="ISeeCars.com">iSeeCars.com</a>&nbsp;ranking the longest-lasting vehicles in the US. The 4Runner had 3.9&nbsp;percent of vehicles over 200,000 miles (320,000&nbsp;km), according to the study.</p>', 'photos/2022/04/28/1893633875.jpg', 'photos/2022/04/28/1893633879.jpg', 'photos/2022/04/28/1893633884.jpg', 'photos/2022/04/28/1896836883.jpg', 'photos/2022/04/28/1896836887.jpg', 'Cruise Control,Audio Interface,Airbags,Air Conditioning,Seat Heating,Alarm System,ParkAssist,Power Steering,Reversing Camera,Direct Fuel Injection,Auto Start/Stop,Wind Deflector,Bluetooth Handset', 'SUV,Mini Van', '1.8 G CVT1798 cc', 'Manual', 'Grey', 0, '5', 6, 'EREFG5687563956', 17.35, 'Diesel', '0', true, '2022-04-28 02:12:16+00');
INSERT INTO public.cars_car (id, car_title, state, city, color, model, year, condition, price, description, car_photo, car_photo_1, car_photo_2, car_photo_3, car_photo_4, features, body_style, engine, transmission, interior, miles, doors, passengers, vin_no, milage, fuel_type, no_of_owners, is_featured, created_date) VALUES (4, 'Toyota Corolla', 'NY', 'Manhatten', 'White', 'Corolla', 2022, 'Excellent,New', 234590, '<h3>Toyota Corolla Altis Verdict</h3>

<p>What we liked about the Toyota Corolla Altis is its ability to commute around the city with ease. Better still, it makes for an apt choice if you are the kind who gets chauffeured around. Then there&rsquo;s also the bullet-proof reliability of Toyota products that come into play.</p>', 'photos/2022/04/28/1900893299.jpg', 'photos/2022/04/28/1900893311.jpg', 'photos/2022/04/28/1900893319.jpg', 'photos/2022/04/28/1900893329.jpg', 'photos/2022/04/28/1900893391.jpg', 'Cruise Control,Audio Interface,Airbags,Air Conditioning,Seat Heating,Alarm System,ParkAssist,Power Steering,Reversing Camera,Direct Fuel Injection,Auto Start/Stop,Wind Deflector,Bluetooth Handset', 'SUV,Royal', '2.0-litre four-cylinder versions badged D165 and D200', 'Automatic,CVT', 'Light Brown', 0, '5', 6, 'WDY6956464472323', 23.24, 'Electric', '0', true, '2022-04-28 02:17:18+00');
INSERT INTO public.cars_car (id, car_title, state, city, color, model, year, condition, price, description, car_photo, car_photo_1, car_photo_2, car_photo_3, car_photo_4, features, body_style, engine, transmission, interior, miles, doors, passengers, vin_no, milage, fuel_type, no_of_owners, is_featured, created_date) VALUES (5, 'Ford F-250 Super Duty', 'SD', 'France', 'Nevy Blue', 'F-250 Super', 2018, 'Excellent,Used', 94860, '<h2>OUR MOST CAPABLE SUPER DUTY.</h2>

<p>Super Duty&reg;&nbsp;never stops moving forward. That&rsquo;s why Ford Super Duty features the available 7.3L OHV gas V8 and the available Power Stroke&reg;&nbsp;V8 Turbo Diesel, and offers the latest technology with an available new 12-inch screen featuring the all-new SYNC&reg;&nbsp;4. Impressive Super Duty gas and diesel power ratings combine with rugged frame and chassis engineering to achieve strong numbers in every category of hauling and towing, including best-in-class horsepower, best-in-class GCWR, best-in-class payload and the best 5th-wheel and conventional towing in its class.</p>

<p>475 horsepower at 2,600 RPM with available 6.7L Power Stroke&reg;&nbsp;Diesel engine. Class is Full-Size Pickups over 8,500 lbs. GVWR. 430 horsepower and 475 lb.-ft. of torque on available 7.3L gas V8 engine. Class is Full-Size Pickups over 8,500 lbs. GVWR. Max available GCWR of 45,300 lbs. on F-450, Crew Cab. Class is Full-Size Pickups over 8,500 lbs. GVWR. Max available payload on F-350 DRW, Regular Cab, 4x2, 6.2L with F-350 Gas Heavy-Duty Payload Package. Class is Full-Size Pickups over 8,500 lbs. GVWR. See label on doorjamb for carrying capacity of a specific vehicle.</p>', 'photos/2022/04/28/1894300894.jpg', 'photos/2022/04/28/1894300905.jpg', 'photos/2022/04/28/1894300920.jpg', 'photos/2022/04/28/1900155012.jpg', 'photos/2022/04/28/1900155133.jpg', 'Cruise Control,Audio Interface,Airbags,Air Conditioning,Seat Heating,Alarm System,ParkAssist,Power Steering,Reversing Camera,Direct Fuel Injection,Auto Start/Stop,Wind Deflector,Bluetooth Handset', 'SUV,Mini Van,Classic', '6.7-liter Power Stroke® V8 Turbo Diesel', 'Manual,Automatic,CVT', 'Black', 54.02, '3', 2, 'WERETRE5465464', 20.35, 'Diesel', '1', true, '2022-04-28 02:20:36+00');
INSERT INTO public.cars_car (id, car_title, state, city, color, model, year, condition, price, description, car_photo, car_photo_1, car_photo_2, car_photo_3, car_photo_4, features, body_style, engine, transmission, interior, miles, doors, passengers, vin_no, milage, fuel_type, no_of_owners, is_featured, created_date) VALUES (6, 'Ford Edge', 'FL', 'Tokyo', 'Black', 'Edge', 2019, 'New', 254890, '<h2>The New Era of Edge</h2>

<p>With the bold design and impressive performance of the 2022 Ford Edge, you&rsquo;ll never have to sacrifice substance for style again. Plus, the Edge you love now gives you even more with standard all-wheel-drive on every model.</p>

<h2>Good Looks That&rsquo;ll Get You Second Looks</h2>

<p>With the dynamic grille, sleek roof, modern shape and smooth lines, Edge naturally gets noticed. Plus, with two new exterior colors to choose from and a fresh tailgate appliqu&eacute;, you won&rsquo;t just be turning corners &mdash; you&rsquo;ll be turning heads.</p>

<h2>Safety Comes Standard</h2>

<p>The Ford Edge with specific LED headlamps was recognized in 2021 as an IIHS TOP SAFETY PICK. With available Ford Co-Pilot360&trade;&nbsp;Technology, it&rsquo;s an SUV you can feel secure in.</p>', 'photos/2022/04/28/1901478607.jpg', 'photos/2022/04/28/1901478618.jpg', 'photos/2022/04/28/1901478646.jpg', 'photos/2022/04/28/1901478672.jpg', 'photos/2022/04/28/1901478687.jpg', 'Cruise Control,Audio Interface,Airbags,Air Conditioning,Seat Heating,Alarm System,ParkAssist,Power Steering,Reversing Camera,Direct Fuel Injection,Auto Start/Stop,Wind Deflector,Bluetooth Handset', 'SUV,Mini Van', '2.7L V6 EcoBoost', 'Automatic,CVT', 'Black and Grey', 0, '5', 4, 'WERETRE5465464', 26.9, 'Electric', '0', true, '2022-04-27 21:05:31+00');


--
-- Data for Name: contacts_contact; Type: TABLE DATA; Schema: public; Owner: sam
--

INSERT INTO public.contacts_contact (id, first_name, last_name, car_id, customer_need, car_title, city, state, email, phone, message, user_id, create_date) VALUES (1, 'Somvit', 'Maity', 5, 'I''d like to know your best price for this', 'Ford F-250 Super Duty', 'Howrah', 'West Bengal', 'maitysomvit@gmail.com', '+916291646550', 'acsa', 0, '2022-09-29 07:26:22.132353+00');
INSERT INTO public.contacts_contact (id, first_name, last_name, car_id, customer_need, car_title, city, state, email, phone, message, user_id, create_date) VALUES (2, 'Somvit', 'Maity', 6, 'I''d like a history report for this', 'Ford Edge', 'Howrah', 'West Bengal', 'maitysomvit@gmail.com', '+916291646550', '', 0, '2022-09-29 13:00:20.536207+00');
INSERT INTO public.contacts_contact (id, first_name, last_name, car_id, customer_need, car_title, city, state, email, phone, message, user_id, create_date) VALUES (3, 'Sam', 'Pearce', 5, 'I''m interested in this', 'Ford F-250 Super Duty', 'California', 'West Bengal', 'maitysomvit@gmail.com', '+91 6291646550', 'test', 0, '2023-01-05 11:52:04.634658+00');
INSERT INTO public.contacts_contact (id, first_name, last_name, car_id, customer_need, car_title, city, state, email, phone, message, user_id, create_date) VALUES (4, 'SOMVIT', 'MAITY', 4, 'I''m interested in this', 'Toyota Corolla', 'Jagadishpur Hat', 'West Bengal', 'maitysomvit@gmail.com', '06291646550', '', 0, '2023-02-24 13:06:59.860018+00');


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: sam
--

INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2022-04-27 06:59:58.346544+00', '1', 'FACEBOOK', 1, '[{"added": {}}]', 14, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (2, '2022-04-27 10:59:15.502166+00', '2', 'GOOGLE', 1, '[{"added": {}}]', 14, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (3, '2022-04-27 11:13:27.425116+00', '1', 'FACEBOOK', 2, '[{"changed": {"fields": ["Sites"]}}]', 14, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (4, '2022-04-27 11:14:58.930568+00', '1', 'localhost:8000', 2, '[{"changed": {"fields": ["Domain name", "Display name"]}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (5, '2022-04-27 20:11:20.336355+00', '1', 'Ferrari 488 GTB', 1, '[{"added": {}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (6, '2022-04-27 20:18:04.541723+00', '1', 'Domnic', 1, '[{"added": {}}]', 2, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (7, '2022-04-27 20:20:10.888958+00', '1', 'Domnic', 2, '[]', 2, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (8, '2022-04-27 20:21:40.973472+00', '2', 'Brain', 1, '[{"added": {}}]', 2, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (9, '2022-04-27 20:23:51.759286+00', '3', 'Letty', 1, '[{"added": {}}]', 2, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (10, '2022-04-27 20:26:21.405014+00', '4', 'Mia', 1, '[{"added": {}}]', 2, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (11, '2022-04-27 20:31:29.853422+00', '5', 'Tej', 1, '[{"added": {}}]', 2, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (12, '2022-04-27 20:33:45.914593+00', '6', 'Roman', 1, '[{"added": {}}]', 2, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (13, '2022-04-27 20:42:12.577419+00', '2', 'Jaguar F-PACE', 1, '[{"added": {}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (14, '2022-04-27 20:47:14.989943+00', '3', 'Toyota 4Runner', 1, '[{"added": {}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (15, '2022-04-27 20:50:32.432751+00', '4', 'Toyota Corolla', 1, '[{"added": {}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (16, '2022-04-27 21:00:41.608546+00', '5', 'Ford F-250 Super Duty', 1, '[{"added": {}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (17, '2022-04-27 21:05:37.91945+00', '6', 'Ford Edge', 1, '[{"added": {}}]', 1, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (18, '2023-01-05 05:57:02.564632+00', '1', 'FACEBOOK', 2, '[{"changed": {"fields": ["Client id", "Secret key", "Key"]}}]', 14, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (19, '2023-01-05 05:58:10.901818+00', '2', '127.0.0.1:8000', 1, '[{"added": {}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (20, '2023-01-05 05:58:56.076942+00', '1', 'FACEBOOK', 2, '[{"changed": {"fields": ["Sites"]}}]', 14, 1);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: sam
--

INSERT INTO public.django_content_type (id, app_label, model) VALUES (1, 'cars', 'car');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (2, 'pages', 'team');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (3, 'contacts', 'contact');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (4, 'admin', 'logentry');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (5, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (6, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (7, 'auth', 'user');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (8, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (9, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (10, 'sites', 'site');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (11, 'account', 'emailaddress');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (12, 'account', 'emailconfirmation');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (13, 'socialaccount', 'socialaccount');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (14, 'socialaccount', 'socialapp');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (15, 'socialaccount', 'socialtoken');


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: sam
--

INSERT INTO public.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2022-04-27 05:41:33.717552+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2022-04-27 05:41:43.55378+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (3, 'account', '0001_initial', '2022-04-27 05:41:48.387421+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (4, 'account', '0002_email_max_length', '2022-04-27 05:41:49.553471+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (5, 'admin', '0001_initial', '2022-04-27 05:41:52.493503+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (6, 'admin', '0002_logentry_remove_auto_add', '2022-04-27 05:41:53.384152+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (7, 'admin', '0003_logentry_add_action_flag_choices', '2022-04-27 05:41:54.587315+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (8, 'contenttypes', '0002_remove_content_type_name', '2022-04-27 05:41:56.336876+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0002_alter_permission_name_max_length', '2022-04-27 05:41:57.819344+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0003_alter_user_email_max_length', '2022-04-27 05:41:59.272511+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0004_alter_user_username_opts', '2022-04-27 05:42:00.444422+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0005_alter_user_last_login_null', '2022-04-27 05:42:02.10072+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0006_require_contenttypes_0002', '2022-04-27 05:42:03.27263+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (14, 'auth', '0007_alter_validators_add_error_messages', '2022-04-27 05:42:04.663298+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (15, 'auth', '0008_alter_user_username_max_length', '2022-04-27 05:42:06.413348+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (16, 'auth', '0009_alter_user_last_name_max_length', '2022-04-27 05:42:07.897766+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (17, 'auth', '0010_alter_group_name_max_length', '2022-04-27 05:42:09.397322+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (18, 'auth', '0011_update_proxy_permissions', '2022-04-27 05:42:12.131779+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (20, 'auth', '0012_alter_user_first_name_max_length', '2022-04-27 05:44:54.386196+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (21, 'cars', '0001_initial', '2022-04-27 05:44:55.83937+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (22, 'cars', '0002_auto_20200706_1659', '2022-04-27 05:44:58.557722+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (23, 'cars', '0003_alter_car_year', '2022-04-27 05:44:59.792139+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (24, 'contacts', '0001_initial', '2022-04-27 05:45:01.383498+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (25, 'pages', '0001_initial', '2022-04-27 05:45:02.867921+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (26, 'pages', '0002_auto_20200625_1755', '2022-04-27 05:45:05.322104+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (27, 'sessions', '0001_initial', '2022-04-27 05:45:07.853435+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (28, 'sites', '0001_initial', '2022-04-27 05:45:09.322234+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (29, 'sites', '0002_alter_domain_unique', '2022-04-27 05:45:11.697308+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (30, 'socialaccount', '0001_initial', '2022-04-27 05:45:19.322067+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (31, 'socialaccount', '0002_token_max_lengths', '2022-04-27 05:45:21.305482+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (32, 'socialaccount', '0003_extra_data_default_dict', '2022-04-27 05:45:22.510645+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (33, 'cars', '0004_alter_car_body_style_alter_car_condition_and_more', '2022-04-27 20:06:22.021567+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (34, 'cars', '0005_alter_car_milage_alter_car_miles', '2022-04-27 20:17:12.243406+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (35, 'pages', '0003_remove_team_google_plus_link', '2022-04-27 20:17:13.718062+00');


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: sam
--

INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('laaesf3o370bovymisvvdh8yhvyif8sh', '.eJxVjEEOwiAQRe_C2pDAAKJL956BDDODVA1NSrtqvLtt0oVu_3vvryrhMte0dJnSwOqqjDr9bhnpJW0H_MT2GDWNbZ6GrHdFH7Tr-8jyvh3u30HFXrc6-rN3xCSEjNb4YJliLlKcEBSIMfOFQCwE570JQOBc2GwborOCoj5fCVA4mQ:1njnci:Th3DWI4e2ZOKdcYCW1jHtZnTaH0bwxzuCzdvewAVp90', '2022-05-11 19:46:52.853383+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('tpk5hujnyhhgyqg3768pmdji4n6tivm2', 'eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIm9oOVNqQmx3TUhPYiJdfQ:1njySQ:QX1ZolloXpABgXPQkZO_DugRfh_ohUIIqzYssJTMFAs', '2022-05-12 07:20:58.428813+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('zjszn7n7iui0lzc0dlk9qqvohvydjp8r', 'eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIkI3U2tBaURMSmwwbiJdfQ:1nlm0S:jkPzuPiOI0yb1GfagOWicsqVaVQhXb8qeAbQ7Luue-0', '2022-05-17 06:27:32.434008+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('60kp6h4sgvp6hgvilhqr4y4ty447yf8j', 'eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIk5qU0tya2dGeEJqMiJdfQ:1odo4a:1NWNSBQpFmKeEdzsViOKHwteBqDFiZ5fMM3hU-k_zlQ', '2022-10-13 07:35:08.67377+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('etjfcexl7bd30edq5kgmgjed8tfa6b7a', 'eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIjE0Z0t0VXE5eHdhdSJdfQ:1odo4c:oFBILDx4fInJl_BgucdzUVlX1-InC6H8inXMXSKUqTM', '2022-10-13 07:35:10.909285+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('xr56vkxcmhmi19cvii719xn4jbm6waqx', 'eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIldIMDhWZTRlUUlyOCJdfQ:1odoGe:rHhSUO0I_S4-sU2H7aJgy3CKQ41WQbwdXgd-8S4K7wk', '2022-10-13 07:47:36.679186+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('sfc79pxiwe110ekv3rqagoqpy8jrjl9g', '.eJxVjMsOwiAQRf-FtSEzlFdcuvcbyDBQqRpISrsy_ruSdKHbe865LxFo30rYe17DksRZoDj9bpH4kesA6U711iS3uq1LlEORB-3y2lJ-Xg7376BQL996QjCWjZkSOqLsGRQqcHNkpFlH9KAxMWQV0TIgsCXltZ_caJxm8f4Aybw3EA:1pB9G4:EAj_8g6TxBK_0Nk4tht004ZllXy_o5D93DdmaPakCjg', '2023-01-13 06:52:48.922761+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('yr5dtity1xvktgxwsgy70eqv9opwvkwd', '.eJxVjEEOwiAQRe_C2hCEyoBL9z0DYWZAqgaS0q6MdzckXej2v_f-W4S4byXsPa1hYXEVIE6_G0Z6pjoAP2K9N0mtbuuCcijyoF3OjdPrdrh_ByX2MuqIykwqMRMDOcyTNxMgOsjR09loRA0Z7UVr69kq5cCbTGAyWzSE4vMFCu84mw:1pVXpb:InGj-bEUIRaaQwF9_06dsEoqA7wDTa37OYHF0nOXlaY', '2023-03-10 13:09:47.282356+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('bd9ubdngcavdb183vvvj79o2z6dt9t8m', '.eJxVjEEOwiAQRe_C2hCEyoBL9z0DYWZAqgaS0q6MdzckXej2v_f-W4S4byXsPa1hYXEVIE6_G0Z6pjoAP2K9N0mtbuuCcijyoF3OjdPrdrh_ByX2MuqIykwqMRMDOcyTNxMgOsjR09loRA0Z7UVr69kq5cCbTGAyWzSE4vMFCu84mw:1pVXpz:OndmJjxbEmz0PYv1jxrbI2L5QqrEayCj9hML0ebe1K0', '2023-03-10 13:10:11.565259+00');


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: sam
--

INSERT INTO public.django_site (id, domain, name) VALUES (1, 'localhost:8000', 'localhost:8000');
INSERT INTO public.django_site (id, domain, name) VALUES (2, '127.0.0.1:8000', '127.0.0.1:8000');


--
-- Data for Name: pages_team; Type: TABLE DATA; Schema: public; Owner: sam
--

INSERT INTO public.pages_team (id, first_name, last_name, designation, photo, facebook_link, twitter_link, created_date) VALUES (1, 'Domnic', 'Toretto', 'CEO', 'photos/2022/04/28/toretto.jpg', 'https://www.facebook.com/VinDiesel', 'https://twitter.com/vindiesel', '2022-04-27 20:18:03.729687+00');
INSERT INTO public.pages_team (id, first_name, last_name, designation, photo, facebook_link, twitter_link, created_date) VALUES (2, 'Brain', 'O''Corner', 'Manager', 'photos/2022/04/28/brain_o_corner.png', 'https://www.facebook.com/PaulWalker', 'https://twitter.com/realpaulwalker', '2022-04-27 20:21:40.380197+00');
INSERT INTO public.pages_team (id, first_name, last_name, designation, photo, facebook_link, twitter_link, created_date) VALUES (3, 'Letty', 'Ortiz', 'Assistent Manager', 'photos/2022/04/28/letty.png', 'https://www.facebook.com/MRodOfficial', 'https://twitter.com/MRodOfficial?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor', '2022-04-27 20:23:51.192373+00');
INSERT INTO public.pages_team (id, first_name, last_name, designation, photo, facebook_link, twitter_link, created_date) VALUES (4, 'Mia', 'Toretto', 'Assistent Manager', 'photos/2022/04/28/mia1.jpg', 'https://www.facebook.com/JordanaBrewster', 'https://twitter.com/JordanaBrewster?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor', '2022-04-27 20:26:20.810757+00');
INSERT INTO public.pages_team (id, first_name, last_name, designation, photo, facebook_link, twitter_link, created_date) VALUES (5, 'Tej', 'Parker', 'Head Technician', 'photos/2022/04/28/tej.jpg', 'https://www.facebook.com/ludacris', 'https://twitter.com/Ludacris?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor', '2022-04-27 20:31:29.286511+00');
INSERT INTO public.pages_team (id, first_name, last_name, designation, photo, facebook_link, twitter_link, created_date) VALUES (6, 'Roman', 'Pearce', 'Web Developer', 'photos/2022/04/28/ROMAN.jpg', 'https://www.facebook.com/tyrese', 'https://twitter.com/tyrese', '2022-04-27 20:33:45.282735+00');


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: sam
--

INSERT INTO public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) VALUES (2, 'facebook', '1321450455015198', '2022-04-27 18:06:10.514121+00', '2022-04-27 18:06:10.514121+00', '{"id": "1321450455015198", "name": "Somvit Maity", "first_name": "Somvit", "last_name": "Maity"}', 3);
INSERT INTO public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) VALUES (3, 'google', '106344498468464259145', '2022-09-29 07:55:43.458604+00', '2022-09-29 07:55:43.458615+00', '{"id": "106344498468464259145", "name": "Somvit Maity", "given_name": "Somvit", "family_name": "Maity", "picture": "https://lh3.googleusercontent.com/a/ALm5wu3rPoFdrwXptS3DWUzxg6HPLMdzXdiki-hK-xor=s96-c", "locale": "en"}', 6);
INSERT INTO public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) VALUES (1, 'google', '115623925138883024458', '2023-01-05 18:29:32.554299+00', '2022-04-27 11:22:22.872289+00', '{"id": "115623925138883024458", "name": "SOMVIT MAITY", "given_name": "SOMVIT", "family_name": "MAITY", "picture": "https://lh3.googleusercontent.com/a/AEdFTp4GC1sOtOQzUIwD08Qmpy29mKQQLkAJ1J7zBzxAjQ=s96-c", "locale": "en"}', 2);
INSERT INTO public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) VALUES (4, 'facebook', '1495386710954904', '2023-02-24 13:10:07.468077+00', '2023-01-05 06:19:23.920862+00', '{"id": "1495386710954904", "name": "Somvit Maity", "first_name": "Somvit", "last_name": "Maity"}', 7);


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: sam
--

INSERT INTO public.socialaccount_socialapp (id, provider, name, client_id, secret, key) VALUES (2, 'google', 'GOOGLE', '632592293624-edvqkh56ico0hfjpbb9g2qtfnkefut4b.apps.googleusercontent.com', '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', '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');
INSERT INTO public.socialaccount_socialapp (id, provider, name, client_id, secret, key) VALUES (1, 'facebook', 'FACEBOOK', '541638144300518', 'e3b22fa948258fffb869e794a445e892', '');


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: sam
--

INSERT INTO public.socialaccount_socialapp_sites (id, socialapp_id, site_id) VALUES (1, 2, 1);
INSERT INTO public.socialaccount_socialapp_sites (id, socialapp_id, site_id) VALUES (2, 1, 1);
INSERT INTO public.socialaccount_socialapp_sites (id, socialapp_id, site_id) VALUES (3, 1, 2);


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: sam
--

INSERT INTO public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) VALUES (2, 'EAAHh6XMjKNQBAGhXoxtwyd8woGYkhZCnukMWK3ZBMJX5vA4u5JxcDj4hd4shPGQOYpYM9mddZAg7eAVqyuWPCZAS2OQT8mmtO4dgQS6YMuRpDC3a6xNvxO7A7zzAZAKzKMLGV3OtUw6aZBH8S4rZCNEEDzNUM70jO2Qx6VBVTjZApdEvTFurEFqFOgQeMkG0FZCTyZClpxc9XVBatlFH2HG7pJc5pRrIhV1Afipb9G0NGsZCZCKTZAvYZAqymWdvZA0PbMZBQr0ZD', '', '2022-06-26 11:15:38.646382+00', 2, 1);
INSERT INTO public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) VALUES (3, 'ya29.a0Aa4xrXPHGajTQhCQ8GzxTf5_Ed4YKvEmIxK5xNpOEqYapsPiI2cQLvvjX5PaYZL4SqPXDNvnzd0OZqTW291S_pAP7YhJ-tPs7rJH-QgZIAuEjZ5F5mYoisx2xoS4eCU35Bc3_ftKqHwzQ3Tnhchg3h5iIuBPaCgYKATASARISFQEjDvL9Z7eK_Xqbmd8xVFtQlUPJlA0163', '', '2022-09-29 08:55:42.39763+00', 3, 2);
INSERT INTO public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) VALUES (1, 'ya29.a0AX9GBdX66gEBhJV0P5-r1t1dieBra8ifCjzRBhDJb1_zlu18fOBoZgjO8dEjtLbvQ5ztsZKadIvMoXSKYF0wnUB87nNjvOYJ04Hn8W5S6CU4DICxAHl2G4iZMUMdXfO3znQdHwGJ2eL4Dcoq2V8CuEejL0CvUQaCgYKAUsSARASFQHUCsbC0Kj4IjV18Ci_Ryy2qL3Z0A0165', '', '2023-01-05 19:29:28.010876+00', 1, 2);
INSERT INTO public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) VALUES (4, 'EAAHsnfUwFeYBALFxHD5c7IlDhsdPNZCBgJKWXfB5WzVilpfPZBatu0JYVZAzpZBlYbiik6OYyy2cQnvNo84O7ZBOSsCNHINHsD8GXypJDqMj42tpdy6NRxZAYBDeQsga0SIW1xxPcVIiFGKRxAxQiTMHB9lIH3rcaegz2cYQBIKwZCaybmwWuTftdhuJwIZA0XOZB8h8xJ0FCIvVtBYGNxJGgZAriQ7XpVdyO67fFjPKrSg9iuIXIB1T42cxW7J53k3MUZD', '', '2023-04-25 13:09:37.186483+00', 4, 1);


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 7, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: cars_car_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.cars_car_id_seq', 6, true);


--
-- Name: contacts_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.contacts_contact_id_seq', 4, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 20, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 35, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.django_site_id_seq', 2, true);


--
-- Name: pages_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.pages_teams_id_seq', 6, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 4, true);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 2, true);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 3, true);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sam
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 4, true);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cars_car cars_car_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.cars_car
    ADD CONSTRAINT cars_car_pkey PRIMARY KEY (id);


--
-- Name: contacts_contact contacts_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.contacts_contact
    ADD CONSTRAINT contacts_contact_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: pages_team pages_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.pages_team
    ADD CONSTRAINT pages_teams_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: sam
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sam
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO sam;


--
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO sam;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO sam;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO sam;


--
-- PostgreSQL database dump complete
--

