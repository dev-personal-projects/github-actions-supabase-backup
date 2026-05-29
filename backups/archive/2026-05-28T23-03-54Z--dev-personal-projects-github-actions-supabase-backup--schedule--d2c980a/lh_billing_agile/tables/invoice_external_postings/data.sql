--
-- PostgreSQL database dump
--

\restrict raC3BP9jsDzqUEtzCOXUyNgvUxnQwvfaNc9pdWFIcPb0pkM9n54dqNbQqPi9zIP

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
-- Data for Name: invoice_external_postings; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoice_external_postings (invoice_external_posting_id, invoice_id, system, external_id, idempotency_key, posted_at, metadata, last_error, created_at, updated_at) FROM stdin;
\.


--
-- Name: invoice_external_postings_invoice_external_posting_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_external_postings_invoice_external_posting_id_seq', 56, true);


--
-- PostgreSQL database dump complete
--

\unrestrict raC3BP9jsDzqUEtzCOXUyNgvUxnQwvfaNc9pdWFIcPb0pkM9n54dqNbQqPi9zIP

