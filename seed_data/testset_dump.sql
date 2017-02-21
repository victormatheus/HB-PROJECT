--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: actions; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE actions (
    action_id integer NOT NULL,
    user_id integer NOT NULL,
    place_id integer NOT NULL,
    action_code character varying(3) NOT NULL
);


ALTER TABLE actions OWNER TO vagrant;

--
-- Name: actions_action_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE actions_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actions_action_id_seq OWNER TO vagrant;

--
-- Name: actions_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE actions_action_id_seq OWNED BY actions.action_id;


--
-- Name: actiontypes; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE actiontypes (
    action_code character varying(3) NOT NULL,
    action_name character varying(20) NOT NULL
);


ALTER TABLE actiontypes OWNER TO vagrant;

--
-- Name: activations; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE activations (
    activation_number bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE activations OWNER TO vagrant;

--
-- Name: activations_activation_number_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE activations_activation_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activations_activation_number_seq OWNER TO vagrant;

--
-- Name: activations_activation_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE activations_activation_number_seq OWNED BY activations.activation_number;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE cities (
    city_id integer NOT NULL,
    name character varying(100) NOT NULL,
    country_code character varying(2) NOT NULL,
    latitud character varying(100),
    longitud character varying(100),
    description text,
    picture character varying(200)
);


ALTER TABLE cities OWNER TO vagrant;

--
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE cities_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cities_city_id_seq OWNER TO vagrant;

--
-- Name: cities_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE cities_city_id_seq OWNED BY cities.city_id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE countries (
    country_code character varying(2) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    latitud character varying(100),
    longitud character varying(100),
    picture character varying(200)
);


ALTER TABLE countries OWNER TO vagrant;

--
-- Name: place_tags; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE place_tags (
    place_tag_id integer NOT NULL,
    place_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE place_tags OWNER TO vagrant;

--
-- Name: place_tags_place_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE place_tags_place_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE place_tags_place_tag_id_seq OWNER TO vagrant;

--
-- Name: place_tags_place_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE place_tags_place_tag_id_seq OWNED BY place_tags.place_tag_id;


--
-- Name: places; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE places (
    place_id integer NOT NULL,
    name character varying(100) NOT NULL,
    city_id integer NOT NULL,
    rating double precision,
    latitud character varying(100),
    longitud character varying(100),
    address character varying(200),
    description text,
    picture character varying(200),
    url_4s character varying(200)
);


ALTER TABLE places OWNER TO vagrant;

--
-- Name: places_place_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE places_place_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE places_place_id_seq OWNER TO vagrant;

--
-- Name: places_place_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE places_place_id_seq OWNED BY places.place_id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE tags (
    tag_id integer NOT NULL,
    tag_name character varying(50) NOT NULL
);


ALTER TABLE tags OWNER TO vagrant;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE tags_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_tag_id_seq OWNER TO vagrant;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE tags_tag_id_seq OWNED BY tags.tag_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE users (
    user_id integer NOT NULL,
    name character varying(100) NOT NULL,
    lastname character varying(100) NOT NULL,
    city_id integer,
    email character varying(64) NOT NULL,
    password character varying(20) NOT NULL,
    is_activated boolean,
    picture character varying(200)
);


ALTER TABLE users OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: action_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY actions ALTER COLUMN action_id SET DEFAULT nextval('actions_action_id_seq'::regclass);


--
-- Name: activation_number; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY activations ALTER COLUMN activation_number SET DEFAULT nextval('activations_activation_number_seq'::regclass);


--
-- Name: city_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY cities ALTER COLUMN city_id SET DEFAULT nextval('cities_city_id_seq'::regclass);


--
-- Name: place_tag_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY place_tags ALTER COLUMN place_tag_id SET DEFAULT nextval('place_tags_place_tag_id_seq'::regclass);


--
-- Name: place_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY places ALTER COLUMN place_id SET DEFAULT nextval('places_place_id_seq'::regclass);


--
-- Name: tag_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tags ALTER COLUMN tag_id SET DEFAULT nextval('tags_tag_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Data for Name: actions; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY actions (action_id, user_id, place_id, action_code) FROM stdin;
1	6	34	hbh
2	3	87	hbh
3	10	99	sav
4	1	65	hbh
5	6	67	sav
6	1	150	hbh
7	3	74	sav
8	7	42	hbh
9	9	55	hbh
10	2	7	hbh
11	9	118	hbh
12	8	47	hbh
13	9	124	sav
14	3	29	sav
15	4	100	sav
16	1	84	hbh
17	7	31	hbh
18	6	112	hbh
19	2	140	sav
20	8	16	hbh
\.


--
-- Name: actions_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('actions_action_id_seq', 20, true);


--
-- Data for Name: actiontypes; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY actiontypes (action_code, action_name) FROM stdin;
sav	Save
hbh	Have been here
\.


--
-- Data for Name: activations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY activations (activation_number, user_id) FROM stdin;
8526137043	1
8071003262	2
6258634672	3
8681386642	4
7488321046	5
2174795489	6
4158241121	7
2195105914	8
4316422674	9
5623223490	10
2933617472	11
\.


--
-- Name: activations_activation_number_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('activations_activation_number_seq', 1, false);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY cities (city_id, name, country_code, latitud, longitud, description, picture) FROM stdin;
1	Hong Kong	HK	22.28552	114.15769	\N	\N
2	Singapore	SG	1.28967	103.85007	\N	\N
3	Stockholm	SE	59.33258	18.0649	\N	\N
4	New York City	US	40.742185	-73.992602	\N	\N
5	London	GB	51.50853	-0.12574	\N	\N
6	Cartagena	CO	10.39972	-75.51444	\N	\N
7	San Francisco	US	\N	\N	\N	\N
\.


--
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('cities_city_id_seq', 7, true);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY countries (country_code, name, description, latitud, longitud, picture) FROM stdin;
CA	Canada	\N	\N	\N	\N
ST	Sao Tome and Principe	\N	\N	\N	\N
GW	Guinea-Bissau	\N	\N	\N	\N
MC	Monaco	\N	\N	\N	\N
LT	Lithuania	\N	\N	\N	\N
KH	Cambodia	\N	\N	\N	\N
KN	Saint Kitts and Nevis	\N	\N	\N	\N
CH	Switzerland	\N	\N	\N	\N
ET	Ethiopia	\N	\N	\N	\N
AW	Aruba	\N	\N	\N	\N
MF	Saint Martin (French part)	\N	\N	\N	\N
PS	Palestine	\N	\N	\N	\N
AR	Argentina	\N	\N	\N	\N
BO	Bolivia	\N	\N	\N	\N
CM	Cameroon	\N	\N	\N	\N
BF	Burkina Faso	\N	\N	\N	\N
TM	Turkmenistan	\N	\N	\N	\N
GH	Ghana	\N	\N	\N	\N
SA	Saudi Arabia	\N	\N	\N	\N
RW	Rwanda	\N	\N	\N	\N
TG	Togo	\N	\N	\N	\N
JP	Japan	\N	\N	\N	\N
AS	American Samoa	\N	\N	\N	\N
UM	United States Minor Outlying Islands	\N	\N	\N	\N
CC	Cocos (Keeling) Islands	\N	\N	\N	\N
PN	Pitcairn	\N	\N	\N	\N
GT	Guatemala	\N	\N	\N	\N
BA	Bosnia and Herzegovina	\N	\N	\N	\N
KW	Kuwait	\N	\N	\N	\N
JO	Jordan	\N	\N	\N	\N
BL	Saint Barthelemy	\N	\N	\N	\N
DM	Dominica	\N	\N	\N	\N
LR	Liberia	\N	\N	\N	\N
MV	Maldives	\N	\N	\N	\N
JM	Jamaica	\N	\N	\N	\N
OM	Oman	\N	\N	\N	\N
TZ	Tanzania	\N	\N	\N	\N
MQ	Martinique	\N	\N	\N	\N
AL	Albania	\N	\N	\N	\N
GA	Gabon	\N	\N	\N	\N
NU	Niue	\N	\N	\N	\N
VA	Vatican	\N	\N	\N	\N
WF	Wallis and Futuna	\N	\N	\N	\N
NZ	New Zealand	\N	\N	\N	\N
YE	Yemen	\N	\N	\N	\N
JE	Jersey	\N	\N	\N	\N
AD	Andorra	\N	\N	\N	\N
GL	Greenland	\N	\N	\N	\N
WS	Samoa	\N	\N	\N	\N
NF	Norfolk Island	\N	\N	\N	\N
AE	United Arab Emirates	\N	\N	\N	\N
GU	Guam	\N	\N	\N	\N
IN	India	\N	\N	\N	\N
AZ	Azerbaijan	\N	\N	\N	\N
LS	Lesotho	\N	\N	\N	\N
VC	Saint Vincent and the Grenadines	\N	\N	\N	\N
KE	Kenya	\N	\N	\N	\N
MO	Macao	\N	\N	\N	\N
TR	Turkey	\N	\N	\N	\N
AF	Afghanistan	\N	\N	\N	\N
BD	Bangladesh	\N	\N	\N	\N
MR	Mauritania	\N	\N	\N	\N
SB	Solomon Islands	\N	\N	\N	\N
TC	Turks and Caicos Islands	\N	\N	\N	\N
LC	Saint Lucia	\N	\N	\N	\N
SM	San Marino	\N	\N	\N	\N
PF	French Polynesia	\N	\N	\N	\N
FR	France	\N	\N	\N	\N
BM	Bermuda	\N	\N	\N	\N
SK	Slovakia	\N	\N	\N	\N
SO	Somalia	\N	\N	\N	\N
PE	Peru	\N	\N	\N	\N
SZ	Swaziland	\N	\N	\N	\N
BQ	Bonaire Sint Eustatius and Saba	\N	\N	\N	\N
NR	Nauru	\N	\N	\N	\N
SC	Seychelles	\N	\N	\N	\N
NO	Norway	\N	\N	\N	\N
CI	Cote d'Ivoire	\N	\N	\N	\N
CK	Cook Islands	\N	\N	\N	\N
BJ	Benin	\N	\N	\N	\N
KR	Korea	\N	\N	\N	\N
EH	Western Sahara	\N	\N	\N	\N
CU	Cuba	\N	\N	\N	\N
ME	Montenegro	\N	\N	\N	\N
FK	Falkland Islands (Malvinas)	\N	\N	\N	\N
YT	Mayotte	\N	\N	\N	\N
CN	China	\N	\N	\N	\N
AM	Armenia	\N	\N	\N	\N
TL	Timor-Leste	\N	\N	\N	\N
DO	Dominican Republic	\N	\N	\N	\N
MN	Mongolia	\N	\N	\N	\N
UA	Ukraine	\N	\N	\N	\N
BH	Bahrain	\N	\N	\N	\N
TO	Tonga	\N	\N	\N	\N
FI	Finland	\N	\N	\N	\N
LY	Libya	\N	\N	\N	\N
KY	Cayman Islands	\N	\N	\N	\N
CF	Central African Republic	\N	\N	\N	\N
NC	New Caledonia	\N	\N	\N	\N
MU	Mauritius	\N	\N	\N	\N
TJ	Tajikistan	\N	\N	\N	\N
LI	Liechtenstein	\N	\N	\N	\N
AU	Australia	\N	\N	\N	\N
ML	Mali	\N	\N	\N	\N
SE	Sweden	\N	\N	\N	\N
RU	Russia	\N	\N	\N	\N
BG	Bulgaria	\N	\N	\N	\N
US	United States	\N	\N	\N	\N
RO	Romania	\N	\N	\N	\N
AO	Angola	\N	\N	\N	\N
TF	French Southern Territories	\N	\N	\N	\N
TD	Chad	\N	\N	\N	\N
ZA	South Africa	\N	\N	\N	\N
TK	Tokelau	\N	\N	\N	\N
CY	Cyprus	\N	\N	\N	\N
GS	South Georgia and the South Sandwich Islands	\N	\N	\N	\N
BN	Brunei Darussalam	\N	\N	\N	\N
QA	Qatar	\N	\N	\N	\N
MY	Malaysia	\N	\N	\N	\N
AT	Austria	\N	\N	\N	\N
VN	Vietnam	\N	\N	\N	\N
MZ	Mozambique	\N	\N	\N	\N
UG	Uganda	\N	\N	\N	\N
HU	Hungary	\N	\N	\N	\N
NE	Niger	\N	\N	\N	\N
IM	Isle of Man	\N	\N	\N	\N
BR	Brazil	\N	\N	\N	\N
FO	Faroe Islands	\N	\N	\N	\N
GN	Guinea	\N	\N	\N	\N
PA	Panama	\N	\N	\N	\N
CR	Costa Rica	\N	\N	\N	\N
LU	Luxembourg	\N	\N	\N	\N
CV	Cape Verde	\N	\N	\N	\N
BS	Bahamas	\N	\N	\N	\N
GI	Gibraltar	\N	\N	\N	\N
IE	Ireland	\N	\N	\N	\N
PK	Pakistan	\N	\N	\N	\N
PW	Palau	\N	\N	\N	\N
NG	Nigeria	\N	\N	\N	\N
EC	Ecuador	\N	\N	\N	\N
CZ	Czech Republic	\N	\N	\N	\N
BY	Belarus	\N	\N	\N	\N
IR	Iran	\N	\N	\N	\N
DZ	Algeria	\N	\N	\N	\N
SI	Slovenia	\N	\N	\N	\N
SV	El Salvador	\N	\N	\N	\N
TV	Tuvalu	\N	\N	\N	\N
PM	Saint Pierre and Miquelon	\N	\N	\N	\N
MH	Marshall Islands	\N	\N	\N	\N
CL	Chile	\N	\N	\N	\N
PR	Puerto Rico	\N	\N	\N	\N
BE	Belgium	\N	\N	\N	\N
KI	Kiribati	\N	\N	\N	\N
HT	Haiti	\N	\N	\N	\N
BZ	Belize	\N	\N	\N	\N
HK	Hong Kong	\N	\N	\N	\N
SL	Sierra Leone	\N	\N	\N	\N
GE	Georgia	\N	\N	\N	\N
LA	Lao People's Democratic Republic	\N	\N	\N	\N
MX	Mexico	\N	\N	\N	\N
GM	Gambia	\N	\N	\N	\N
PH	Philippines	\N	\N	\N	\N
MD	Moldova	\N	\N	\N	\N
MA	Morocco	\N	\N	\N	\N
HR	Croatia	\N	\N	\N	\N
FM	Micronesia	\N	\N	\N	\N
GG	Guernsey	\N	\N	\N	\N
TH	Thailand	\N	\N	\N	\N
NA	Namibia	\N	\N	\N	\N
GD	Grenada	\N	\N	\N	\N
IQ	Iraq	\N	\N	\N	\N
PT	Portugal	\N	\N	\N	\N
EE	Estonia	\N	\N	\N	\N
UY	Uruguay	\N	\N	\N	\N
GQ	Equatorial Guinea	\N	\N	\N	\N
LB	Lebanon	\N	\N	\N	\N
SJ	Svalbard and Jan Mayen	\N	\N	\N	\N
UZ	Uzbekistan	\N	\N	\N	\N
TN	Tunisia	\N	\N	\N	\N
DJ	Djibouti	\N	\N	\N	\N
HM	Heard Island and McDonald Islands	\N	\N	\N	\N
AG	Antigua and Barbuda	\N	\N	\N	\N
ES	Spain	\N	\N	\N	\N
CO	Colombia	\N	\N	\N	\N
RE	Reunion	\N	\N	\N	\N
BI	Burundi	\N	\N	\N	\N
TW	Taiwan	\N	\N	\N	\N
FJ	Fiji	\N	\N	\N	\N
BB	Barbados	\N	\N	\N	\N
MG	Madagascar	\N	\N	\N	\N
IT	Italy	\N	\N	\N	\N
CW	Curacao	\N	\N	\N	\N
BT	Bhutan	\N	\N	\N	\N
SD	Sudan	\N	\N	\N	\N
NP	Nepal	\N	\N	\N	\N
MT	Malta	\N	\N	\N	\N
NL	Netherlands	\N	\N	\N	\N
MP	Northern Mariana Islands	\N	\N	\N	\N
SR	Suriname	\N	\N	\N	\N
AI	Anguilla	\N	\N	\N	\N
VE	Venezuela	\N	\N	\N	\N
AX	Aland Islands	\N	\N	\N	\N
CX	Christmas Island	\N	\N	\N	\N
ID	Indonesia	\N	\N	\N	\N
IS	Iceland	\N	\N	\N	\N
ZM	Zambia	\N	\N	\N	\N
SN	Senegal	\N	\N	\N	\N
PG	Papua New Guinea	\N	\N	\N	\N
MW	Malawi	\N	\N	\N	\N
TT	Trinidad and Tobago	\N	\N	\N	\N
ZW	Zimbabwe	\N	\N	\N	\N
DE	Germany	\N	\N	\N	\N
VU	Vanuatu	\N	\N	\N	\N
DK	Denmark	\N	\N	\N	\N
KZ	Kazakhstan	\N	\N	\N	\N
PL	Poland	\N	\N	\N	\N
ER	Eritrea	\N	\N	\N	\N
KG	Kyrgyzstan	\N	\N	\N	\N
IO	British Indian Ocean Territory	\N	\N	\N	\N
MS	Montserrat	\N	\N	\N	\N
IL	Israel	\N	\N	\N	\N
MK	Macedonia	\N	\N	\N	\N
LK	Sri Lanka	\N	\N	\N	\N
LV	Latvia	\N	\N	\N	\N
SS	South Sudan	\N	\N	\N	\N
GY	Guyana	\N	\N	\N	\N
SY	Syria	\N	\N	\N	\N
GP	Guadeloupe	\N	\N	\N	\N
HN	Honduras	\N	\N	\N	\N
MM	Myanmar	\N	\N	\N	\N
BV	Bouvet Island	\N	\N	\N	\N
EG	Egypt	\N	\N	\N	\N
NI	Nicaragua	\N	\N	\N	\N
SG	Singapore	\N	\N	\N	\N
RS	Serbia	\N	\N	\N	\N
BW	Botswana	\N	\N	\N	\N
GB	United Kingdom	\N	\N	\N	\N
AQ	Antarctica	\N	\N	\N	\N
CG	Congo	\N	\N	\N	\N
SX	Sint Maarten (Dutch part)	\N	\N	\N	\N
GR	Greece	\N	\N	\N	\N
PY	Paraguay	\N	\N	\N	\N
GF	French Guiana	\N	\N	\N	\N
KM	Comoros	\N	\N	\N	\N
\.


--
-- Data for Name: place_tags; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY place_tags (place_tag_id, place_id, tag_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	8	8
9	9	9
10	10	4
11	11	4
12	12	10
13	13	4
14	14	11
15	15	4
16	16	12
17	17	13
18	18	14
19	19	15
20	20	16
21	21	4
22	22	17
23	23	18
24	24	7
25	25	4
26	26	4
27	18	19
28	28	4
29	29	20
30	30	1
31	31	1
32	32	21
33	33	22
34	34	12
35	35	11
36	36	4
37	37	23
38	38	24
39	39	25
40	40	24
41	41	10
42	42	26
43	43	27
44	44	28
45	45	29
46	46	1
47	47	7
48	48	25
49	49	12
50	50	30
51	51	31
52	52	32
53	53	33
54	54	6
55	55	13
56	56	13
57	57	2
58	58	34
59	59	4
60	60	35
61	61	12
62	62	36
63	63	24
64	64	15
65	65	37
66	66	24
67	67	1
68	68	7
69	69	38
70	70	39
71	71	40
72	72	41
73	73	39
74	74	7
75	75	42
76	76	13
77	77	39
78	78	43
79	79	44
80	80	45
81	81	46
82	82	38
83	83	22
84	84	39
85	85	47
86	86	39
87	87	48
88	88	45
89	89	49
90	90	50
91	91	13
92	92	37
93	93	51
94	94	13
95	95	27
96	96	52
97	97	13
98	98	53
99	99	13
100	100	1
101	101	13
102	102	24
103	103	54
104	104	55
105	105	33
106	106	13
107	107	56
108	108	57
109	109	58
110	110	49
111	111	52
112	112	59
113	113	27
114	114	60
115	115	13
116	116	61
117	117	62
118	118	63
119	119	45
120	120	12
121	121	13
122	122	13
123	123	13
124	124	13
125	125	13
126	126	64
127	127	6
128	128	65
129	129	17
130	130	13
131	131	13
132	132	24
133	133	66
134	134	13
135	135	25
136	136	13
137	137	67
138	138	68
139	139	69
140	140	13
141	141	41
142	133	66
143	143	13
144	144	13
145	145	13
146	146	70
147	147	37
148	148	6
149	149	71
150	150	72
151	151	73
152	152	26
153	153	31
154	154	62
155	155	73
156	156	28
157	157	74
158	158	47
159	159	15
160	154	45
161	161	75
162	162	76
163	163	73
164	164	31
165	165	28
166	166	77
167	167	78
168	168	78
169	169	62
170	170	28
171	171	7
172	172	24
173	173	31
174	174	58
175	175	79
176	176	80
177	177	27
178	178	81
179	179	13
180	180	27
\.


--
-- Name: place_tags_place_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('place_tags_place_tag_id_seq', 180, true);


--
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY places (place_id, name, city_id, rating, latitud, longitud, address, description, picture, url_4s) FROM stdin;
1	Nan Lian Garden	1	9.5	22.339663323718344	114.20401995515398	60 Fung Tak Rd	\N	\N	https://foursquare.com/item/5250e59911d2cc0d5860c883
2	Morning Trail, The Peak	1	9.5	22.2780082676673	114.14443177978094	Harlech Rd and Lugard Rd	\N	\N	https://foursquare.com/item/5687e176498eaebe398e9372
3	Broadway Cinematheque (百老匯電影中心)	1	9.40000000000000036	22.310716183194028	114.16890263557434	G/F, Prosperous Garden, 3 Public Square St	\N	\N	https://foursquare.com/item/5195443a498edbf8a550bc56
4	Toy Story Land	1	9.40000000000000036	22.310369992285068	114.039779214547	Hong Kong Disneyland	\N	\N	https://foursquare.com/item/4ea8e598b8f7d2a521a92c8d
5	The Asia Society Hong Kong Center 亞洲協會香港中心	1	9.40000000000000036	22.27591114063176	114.1654487911651	9 Justice Dr	\N	\N	https://foursquare.com/item/516b8c6fe4b010e0c0352a85
6	ArtisTree	1	9.30000000000000071	22.286708	114.212735	1/F, Cornwall House, Taikoo Place, 979 King's Rd	\N	\N	https://foursquare.com/item/517fdb5fe4b06e1ee7696897
7	Café Gray Deluxe	1	9.30000000000000071	22.277784	114.165378	49/F, Upper House, Pacific Place, 88 Queensway	\N	\N	https://foursquare.com/item/51be6280498e40022fa144eb
8	Victoria Peak (太平山)	1	9.30000000000000071	22.271138338877577	114.14992997222568	Peak Rd	\N	\N	https://foursquare.com/item/50b4e4d9e4b0f6a10aa028ae
9	Samsen 泰麵	1	9.30000000000000071	22.274093	114.174093	G/F, 68 Stone Nullah Lane	\N	\N	https://foursquare.com/item/589ef12004f4d77ed036e2ec
10	Mickey's PhilharMagic	1	9.19999999999999929	22.312061103888105	114.04047310352325	Hong Kong Disneyland	\N	\N	https://foursquare.com/item/5277cd4c498e0d29857374f9
11	Big Grizzly Mountain Runaway Mine Cars	1	9.19999999999999929	22.310113333685624	114.04193951519044	Grizzly Gulch, Hong Kong Disneyland	\N	\N	https://foursquare.com/item/54c49b79498e64b8cdef4360
12	Hong Kong Park Aviary 香港公園觀鳥園	1	9.19999999999999929	22.27714	114.161399	Hong Kong Park	\N	\N	https://foursquare.com/item/4b4c9b2870c603bbbacf8fb4
13	Adventureland	1	9.19999999999999929	22.312498442831586	114.04188144272356	Hong Kong Disneyland	\N	\N	https://foursquare.com/item/5279086d498e9152e02cd000
14	Hong Kong Disneyland (香港迪士尼樂園)	1	9.19999999999999929	22.313330601839578	114.04434370895963	Fantasy Rd (Penny's Bay)	\N	\N	https://foursquare.com/item/4e1ad9a7636529dcc13b782a
15	Sleeping Beauty's Castle	1	9.19999999999999929	22.312768364230536	114.04185240648741	Fantasyland, Hong Kong Disneyland	\N	\N	https://foursquare.com/item/51c985bd498e805f34b8ba62
16	The Sky Terrace 428 凌霄閣摩天臺428	1	9.19999999999999929	22.271315676638288	114.1500198841095	The Peak Tower, 128 Peak Rd	\N	\N	https://foursquare.com/item/5188a0cf498e470e92b650dd
17	Hong Kong Park	1	9.09999999999999964	22.27769953093909	114.16185379028319	19 Cotton Tree Dr	\N	\N	https://foursquare.com/item/5084cf11e4b0d2d6651e5550
18	Din Tai Fung (鼎泰豐)	1	9.09999999999999964	22.2976732545756	114.16944980621338	Shop 130, 3/F, Silvercord, 30 Canton Rd	\N	\N	https://foursquare.com/item/50db27abe4b0b7ab9cc1dd4b
19	Winstons Coffee	1	9.09999999999999964	22.28695648501287	114.1443156609422	213 Queens Rd W	\N	\N	https://foursquare.com/item/5712f616498ecfc33f311668
20	Yardbird	1	9.09999999999999964	22.28360160666072	114.15011376142502	33-35 Bridges St (at Aberdeen St)	\N	\N	https://foursquare.com/item/4e605f6b1520355eb67a351b
21	Flash	1	9.09999999999999964	22.234606358005475	114.17110928025497	Ocean Park Hong Kong	\N	\N	https://foursquare.com/item/50f28caee4b0dbfd2234f4f1
22	Tian Tan Buddha (Giant Buddha) (天壇大佛)	1	9.09999999999999964	22.253953	113.905011	Po Lin Monastery, Ngong Ping Rd	\N	\N	https://foursquare.com/item/4f1d9acfe4b03543a3844660
23	Pure Yoga	1	9.09999999999999964	22.283033302292747	114.15579386198564	2/F, Asia Standard Tower, 59-65 Queen's Rd C	\N	\N	https://foursquare.com/item/5386ada5498e6b709bd94c83
24	NOT Specialty Coffee	1	9.09999999999999964	22.279719808343184	114.17888290047385	324 Jaffe Rd (btwn Marsh & Tonnochy Rd)	\N	\N	https://foursquare.com/item/562dc9d6498e4b2dbb44df93
25	Fantasyland	1	9	22.312324131143953	114.0404462814331	Hong Kong Disneyland	\N	\N	https://foursquare.com/item/52009e3a498ef1acdc45b09d
26	Hair Raiser 動感快車	1	9	22.234557725134476	114.17187561782718	180 Wong Chuk Hang Rd	\N	\N	https://foursquare.com/item/50f25623e4b0bf1338498328
27	Din Tai Fung (鼎泰豐)	1	9	22.279396925607852	114.18624420086987	68 Yee Wo St, 铜锣湾	\N	\N	https://foursquare.com/item/4bd4597370c603bb672b99b4
28	Tomorrowland	1	9	22.313536503714015	114.04192790069763	Hong Kong Disneyland	\N	\N	https://foursquare.com/item/57e759da498ec357e4315d3a
29	Royal Hong Kong Yacht Club 香港遊艇會	1	9	22.284367	114.1821	Kellett Island	\N	\N	https://foursquare.com/item/503b4803e4b0e2a7dbd2c750
30	Victoria Peak Garden	1	9	22.274014922218168	114.14346799250524	16 Mount Austin Rd	\N	\N	https://foursquare.com/item/4db4ee34fa8c350240effbf2
31	Gardens by the Bay	2	9.5	1.282457110058118	103.86341536632324	18 Marina Gardens Dr	\N	\N	https://foursquare.com/item/4ff7fab3e4b054fbaaba909b
32	Napoleon Food & Wine Bar	2	9.5	1.2799670469544204	103.84714543819426	206 Telok Ayer Street	\N	\N	https://foursquare.com/item/51c5c83f498e778c13e597ad
33	Marina Bay Downtown Area (MBDA)	2	9.5	1.2790415374388213	103.85495626876134	Marina Blvd, Central Blvd & Surrounds	\N	\N	https://foursquare.com/item/4e9c20981081f57b9e735d9f
34	Henderson Waves	2	9.30000000000000071	1.276239028996051	103.81523273528167	Henderson Rd (Connecting Telok Blangah Hill Park & Mt Faber Park)	\N	\N	https://foursquare.com/item/4c64dcabba119c7489bd22a2
35	Universal Studios Singapore	2	9.30000000000000071	1.2558362351439183	103.82142514956163	32 Sentosa Gateway (Resorts World Sentosa)	\N	\N	https://foursquare.com/item/4c03b68b70c603bbfbc39db4
36	Transformers The Ride: The Ultimate 3D Battle	2	9.30000000000000071	1.2543801160622412	103.8216062847745	Universal Studios Singapore (Sci-Fi City Zone)	\N	\N	https://foursquare.com/item/4ef41ba36da1a067a63a3b63
37	Blu Kouzina	2	9.30000000000000071	1.303253431786934	103.81035625934601	Blk 10 Dempsey Hill #01-21 (10 Dempsey Rd)	\N	\N	https://foursquare.com/item/54320529498e30aedc0307b1
38	Books Actually	2	9.30000000000000071	1.2825811480513059	103.83032370327051	9 Yong Siak St (Tiong Bahru Estate)	\N	\N	https://foursquare.com/item/50e0100be4b0f34007cf9b0e
39	Singapore Botanic Gardens	2	9.30000000000000071	1.3154563430460127	103.81596290467682	1 Cluny Rd.	\N	\N	https://foursquare.com/item/4e8ac9530cd6c43cb1903465
40	Books Kinokuniya 紀伊國屋書店	2	9.30000000000000071	1.3031855416785523	103.8342467245539	#04-20/20B/20C/20E Ngee Ann City (391 Orchard Rd)	\N	\N	https://foursquare.com/item/4ba5e1dc70c603bbf92a95b4
41	Singapore Zoo	2	9.30000000000000071	1.4048016561145835	103.79060739455322	80 Mandai Lake Rd.	\N	\N	https://foursquare.com/item/51d3a64d498e2527fd0fa472
42	Marina Bay Sands	2	9.30000000000000071	1.2831902557086854	103.85912418365479	10 Bayfront Avenue	\N	\N	https://foursquare.com/item/55a03979498e868f0af2cd31
43	Esplanade - Theatres On The Bay	2	9.30000000000000071	1.2896406004717818	103.85580555199617	1 Esplanade Dr.	\N	\N	https://foursquare.com/item/4fc0fa14e4b014a2d67e724e
44	East Coast Park	2	9.30000000000000071	1.3051144026337076	103.92740249633789	Along East Coast Pkwy (East Coast Park Service Rd)	\N	\N	https://foursquare.com/item/4c5037348edf0f471f6fe2ae
45	Resorts World Sentosa	2	9.19999999999999929	1.2564040250000972	103.82051381669906	8 Sentosa Gateway	\N	\N	https://foursquare.com/item/4ddf84913151c0922ed0a275
46	National Orchid Garden	2	9.19999999999999929	1.3117038129541208	103.81474029768252	Singapore Botanic Gardens (1 Cluny Rd. (Central Core along Tyersall Ave.))	\N	\N	https://foursquare.com/item/51521d0ee4b0507a3943715a
47	Percolate	2	9.19999999999999929	1.3280234803803905	103.93487431293876	#01-152, 136 Bedok North Ave 3	\N	\N	https://foursquare.com/item/53773823498e90583ae891b2
48	Cloud Forest	2	9.19999999999999929	1.283866002786424	103.86573314666748	Gardens By The Bay (18 Marina Gardens Dr.)	\N	\N	https://foursquare.com/item/501aaea8e4b07ea8afb15026
49	Marina Bay Sands Boardwalk	2	9.19999999999999929	1.284048347205377	103.85849118232727	10 Bayfront Avenue	\N	\N	https://foursquare.com/item/53714ce511d26dd2ea2c25ba
50	28 HongKong Street	2	9.19999999999999929	1.287873047219137	103.84684871187127	28 Hong Kong Street	\N	\N	https://foursquare.com/item/51f5d1aa498e5eb85c39fe58
51	Tom's Palette	2	9.19999999999999929	1.29599858576298	103.8567567555145	#01-25 Shaw Towers (100 Beach Road)	\N	\N	https://foursquare.com/item/4ccc348db571b60c3bf9d065
52	Binomio Spanish Restaurante	2	9.19999999999999929	1.2778417019561932	103.84228559303185	#01-02, Craig Place (20 Craig Rd.)	\N	\N	https://foursquare.com/item/51bc0a95498e7e9461eca6dd
53	Sephora	2	9.19999999999999929	1.3038197334026675	103.83206159335528	#B2-09, ION Orchard (2 Orchard Turn)	\N	\N	https://foursquare.com/item/4c7f14ce8e64952163b813bd
54	National Gal­lery Singa­pore	2	9.19999999999999929	1.2907395913341984	103.85154786540198	1 St. Andrew's Road	\N	\N	https://foursquare.com/item/5693cee3498e0bad978adeb2
55	Mount Faber Park	2	9.09999999999999964	1.2727409581382068	103.81864022617543	Mount Faber Rd	\N	\N	https://foursquare.com/item/541ee970498e943eba8d1ee3
56	Punggol Waterway Park	2	9.09999999999999964	1.4102274642652444	103.90697479248047	Punggol	\N	\N	https://foursquare.com/item/4eb403028b81a81f8fe988d3
57	Punggol Promenade Riverside Walk	2	9.09999999999999964	1.3932439841755129	103.91734169924771	Punggol East	\N	\N	https://foursquare.com/item/4df7eeafa809df9984e8460e
58	Louis Vuitton Island Maison	2	9.09999999999999964	1.2850588251910706	103.85863087238256	Marina Bay Sands (2 Bayfront Ave.)	\N	\N	https://foursquare.com/item/4e8addcce5e8cd224a750f43
59	The Singapore Flyer	2	9.09999999999999964	1.2894447773183417	103.86324549975406	30 Raffles Ave	\N	\N	https://foursquare.com/item/5162eb5c498e5d9dadd35b2d
60	MacRitchie Reservoir	2	9.09999999999999964	1.3426982080671415	103.83363246917725	MacRitchie Reservoir Park	\N	\N	https://foursquare.com/item/526b265911d27c7e42e8c3d9
61	Monteliusvägen	3	9.5	59.32074765317659	18.06259770163445	Monteliusvägen	\N	\N	https://foursquare.com/item/50995297e4b0fd2387c50b02
62	Klättercentret	3	9.5	59.29907433092187	17.991520561261485	Tellusgången 24	\N	\N	https://foursquare.com/item/53ab4494498eddb7e1576f3b
63	Papercut	3	9.5	59.317171692578555	18.054880964900807	Krukmakargatan 24–26	\N	\N	https://foursquare.com/item/51595ef2e4b0dc047ec21a70
64	Johan & Nyström	3	9.5	59.316209845175614	18.063844070646958	Swedenborgsgatan 7 (Maria Prästgårdsgata)	\N	\N	https://foursquare.com/item/52779c2f11d220aa1d9ae399
65	Fotografiska	3	9.5	59.317987362345406	18.085006451389237	Stadsgårdshamnen 22	\N	\N	https://foursquare.com/item/4e33fac3b3ad90171c63445d
66	Science Fiction Bokhandeln	3	9.40000000000000036	59.324040574431656	18.070626918333545	Västerlånggatan 48 (Gamla Stan)	\N	\N	https://foursquare.com/item/4c485e71972c0f4797bf2621
67	Rosendals Trädgård	3	9.40000000000000036	59.327447531966364	18.115183206731857	Rosendalsterrassen 12	\N	\N	https://foursquare.com/item/5343363a498e48d2bdc7c5a1
68	Snickarbacken 7	3	9.40000000000000036	59.33794104458486	18.0679698710224	Snickarbacken 7	\N	\N	https://foursquare.com/item/512895e3e4b0fb383035dbdc
69	Sivletto	3	9.40000000000000036	59.30961801913805	18.089211881160736	Malmgårdsvägen 16-18 (at Ringvägen)	\N	\N	https://foursquare.com/item/571b563c498e4be6bcc7a7bb
70	Lilla Ego	3	9.40000000000000036	59.34376	18.045631	Västmannagatan 69	\N	\N	https://foursquare.com/item/55d4d6be498e485b599b05db
71	Stockholms Stadshus | Stockholm City Hall (Stockholms Stadshus)	3	9.30000000000000071	59.32744588143589	18.05499494075775	Ragnar Östbergs plan 1	\N	\N	https://foursquare.com/item/51ebcf39498e4f9b4a92f6c1
72	Vasamuseet	3	9.30000000000000071	59.32784815275516	18.091607093811035	Galärvarvsvägen 14 (Djurgårdsvägen)	\N	\N	https://foursquare.com/item/4edddc8b8231efe393788e71
73	Oaxen Krog & Slip	3	9.30000000000000071	59.32232111516647	18.101470170666516	Beckholmsvägen 26 (Djurgården)	\N	\N	https://foursquare.com/item/54f323b5498e60009296d9bb
74	Café Pascal	3	9.30000000000000071	59.3419875630816	18.05197477340698	Norrtullsgatan 4 (Sandåsgatan)	\N	\N	https://foursquare.com/item/55199bae498e4147d065c31c
75	Linje Tio	3	9.30000000000000071	59.31619183255724	18.035047687018626	Hornsbruksgatan 24 (Borgargatan)	\N	\N	https://foursquare.com/item/53cf6f45498e2dae354d98d6
76	Humlegården	3	9.30000000000000071	59.338757620691425	18.072455872562365	Humlegårdsgatan	\N	\N	https://foursquare.com/item/4edeb5a5b8f76b6e9cd9b775
77	Kalf & Hansen	3	9.30000000000000071	59.318931110835905	18.061942836651983	Mariatorget 2	\N	\N	https://foursquare.com/item/53fdbcc9498ee29eeebf7025
78	Nackareservatet	3	9.30000000000000071	59.288262477543654	18.12200789174107	Sverige	\N	\N	https://foursquare.com/item/572cb702498e379a1b068fd9
79	Farang	3	9.30000000000000071	59.3416374320375	18.062725067138672	Tulegatan 7 (Rådmansgatan)	\N	\N	https://foursquare.com/item/51aef897498e5587bc60877e
80	Pizza Hatt	3	9.30000000000000071	59.337240930764764	18.05401689900642	Upplandsgatan 9B (Kammakargatan)	\N	\N	https://foursquare.com/item/4cd2c9b8fa66236a6611ed2e
81	Akkurat	3	9.30000000000000071	59.319644425962025	18.068883622738515	Hornsgatan 18	\N	\N	https://foursquare.com/item/4fbfe663e4b0bccbf57aeb3d
82	Grandpa	3	9.19999999999999929	59.312822	18.080763	Södermannagatan 21 (Bondegatan)	\N	\N	https://foursquare.com/item/54fc52fb498e6dddac50e422
83	Hornsbergs Strand	3	9.19999999999999929	59.34064172715326	18.00682783126831	Kungsholmen	\N	\N	https://foursquare.com/item/51ec2c6f498e1729c83c90af
84	Bakfickan	3	9.19999999999999929	59.330055	18.07102	Karl XII:s Torg	\N	\N	https://foursquare.com/item/55b4bb7f498e86438a7ff111
85	Reggev Hummus	3	9.19999999999999929	59.308763	18.082216	Ringvägen 145 (btw Bjurholmsgatan & Södermannagatan)	\N	\N	https://foursquare.com/item/4e99939977c85da036f264b7
86	Rolfs Kök	3	9.19999999999999929	59.33871041413502	18.05702805519104	Tegnérgatan 41	\N	\N	https://foursquare.com/item/4c9b36d9d4b1b1f75f8ad635
87	Pen Store	3	9.19999999999999929	59.317550315729385	18.051835751327715	Hornsgatan 98	\N	\N	https://foursquare.com/item/56e2dd1d498eb73dd5d8e207
88	800 grader	3	9.19999999999999929	59.34242804623578	18.04084761922348	Sigtunagatan 17	\N	\N	https://foursquare.com/item/56116dae498ee97d50a5243b
89	Wijnjas grosshandel	3	9.19999999999999929	59.32958904076409	18.046292451172757	Bergsgatan 24 (at Pipersgatan)	\N	\N	https://foursquare.com/item/54341f7811d259b7bf4952ba
90	AG Restaurang & Bar	3	9.19999999999999929	59.33518662932892	18.03496074467464	Kronobergsgatan 37 (Fleminggatan)	\N	\N	https://foursquare.com/item/4b05626b70c603bb0eed8eb4
91	Central Park	4	9.80000000000000071	40.78885994449482	-73.96116256713867	59th St to 110th St (5th Ave to Central Park West)	\N	\N	https://foursquare.com/item/5150464ee4b02f70eb28eee4
92	The Metropolitan Museum of Art (Metropolitan Museum of Art)	4	9.69999999999999929	40.77913186407382	-73.96291774473308	1000 5th Ave (btwn E 80th & E 84th St)	\N	\N	https://foursquare.com/item/512d1d4fe4b0ae1a14d17f5f
93	Aire Ancient Baths	4	9.69999999999999929	40.71814377480724	-74.0049147605896	88 Franklin St (at Church St)	\N	\N	https://foursquare.com/item/51672662e4b0a1b862b1530c
94	Bryant Park	4	9.59999999999999964	40.754068523120246	-73.98415362980316	E 42nd St (btwn 5th & 6th Ave)	\N	\N	https://foursquare.com/item/4ca509f2ae1eef3b8bfc2f47
95	Minskoff Theatre	4	9.59999999999999964	40.75749442223194	-73.98568022741497	1515 Broadway (at W 45th St)	\N	\N	https://foursquare.com/item/4b2d716970c603bbca7e8fb4
96	Equinox West 50th Street	4	9.59999999999999964	40.762177	-73.984548	1633 Broadway (at Paramount Plz)	\N	\N	\N
97	High Line	4	9.59999999999999964	40.74488019457947	-74.00559949094632	btwn Gansevoort & W 34th St (btwn 10th & 12th Ave)	\N	\N	https://foursquare.com/item/4eaed5b72c5bb67b2435833e
98	West Side Highway Running Path	4	9.59999999999999964	40.733218047025495	-74.00863511726843	West Side Highway (btwn Battery Park & W 72nd St)	\N	\N	https://foursquare.com/item/51f039a0498ef4a3724bbbed
99	Gantry Plaza State Park	4	9.59999999999999964	40.74655794031174	-73.9580512046814	474 48th Ave (at Center Blvd)	\N	\N	https://foursquare.com/item/4e871dc8775b8a3951afd996
100	Central Park - Conservatory Garden	4	9.59999999999999964	40.79424530078437	-73.95197868347168	1231 5th Ave (at 105th St)	\N	\N	https://foursquare.com/item/4de6af768130690dbf1147ca
101	Washington Square Park	4	9.59999999999999964	40.73077900590829	-73.99755972622535	W 4th St (btwn MacDougal St & University Pl)	\N	\N	https://foursquare.com/item/4c757e2c6f789c7494424c4c
102	Strand Bookstore	4	9.59999999999999964	40.73320178975766	-73.99096009548717	828 Broadway (at E 12th St)	\N	\N	https://foursquare.com/item/4be21e8470c603bb5d639ab4
103	New York Public Library - Schomburg Center for Research in Black Culture	4	9.59999999999999964	40.81413402921382	-73.94021987915039	515 Malcolm X Blvd (at W 135th St.)	\N	\N	https://foursquare.com/item/50cb8389e4b05e0e484daa63
104	I Love Kickboxing - Midtown East 43rd	4	9.59999999999999964	40.75059241608557	-73.97161326199841	303 E 43rd Street, Lower Level (2nd Ave.)	\N	\N	https://foursquare.com/item/543882d611d24cd01f11a50f
105	Elf Cosmetics	4	9.59999999999999964	40.72988079657862	-73.99235464508372	10 W 33rd St Rm 802 (5th Avenue)	\N	\N	https://foursquare.com/item/578e5afb498e144cd7cc8863
106	Riverside Park	4	9.59999999999999964	40.806809433439135	-73.96865129470825	Riverside Dr. (btwn W 59th St. & St. Clair Pl.)	\N	\N	https://foursquare.com/item/51c0d794498efff55bf8dac9
107	Lincoln Center for the Performing Arts	4	9.59999999999999964	40.77223354479133	-73.98289102110769	70 Lincoln Center Plz (btwn Columbus & 10th Ave)	\N	\N	https://foursquare.com/item/4be2234d70c603bbdd639ab4
108	St. Patrick's Cathedral	4	9.59999999999999964	40.75874373368367	-73.97660654989457	14 E 51st St (at 5th Ave)	\N	\N	https://foursquare.com/item/4bf6e15e70c603bb556b9cb4
109	Levain Bakery	4	9.59999999999999964	40.77984275934918	-73.98056030273438	167 W 74th St (at Amsterdam Ave)	\N	\N	https://foursquare.com/item/5110161ce4b03a1187a32fe3
110	Murray's Cheese	4	9.59999999999999964	40.73109392616922	-74.00284500572215	254 Bleecker St (at Cornelia St)	\N	\N	https://foursquare.com/item/5155a2f8e4b065694633ed6b
111	Equinox East 63rd Street	4	9.59999999999999964	40.764401	-73.966462	817 Lexington Avenue (at E 63rd St)	\N	\N	https://foursquare.com/item/5841f9ffc45ee347d5b8d11d
112	Brooklyn Bridge	4	9.59999999999999964	40.70717813660742	-73.99691125083612	Brooklyn Bridge	\N	\N	https://foursquare.com/item/4bb155a870c603bb712496b4
113	David H. Koch Theater	4	9.59999999999999964	40.77199437487606	-73.98347854614258	Lincoln Center Plaza (at W 63rd St & Columbus Ave)	\N	\N	https://foursquare.com/item/5050dce9e4b0e464efcdcb20
114	Union Square Greenmarket	4	9.59999999999999964	40.73652697126574	-73.9905595779419	1 Union Sq W (btwn 15th & 17th St)	\N	\N	https://foursquare.com/item/4d93acf9a8a95941ce962978
115	Hudson River Park	4	9.59999999999999964	40.73265337566474	-74.01070666068738	West St (btwn Battery Pl & W 59th St)	\N	\N	https://foursquare.com/item/4cbdfc6fee009521d0c5fb24
116	Jacqueline Kennedy Onassis Reservoir	4	9.59999999999999964	40.78511988296314	-73.96247578387509	Central Park (btwn 85th & 96th St)	\N	\N	https://foursquare.com/item/4be2204270c603bb96639ab4
117	L'Artusi	4	9.59999999999999964	40.733793607045456	-74.00506581253089	228 W 10th St (btwn Bleecker & Hudson St)	\N	\N	https://foursquare.com/item/4d4622693616b60cf345f5c2
118	Bethesda Fountain	4	9.59999999999999964	40.77429373881737	-73.9708399772644	Terrace Dr (at Central Park)	\N	\N	https://foursquare.com/item/4ff31547e4b041a995485e27
119	Rubirosa Ristorante	4	9.59999999999999964	40.722726166658305	-73.99599305184151	235 Mulberry St (btwn Prince & Spring St)	\N	\N	https://foursquare.com/item/4e8cbed9be7bc43c182e5487
120	Top of The Rock Observation Deck	4	9.59999999999999964	40.75903357413162	-73.97933721542358	30 Rockefeller Plz (btwn 5th & 6th Ave)	\N	\N	https://foursquare.com/item/4e49771262e13240b6f23c6c
121	Hyde Park	5	9.69999999999999929	51.50778087767913	-0.16239166259765625	Serpentine Rd	\N	\N	https://foursquare.com/item/51bde126498e9198c22500b0
122	Regent's Park	5	9.69999999999999929	51.527247837410805	-0.15111879685219604	Chester Rd	\N	\N	https://foursquare.com/item/51ba92cf498e54a17abde041
123	Hampstead Heath	5	9.69999999999999929	51.56351904151964	-0.16839981079101562	E Heath Rd	\N	\N	https://foursquare.com/item/4d5a787a8e1059416c37dee1
124	Primrose Hill	5	9.69999999999999929	51.539580748273785	-0.16061717509928597	Primrose Hill Rd	\N	\N	https://foursquare.com/item/4fe4b4e2e4b0b34d05aaf854
125	Greenwich Park	5	9.59999999999999964	51.477908339347096	-0.00038623809814453125	Romney Rd	\N	\N	https://foursquare.com/item/4d5a6e178e105941f4cbdde1
126	Royal Albert Hall	5	9.59999999999999964	51.500982454474055	-0.1774120330810547	Kensington Gore	\N	\N	https://foursquare.com/item/4d5405e4a64560fcf364b53a
127	National Gallery	5	9.59999999999999964	51.50846740897111	-0.12826068559120496	Trafalgar Sq	\N	\N	https://foursquare.com/item/50f3111ae4b09716f37aec53
128	Borough Market	5	9.59999999999999964	51.50548444430651	-0.09020398384821562	Southwark St	\N	\N	https://foursquare.com/item/4f70845be4b0e0075d49dab7
129	Elizabeth Tower (Big Ben) (Big Ben (Elizabeth Tower))	5	9.59999999999999964	51.50089416145207	-0.1254165659909606	Parliament Sq (Bridge St)	\N	\N	https://foursquare.com/item/50f6b55ae4b0833ecce0aee1
130	St James's Park	5	9.59999999999999964	51.50213114998136	-0.133807886303843	The Mall	\N	\N	https://foursquare.com/item/4d54110fa64560fc44beb53a
131	Victoria Park	5	9.59999999999999964	51.53680634141707	-0.03712177276611328	Grove Rd	\N	\N	https://foursquare.com/item/4f71a29ae4b0741eb47b2a13
132	Daunt Books	5	9.59999999999999964	51.520446103688144	-0.15188031915267824	83 Marylebone High St (Paddington St)	\N	\N	https://foursquare.com/item/4f9918f1e4b06526ab6c55ce
133	Dishoom	5	9.59999999999999964	51.52452361919365	-0.07674786755631656	7 Boundary St	\N	\N	https://foursquare.com/item/51045cb6e4b0f868863c82e8
134	Holland Park	5	9.59999999999999964	51.50259867448262	-0.2036762237548828	Ilchester Pl	\N	\N	https://foursquare.com/item/4d5926175e7788bff9b8849e
135	Royal Botanic Gardens (Royal Botanic Gardens, Kew)	5	9.5	51.477747968798816	-0.296630859375	Kew Rd	\N	\N	https://foursquare.com/item/4f466166e4b00ed04a3aae96
136	Kensington Gardens	5	9.5	51.50536748609696	-0.18559692951674742	Exhibition Rd	\N	\N	https://foursquare.com/item/518ffd5a498e1e45fb05f36c
137	Somerset House	5	9.5	51.51078575130956	-0.11789917945861816	Strand	\N	\N	https://foursquare.com/item/50d04952e4b028fc43581adb
138	Maltby Street Market	5	9.5	51.499326358394505	-0.07560628325817981	Rope Walk (Maltby St)	\N	\N	https://foursquare.com/item/4f7087d8e4b03b575eed01b1
139	Rough Trade East	5	9.5	51.5210642591425	-0.0724947452545166	91 Brick Ln	\N	\N	https://foursquare.com/item/4e395a0f1fc77951ffe69e4d
140	Richmond Park	5	9.5	51.438787958727794	-0.2747011184692383	Richmond	\N	\N	https://foursquare.com/item/4acde01070c603bbea908eb4
141	British Museum	5	9.5	51.51909051512128	-0.1265965471332373	Great Russell St (btwn Montague & Bloomsbury)	\N	\N	https://foursquare.com/item/51895de4498eaddda1d26171
142	Dishoom	5	9.5	51.536116098887355	-0.12568378171178593	5 Stable St	\N	\N	https://foursquare.com/item/5499cf4a498e4a801262bc04
143	Battersea Park	5	9.5	51.479512013817555	-0.1569843292236328	Albert Bridge Rd	\N	\N	https://foursquare.com/item/4d593fc95e7788bf287f859e
144	Clissold Park	5	9.5	51.56076785329521	-0.08901603993015311	Church St (at Green Ln)	\N	\N	https://foursquare.com/item/4ad0984a70c603bb40948eb4
145	Brockwell Park	5	9.5	51.45047677918557	-0.10788917541503906	Dulwich Rd	\N	\N	https://foursquare.com/item/4f71a164e4b0022eb9ce9cc7
146	Scott's	5	9.5	51.50974974863149	-0.15086267845070342	20 Mount St.	\N	\N	https://foursquare.com/item/4bf404a470c603bb3e1f9cb4
147	Victoria and Albert Museum (V&A)	5	9.5	51.4964175460653	-0.17237235342987087	Cromwell Rd	\N	\N	https://foursquare.com/item/51e5c875498e1f652f88d018
148	Tate Britain	5	9.5	51.49077851281006	-0.12711536698936093	Millbank	\N	\N	https://foursquare.com/item/4d345adc306160fcb63c6b88
149	Coya London	5	9.5	51.50440036150375	-0.1477551586390948	118 Piccadilly (Old Park Lane)	\N	\N	https://foursquare.com/item/515301a4e4b0cffe8e8868b7
150	Scarfes Bar	5	9.5	51.517866	-0.118259	252 High Holborn	\N	\N	https://foursquare.com/item/54a078f4498e6a3066ad9098
151	Centro Histórico de Cartagena / Ciudad Amurallada	6	9.59999999999999964	10.424203397846842	-75.5488990963779	Cartagena de Indias, Bolívar	\N	\N	https://foursquare.com/item/50214cbee4b048261ce07e7d
152	Sofitel Santa Clara	6	9.5	10.428479350488166	-75.54796663570262	Calle del Torno 39-29	\N	\N	https://foursquare.com/item/4b51bbf170c603bb871790b4
153	La Palettería	6	9.30000000000000071	10.424227424120954	-75.55099142580087	Cll Santo Domingo # 36 - 86	\N	\N	https://foursquare.com/item/51c9add7498e72fbf2791d3e
154	Di Silvio Trattoria	6	9.30000000000000071	10.420772502637178	-75.54583311080933	Calle de la Sierpe #9A-08 (Getsemaní)	\N	\N	https://foursquare.com/item/51b6176e498e6a62be9664fb
155	Ciudad Amurallada	6	9.19999999999999929	10.424015601005486	-75.55198640904256	Cartagena de Indias, Bolívar	\N	\N	https://foursquare.com/item/4ed41e675c5c9528fd9b2acd
156	Bahía de Manga	6	9.19999999999999929	10.410748060925236	-75.53890228271484	Calle 36	\N	\N	https://foursquare.com/item/5023d836e4b0e5018875b762
157	Restaurante Donjuán	6	9.19999999999999929	10.4239855317609	-75.5495935678482	Calle del Colegio # 34-60 Local 1	\N	\N	https://foursquare.com/item/4d36444dedbd37046fda68e3
158	Azzahr by El Arabe	6	9.19999999999999929	10.423676851537428	-75.55327134893727	Calle de la Artilleria # 33 - 24 (Centro Historico)	\N	\N	https://foursquare.com/item/585da6b6964d7878e39c7654
159	Juan Valdez Café	6	9.09999999999999964	10.402348	-75.556178	Bocagrande Av. San Martín #7-17	\N	\N	https://foursquare.com/item/4cfd36552c1aa090321a057a
160	Di Silvio Trattoria	6	9.09999999999999964	10.39910712817434	-75.55653481871336	Colombia	\N	\N	https://foursquare.com/item/57d6f4f4498eb016f7237f68
161	Restaurante La Mulata	6	9.09999999999999964	10.426277825230748	-75.54672713620855	Calle de Quero	\N	\N	https://foursquare.com/item/5287bf6f11d2cccdffb6ceab
162	EL BARÓN - Café & Liquor Bar	6	9.09999999999999964	10.422007069472345	-75.55076569318771	Carrera 4 No. 31-7 (Plaza de San Pedro Claver)	\N	\N	https://foursquare.com/item/532e075b498e3c6c3433fbfa
163	Torre del Reloj	6	9.09999999999999964	10.422980474488789	-75.54912954568863	Centro	\N	\N	https://foursquare.com/item/52fe3f2411d262c185ae9b80
164	Shakin' Milkshake and Smoothie Bar	6	9	10.4090232370618	-75.55175898489095	Carrera 1 # 11-28	\N	\N	https://foursquare.com/item/581513c4d67cfccd58ec4ff5
165	Laguito, Cartagena	6	9	10.396431841011132	-75.56307291268057	Barrio El Laguito	\N	\N	https://foursquare.com/item/508c1f1de4b0ca23f60b0188
166	Cuzco Cocina Peruana	6	9	10.423614033635145	-75.55203757942854	Cartagena de Indias, Bolívar	\N	\N	https://foursquare.com/item/50e74077e4b0ecb01f4e985f
167	Plaza De La Trinidad	6	9	10.420694702351229	-75.54540802444272	Barrio Getsemani	\N	\N	https://foursquare.com/item/534890e2498e2d9ce524f3ad
168	Plaza Santo Domingo	6	9	10.42423576652723	-75.55199778024097	Cartagena de Indias, Bolívar	\N	\N	https://foursquare.com/item/4e63dfc61495676d565c91c6
169	Tratoria Cebichería Wippy	6	9	10.423927505591314	-75.55203189383096	Calle Santo Domingo 33-81 (Plaza Santo Domingo)	\N	\N	https://foursquare.com/item/55220605498ee59418e43cfe
170	Isla de Baru	6	8.90000000000000036	10.218259957385426	-75.61172428685471	Isla Baru	\N	\N	https://foursquare.com/item/51c6615b498ebd0759066501
171	San Alberto	6	8.90000000000000036	10.42399619746591	-75.55104828216619	Cartagena de Indias, Bolívar	\N	\N	https://foursquare.com/item/55d341cb498e5655beb23a4f
172	Abaco	6	8.90000000000000036	10.424964905265005	-75.55121316550216	Calle De La Iglesia Con Calle De La Mantilla Esquina (3-86)	\N	\N	https://foursquare.com/item/4d1a43c2bb488cfa4afec3d4
173	Gelateria Paradiso	6	8.90000000000000036	10.42517371142022	-75.55059343063253	Calle de las Estrellas (Calle 36) (at Calle del Cuartel (Carrera 5))	\N	\N	https://foursquare.com/item/50aec12ae4b03ce490a3fc35
174	Mila Pasteleria	6	8.90000000000000036	10.424986932021659	-75.55109376724273	Calle de la iglesia # 35 - 76	\N	\N	https://foursquare.com/item/507b6922e4b0772057ac8066
175	Gokela - Cartagena	6	8.80000000000000071	10.403076507329313	-75.55444836616516	Carerra 3 (No 7-157)	\N	\N	https://foursquare.com/item/51632b20e4b06c51d43bbf57
176	alquimico	6	8.80000000000000071	10.42371	-75.549685	Colombia	\N	\N	https://foursquare.com/item/5875968504ab1a1578d7625d
177	Teatro Adolfo Mejía	6	8.80000000000000071	10.426713151161056	-75.55127263069153	Cartagena de Indias, Bolívar	\N	\N	https://foursquare.com/item/4fef5432e4b0ac0d2f481395
178	El Coro Lounge	6	8.80000000000000071	10.428084865621027	-75.54810762405396	Centro Historico, Calle Stuart	\N	\N	https://foursquare.com/item/521e915a11d21ac519058a12
179	Plaza De Bolívar	6	8.80000000000000071	10.423287401193594	-75.55115062356874	Cll 33 3 1-99	\N	\N	https://foursquare.com/item/4f5615a4e4b06e95a3d22874
180	Teatro Pedro De Heredia	6	8.80000000000000071	10.42663019149386	-75.55112219540847	Centro	\N	\N	https://foursquare.com/item/550e63c6498e1815cf1f8052
\.


--
-- Name: places_place_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('places_place_id_seq', 180, true);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY tags (tag_id, tag_name) FROM stdin;
1	Garden
2	Trail
3	Multiplex
4	Theme Park Ride / Attraction
5	Non-Profit
6	Art Gallery
7	Café
8	Mountain
9	Thai Restaurant
10	Zoo
11	Theme Park
12	Scenic Lookout
13	Park
14	Dumpling Restaurant
15	Coffee Shop
16	Japanese Restaurant
17	Monument / Landmark
18	Yoga Studio
19	Taiwanese Restaurant
20	Club House
21	Wine Bar
22	Harbor / Marina
23	Greek Restaurant
24	Bookstore
25	Botanical Garden
26	Hotel
27	Theater
28	Beach
29	Resort
30	Cocktail Bar
31	Ice Cream Shop
32	Spanish Restaurant
33	Cosmetics Shop
34	Accessories Store
35	Reservoir
36	Climbing Gym
37	Art Museum
38	Clothing Store
39	Scandinavian Restaurant
40	City Hall
41	History Museum
42	French Restaurant
43	Nature Preserve
44	Asian Restaurant
45	Pizza Place
46	Pub
47	Middle Eastern Restaurant
48	Arts & Crafts Store
49	Cheese Shop
50	Steakhouse
51	Spa
52	Gym / Fitness Center
53	Track
54	Library
55	Martial Arts Dojo
56	Performing Arts Venue
57	Church
58	Bakery
59	Bridge
60	Farmers Market
61	Lake
62	Italian Restaurant
63	Fountain
64	Concert Hall
65	Market
66	Indian Restaurant
67	Event Space
68	Street Food Gathering
69	Record Shop
70	Seafood Restaurant
71	Latin American Restaurant
72	Hotel Bar
73	Historic Site
74	Restaurant
75	Caribbean Restaurant
76	Bar
77	Peruvian Restaurant
78	Plaza
79	Sandwich Place
80	Nightclub
81	Lounge
\.


--
-- Name: tags_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('tags_tag_id_seq', 81, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY users (user_id, name, lastname, city_id, email, password, is_activated, picture) FROM stdin;
1	Kenneth	Allen	1	kallen0@slashdot.org	DlmIEn8	f	\N
2	Annie	Mason	2	amason1@bravesites.com	lJ6unx	t	\N
3	Joe	Lawrence	3	jlawrence2@ezinearticles.com	YWzHDz0RHE	t	\N
4	Adam	Burns	3	aburns3@hugedomains.com	10f5gAUPq	f	\N
5	Paula	Cooper	1	pcooper4@fotki.com	KP3Ufx	t	\N
6	Kelly	Schmidt	5	kschmidt5@nytimes.com	KMGbVwHT3	f	\N
7	Brenda	Wheeler	5	bwheeler6@purevolume.com	0hrowGKucWy	t	\N
8	Shawn	Kennedy	5	skennedy7@dyndns.org	zPbHSYvuVD	t	\N
9	Barbara	Sanders	6	bsanders8@house.gov	fvb6zBWAk	t	\N
10	Jose	Ross	2	jross9@seesaa.net	5hDLzheMQ	f	\N
11	Stephanie	Boyette	7	sjboyette@gmail.com	1234	f	\N
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('users_user_id_seq', 11, true);


--
-- Name: actions_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (action_id);


--
-- Name: actiontypes_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY actiontypes
    ADD CONSTRAINT actiontypes_pkey PRIMARY KEY (action_code);


--
-- Name: activations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY activations
    ADD CONSTRAINT activations_pkey PRIMARY KEY (activation_number);


--
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_code);


--
-- Name: place_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY place_tags
    ADD CONSTRAINT place_tags_pkey PRIMARY KEY (place_tag_id);


--
-- Name: places_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY places
    ADD CONSTRAINT places_pkey PRIMARY KEY (place_id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (tag_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: actions_action_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY actions
    ADD CONSTRAINT actions_action_code_fkey FOREIGN KEY (action_code) REFERENCES actiontypes(action_code);


--
-- Name: actions_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY actions
    ADD CONSTRAINT actions_place_id_fkey FOREIGN KEY (place_id) REFERENCES places(place_id);


--
-- Name: actions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY actions
    ADD CONSTRAINT actions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: activations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY activations
    ADD CONSTRAINT activations_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: cities_country_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_country_code_fkey FOREIGN KEY (country_code) REFERENCES countries(country_code);


--
-- Name: place_tags_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY place_tags
    ADD CONSTRAINT place_tags_place_id_fkey FOREIGN KEY (place_id) REFERENCES places(place_id);


--
-- Name: place_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY place_tags
    ADD CONSTRAINT place_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tags(tag_id);


--
-- Name: places_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY places
    ADD CONSTRAINT places_city_id_fkey FOREIGN KEY (city_id) REFERENCES cities(city_id);


--
-- Name: users_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_city_id_fkey FOREIGN KEY (city_id) REFERENCES cities(city_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

