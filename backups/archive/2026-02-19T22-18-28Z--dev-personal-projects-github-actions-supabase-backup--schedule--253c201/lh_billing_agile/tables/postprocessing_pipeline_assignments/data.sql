--
-- PostgreSQL database dump
--

\restrict fTwF0bu8rFeJL79aqN66zrChjjeJc3OlIv6m6qpgV8D21Oc2cOXZ5HNmtxZ5vIO

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
-- Data for Name: postprocessing_pipeline_assignments; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.postprocessing_pipeline_assignments (postprocessing_pipeline_assignment_id, postprocessing_pipeline_id, country_code, company_id, priority, created_at, updated_at) FROM stdin;
1	1	\N	\N	1	2026-02-19 12:23:03.750678+00	2026-02-19 12:23:03.750678+00
\.


--
-- Name: postprocessing_pipeline_assig_postprocessing_pipeline_assig_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.postprocessing_pipeline_assig_postprocessing_pipeline_assig_seq', 1, true);


--
-- PostgreSQL database dump complete
--

\unrestrict fTwF0bu8rFeJL79aqN66zrChjjeJc3OlIv6m6qpgV8D21Oc2cOXZ5HNmtxZ5vIO

