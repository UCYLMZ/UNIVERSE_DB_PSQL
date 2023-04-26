--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: utku
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    apparent_magnitude numeric(10,5),
    absolute_magnitude numeric(10,5),
    additional text
);


ALTER TABLE public.galaxy OWNER TO utku;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: utku
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO utku;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: utku
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: living_zone; Type: TABLE; Schema: public; Owner: utku
--

CREATE TABLE public.living_zone (
    living_zone_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    star_id integer,
    galaxy_id integer
);


ALTER TABLE public.living_zone OWNER TO utku;

--
-- Name: living_zone_living_zone_id_seq; Type: SEQUENCE; Schema: public; Owner: utku
--

CREATE SEQUENCE public.living_zone_living_zone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.living_zone_living_zone_id_seq OWNER TO utku;

--
-- Name: living_zone_living_zone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: utku
--

ALTER SEQUENCE public.living_zone_living_zone_id_seq OWNED BY public.living_zone.living_zone_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: utku
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    moon_mass integer,
    diameter integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO utku;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: utku
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO utku;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: utku
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: utku
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_diameter integer,
    planet_visible boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO utku;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: utku
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO utku;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: utku
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: utku
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    visual_brightness integer,
    star_visible boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO utku;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: utku
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO utku;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: utku
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: living_zone living_zone_id; Type: DEFAULT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.living_zone ALTER COLUMN living_zone_id SET DEFAULT nextval('public.living_zone_living_zone_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: utku
--

COPY public.galaxy (galaxy_id, name, apparent_magnitude, absolute_magnitude, additional) FROM stdin;
1	milky way	-5.00000	-21.00000	It is the galaxy which is our home.
2	andromeda	3.44000	-20.60000	Naked eye object.
3	messier 81	6.94000	-28.50000	11.6 million light-years from Earth.
4	chartwheel	15.20000	6.45000	500 million light-years from Milky Way.
5	whirlpool	8.40000	-17.85000	Classified as type spiral galaxy. Also known as Messier 51a.
6	large magellanic cloud	0.13000	0.90000	Second or third closest galaxy to the Milky Way.
\.


--
-- Data for Name: living_zone; Type: TABLE DATA; Schema: public; Owner: utku
--

COPY public.living_zone (living_zone_id, name, planet_id, star_id, galaxy_id) FROM stdin;
1	earth	1	1	1
2	trappist-1d	9	4	1
3	kepler-90i	12	5	1
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: utku
--

COPY public.moon (moon_id, name, moon_mass, diameter, planet_id) FROM stdin;
1	the moon	735	3475	1
2	europa	480	3122	2
3	lo	322	2132	2
4	ganymede	530	4611	2
5	callisto	671	5625	2
6	amalthea	276	1023	2
7	titan	590	5023	3
8	enceladus	390	4001	3
9	mimas	267	2439	3
10	dione	305	2968	3
11	trion	604	6038	4
12	thalassa	102	1904	4
13	hippocamp	60	908	4
14	titania	631	5483	6
15	miranda	492	3475	6
16	oberon	485	4356	6
17	umbriel	355	6746	6
18	puck	536	2376	6
19	ariel	324	2342	6
20	cressida	324	4375	6
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: utku
--

COPY public.planet (planet_id, name, planet_diameter, planet_visible, star_id) FROM stdin;
1	earth	12742	t	1
2	jupiter	139820	t	1
3	saturn	116460	t	1
4	neptune	49244	f	1
5	venus	12104	t	1
6	uranus	50725	f	1
7	mercury	4879	t	1
8	trappist-1c	13247	f	4
9	trappist-1d	18030	f	4
10	trappist-1e	12523	f	4
11	kepler-90c	28634	f	5
12	kepler-90i	12823	f	5
13	kepler-90d	8752	f	5
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: utku
--

COPY public.star (star_id, name, visual_brightness, star_visible, galaxy_id) FROM stdin;
1	sun	-27	t	1
2	51 and	4	t	2
3	sn 1993j	11	f	3
4	trappist-1	16	f	1
5	kepler-90	14	f	1
6	hd 10180	7	f	1
\.


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: utku
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, true);


--
-- Name: living_zone_living_zone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: utku
--

SELECT pg_catalog.setval('public.living_zone_living_zone_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: utku
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: utku
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: utku
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: living_zone living_zone_name_key; Type: CONSTRAINT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.living_zone
    ADD CONSTRAINT living_zone_name_key UNIQUE (name);


--
-- Name: living_zone living_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.living_zone
    ADD CONSTRAINT living_zone_pkey PRIMARY KEY (living_zone_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: living_zone living_zone_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.living_zone
    ADD CONSTRAINT living_zone_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: living_zone living_zone_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.living_zone
    ADD CONSTRAINT living_zone_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: utku
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

