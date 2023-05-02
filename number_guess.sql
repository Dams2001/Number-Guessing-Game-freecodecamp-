--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (62, 'user_1683007837335', 0, NULL);
INSERT INTO public.users VALUES (63, 'user_1683007837334', 0, NULL);
INSERT INTO public.users VALUES (64, 'user_1683007846103', 0, NULL);
INSERT INTO public.users VALUES (65, 'user_1683007846102', 0, NULL);
INSERT INTO public.users VALUES (66, 'user_1683007856571', 0, NULL);
INSERT INTO public.users VALUES (67, 'user_1683007856570', 0, NULL);
INSERT INTO public.users VALUES (68, 'user_1683007923884', 0, NULL);
INSERT INTO public.users VALUES (69, 'user_1683007923883', 0, NULL);
INSERT INTO public.users VALUES (99, 'user_1683008122522', 0, NULL);
INSERT INTO public.users VALUES (100, 'user_1683008122521', 0, NULL);
INSERT INTO public.users VALUES (101, 'user_1683008835917', 0, NULL);
INSERT INTO public.users VALUES (102, 'user_1683008835916', 0, NULL);
INSERT INTO public.users VALUES (103, 'agustin01', 3, 8);
INSERT INTO public.users VALUES (104, 'user_1683009163731', 0, NULL);
INSERT INTO public.users VALUES (105, 'user_1683009163730', 0, NULL);
INSERT INTO public.users VALUES (106, 'user_1683009192690', 0, NULL);
INSERT INTO public.users VALUES (107, 'user_1683009192689', 0, NULL);
INSERT INTO public.users VALUES (108, 'user_1683010323285', 0, NULL);
INSERT INTO public.users VALUES (109, 'user_1683010323286', 0, NULL);
INSERT INTO public.users VALUES (110, 'user_1683010420785', 0, NULL);
INSERT INTO public.users VALUES (111, 'user_1683010420784', 0, NULL);
INSERT INTO public.users VALUES (112, 'user_1683010487819', 0, NULL);
INSERT INTO public.users VALUES (113, 'user_1683010487818', 0, NULL);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 113, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

