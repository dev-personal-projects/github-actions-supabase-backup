--
-- PostgreSQL database dump
--

\restrict y3C9Nc5y2YFY65h5O6T014xGILng4odvaJ6jyYHPMaHUvKBnt8oFXkpnm0VosyF

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
-- Data for Name: lh_configuration; Type: TABLE DATA; Schema: lh_system; Owner: -
--

COPY lh_system.lh_configuration (cfg_id, cfg_service, cfg_key, cfg_value, cmp_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: lh_configuration_cfg_id_seq; Type: SEQUENCE SET; Schema: lh_system; Owner: -
--

SELECT pg_catalog.setval('lh_system.lh_configuration_cfg_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict y3C9Nc5y2YFY65h5O6T014xGILng4odvaJ6jyYHPMaHUvKBnt8oFXkpnm0VosyF

