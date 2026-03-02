--
-- PostgreSQL database dump
--

\restrict FhMzL0oMLWyTbdIFMbVKNdXe2CR08IVCUUB9QtLs2xD1uR4mFgkf8ufy21dBqN6

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
-- Data for Name: postprocessing_pipeline_versions; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.postprocessing_pipeline_versions (postprocessing_pipeline_version_id, postprocessing_pipeline_id, version_number, definition_checksum, approved_at, approved_by, created_at, updated_at) FROM stdin;
1	1	1	seed:no_postprocessing:v1	2026-02-25 09:51:31.502909+00	seed	2026-02-25 09:51:31.502909+00	2026-02-25 09:51:31.502909+00
100	100	1	smoke:kenya:tims+qr:v1	2026-03-01 16:08:45.512352+00	smoke	2026-03-01 16:08:45.512352+00	2026-03-01 16:08:45.512352+00
101	101	1	smoke:kenya:tims+qr:v1	2026-03-01 16:08:55.826928+00	smoke	2026-03-01 16:08:55.826928+00	2026-03-01 16:08:55.826928+00
\.


--
-- Name: postprocessing_pipeline_versi_postprocessing_pipeline_versi_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.postprocessing_pipeline_versi_postprocessing_pipeline_versi_seq', 101, true);


--
-- PostgreSQL database dump complete
--

\unrestrict FhMzL0oMLWyTbdIFMbVKNdXe2CR08IVCUUB9QtLs2xD1uR4mFgkf8ufy21dBqN6

