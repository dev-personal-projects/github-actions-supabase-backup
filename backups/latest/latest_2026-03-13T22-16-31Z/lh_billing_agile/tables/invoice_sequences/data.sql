--
-- PostgreSQL database dump
--

\restrict 2eKLERn6uR5CNGL9i0dSshf5ai11NXYEx6UfzFP8OuL5CCbo2vOetGgIVX7WgaU

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
1	default	INV	9042	{prefix}-{year}-{number:06}	2026-03-03 15:53:52.928983+00	2026-03-09 15:10:17.700164+00
\.


--
-- Name: invoice_sequences_invoice_sequence_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_sequences_invoice_sequence_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 2eKLERn6uR5CNGL9i0dSshf5ai11NXYEx6UfzFP8OuL5CCbo2vOetGgIVX7WgaU

