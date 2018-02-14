--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 10.0

-- Started on 2018-02-14 11:45:04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 236 (class 1255 OID 44515)
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$  
BEGIN  
  NEW.updated_at = NOW();
  RETURN NEW;
END;  
$$;


ALTER FUNCTION public.trigger_set_timestamp() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 44574)
-- Name: adaptation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE adaptation (
    anime_id integer NOT NULL,
    manga_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE adaptation OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 61554)
-- Name: age_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE age_group (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


ALTER TABLE age_group OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 61552)
-- Name: age_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE age_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE age_group_id_seq OWNER TO postgres;

--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 231
-- Name: age_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE age_group_id_seq OWNED BY age_group.id;


--
-- TOC entry 192 (class 1259 OID 44506)
-- Name: anime; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE anime (
    id integer NOT NULL,
    mal_id integer NOT NULL,
    main_title text NOT NULL,
    english_title text NOT NULL,
    japanese_title text,
    alternative_titles text[],
    synopsis text,
    spoilers text,
    type text,
    episodes integer,
    status text,
    premiered text,
    broadcast text,
    producers text[],
    licensors text[],
    studios text[],
    source text,
    duration text,
    content_rating text,
    openings text[],
    endings text[],
    image_id integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    aired text
);


ALTER TABLE anime OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 44761)
-- Name: anime_anime_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE anime_anime_genre (
    anime_id integer NOT NULL,
    genre_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE anime_anime_genre OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 44741)
-- Name: anime_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE anime_genre (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


ALTER TABLE anime_genre OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 44739)
-- Name: anime_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE anime_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anime_genre_id_seq OWNER TO postgres;

--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 198
-- Name: anime_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE anime_genre_id_seq OWNED BY anime_genre.id;


--
-- TOC entry 191 (class 1259 OID 44504)
-- Name: anime_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE anime_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anime_id_seq OWNER TO postgres;

--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 191
-- Name: anime_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE anime_id_seq OWNED BY anime.id;


--
-- TOC entry 196 (class 1259 OID 44559)
-- Name: anime_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE anime_image (
    id integer NOT NULL,
    anime_id integer NOT NULL,
    image_path text NOT NULL,
    mal_link text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE anime_image OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 44557)
-- Name: anime_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE anime_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anime_image_id_seq OWNER TO postgres;

--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 195
-- Name: anime_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE anime_image_id_seq OWNED BY anime_image.id;


--
-- TOC entry 194 (class 1259 OID 44537)
-- Name: anime_relation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE anime_relation (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    type text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE anime_relation OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 61446)
-- Name: anime_staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE anime_staff (
    anime_id integer NOT NULL,
    person_id integer NOT NULL,
    role text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE anime_staff OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 53741)
-- Name: casting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE casting (
    id integer NOT NULL,
    anime_id integer NOT NULL,
    character_id integer,
    person_id integer,
    language_id integer,
    role text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE casting OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 53739)
-- Name: casting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE casting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE casting_id_seq OWNER TO postgres;

--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 217
-- Name: casting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE casting_id_seq OWNED BY casting.id;


--
-- TOC entry 211 (class 1259 OID 45004)
-- Name: character; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "character" (
    id integer NOT NULL,
    mal_id integer NOT NULL,
    name text NOT NULL,
    japanese_name text,
    alternative_names text[],
    description text,
    spoilers text[],
    gender_id integer,
    image_id integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE "character" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 61563)
-- Name: character_age_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE character_age_group (
    character_id integer NOT NULL,
    age_group_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE character_age_group OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 45015)
-- Name: character_anime; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE character_anime (
    character_id integer NOT NULL,
    anime_id integer NOT NULL,
    role text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE character_anime OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 61502)
-- Name: character_character_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE character_character_tag (
    character_id integer NOT NULL,
    tag_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE character_character_tag OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 61620)
-- Name: character_eye_color; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE character_eye_color (
    character_id integer NOT NULL,
    eye_color_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE character_eye_color OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 61535)
-- Name: character_hair_color; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE character_hair_color (
    character_id integer NOT NULL,
    hair_color_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE character_hair_color OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 61720)
-- Name: character_hair_length; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE character_hair_length (
    character_id integer NOT NULL,
    hair_length_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE character_hair_length OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 45002)
-- Name: character_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE character_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE character_id_seq OWNER TO postgres;

--
-- TOC entry 2471 (class 0 OID 0)
-- Dependencies: 210
-- Name: character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE character_id_seq OWNED BY "character".id;


--
-- TOC entry 215 (class 1259 OID 53700)
-- Name: character_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE character_image (
    id integer NOT NULL,
    character_id integer NOT NULL,
    image_path text NOT NULL,
    mal_link text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE character_image OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 53698)
-- Name: character_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE character_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE character_image_id_seq OWNER TO postgres;

--
-- TOC entry 2472 (class 0 OID 0)
-- Dependencies: 214
-- Name: character_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE character_image_id_seq OWNED BY character_image.id;


--
-- TOC entry 213 (class 1259 OID 45034)
-- Name: character_manga; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE character_manga (
    character_id integer NOT NULL,
    manga_id integer NOT NULL,
    role text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE character_manga OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 53922)
-- Name: character_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE character_tag (
    id integer NOT NULL,
    parent_id integer,
    name text NOT NULL,
    description text,
    is_category boolean,
    created_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE character_tag OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 53719)
-- Name: character_voice_actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE character_voice_actor (
    character_id integer NOT NULL,
    person_id integer NOT NULL,
    language_id integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE character_voice_actor OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 53889)
-- Name: color; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE color (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE color OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 53887)
-- Name: color_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE color_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE color_id_seq OWNER TO postgres;

--
-- TOC entry 2473 (class 0 OID 0)
-- Dependencies: 221
-- Name: color_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE color_id_seq OWNED BY color.id;


--
-- TOC entry 220 (class 1259 OID 53870)
-- Name: gender; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE gender (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE gender OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 53868)
-- Name: gender_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE gender_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gender_id_seq OWNER TO postgres;

--
-- TOC entry 2474 (class 0 OID 0)
-- Dependencies: 219
-- Name: gender_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE gender_id_seq OWNED BY gender.id;


--
-- TOC entry 224 (class 1259 OID 53900)
-- Name: hair_length; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE hair_length (
    id integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE hair_length OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 53898)
-- Name: hair_length_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hair_length_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hair_length_id_seq OWNER TO postgres;

--
-- TOC entry 2475 (class 0 OID 0)
-- Dependencies: 223
-- Name: hair_length_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE hair_length_id_seq OWNED BY hair_length.id;


--
-- TOC entry 205 (class 1259 OID 44795)
-- Name: language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE language (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE language OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 44793)
-- Name: language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE language_id_seq OWNER TO postgres;

--
-- TOC entry 2476 (class 0 OID 0)
-- Dependencies: 204
-- Name: language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE language_id_seq OWNED BY language.id;


--
-- TOC entry 190 (class 1259 OID 44259)
-- Name: manga; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE manga (
    id integer NOT NULL,
    mal_id integer NOT NULL,
    main_title text NOT NULL,
    english_title text NOT NULL,
    japanese_title text,
    alternative_titles text[],
    synopsis text,
    spoilers text[],
    type text,
    volumes integer,
    chapters integer,
    status text,
    published text,
    serialization text,
    image_id integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE manga OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 61481)
-- Name: manga_author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE manga_author (
    manga_id integer NOT NULL,
    person_id integer NOT NULL,
    role text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE manga_author OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 44752)
-- Name: manga_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE manga_genre (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


ALTER TABLE manga_genre OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 44750)
-- Name: manga_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE manga_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE manga_genre_id_seq OWNER TO postgres;

--
-- TOC entry 2477 (class 0 OID 0)
-- Dependencies: 200
-- Name: manga_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE manga_genre_id_seq OWNED BY manga_genre.id;


--
-- TOC entry 189 (class 1259 OID 44257)
-- Name: manga_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE manga_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE manga_id_seq OWNER TO postgres;

--
-- TOC entry 2478 (class 0 OID 0)
-- Dependencies: 189
-- Name: manga_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE manga_id_seq OWNED BY manga.id;


--
-- TOC entry 188 (class 1259 OID 44211)
-- Name: manga_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE manga_image (
    id integer NOT NULL,
    manga_id integer,
    image_path text,
    mal_link text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE manga_image OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 44209)
