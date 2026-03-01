--
-- PostgreSQL database dump
--

\restrict mkv80O6J6elp8ctizjXRXx0phIqZEijr5GxnEH4MWZLonMFLb2Bxht0p0Wsld6a

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
-- Data for Name: invoice_sequences; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoice_sequences (invoice_sequence_id, context_key, prefix, last_number, format, created_at, updated_at) FROM stdin;
1	default	INV	9254	{prefix}-{year}-{number:06}	2026-02-25 09:51:19.072024+00	2026-03-01 16:09:09.796381+00
\.


--
-- Name: invoice_sequences_invoice_sequence_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_sequences_invoice_sequence_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

\unrestrict mkv80O6J6elp8ctizjXRXx0phIqZEijr5GxnEH4MWZLonMFLb2Bxht0p0Wsld6a

