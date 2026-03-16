--
-- PostgreSQL database dump
--

\restrict mhIalh2HblQdDsXC4zOGF2f5UcIygG7gwkd2JuS5HWLOlrhaJLiP4ndbKqYBcgB

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
-- Data for Name: invoices; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoices (invoice_id, inv_prfx_id, cmp_id, cctr_id, invoice_grouping, billing_group_key, period_start, period_end, currency, subtotal, tax_total, grand_total, remittance_profile_id, remittance_details, remittance_resolved_at, status, trigger_type, correlation_id, force_sent, is_dry_run, test_recipients, generated_at, sent_at, pdf_render_attempt_count, pdf_render_next_attempt_at, pdf_render_last_error, pdf_render_last_failed_at, pdf_render_blocked, pdf_render_blocked_reason, created_at, updated_at) FROM stdin;
\.


--
-- Name: invoices_invoice_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoices_invoice_id_seq', 42, true);


--
-- PostgreSQL database dump complete
--

\unrestrict mhIalh2HblQdDsXC4zOGF2f5UcIygG7gwkd2JuS5HWLOlrhaJLiP4ndbKqYBcgB