-- Name: manga_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE manga_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE manga_image_id_seq OWNER TO postgres;

--
-- TOC entry 2479 (class 0 OID 0)
-- Dependencies: 187
-- Name: manga_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE manga_image_id_seq OWNED BY manga_image.id;


--
-- TOC entry 203 (class 1259 OID 44777)
-- Name: manga_manga_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE manga_manga_genre (
    manga_id integer NOT NULL,
    genre_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE manga_manga_genre OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 44516)
-- Name: manga_relation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE manga_relation (
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    type text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE manga_relation OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 44806)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE person (
    id integer NOT NULL,
    mal_id integer NOT NULL,
    first_name text,
    surname text,
    given_name text,
    family_name text,
    alternative_names text[],
    birthday text,
    website text,
    description text,
    image_id integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE person OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 44804)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person_id_seq OWNER TO postgres;

--
-- TOC entry 2480 (class 0 OID 0)
-- Dependencies: 206
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE person_id_seq OWNED BY person.id;


--
-- TOC entry 209 (class 1259 OID 44834)
-- Name: person_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE person_image (
    id integer NOT NULL,
    person_id integer NOT NULL,
    image_path text NOT NULL,
    mal_link text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE person_image OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 44832)
-- Name: person_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE person_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person_image_id_seq OWNER TO postgres;

--
-- TOC entry 2481 (class 0 OID 0)
-- Dependencies: 208
-- Name: person_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE person_image_id_seq OWNED BY person_image.id;


--
-- TOC entry 225 (class 1259 OID 53920)
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tag_id_seq OWNER TO postgres;

--
-- TOC entry 2482 (class 0 OID 0)
-- Dependencies: 225
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tag_id_seq OWNED BY character_tag.id;


--
-- TOC entry 2225 (class 2604 OID 61557)
-- Name: age_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY age_group ALTER COLUMN id SET DEFAULT nextval('age_group_id_seq'::regclass);


--
-- TOC entry 2188 (class 2604 OID 44509)
-- Name: anime id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anime ALTER COLUMN id SET DEFAULT nextval('anime_id_seq'::regclass);


--
-- TOC entry 2196 (class 2604 OID 44744)
-- Name: anime_genre id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anime_genre ALTER COLUMN id SET DEFAULT nextval('anime_genre_id_seq'::regclass);


--
-- TOC entry 2193 (class 2604 OID 44562)
-- Name: anime_image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anime_image ALTER COLUMN id SET DEFAULT nextval('anime_image_id_seq'::regclass);


--
-- TOC entry 2214 (class 2604 OID 53744)
-- Name: casting id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY casting ALTER COLUMN id SET DEFAULT nextval('casting_id_seq'::regclass);


--
-- TOC entry 2206 (class 2604 OID 45007)
-- Name: character id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "character" ALTER COLUMN id SET DEFAULT nextval('character_id_seq'::regclass);


--
-- TOC entry 2211 (class 2604 OID 53703)
-- Name: character_image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_image ALTER COLUMN id SET DEFAULT nextval('character_image_id_seq'::regclass);


--
-- TOC entry 2219 (class 2604 OID 53925)
-- Name: character_tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_tag ALTER COLUMN id SET DEFAULT nextval('tag_id_seq'::regclass);


--
-- TOC entry 2217 (class 2604 OID 53892)
-- Name: color id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY color ALTER COLUMN id SET DEFAULT nextval('color_id_seq'::regclass);


--
-- TOC entry 2216 (class 2604 OID 53873)
-- Name: gender id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gender ALTER COLUMN id SET DEFAULT nextval('gender_id_seq'::regclass);


--
-- TOC entry 2218 (class 2604 OID 53903)
-- Name: hair_length id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hair_length ALTER COLUMN id SET DEFAULT nextval('hair_length_id_seq'::regclass);


--
-- TOC entry 2200 (class 2604 OID 44798)
-- Name: language id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY language ALTER COLUMN id SET DEFAULT nextval('language_id_seq'::regclass);


--
-- TOC entry 2185 (class 2604 OID 44262)
-- Name: manga id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manga ALTER COLUMN id SET DEFAULT nextval('manga_id_seq'::regclass);


--
-- TOC entry 2197 (class 2604 OID 44755)
-- Name: manga_genre id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manga_genre ALTER COLUMN id SET DEFAULT nextval('manga_genre_id_seq'::regclass);


--
-- TOC entry 2183 (class 2604 OID 44214)
-- Name: manga_image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manga_image ALTER COLUMN id SET DEFAULT nextval('manga_image_id_seq'::regclass);


--
-- TOC entry 2201 (class 2604 OID 44809)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person ALTER COLUMN id SET DEFAULT nextval('person_id_seq'::regclass);


--
-- TOC entry 2204 (class 2604 OID 44837)
-- Name: person_image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person_image ALTER COLUMN id SET DEFAULT nextval('person_image_id_seq'::regclass);


--
-- TOC entry 2242 (class 2606 OID 44578)
-- Name: adaptation adaptation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adaptation
    ADD CONSTRAINT adaptation_pkey PRIMARY KEY (anime_id, manga_id);


--
-- TOC entry 2286 (class 2606 OID 61562)
-- Name: age_group age_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY age_group
    ADD CONSTRAINT age_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 44766)
-- Name: anime_anime_genre anime_anime_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anime_anime_genre
    ADD CONSTRAINT anime_anime_genre_pkey PRIMARY KEY (anime_id, genre_id);


--
-- TOC entry 2244 (class 2606 OID 44749)
-- Name: anime_genre anime_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anime_genre
    ADD CONSTRAINT anime_genre_pkey PRIMARY KEY (id);


--
-- TOC entry 2240 (class 2606 OID 44568)
-- Name: anime_image anime_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anime_image
    ADD CONSTRAINT anime_image_pkey PRIMARY KEY (id);


--
-- TOC entry 2234 (class 2606 OID 44514)
-- Name: anime anime_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anime
    ADD CONSTRAINT anime_pkey PRIMARY KEY (id);


--
-- TOC entry 2238 (class 2606 OID 61682)
-- Name: anime_relation anime_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anime_relation
    ADD CONSTRAINT anime_relation_pkey PRIMARY KEY (parent_id, child_id, type);


--
-- TOC entry 2278 (class 2606 OID 61697)
-- Name: anime_staff anime_staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anime_staff
    ADD CONSTRAINT anime_staff_pkey PRIMARY KEY (anime_id, person_id, role);


--
-- TOC entry 2268 (class 2606 OID 53751)
-- Name: casting casting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY casting
    ADD CONSTRAINT casting_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 61579)
-- Name: character_age_group character_age_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_age_group
    ADD CONSTRAINT character_age_group_pkey PRIMARY KEY (character_id, age_group_id);


--
-- TOC entry 2260 (class 2606 OID 45023)
-- Name: character_anime character_anime_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_anime
    ADD CONSTRAINT character_anime_pkey PRIMARY KEY (character_id, anime_id);


--
-- TOC entry 2282 (class 2606 OID 61534)
-- Name: character_character_tag character_character_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_character_tag
    ADD CONSTRAINT character_character_tag_pkey PRIMARY KEY (character_id, tag_id);


--
-- TOC entry 2290 (class 2606 OID 61739)
-- Name: character_eye_color character_eye_color_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_eye_color
    ADD CONSTRAINT character_eye_color_pkey PRIMARY KEY (character_id, eye_color_id);


--
-- TOC entry 2284 (class 2606 OID 61737)
-- Name: character_hair_color character_hair_color_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_hair_color
    ADD CONSTRAINT character_hair_color_pkey PRIMARY KEY (character_id, hair_color_id);


--
-- TOC entry 2292 (class 2606 OID 61725)
-- Name: character_hair_length character_hair_length_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_hair_length
    ADD CONSTRAINT character_hair_length_pkey PRIMARY KEY (character_id, hair_length_id);


--
-- TOC entry 2264 (class 2606 OID 53708)
-- Name: character_image character_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_image
    ADD CONSTRAINT character_image_pkey PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 45042)
-- Name: character_manga character_manga_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_manga
    ADD CONSTRAINT character_manga_pkey PRIMARY KEY (character_id, manga_id);


