--
-- PostgreSQL database dump
--

\restrict DARbVlcSwFjpVlfOaHlQ1rkuGUDFZJv9qBYgjOFt6eHeZj0fEPg6HTq5JBv2bIA

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
-- Data for Name: invoices; Type: TABLE DATA; Schema: lh_billing; Owner: -
--

COPY lh_billing.invoices (invoice_id, inv_prfx_id, cmp_id, cctr_id, invoice_grouping, billing_group_key, period_start, period_end, currency, subtotal, tax_total, grand_total, status, trigger_type, correlation_id, force_sent, is_dry_run, test_recipients, generated_at, sent_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: invoices_invoice_id_seq; Type: SEQUENCE SET; Schema: lh_billing; Owner: -
--

SELECT pg_catalog.setval('lh_billing.invoices_invoice_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict DARbVlcSwFjpVlfOaHlQ1rkuGUDFZJv9qBYgjOFt6eHeZj0fEPg6HTq5JBv2bIA

