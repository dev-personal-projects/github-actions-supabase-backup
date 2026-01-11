--
-- PostgreSQL database dump
--

\restrict 7XeZkJuVa9My9PQz0T0PlgaGfL2Ege3IguBrLxpijRE0lEr20UzX5LVZmuWvIbq

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
-- Data for Name: invoice_sequences; Type: TABLE DATA; Schema: lh_billing; Owner: -
--

COPY lh_billing.invoice_sequences (invoice_sequence_id, context_key, prefix, last_number, format, created_at, updated_at) FROM stdin;
1	default	INV	9000	{prefix}-{year}-{number:06}	2026-01-10 20:16:59.537972+00	2026-01-10 20:16:59.537972+00
\.


--
-- Name: invoice_sequences_invoice_sequence_id_seq; Type: SEQUENCE SET; Schema: lh_billing; Owner: -
--

SELECT pg_catalog.setval('lh_billing.invoice_sequences_invoice_sequence_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 7XeZkJuVa9My9PQz0T0PlgaGfL2Ege3IguBrLxpijRE0lEr20UzX5LVZmuWvIbq

