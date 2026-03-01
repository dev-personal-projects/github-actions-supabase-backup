--
-- PostgreSQL database dump
--

\restrict vcVJn3iZGcpssGLLKqXPCgZDLctIjA4pajfGK0kCXYqrsLHATjhJzIWbVpJ9dkl

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.9 (Ubuntu 17.9-1.pgdg24.04+1)

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
-- Data for Name: postprocessing_pipelines; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.postprocessing_pipelines (postprocessing_pipeline_id, pipeline_name, is_active, created_at, updated_at) FROM stdin;
1	no_postprocessing	t	2026-02-25 09:51:31.502909+00	2026-02-25 09:51:31.502909+00
100	smoke_kenya_tims_qr_900001	t	2026-03-01 16:08:45.512352+00	2026-03-01 16:08:45.512352+00
101	smoke_kenya_tims_qr_902001	t	2026-03-01 16:08:55.826928+00	2026-03-01 16:08:55.826928+00
\.


--
-- Name: postprocessing_pipelines_postprocessing_pipeline_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.postprocessing_pipelines_postprocessing_pipeline_id_seq', 101, true);


--
-- PostgreSQL database dump complete
--

\unrestrict vcVJn3iZGcpssGLLKqXPCgZDLctIjA4pajfGK0kCXYqrsLHATjhJzIWbVpJ9dkl

