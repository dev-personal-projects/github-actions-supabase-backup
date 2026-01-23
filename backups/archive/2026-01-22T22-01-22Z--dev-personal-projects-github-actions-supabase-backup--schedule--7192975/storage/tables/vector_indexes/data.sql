--
-- PostgreSQL database dump
--

\restrict LawPnuiiR2EnWmlbLr1wheO7bphG1PyV4M1uze4DYnj0a9Z2k2aUXRI2sqyXB4k

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.7 (Ubuntu 17.7-3.pgdg24.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict LawPnuiiR2EnWmlbLr1wheO7bphG1PyV4M1uze4DYnj0a9Z2k2aUXRI2sqyXB4k