--
-- TOC entry 2258 (class 2606 OID 45014)
-- Name: character character_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT character_pkey PRIMARY KEY (id);


--
-- TOC entry 2276 (class 2606 OID 53931)
-- Name: character_tag character_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_tag
    ADD CONSTRAINT character_tag_pkey PRIMARY KEY (id);


--
-- TOC entry 2266 (class 2606 OID 53723)
-- Name: character_voice_actor character_voice_actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_voice_actor
    ADD CONSTRAINT character_voice_actor_pkey PRIMARY KEY (character_id, person_id);


--
-- TOC entry 2272 (class 2606 OID 53897)
-- Name: color color_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY color
    ADD CONSTRAINT color_pkey PRIMARY KEY (id);


--
-- TOC entry 2270 (class 2606 OID 53878)
-- Name: gender gender_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gender
    ADD CONSTRAINT gender_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 53908)
-- Name: hair_length hair_length_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hair_length
    ADD CONSTRAINT hair_length_pkey PRIMARY KEY (id);


--
-- TOC entry 2252 (class 2606 OID 44803)
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);


--
-- TOC entry 2280 (class 2606 OID 61691)
-- Name: manga_author manga_author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manga_author
    ADD CONSTRAINT manga_author_pkey PRIMARY KEY (manga_id, person_id, role);


--
-- TOC entry 2246 (class 2606 OID 44760)
-- Name: manga_genre manga_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manga_genre
    ADD CONSTRAINT manga_genre_pkey PRIMARY KEY (id);


--
-- TOC entry 2230 (class 2606 OID 44219)
-- Name: manga_image manga_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manga_image
    ADD CONSTRAINT manga_image_pkey PRIMARY KEY (id);


--
-- TOC entry 2250 (class 2606 OID 44782)
-- Name: manga_manga_genre manga_manga_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manga_manga_genre
    ADD CONSTRAINT manga_manga_genre_pkey PRIMARY KEY (manga_id, genre_id);


--
-- TOC entry 2232 (class 2606 OID 44267)
-- Name: manga manga_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manga
    ADD CONSTRAINT manga_pkey PRIMARY KEY (id);


--
-- TOC entry 2236 (class 2606 OID 61680)
-- Name: manga_relation manga_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manga_relation
    ADD CONSTRAINT manga_relation_pkey PRIMARY KEY (parent_id, child_id, type);


--
-- TOC entry 2256 (class 2606 OID 44843)
-- Name: person_image person_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person_image
    ADD CONSTRAINT person_image_pkey PRIMARY KEY (id);


--
-- TOC entry 2254 (class 2606 OID 44816)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2620 OID 61671)
-- Name: anime set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON anime FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- TOC entry 2338 (class 2620 OID 61677)
-- Name: manga set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON manga FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- TOC entry 2340 (class 2620 OID 61678)
-- Name: person set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON person FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- TOC entry 2341 (class 2620 OID 61740)
-- Name: character set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON "character" FOR EACH ROW EXECUTE PROCEDURE trigger_set_timestamp();


--
-- TOC entry 2301 (class 2606 OID 44579)
-- Name: adaptation adaptation_anime_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adaptation
    ADD CONSTRAINT adaptation_anime_id_fkey FOREIGN KEY (anime_id) REFERENCES anime(id);


--
-- TOC entry 2302 (class 2606 OID 44584)
-- Name: adaptation adaptation_manga_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adaptation
    ADD CONSTRAINT adaptation_manga_id_fkey FOREIGN KEY (manga_id) REFERENCES manga(id);


--
-- TOC entry 2303 (class 2606 OID 44767)
-- Name: anime_anime_genre anime_anime_genre_anime_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anime_anime_genre
    ADD CONSTRAINT anime_anime_genre_anime_id_fkey FOREIGN KEY (anime_id) REFERENCES anime(id);


--
-- TOC entry 2304 (class 2606 OID 44772)
-- Name: anime_anime_genre anime_anime_genre_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anime_anime_genre
    ADD CONSTRAINT anime_anime_genre_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES anime_genre(id);


--
-- TOC entry 2300 (class 2606 OID 44569)
-- Name: anime_image anime_image_anime_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anime_image
    ADD CONSTRAINT anime_image_anime_id_fkey FOREIGN KEY (anime_id) REFERENCES anime(id);


--
-- TOC entry 2295 (class 2606 OID 44711)
-- Name: anime anime_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anime
    ADD CONSTRAINT anime_image_id_fkey FOREIGN KEY (image_id) REFERENCES manga(id);


--
-- TOC entry 2299 (class 2606 OID 44550)
-- Name: anime_relation anime_relation_child_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anime_relation
    ADD CONSTRAINT anime_relation_child_id_fkey FOREIGN KEY (child_id) REFERENCES anime(id);


--
-- TOC entry 2298 (class 2606 OID 44545)
-- Name: anime_relation anime_relation_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anime_relation
    ADD CONSTRAINT anime_relation_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES anime(id);


--
-- TOC entry 2324 (class 2606 OID 61456)
-- Name: anime_staff anime_staff_anime_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anime_staff
    ADD CONSTRAINT anime_staff_anime_id_fkey FOREIGN KEY (anime_id) REFERENCES anime(id);


--
-- TOC entry 2325 (class 2606 OID 61461)
-- Name: anime_staff anime_staff_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY anime_staff
    ADD CONSTRAINT anime_staff_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(id);


--
-- TOC entry 2319 (class 2606 OID 53752)
-- Name: casting casting_anime_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY casting
    ADD CONSTRAINT casting_anime_id_fkey FOREIGN KEY (anime_id) REFERENCES anime(id);


--
-- TOC entry 2320 (class 2606 OID 53757)
-- Name: casting casting_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY casting
    ADD CONSTRAINT casting_character_id_fkey FOREIGN KEY (character_id) REFERENCES "character"(id);


--
-- TOC entry 2322 (class 2606 OID 53767)
-- Name: casting casting_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY casting
    ADD CONSTRAINT casting_language_id_fkey FOREIGN KEY (language_id) REFERENCES language(id);


--
-- TOC entry 2321 (class 2606 OID 53762)
-- Name: casting casting_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY casting
    ADD CONSTRAINT casting_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(id);


--
-- TOC entry 2333 (class 2606 OID 61573)
-- Name: character_age_group character_age_group_age_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_age_group
    ADD CONSTRAINT character_age_group_age_group_id_fkey FOREIGN KEY (age_group_id) REFERENCES age_group(id);


--
-- TOC entry 2332 (class 2606 OID 61568)
-- Name: character_age_group character_age_group_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_age_group
    ADD CONSTRAINT character_age_group_character_id_fkey FOREIGN KEY (character_id) REFERENCES "character"(id);


--
-- TOC entry 2312 (class 2606 OID 45029)
-- Name: character_anime character_anime_anime_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_anime
    ADD CONSTRAINT character_anime_anime_id_fkey FOREIGN KEY (anime_id) REFERENCES anime(id);


--
-- TOC entry 2311 (class 2606 OID 45024)
-- Name: character_anime character_anime_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_anime
    ADD CONSTRAINT character_anime_character_id_fkey FOREIGN KEY (character_id) REFERENCES "character"(id);


--
-- TOC entry 2328 (class 2606 OID 61507)
-- Name: character_character_tag character_character_tag_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_character_tag
    ADD CONSTRAINT character_character_tag_character_id_fkey FOREIGN KEY (character_id) REFERENCES "character"(id);


--
-- TOC entry 2329 (class 2606 OID 61512)
-- Name: character_character_tag character_character_tag_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_character_tag
    ADD CONSTRAINT character_character_tag_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES character_tag(id);


--
-- TOC entry 2334 (class 2606 OID 61627)
-- Name: character_eye_color character_eye_color_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_eye_color
    ADD CONSTRAINT character_eye_color_character_id_fkey FOREIGN KEY (character_id) REFERENCES "character"(id);


--
-- TOC entry 2335 (class 2606 OID 61632)
-- Name: character_eye_color character_eye_color_color_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_eye_color
    ADD CONSTRAINT character_eye_color_color_id_fkey FOREIGN KEY (eye_color_id) REFERENCES color(id);


--
-- TOC entry 2310 (class 2606 OID 53879)
-- Name: character character_gender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT character_gender_id_fkey FOREIGN KEY (gender_id) REFERENCES gender(id);


