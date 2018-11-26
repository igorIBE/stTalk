--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2018-11-26 19:54:05 BRST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2165 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 16418)
-- Name: adm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE adm (
    "admEmail" character(30) NOT NULL
);


ALTER TABLE adm OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16482)
-- Name: comentario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comentario (
    "codPost" integer,
    "usuEmail" character(30),
    comentario character varying(300)[]
);


ALTER TABLE comentario OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16428)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE post (
    "cdPost" integer NOT NULL,
    post text
);


ALTER TABLE post OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16413)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    email character(30) NOT NULL,
    nome character varying(15),
    senha character(15)
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 2155 (class 0 OID 16418)
-- Dependencies: 182
-- Data for Name: adm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY adm ("admEmail") FROM stdin;
\.


--
-- TOC entry 2157 (class 0 OID 16482)
-- Dependencies: 184
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comentario ("codPost", "usuEmail", comentario) FROM stdin;
\.


--
-- TOC entry 2156 (class 0 OID 16428)
-- Dependencies: 183
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY post ("cdPost", post) FROM stdin;
\.


--
-- TOC entry 2154 (class 0 OID 16413)
-- Dependencies: 181
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (email, nome, senha) FROM stdin;
\.


--
-- TOC entry 2034 (class 2606 OID 16427)
-- Name: adm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adm
    ADD CONSTRAINT adm_pkey PRIMARY KEY ("admEmail");


--
-- TOC entry 2036 (class 2606 OID 16437)
-- Name: pk_post; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY post
    ADD CONSTRAINT pk_post PRIMARY KEY ("cdPost");


--
-- TOC entry 2032 (class 2606 OID 16417)
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (email);


--
-- TOC entry 2037 (class 2606 OID 16421)
-- Name: adm_admEmail_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adm
    ADD CONSTRAINT "adm_admEmail_fkey" FOREIGN KEY ("admEmail") REFERENCES usuario(email);


--
-- TOC entry 2039 (class 2606 OID 16493)
-- Name: codpost; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT codpost FOREIGN KEY ("codPost") REFERENCES post("cdPost");


--
-- TOC entry 2038 (class 2606 OID 16488)
-- Name: usuemail; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentario
    ADD CONSTRAINT usuemail FOREIGN KEY ("usuEmail") REFERENCES usuario(email);


--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-11-26 19:54:05 BRST

--
-- PostgreSQL database dump complete
--

