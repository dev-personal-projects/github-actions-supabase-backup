--
-- PostgreSQL database dump
--

\restrict Eq1Sj0LahIg4akF0rHHaEhQSu31A8oxg8YrJTrtRLSDws8prYyrZDrdADYwKkMw

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
-- Data for Name: postprocessing_pipelines; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.postprocessing_pipelines (postprocessing_pipeline_id, pipeline_name, is_active, created_at, updated_at) FROM stdin;
1	no_postprocessing	t	2026-02-20 17:47:24.383025+00	2026-02-20 17:47:24.383025+00
\.


--
-- Name: postprocessing_pipelines_postprocessing_pipeline_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.postprocessing_pipelines_postprocessing_pipeline_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

\unrestrict Eq1Sj0LahIg4akF0rHHaEhQSu31A8oxg8YrJTrtRLSDws8prYyrZDrdADYwKkMw