--
-- TOC entry 2330 (class 2606 OID 61542)
-- Name: character_hair_color character_hair_color_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_hair_color
    ADD CONSTRAINT character_hair_color_character_id_fkey FOREIGN KEY (character_id) REFERENCES "character"(id);


--
-- TOC entry 2331 (class 2606 OID 61547)
-- Name: character_hair_color character_hair_color_hair_color_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_hair_color
    ADD CONSTRAINT character_hair_color_hair_color_id_fkey FOREIGN KEY (hair_color_id) REFERENCES color(id);


--
-- TOC entry 2336 (class 2606 OID 61726)
-- Name: character_hair_length character_hair_length_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_hair_length
    ADD CONSTRAINT character_hair_length_character_id_fkey FOREIGN KEY (character_id) REFERENCES "character"(id);


--
-- TOC entry 2337 (class 2606 OID 61731)
-- Name: character_hair_length character_hair_length_hair_length_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_hair_length
    ADD CONSTRAINT character_hair_length_hair_length_id_fkey FOREIGN KEY (hair_length_id) REFERENCES hair_length(id);


--
-- TOC entry 2315 (class 2606 OID 53709)
-- Name: character_image character_image_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_image
    ADD CONSTRAINT character_image_character_id_fkey FOREIGN KEY (character_id) REFERENCES "character"(id);


--
-- TOC entry 2309 (class 2606 OID 53714)
-- Name: character character_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT character_image_id_fkey FOREIGN KEY (image_id) REFERENCES character_image(id);


--
-- TOC entry 2313 (class 2606 OID 45043)
-- Name: character_manga character_manga_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_manga
    ADD CONSTRAINT character_manga_character_id_fkey FOREIGN KEY (character_id) REFERENCES "character"(id);


--
-- TOC entry 2314 (class 2606 OID 45048)
-- Name: character_manga character_manga_manga_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_manga
    ADD CONSTRAINT character_manga_manga_id_fkey FOREIGN KEY (manga_id) REFERENCES manga(id);


--
-- TOC entry 2323 (class 2606 OID 53932)
-- Name: character_tag character_tag_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_tag
    ADD CONSTRAINT character_tag_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES character_tag(id);


--
-- TOC entry 2316 (class 2606 OID 53724)
-- Name: character_voice_actor character_voice_actor_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_voice_actor
    ADD CONSTRAINT character_voice_actor_character_id_fkey FOREIGN KEY (character_id) REFERENCES "character"(id);


--
-- TOC entry 2318 (class 2606 OID 53734)
-- Name: character_voice_actor character_voice_actor_lanuage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_voice_actor
    ADD CONSTRAINT character_voice_actor_lanuage_id_fkey FOREIGN KEY (language_id) REFERENCES language(id);


--
-- TOC entry 2317 (class 2606 OID 53729)
-- Name: character_voice_actor character_voice_actor_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY character_voice_actor
    ADD CONSTRAINT character_voice_actor_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(id);


--
-- TOC entry 2326 (class 2606 OID 61491)
-- Name: manga_author manga_author_manga_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manga_author
    ADD CONSTRAINT manga_author_manga_id_fkey FOREIGN KEY (manga_id) REFERENCES manga(id);


--
-- TOC entry 2327 (class 2606 OID 61496)
-- Name: manga_author manga_author_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manga_author
    ADD CONSTRAINT manga_author_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(id);


--
-- TOC entry 2294 (class 2606 OID 44268)
-- Name: manga manga_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manga
    ADD CONSTRAINT manga_image_id_fkey FOREIGN KEY (image_id) REFERENCES manga_image(id);


--
-- TOC entry 2293 (class 2606 OID 44273)
-- Name: manga_image manga_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manga_image
    ADD CONSTRAINT manga_image_id_fkey FOREIGN KEY (manga_id) REFERENCES manga(id);


--
-- TOC entry 2306 (class 2606 OID 44788)
-- Name: manga_manga_genre manga_manga_genre_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manga_manga_genre
    ADD CONSTRAINT manga_manga_genre_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES manga_genre(id);


--
-- TOC entry 2305 (class 2606 OID 44783)
-- Name: manga_manga_genre manga_manga_genre_manga_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manga_manga_genre
    ADD CONSTRAINT manga_manga_genre_manga_id_fkey FOREIGN KEY (manga_id) REFERENCES manga(id);


--
-- TOC entry 2297 (class 2606 OID 44529)
-- Name: manga_relation manga_relation_child_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manga_relation
    ADD CONSTRAINT manga_relation_child_id_fkey FOREIGN KEY (child_id) REFERENCES manga(id);


--
-- TOC entry 2296 (class 2606 OID 44524)
-- Name: manga_relation manga_relation_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manga_relation
    ADD CONSTRAINT manga_relation_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES manga(id);


--
-- TOC entry 2307 (class 2606 OID 44849)
-- Name: person person_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_image_id_fkey FOREIGN KEY (image_id) REFERENCES person_image(id);


--
-- TOC entry 2308 (class 2606 OID 44844)
-- Name: person_image person_image_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person_image
    ADD CONSTRAINT person_image_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(id);


-- Completed on 2018-02-14 11:45:05

--
-- PostgreSQL database dump complete
--
INSERT INTO "public"."color" ("id", "name") VALUES ('1', 'White');
INSERT INTO "public"."color" ("id", "name") VALUES ('2', 'Black');
INSERT INTO "public"."color" ("id", "name") VALUES ('3', 'Gray/Silver');
INSERT INTO "public"."color" ("id", "name") VALUES ('4', 'Purple');
INSERT INTO "public"."color" ("id", "name") VALUES ('5', 'Pink');
INSERT INTO "public"."color" ("id", "name") VALUES ('6', 'Red');
INSERT INTO "public"."color" ("id", "name") VALUES ('7', 'Green');
INSERT INTO "public"."color" ("id", "name") VALUES ('8', 'Blue');
INSERT INTO "public"."color" ("id", "name") VALUES ('9', 'Orange');
INSERT INTO "public"."color" ("id", "name") VALUES ('10', 'Yellow/Blonde');
INSERT INTO "public"."color" ("id", "name") VALUES ('11', 'Brown');
INSERT INTO "public"."color" ("id", "name") VALUES ('12', 'Unknown');

INSERT INTO "public"."gender" ("id", "name") VALUES ('1', 'Male');
INSERT INTO "public"."gender" ("id", "name") VALUES ('2', 'Female');
INSERT INTO "public"."gender" ("id", "name") VALUES ('3', 'Unkown/Ambiguous');

INSERT INTO "public"."hair_length" ("id", "description") VALUES ('1', 'To Ears');
INSERT INTO "public"."hair_length" ("id", "description") VALUES ('2', 'To Neck');
INSERT INTO "public"."hair_length" ("id", "description") VALUES ('3', 'To Shoulders');
INSERT INTO "public"."hair_length" ("id", "description") VALUES ('4', 'To Chest');
INSERT INTO "public"."hair_length" ("id", "description") VALUES ('5', 'To Waist');
INSERT INTO "public"."hair_length" ("id", "description") VALUES ('6', 'Past Waist');
INSERT INTO "public"."hair_length" ("id", "description") VALUES ('7', 'Hair Up/Unknown');

INSERT INTO "public"."language" ("id", "name") VALUES ('1', 'Japanese');
INSERT INTO "public"."language" ("id", "name") VALUES ('2', 'English');
INSERT INTO "public"."language" ("id", "name") VALUES ('3', 'Italian');
INSERT INTO "public"."language" ("id", "name") VALUES ('4', 'French');
INSERT INTO "public"."language" ("id", "name") VALUES ('5', 'Spanish');
INSERT INTO "public"."language" ("id", "name") VALUES ('6', 'German');
INSERT INTO "public"."language" ("id", "name") VALUES ('7', 'Hungarian');
INSERT INTO "public"."language" ("id", "name") VALUES ('8', 'Brazilian');
INSERT INTO "public"."language" ("id", "name") VALUES ('9', 'Hebrew');
INSERT INTO "public"."language" ("id", "name") VALUES ('10', 'Korean');
INSERT INTO "public"."language" ("id", "name") VALUES ('11', 'Mandarin');

