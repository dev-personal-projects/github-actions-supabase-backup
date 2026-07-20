--
-- PostgreSQL database dump
--

\restrict Ldq893qbI3yKOziPmt1UYHvS1FXCnurKwQL1e5pHjrl6cN3oMk5TuQRB629BdBa

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.10 (Ubuntu 17.10-1.pgdg24.04+1)

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
\.


--
-- Name: invoice_pdf_artifacts_invoice_pdf_artifact_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_pdf_artifacts_invoice_pdf_artifact_id_seq', 42, true);


--
-- PostgreSQL database dump complete
--

\unrestrict Ldq893qbI3yKOziPmt1UYHvS1FXCnurKwQL1e5pHjrl6cN3oMk5TuQRB629BdBa

