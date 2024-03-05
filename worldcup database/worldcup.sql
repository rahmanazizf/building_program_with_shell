--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2018, 'Final', 28, 4, 2, 27);
INSERT INTO public.games VALUES (2, 2018, 'Third Place', 30, 2, 0, 29);
INSERT INTO public.games VALUES (3, 2018, 'Semi-Final', 30, 2, 1, 28);
INSERT INTO public.games VALUES (4, 2018, 'Semi-Final', 29, 1, 0, 27);
INSERT INTO public.games VALUES (5, 2018, 'Quarter-Final', 31, 3, 2, 28);
INSERT INTO public.games VALUES (6, 2018, 'Quarter-Final', 32, 2, 0, 30);
INSERT INTO public.games VALUES (7, 2018, 'Quarter-Final', 33, 2, 1, 29);
INSERT INTO public.games VALUES (8, 2018, 'Quarter-Final', 34, 2, 0, 27);
INSERT INTO public.games VALUES (9, 2018, 'Eighth-Final', 35, 2, 1, 30);
INSERT INTO public.games VALUES (10, 2018, 'Eighth-Final', 36, 1, 0, 32);
INSERT INTO public.games VALUES (11, 2018, 'Eighth-Final', 37, 3, 2, 29);
INSERT INTO public.games VALUES (12, 2018, 'Eighth-Final', 38, 2, 0, 33);
INSERT INTO public.games VALUES (13, 2018, 'Eighth-Final', 39, 2, 1, 28);
INSERT INTO public.games VALUES (14, 2018, 'Eighth-Final', 40, 2, 1, 31);
INSERT INTO public.games VALUES (15, 2018, 'Eighth-Final', 41, 2, 1, 34);
INSERT INTO public.games VALUES (16, 2018, 'Eighth-Final', 42, 4, 3, 27);
INSERT INTO public.games VALUES (17, 2014, 'Final', 42, 1, 0, 43);
INSERT INTO public.games VALUES (18, 2014, 'Third Place', 33, 3, 0, 44);
INSERT INTO public.games VALUES (19, 2014, 'Semi-Final', 44, 1, 0, 42);
INSERT INTO public.games VALUES (20, 2014, 'Semi-Final', 33, 7, 1, 43);
INSERT INTO public.games VALUES (21, 2014, 'Quarter-Final', 45, 1, 0, 44);
INSERT INTO public.games VALUES (22, 2014, 'Quarter-Final', 29, 1, 0, 42);
INSERT INTO public.games VALUES (23, 2014, 'Quarter-Final', 35, 2, 1, 33);
INSERT INTO public.games VALUES (24, 2014, 'Quarter-Final', 27, 1, 0, 43);
INSERT INTO public.games VALUES (25, 2014, 'Eighth-Final', 46, 2, 1, 33);
INSERT INTO public.games VALUES (26, 2014, 'Eighth-Final', 34, 2, 0, 35);
INSERT INTO public.games VALUES (27, 2014, 'Eighth-Final', 47, 2, 0, 27);
INSERT INTO public.games VALUES (28, 2014, 'Eighth-Final', 48, 2, 1, 43);
INSERT INTO public.games VALUES (29, 2014, 'Eighth-Final', 38, 2, 1, 44);
INSERT INTO public.games VALUES (30, 2014, 'Eighth-Final', 49, 2, 1, 45);
INSERT INTO public.games VALUES (31, 2014, 'Eighth-Final', 36, 1, 0, 42);
INSERT INTO public.games VALUES (32, 2014, 'Eighth-Final', 50, 2, 1, 29);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (27, 'France');
INSERT INTO public.teams VALUES (28, 'Croatia');
INSERT INTO public.teams VALUES (29, 'Belgium');
INSERT INTO public.teams VALUES (30, 'England');
INSERT INTO public.teams VALUES (31, 'Russia');
INSERT INTO public.teams VALUES (32, 'Sweden');
INSERT INTO public.teams VALUES (33, 'Brazil');
INSERT INTO public.teams VALUES (34, 'Uruguay');
INSERT INTO public.teams VALUES (35, 'Colombia');
INSERT INTO public.teams VALUES (36, 'Switzerland');
INSERT INTO public.teams VALUES (37, 'Japan');
INSERT INTO public.teams VALUES (38, 'Mexico');
INSERT INTO public.teams VALUES (39, 'Denmark');
INSERT INTO public.teams VALUES (40, 'Spain');
INSERT INTO public.teams VALUES (41, 'Portugal');
INSERT INTO public.teams VALUES (42, 'Argentina');
INSERT INTO public.teams VALUES (43, 'Germany');
INSERT INTO public.teams VALUES (44, 'Netherlands');
INSERT INTO public.teams VALUES (45, 'Costa Rica');
INSERT INTO public.teams VALUES (46, 'Chile');
INSERT INTO public.teams VALUES (47, 'Nigeria');
INSERT INTO public.teams VALUES (48, 'Algeria');
INSERT INTO public.teams VALUES (49, 'Greece');
INSERT INTO public.teams VALUES (50, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 50, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games fk_opponent_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_opponent_id FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games fk_winner_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_winner_id FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

