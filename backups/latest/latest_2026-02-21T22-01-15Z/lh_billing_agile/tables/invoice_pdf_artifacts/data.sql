--
-- PostgreSQL database dump
--

\restrict iUSwIy9iFfbgzL1TNJa4M42AMHJfPgQQN6hhnHjFZpW7NAwD5o8Nu78zX9Pbf1L

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
-- Data for Name: invoice_pdf_artifacts; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoice_pdf_artifacts (invoice_pdf_artifact_id, invoice_id, original_pdf_blob_path, original_pdf_sha256, postprocessed_pdf_blob_path, postprocessed_pdf_sha256, stamp_rule_id, created_at, updated_at) FROM stdin;
3	3	2026/03/900001/3.pdf	375a464e51e7e5ffd89da751ef990445b1d7cdf4ace0245c0a9197686e516067	\N	\N	\N	2026-02-20 18:58:10.518223+00	2026-02-20 18:58:10.518223+00
4	4	2026/06/900001/4.pdf	1648487f539214c41376dd57b090d52413adb7e166f3cca30d8b6d015d40bb86	\N	\N	\N	2026-02-20 18:58:10.790954+00	2026-02-20 18:58:10.790954+00
\.


--
-- Name: invoice_pdf_artifacts_invoice_pdf_artifact_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_pdf_artifacts_invoice_pdf_artifact_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

\unrestrict iUSwIy9iFfbgzL1TNJa4M42AMHJfPgQQN6hhnHjFZpW7NAwD5o8Nu78zX9Pbf1L

