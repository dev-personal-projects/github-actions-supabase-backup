--
-- PostgreSQL database dump
--

\restrict z7R7UKDcjyuaEHrMpEQgf7vVKNORJyVZ4CJc7uEGhfOvbSS5ZMGZcRu9daLq8Gw

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.7 (Ubuntu 17.7-3.pgdg24.04+1)

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
1	default	INV	9010	{prefix}-{year}-{number:06}	2026-01-22 14:24:19.06386+00	2026-01-23 11:11:42.293951+00
\.


--
-- Name: invoice_sequences_invoice_sequence_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_sequences_invoice_sequence_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

\unrestrict z7R7UKDcjyuaEHrMpEQgf7vVKNORJyVZ4CJc7uEGhfOvbSS5ZMGZcRu9daLq8Gw

