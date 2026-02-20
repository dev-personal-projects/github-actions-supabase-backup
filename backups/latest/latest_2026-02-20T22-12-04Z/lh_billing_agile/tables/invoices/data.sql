--
-- PostgreSQL database dump
--

\restrict mcd7tSGAWuFi4iCTe6JHSIYV5Tr1G2Ccw13JdYSLzJ1fjetXMlqmaJM0pUrPIRm

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
-- Data for Name: invoices; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoices (invoice_id, inv_prfx_id, cmp_id, cctr_id, invoice_grouping, billing_group_key, period_start, period_end, currency, subtotal, tax_total, grand_total, remittance_profile_id, remittance_details, remittance_resolved_at, status, trigger_type, correlation_id, force_sent, is_dry_run, test_recipients, generated_at, sent_at, pdf_render_attempt_count, pdf_render_next_attempt_at, pdf_render_last_error, pdf_render_last_failed_at, pdf_render_blocked, pdf_render_blocked_reason, created_at, updated_at) FROM stdin;
3	INV-2026-009003	900001	900001	per_company	cmp:900001	2026-02-20	2026-03-31	KES	132140.00	0.00	132140.00	1	{"currency": "KES", "bank_code": "111900002", "bank_name": "Goldman Sachs", "swift_code": "GOLDSXUS", "account_name": "Good Info Ltd", "account_number": "67436XXXXX", "payment_method": "bank_transfer"}	2026-02-20 18:58:10.027259+00	sent	HTTP-CompanyId	smoke-email-001-1771613884	f	f	\N	2026-02-20 18:58:10.518223+00	2026-02-20 18:58:49.584268+00	0	2026-02-20 18:58:10.518223+00	\N	\N	f	\N	2026-02-20 18:58:09.76583+00	2026-02-20 18:58:49.556925+00
4	INV-2026-009004	900001	900001	per_company	cmp:900001	2026-04-01	2026-06-30	KES	300000.00	0.00	300000.00	1	{"currency": "KES", "bank_code": "111900002", "bank_name": "Goldman Sachs", "swift_code": "GOLDSXUS", "account_name": "Good Info Ltd", "account_number": "67436XXXXX", "payment_method": "bank_transfer"}	2026-02-20 18:58:10.761254+00	sent	HTTP-CompanyId	smoke-email-001-1771613884	f	f	\N	2026-02-20 18:58:10.790954+00	2026-02-20 18:58:49.829272+00	0	2026-02-20 18:58:10.790954+00	\N	\N	f	\N	2026-02-20 18:58:09.905526+00	2026-02-20 18:58:49.797973+00
\.


--
-- Name: invoices_invoice_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoices_invoice_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

\unrestrict mcd7tSGAWuFi4iCTe6JHSIYV5Tr1G2Ccw13JdYSLzJ1fjetXMlqmaJM0pUrPIRm

