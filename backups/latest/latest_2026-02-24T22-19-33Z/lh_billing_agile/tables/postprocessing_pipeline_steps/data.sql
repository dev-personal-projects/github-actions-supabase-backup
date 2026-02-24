--
-- PostgreSQL database dump
--

\restrict UVtOiCdpSzo4QAK9AijRrD7E7NOmH1veu6YMPs9goEw3aqa98qC2Hd38JQAg4Zr

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.8 (Ubuntu 17.8-1.pgdg24.04+1)

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
-- Data for Name: postprocessing_pipeline_steps; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.postprocessing_pipeline_steps (postprocessing_pipeline_step_id, postprocessing_pipeline_version_id, step_order, step_key, step_config, created_at, updated_at) FROM stdin;
\.


--
-- Name: postprocessing_pipeline_steps_postprocessing_pipeline_step__seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.postprocessing_pipeline_steps_postprocessing_pipeline_step__seq', 2, true);


--
-- PostgreSQL database dump complete
--

\unrestrict UVtOiCdpSzo4QAK9AijRrD7E7NOmH1veu6YMPs9goEw3aqa98qC2Hd38JQAg4Zr

