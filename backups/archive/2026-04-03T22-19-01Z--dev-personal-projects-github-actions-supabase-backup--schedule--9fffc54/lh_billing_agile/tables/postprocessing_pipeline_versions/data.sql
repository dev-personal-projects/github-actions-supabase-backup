--
-- PostgreSQL database dump
--

\restrict Jj0Gq0h5OEZruils80cMrmDX2OyU8zJnJk5wPFQXc8hJYgwwW8RWNoZqIQHyNFk

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
1	1	1	seed:no_postprocessing:v1	2026-03-03 15:54:05.17079+00	seed	2026-03-03 15:54:05.17079+00	2026-03-03 15:54:05.17079+00
2	2	1	seed:kenya_default:v1	2026-03-03 15:54:11.44545+00	seed	2026-03-03 15:54:11.44545+00	2026-03-03 15:54:11.44545+00
\.


--
-- Name: postprocessing_pipeline_versi_postprocessing_pipeline_versi_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.postprocessing_pipeline_versi_postprocessing_pipeline_versi_seq', 2, true);


--
-- PostgreSQL database dump complete
--

\unrestrict Jj0Gq0h5OEZruils80cMrmDX2OyU8zJnJk5wPFQXc8hJYgwwW8RWNoZqIQHyNFk