INSERT INTO "public"."age_group" ("id", "name", "description") VALUES ('1', 'Baby', NULL);
INSERT INTO "public"."age_group" ("id", "name", "description") VALUES ('2', 'Child', NULL);
INSERT INTO "public"."age_group" ("id", "name", "description") VALUES ('3', 'Teen', NULL);
INSERT INTO "public"."age_group" ("id", "name", "description") VALUES ('4', 'Adult', NULL);
INSERT INTO "public"."age_group" ("id", "name", "description") VALUES ('5', 'Senior', NULL);

INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('1', NULL, 'tag', '', 't', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('2', '1', 'Athlete', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('3', '2', 'Baseball Player', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('4', '2', 'Basketball Player', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('5', '2', 'Boxer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('6', '2', 'Cyclist', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('7', '2', 'Gymnast', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('8', '2', 'Ice Skater', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('9', '2', 'Soccer Player', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('10', '2', 'Swimmer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('11', '2', 'Tennis Player', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('12', '2', 'Track and Fielders', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('13', '2', 'Volleyball Player', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('14', '2', 'Wrestler', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('15', '1', 'Musician', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('16', '15', 'Band Member', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('17', '15', 'Bassist', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('18', '15', 'Cellist', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('19', '15', 'Drummer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('20', '15', 'Flutist', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('21', '15', 'Guitarist', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('22', '15', 'Pianist', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('23', '15', 'Singer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('24', '15', 'Violinist', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('25', '1', 'Personality', '', 't', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('26', '25', 'Airhead', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('27', '25', 'Analytical', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('28', '25', 'Big Ego', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('29', '25', 'Bloodthirsty', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('30', '25', 'Bookworm', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('31', '25', 'Bossy', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('32', '25', 'Charismatic', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('33', '25', 'Clumsy', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('34', '25', 'Coward', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('35', '25', 'Cruel', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('36', '25', 'Crybaby', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('37', '25', 'Dandere', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('38', '25', 'Optimist', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('39', '25', 'Flamboyant', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('40', '25', 'Flirt', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('41', '25', 'Quick Temper', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('42', '25', 'Kuudere', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('43', '25', 'Lazy', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('44', '25', 'Manipulative', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('45', '25', 'Masochist', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('46', '25', 'Mischievous', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('47', '25', 'Pacifist', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('48', '25', 'Pervert', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('49', '25', 'Ruthless', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('50', '25', 'Sadistic', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('51', '25', 'Selfish', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('52', '25', 'Shy', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('53', '25', 'Sickly', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('54', '25', 'Stoic', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('55', '25', 'Tomboy', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('56', '25', 'Tsundere', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('57', '25', 'Vengeful', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('58', '1', 'Appearance', '', 't', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('59', '58', 'Hair Style', '', 't', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('60', '59', 'Afro', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('61', '59', 'Spiky Hair', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('62', '59', 'Bald', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('63', '59', 'Balding', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('64', '59', 'Blinding Bangs', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('65', '59', 'Dreadlocks', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('66', '59', 'Hair Antenna', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('67', '59', 'Hair Buns', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('68', '59', 'Hair Drills', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('69', '59', 'Hair Ribbons', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('70', '59', 'Mohawk', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('71', '59', 'Pigtails', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('72', '59', 'Pompadour', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('73', '59', 'Ponytail', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('74', '59', 'Rapunzel', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('75', '59', 'Topknot', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('76', '58', 'Eyewear', '', 't', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('77', '76', 'Eye patch', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('78', '76', 'Glasses', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('79', '76', 'Goggles', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('80', '76', 'Monocles', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('81', '76', 'Opaque glasses', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('82', '76', 'Sunglasses', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('83', '58', 'Headwear', '', 't', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('84', '83', 'Animal Hood', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('85', '83', 'Bandana', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('86', '83', 'Circlet', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('87', '83', 'Crown', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('88', '83', 'Hat', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('89', '83', 'Headband', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('90', '83', 'Headphones', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('91', '83', 'Helmet', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('92', '83', 'Mask', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('93', '83', 'Turban', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('94', '58', 'Body/Facial traits', '', 't', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('95', '94', 'Very Tall', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('96', '94', 'Animal Ears', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('97', '94', 'Big Nose', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('98', '94', 'Breathtaking Beard', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('99', '94', 'Closed Eyes', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('100', '94', 'Dark-skinned', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('101', '94', 'Epic Eyebrows', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('102', '94', 'Exotic Eyes', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('103', '94', 'Facial Mark', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('104', '94', 'Facial Hair', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('105', '94', 'Freckles', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('106', '94', 'Giant', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('107', '94', 'Horns', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('108', '94', 'Huge Breasts', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('109', '94', 'Magnificent Mustache', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('110', '94', 'Missing Teeth', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('111', '94', 'Mole', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('112', '94', 'Muscular', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('113', '94', 'Overweight', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('114', '94', 'Piercings', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('115', '94', 'Pointy Ears', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('116', '94', 'Rosy Cheeks', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('117', '94', 'Sausage Lips', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('118', '94', 'Facial Scar', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('119', '94', 'Sharp Teeth', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('120', '94', 'Small', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('121', '94', 'Snaggle Teeth', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('122', '94', 'Tail', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('123', '94', 'Tattoo', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('124', '94', 'Tiny', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('125', '94', 'Wings', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('126', '58', 'Neckwear', '', 't', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('127', '126', 'Choker', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('128', '126', 'Scarf', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('129', '58', 'Accessories', '', 't', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('130', '129', 'Bandages', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('131', '129', 'Cane', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('132', '129', 'Cape', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('133', '129', 'Pipe', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('134', '58', 'Clothing Style', '', 't', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('135', '134', 'Crossdresser', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('136', '134', 'Gothic Lolita', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('138', '1', 'Animal', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('139', '138', 'Bear', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('140', '138', 'Bird', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('141', '138', 'Cat', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('142', '138', 'Dog', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('143', '138', 'Frog', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('144', '138', 'Horse', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('145', '138', 'Insect', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('146', '138', 'Pig', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('147', '138', 'Rabbit', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('148', '138', 'Reptile', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('149', '138', 'Wolf', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('150', '138', 'Spider', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('151', '138', 'Tanuki', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('152', '1', 'Entity', '', 't', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('153', '152', 'Alien', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('154', '152', 'Android', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('155', '152', 'Angel', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('156', '152', 'Artificial Intelligence', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('157', '152', 'Catgirl', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('158', '152', 'Cyborg', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('159', '152', 'Deity', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('160', '152', 'Demon', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('161', '152', 'Dinosaur', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('162', '152', 'Dragon', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('163', '152', 'Dwarf', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('164', '152', 'Elf', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('165', '152', 'Fairy', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('166', '152', 'Genie', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('167', '152', 'Ghost', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('168', '152', 'Half-breed', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('169', '152', 'Historical Figure', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('170', '152', 'Human Guise', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('171', '152', 'Inanimate Object', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('172', '152', 'Magical Familiar', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('173', '152', 'Mermaid', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('174', '152', 'Monster', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('175', '152', 'Robot', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('176', '152', 'Shinigami', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('177', '152', 'Undead', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('178', '152', 'Vampire', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('179', '152', 'Werewolf', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('180', '58', 'Bodywear', '', 't', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('181', '180', 'Armor', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('182', '1', 'Occupation/Organization', '', 't', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('183', '182', 'Actor', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('184', '182', 'Alchemist', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('185', '182', 'Artist', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('186', '182', 'Astronaut', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('187', '182', 'Bartender', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('188', '182', 'Battle Gamer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('189', '182', 'Biker', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('190', '182', 'Board Game Player', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('191', '182', 'Bodyguard', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('192', '182', 'Bounty Hunter', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('193', '182', 'Butler', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('194', '182', 'Company President', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('195', '182', 'Computer Programmer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('196', '182', 'Cook', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('197', '182', 'Dancer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('198', '182', 'Detective', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('199', '182', 'Doctor', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('200', '182', 'Engineer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('201', '182', 'Exorcist', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('202', '182', 'Farmer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('203', '182', 'Gangster', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('204', '182', 'Gardener', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('205', '182', 'Hacker', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('206', '182', 'Hunter', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('207', '182', 'Idol', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('208', '182', 'Inventor', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('209', '182', 'Landlord', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('210', '182', 'Lawyer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('211', '182', 'Librarian', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('212', '182', 'Maid', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('213', '182', 'Masked Hero', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('214', '182', 'Mecha Pilot', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('215', '182', 'Mechanic', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('216', '182', 'Mercenary', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('217', '182', 'Merchant', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('218', '182', 'Military', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('219', '182', 'Model', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('220', '182', 'Monk', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('221', '182', 'Monster Tamer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('222', '182', 'NEET', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('223', '182', 'Nurse', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('224', '182', 'Onmyouji', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('225', '182', 'Part Time Employee', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('226', '182', 'Photographer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('227', '182', 'Pilot', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('228', '182', 'Pirate', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('229', '182', 'Police', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('230', '182', 'Politician', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('231', '182', 'Priest', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('232', '182', 'Prisoner', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('233', '182', 'Racer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('234', '182', 'Reporter', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('235', '182', 'Salaryman', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('236', '182', 'School Principal', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('237', '182', 'Scientist', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('238', '182', 'Shrine Maiden', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('239', '182', 'Space Pirate', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('240', '182', 'Nun', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('241', '182', 'Teacher', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('242', '182', 'Terrorist', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('243', '182', 'Thief', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('244', '182', 'Traveler', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('245', '182', 'Writer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('246', '1', 'Fighter/Weapons', '', 't', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('247', '246', 'Archer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('248', '246', 'Arm Blades', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('249', '246', 'Assassin', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('250', '246', 'Axe', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('251', '246', 'Claw', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('252', '246', 'Dual Wielder', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('253', '246', 'Gunslinger', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('254', '246', 'Knife', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('255', '246', 'Lancer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('256', '246', 'Martial Artist', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('257', '246', 'Ninja', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('258', '246', 'Humongous Weapon', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('259', '246', 'Samurai', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('260', '246', 'Scythe', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('261', '246', 'Sword', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('262', '246', 'Weird weapon', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('263', '246', 'Warrior', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('264', '246', 'Weapon Master', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('265', '246', 'Whip', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('266', '246', 'Knight', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('267', '1', 'Abilities', '', 't', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('268', '267', 'Magic User', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('269', '267', 'Magical Girl', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('270', '267', 'Psychic', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('271', '267', 'Shapeshifter', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('272', '267', 'Spirit Seer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('273', '267', 'Summoner', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('274', '267', 'Superpower', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('275', '180', 'Power Suit', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('276', '152', 'Youkai', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('277', '276', 'Bakeneko', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('278', '276', 'Jinmenken', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('279', '276', 'Jorogumo', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('280', '276', 'Kappa', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('281', '276', 'Karakasa Obake', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('282', '276', 'Karasu Tengu', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('283', '276', 'Kitsune', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('284', '276', 'Nekomata', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('285', '276', 'Nurikabe', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('286', '276', 'Rokurokubi', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('287', '276', 'Tengu', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('288', '276', 'Yuki Onna', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('289', '276', 'Zashiki Warashi', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('290', '1', 'Traits', '', 't', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('291', '290', '2D Lover', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('292', '290', 'Amnesia', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('293', '290', 'Artificial Limb(s)', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('294', '290', 'Big Eater', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('295', '290', 'Blind', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('296', '290', 'Bully', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('297', '290', 'Deaf', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('298', '290', 'Delinquent', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('299', '290', 'Foreigner', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('300', '290', 'Frequently Naked', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('301', '290', 'Gambler', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('302', '290', 'Genetically Engineered', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('303', '290', 'Heavy Drinker', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('304', '290', 'Immortal', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('305', '290', 'Nobility', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('306', '290', 'Orphan', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('307', '290', 'Otaku', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('308', '290', 'Poor', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('309', '290', 'Royalty', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('310', '290', 'Scantily-dressed', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('311', '290', 'Slave', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('312', '290', 'Smoker', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('313', '290', 'Twin', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('314', '290', 'Video Gamer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('315', '290', 'Wealthy', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('316', '290', 'Wheelchair', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('317', '182', 'Student', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('318', '317', 'Class Representative', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('319', '317', 'Elementary School Student', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('320', '317', 'High School Student', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('321', '317', 'Kindergartner', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('322', '317', 'Middle School Student', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('323', '317', 'School Idol', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('324', '317', 'Student Council', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('325', '317', 'Transfer Student', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('326', '317', 'College Student', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('327', '180', 'Suit', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('328', '94', 'Lipstick', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('329', '180', 'Suspenders', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('330', '180', 'Hotpants', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('331', '180', 'Stockings', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('332', '246', 'Katana', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('333', '180', 'Yukata', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('334', '59', 'Single Bang', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('335', '290', 'Ageless', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('336', '129', 'Bow Tie', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('337', '180', 'Robe', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('338', '126', 'Necklace', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('339', '180', 'Shorts', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('340', '134', 'Midriff', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('341', '290', 'Genius', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('342', '94', 'Tanned', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('343', '129', 'Tie', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('344', '180', 'T-shirt', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('345', '126', 'Turtleneck', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('346', '58', 'Footwear', '', 't', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('347', '346', 'Sneakers', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('348', '346', 'Barefoot', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('349', '346', 'Sandals', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('350', '346', 'Dress Shoes', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('351', '129', 'Earrings', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('352', '346', 'Boots', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('353', '129', 'Belt', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('354', '129', 'Gloves', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('355', '59', 'Wavy Hair', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('356', '290', 'Jester', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('357', '129', 'Arm Bands', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('358', '88', 'Straw Hat', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('359', '94', 'Body Scar', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('360', '134', 'Open Shirt', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('361', '129', 'Detached Sleeves', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('362', '180', 'Skirt', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('363', '180', 'Coat', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('364', '94', 'Loli', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('365', '180', 'Dress', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('366', '290', 'Trap', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('367', '246', 'Unconventional Weapon', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('368', '94', 'Dim Eyes', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('369', '129', 'Cross', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('370', '59', 'Sleek Hair', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('371', '180', 'Sarong', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('372', '180', 'Crop Top', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('373', '94', 'Stitches', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('374', '180', 'Thong', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('375', '59', 'Sideburns', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('376', '180', 'Apron', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('377', '83', 'Hood', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('378', '267', 'Fire Control', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('379', '94', 'Stubble', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('380', '83', 'Hairband', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('381', '182', 'Chef', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('382', '180', 'Miniskirt', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('384', '126', 'Neckerchief', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('385', '346', 'Pumps', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('386', '180', 'Tights', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('387', '59', 'Bowl Cut', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('388', '267', 'Thunder Control', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('389', '180', 'Mechsuit', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('390', '59', 'Cheek Curls', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('391', '180', 'Tank Top', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('392', '59', 'Hair Braids', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('393', '182', 'Princess', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('394', '180', 'Hoodie', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('395', '59', 'Curly Hair', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('396', '180', 'Frills', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('397', '352', 'Thigh High Boots', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('398', '88', 'Beret', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('399', '290', 'Sister Complex', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('401', '59', 'Hair Intakes', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('402', '180', 'Kimono', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('403', '129', 'Bracelet', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('404', '59', 'Hair Ornament', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('405', '346', 'Knee Highs', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('406', '94', 'Goatee', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('407', '94', 'One Eye Showing', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('408', '354', 'Fingerless Gloves', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('409', '182', 'Shinsengumi', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('410', '180', 'Gakuran', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('411', '180', 'Poncho', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('412', '180', 'Jacket', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('413', '129', 'Bell', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('414', '88', 'Cap', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('415', '59', 'Odango', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('416', '182', 'Waitress', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('417', '59', 'Hair Bow', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('418', '138', 'Mouse', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('419', '290', 'Cursebearer', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('420', '290', 'Brother Complex', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('421', '182', 'Clown', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('422', '290', 'God Complex', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('423', '290', 'Disabled', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('424', '290', 'Child Prodigy', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('425', '182', 'Spy', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('426', '290', 'Tyrant', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('427', '25', 'Hyperactive', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('428', '182', 'Cheerleader', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('429', '59', 'Multicolored Hair', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('430', '2', 'Table Tennis Player', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('431', '2', 'Football Player', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('432', '59', 'Ahoge', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('433', '129', 'Bag', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('434', '180', 'Vest', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('435', '59', 'V Bangs', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('436', '83', 'Tiara', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('437', '160', 'Succubus', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('438', '59', 'Side Ponytail', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('439', '180', 'Shirtless', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('440', '182', 'Sensei', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('441', '180', 'School Uniform', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('442', '129', 'School Crest', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('443', '134', 'Plaid', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('444', '354', 'Opera Gloves', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('445', '180', 'Military Unifrom', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('446', '180', 'Labcoat', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('447', '94', 'Tiny Breasts', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('448', '59', 'Hime Cut', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('449', '83', 'Headdress', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('450', '59', 'Hair Clip', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('451', '59', 'Hair Bobble', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('452', '59', 'Hair Tube', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('453', '94', 'Fur', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('454', '129', 'Flower', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('455', '180', 'Cravat', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('456', '180', 'Corset', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('457', '126', 'Collar', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('458', '94', 'Chibi', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('460', '59', 'Blunt Bangs', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');
INSERT INTO "public"."character_tag" ("id", "parent_id", "name", "description", "is_category", "created_at", "updated_at") VALUES ('461', '180', 'Bikini', '', 'f', '2018-01-12 01:40:18.161876', '2018-01-12 01:40:24.290435');


INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('1', 'Action', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('2', 'Adventure', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('3', 'Cars', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('4', 'Comedy', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('5', 'Dementia', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('6', 'Demons', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('7', 'Mystery', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('8', 'Drama', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('9', 'Ecchi', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('10', 'Fantasy', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('11', 'Game', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('12', 'Hentai', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('13', 'Historical', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('14', 'Horror', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('15', 'Kids', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('16', 'Magic', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('17', 'Martial Arts', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('18', 'Mecha', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('19', 'Music', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('20', 'Parody', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('21', 'Samurai', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('22', 'Romance', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('23', 'School', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('24', 'Sci-Fi', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('25', 'Shoujo', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('26', 'Shoujo Ai', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('27', 'Shounen', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('28', 'Shounen Ai', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('29', 'Space', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('30', 'Sports', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('31', 'Super Power', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('32', 'Vampire', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('33', 'Yaoi', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('34', 'Yuri', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('35', 'Harem', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('36', 'Slice of Life', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('37', 'Supernatural', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('38', 'Military', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('39', 'Police', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('40', 'Psychological', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('41', 'Thriller', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('42', 'Seinen', NULL);
INSERT INTO "public"."anime_genre" ("id", "name", "description") VALUES ('43', 'Josei', NULL);

INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('1', 'Action', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('2', 'Adventure', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('3', 'Cars', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('4', 'Comedy', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('5', 'Dementia', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('6', 'Demons', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('7', 'Mystery', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('8', 'Drama', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('9', 'Ecchi', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('10', 'Fantasy', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('11', 'Game', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('12', 'Hentai', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('13', 'Historical', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('14', 'Horror', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('15', 'Kids', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('16', 'Magic', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('17', 'Martial Arts', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('18', 'Mecha', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('19', 'Music', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('20', 'Parody', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('21', 'Samurai', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('22', 'Romance', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('23', 'School', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('24', 'Sci-Fi', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('25', 'Shoujo', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('26', 'Shoujo Ai', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('27', 'Shounen', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('28', 'Shounen Ai', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('29', 'Space', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('30', 'Sports', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('31', 'Super Power', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('32', 'Vampire', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('33', 'Yaoi', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('34', 'Yuri', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('35', 'Harem', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('36', 'Slice of Life', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('37', 'Supernatural', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('38', 'Military', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('39', 'Police', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('40', 'Psychological', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('41', 'Seinen', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('42', 'Josei', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('43', 'Doujinshi', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('44', 'Gender Bender', NULL);
INSERT INTO "public"."manga_genre" ("id", "name", "description") VALUES ('45', 'Thriller', NULL);

-- Anime id of 1
INSERT INTO "public"."anime" ("id", "mal_id", "main_title", "english_title", "japanese_title", "alternative_titles", "synopsis", "spoilers", "type", "episodes", "status", "premiered", "broadcast", "producers", "licensors", "studios", "source", "duration", "content_rating", "openings", "endings", "image_id", "created_at", "updated_at", "aired") VALUES ('1', '1', 'Cowboy Bebop', 'Cowboy Bebop', 'カウボーイビバップ', NULL, 'In the year 2071, humanity has colonized several of the planets and moons of the solar system leaving the now uninhabitable surface of planet Earth behind. The Inter Solar System Police attempts to keep peace in the galaxy, aided in part by outlaw bounty hunters, referred to as "Cowboys." The ragtag team aboard the spaceship Bebop are two such individuals.', NULL, 'TV', '26', 'Finished Airing', 'Spring 1998', 'Saturdays at 01:00 (JST)', '{"Bandai Visual"}', '{Funimation,"Bandai Entertainment"}', '{Sunrise}', 'Original', '24 min. per ep.', 'R - 17+ (violence & profanity)', '{"\"Tank!\" by The Seatbelts (eps 1-25)"}', '{"#1: \"The Real Folk Blues\" by The Seatbelts feat. Mai Yamane (eps 1-12, 14-25)","#2: \"Space Lion\" by The Seatbelts (ep 13)","#3: \"Blue\" by The Seatbelts feat. Mai Yamane (ep 26)"}', '1', '2018-01-07 13:03:53.038573', '2018-01-31 20:35:17.957856', 'Apr 3, 1998 to Apr 24, 1999');
INSERT INTO "public"."anime_anime_genre" ("anime_id", "genre_id", "created_at") VALUES ('1', '1', '2018-01-07 13:33:35.611402');
INSERT INTO "public"."anime_anime_genre" ("anime_id", "genre_id", "created_at") VALUES ('1', '2', '2018-01-07 13:33:35.611402');
INSERT INTO "public"."anime_anime_genre" ("anime_id", "genre_id", "created_at") VALUES ('1', '4', '2018-01-07 13:33:35.611402');
INSERT INTO "public"."anime_anime_genre" ("anime_id", "genre_id", "created_at") VALUES ('1', '8', '2018-01-07 13:33:35.611402');
INSERT INTO "public"."anime_anime_genre" ("anime_id", "genre_id", "created_at") VALUES ('1', '24', '2018-01-07 13:33:35.611402');
INSERT INTO "public"."anime_anime_genre" ("anime_id", "genre_id", "created_at") VALUES ('1', '29', '2018-01-07 13:33:35.611402');
INSERT INTO "public"."anime_image" ("id", "anime_id", "image_path", "mal_link", "created_at") VALUES ('1', '1', '9819185a8c-1.jpg', 'https://myanimelist.cdn-dena.com/images/anime/4/19644.jpg', '2018-01-07 13:13:39.970474');

-- Character id of 1
INSERT INTO "public"."character" ("id", "mal_id", "name", "japanese_name", "alternative_names", "description", "spoilers", "gender_id", "image_id", "created_at", "updated_at") VALUES ('1', '1', 'Spike Spiegel', 'スパイク・スピーゲル', NULL, 'Birthdate: June 26, 2044
Height: 185 cm (6'' 1")
Weight: 70 kg (155 lbs)
Blood type: O
Planet of Origin: Mars

Spike Spiegel is a tall and lean 27-year-old bounty hunter born on Mars. The inspiration for Spike is found in martial artist Bruce Lee who uses the martial arts style of Jeet Kune Do as depicted in Session 8, "Waltz For Venus". He has fluffy, dark green hair (which is inspired by Yusaku Matsuda''s) and reddish brown eyes, one of which is artificial and lighter than the other. He is usually dressed in a blue leisure suit, with a yellow shirt and Lupin III inspired boots. A flashback in Session 6 revealed it was his fully functioning right eye which was surgically replaced by the cybernetic one (although Spike himself may not have conscious recollection of the procedure since he claims to have lost his natural eye in an "accident"). One theory is that his natural eye may have been lost during the pre-series massacre in which he supposedly "died". The purpose of this cybernetic eye is never explicitly stated, though it apparently gives him exceptional hand-eye coordination - particularly with firearms (Spike''s gun of choice is a Jericho 941, as seen throughout the series). In the first episode, when facing a bounty-head using Red Eye, Spike mocks him, calling his moves "too slow". At first, this seems like posturing on Spike''s part, but even with his senses and reflexes accelerated to superhuman levels by the drug, the bounty cannot even touch Spike. A recurring device throughout the entire show is a closeup on Spike''s fully-natural left eye before dissolving to a flashback of his life as part of the syndicate. As said by Spike himself in the last episode, his right eye "only sees the present" and his left eye "only sees the past." Spike often has a bent cigarette between his lips, sometimes despite rain or "No Smoking" signs.
', NULL, '1', '1', '2018-01-09 23:56:54.885018', '2018-01-09 23:56:54.885018');

INSERT INTO "public"."character_age_group" ("character_id", "age_group_id", "created_at") VALUES ('1', '4', '2018-01-12 23:03:25.182278');

INSERT INTO "public"."character_anime" ("character_id", "anime_id", "role", "created_at") VALUES ('1', '1', 'Main', '2018-01-11 13:38:54.723615');
-- INSERT INTO "public"."character_anime" ("character_id", "anime_id", "role", "created_at") VALUES ('1', '2', 'Main', '2018-01-11 13:38:54.723615');
-- INSERT INTO "public"."character_anime" ("character_id", "anime_id", "role", "created_at") VALUES ('1', '3457', 'Main', '2018-01-11 13:38:54.723615');

INSERT INTO "public"."character_character_tag" ("character_id", "tag_id", "created_at") VALUES ('1', '192', '2018-01-12 23:03:25.322341');
INSERT INTO "public"."character_character_tag" ("character_id", "tag_id", "created_at") VALUES ('1', '227', '2018-01-12 23:03:25.325173');
INSERT INTO "public"."character_character_tag" ("character_id", "tag_id", "created_at") VALUES ('1', '253', '2018-01-12 23:03:25.323568');
INSERT INTO "public"."character_character_tag" ("character_id", "tag_id", "created_at") VALUES ('1', '256', '2018-01-12 23:03:25.324353');
INSERT INTO "public"."character_character_tag" ("character_id", "tag_id", "created_at") VALUES ('1', '312', '2018-01-12 23:03:25.325925');

INSERT INTO "public"."character_hair_color" ("character_id", "hair_color_id", "created_at") VALUES ('1', '2', '2018-01-12 23:03:25.327507');
INSERT INTO "public"."character_image" ("id", "character_id", "image_path", "mal_link", "created_at") VALUES ('1', '1', '81a41a89ed-1.jpg', 'https://myanimelist.cdn-dena.com/images/characters/4/50197.jpg', '2018-01-12 01:02:13.219152');

INSERT INTO "public"."character_manga" ("character_id", "manga_id", "role", "created_at") VALUES ('1', '169', 'Main', '2018-01-11 01:06:40.64324');
INSERT INTO "public"."character_manga" ("character_id", "manga_id", "role", "created_at") VALUES ('1', '170', 'Main', '2018-01-11 01:06:40.64324');

-- INSERT INTO "public"."character_voice_actor" ("character_id", "person_id", "language_id", "created_at") VALUES ('1', '11', '1', '2018-01-12 01:04:15.818426');
-- INSERT INTO "public"."character_voice_actor" ("character_id", "person_id", "language_id", "created_at") VALUES ('1', '12', '2', '2018-01-12 01:04:15.818426');
-- INSERT INTO "public"."character_voice_actor" ("character_id", "person_id", "language_id", "created_at") VALUES ('1', '767', '3', '2018-01-12 01:04:15.818426');
-- INSERT INTO "public"."character_voice_actor" ("character_id", "person_id", "language_id", "created_at") VALUES ('1', '1076', '8', '2018-01-12 01:04:15.818426');
-- INSERT INTO "public"."character_voice_actor" ("character_id", "person_id", "language_id", "created_at") VALUES ('1', '1596', '6', '2018-01-12 01:04:15.818426');
-- INSERT INTO "public"."character_voice_actor" ("character_id", "person_id", "language_id", "created_at") VALUES ('1', '6859', '7', '2018-01-12 01:04:15.818426');
-- INSERT INTO "public"."character_voice_actor" ("character_id", "person_id", "language_id", "created_at") VALUES ('1', '8180', '4', '2018-01-12 01:04:15.818426');
-- INSERT INTO "public"."character_voice_actor" ("character_id", "person_id", "language_id", "created_at") VALUES ('1', '8875', '5', '2018-01-12 01:04:15.818426');
-- INSERT INTO "public"."character_voice_actor" ("character_id", "person_id", "language_id", "created_at") VALUES ('1', '12442', '10', '2018-01-12 01:04:15.818426');
-- INSERT INTO "public"."character_voice_actor" ("character_id", "person_id", "language_id", "created_at") VALUES ('1', '16763', '6', '2018-01-12 01:04:15.818426');
-- INSERT INTO "public"."character_voice_actor" ("character_id", "person_id", "language_id", "created_at") VALUES ('1', '17437', '5', '2018-01-12 01:04:15.818426');
-- INSERT INTO "public"."character_voice_actor" ("character_id", "person_id", "language_id", "created_at") VALUES ('1', '17889', '4', '2018-01-12 01:04:15.818426');

-- Manga id of 1
INSERT INTO "public"."manga" ("id", "mal_id", "main_title", "english_title", "japanese_title", "alternative_titles", "synopsis", "spoilers", "type", "volumes", "chapters", "status", "published", "serialization", "image_id", "created_at", "updated_at") VALUES ('1', '1', 'Monster', 'Monster', 'MONSTER', NULL, 'Dr. Kenzou Tenma is a renowned brain surgeon of Japanese descent working in Europe. Highly lauded by his peers as one of the great young minds that will revolutionize the field, he is blessed with a beautiful fiancée and is on the cusp of a big promotion in the hospital he works at. But all of that is about to change with a grave dilemma that Kenzou faces one night—whether to save the life of a small boy or that of the town''s mayor. Despite being pressured by his superiors to perform surgery on the mayor, his morals force him to perform the surgery on the other critical patient, saving his life and forfeiting the mayor''s. A doctor is taught to believe that all life is equal; however, when a series of murders occur in the surgeon''s vicinity, all of the evidence pointing to the boy he saved, Kenzou''s beliefs are shaken. Along his journey to unravel the true identity of his little patient, Kenzou discovers that the fate of the world may be intertwined with the mysterious child.', NULL, 'Manga', '18', '162', 'Finished', 'Dec  5, 1994 to Dec  20, 2001', 'Big Comic Original', '1', '2018-01-04 23:11:27.728984', '2018-01-04 23:11:27.728984');
-- INSERT INTO "public"."manga_author" ("manga_id", "person_id", "role", "created_at") VALUES ('1', '1729', 'Story & Art', '2018-01-12 15:52:33.533665');
INSERT INTO "public"."manga_image" ("id", "manga_id", "image_path", "mal_link", "created_at") VALUES ('1', '1', 'dfc6432967-1.jpg', 'https://myanimelist.cdn-dena.com/images/manga/3/54525.jpg', '2018-01-08 20:30:58.632654');
INSERT INTO "public"."manga_manga_genre" ("manga_id", "genre_id", "created_at") VALUES ('1', '7', '2018-01-07 13:34:00.903055');
INSERT INTO "public"."manga_manga_genre" ("manga_id", "genre_id", "created_at") VALUES ('1', '8', '2018-01-07 13:34:00.903055');
INSERT INTO "public"."manga_manga_genre" ("manga_id", "genre_id", "created_at") VALUES ('1', '40', '2018-01-07 13:34:00.903055');
INSERT INTO "public"."manga_manga_genre" ("manga_id", "genre_id", "created_at") VALUES ('1', '41', '2018-01-07 13:34:00.903055');

-- Person id of 1
INSERT INTO "public"."person" ("id", "mal_id", "first_name", "surname", "given_name", "family_name", "alternative_names", "birthday", "website", "description", "image_id", "created_at", "updated_at") VALUES ('1', '1', 'Tomokazu', 'Seki', '智一', '関', '{"Seki Mondoya","門戸 開","Monto Hiraku"}', 'Sep  8, 1972', '', 'Hometown: Tokyo, Japan
Blood type: AB

Twitter: @seki0908', '1', '2018-01-08 15:47:25.736265', '2018-01-08 15:47:25.736265');
INSERT INTO "public"."person_image" ("id", "person_id", "image_path", "mal_link", "created_at") VALUES ('1', '1', 'e336ce6e2b-1.jpg', 'https://myanimelist.cdn-dena.com/images/voiceactors/3/44649.jpg', '2018-01-08 17:19:16.617714');
