--
-- PostgreSQL database dump
--

\restrict WpaJiQkfzPWYRyaEWDBb6BbBgxsMMb8wCASwJlEKHJrpfILhEMnW80xhjls3tvk

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
21	INV-2026-009021	901001	901001	per_company	cmp:901001	2026-03-04	2026-03-31	USD	22542.49	0.00	22542.49	2	{"currency": "USD", "bank_code": "111900002", "bank_name": "Goldman Sachs", "swift_code": "GOLDSXUS", "account_name": "Good Info Ltd", "account_number": "67436XXXXX", "payment_method": "bank_transfer"}	2026-03-04 08:22:33.145822+00	sent	HTTP-CompanyId	smoke-email-001-1772612524174903879-4946-10981	f	f	\N	2026-03-04 08:22:33.181587+00	2026-03-04 08:22:53.962748+00	0	2026-03-04 08:22:33.181587+00	\N	\N	f	\N	2026-03-04 08:22:32.952998+00	2026-03-04 08:22:53.969591+00
22	INV-2026-009022	901001	901001	per_company	cmp:901001	2026-04-01	2026-06-30	USD	74875.44	0.00	74875.44	2	{"currency": "USD", "bank_code": "111900002", "bank_name": "Goldman Sachs", "swift_code": "GOLDSXUS", "account_name": "Good Info Ltd", "account_number": "67436XXXXX", "payment_method": "bank_transfer"}	2026-03-04 08:22:33.210765+00	sent	HTTP-CompanyId	smoke-email-001-1772612524174903879-4946-10981	f	f	\N	2026-03-04 08:22:33.24028+00	2026-03-04 08:22:54.370227+00	0	2026-03-04 08:22:33.24028+00	\N	\N	f	\N	2026-03-04 08:22:33.026536+00	2026-03-04 08:22:54.371632+00
19	INV-2026-009019	900001	900001	per_company	cmp:900001	2026-03-04	2026-03-31	KES	2930524.88	0.00	2930524.88	1	{"currency": "KES", "bank_code": "111900002", "bank_name": "Goldman Sachs", "swift_code": "GOLDSXUS", "account_name": "Good Info Ltd", "account_number": "67436XXXXX", "payment_method": "bank_transfer"}	2026-03-04 08:22:30.851596+00	sent	HTTP-CompanyId	smoke-email-001-1772612524174903879-4946-10981	f	f	\N	2026-03-04 08:22:31.32361+00	2026-03-04 08:22:56.980706+00	0	2026-03-04 08:22:31.32361+00	\N	\N	f	\N	2026-03-04 08:22:30.475459+00	2026-03-04 08:22:56.982085+00
20	INV-2026-009020	900001	900001	per_company	cmp:900001	2026-04-01	2026-06-30	KES	9733807.20	0.00	9733807.20	1	{"currency": "KES", "bank_code": "111900002", "bank_name": "Goldman Sachs", "swift_code": "GOLDSXUS", "account_name": "Good Info Ltd", "account_number": "67436XXXXX", "payment_method": "bank_transfer"}	2026-03-04 08:22:31.363646+00	sent	HTTP-CompanyId	smoke-email-001-1772612524174903879-4946-10981	f	f	\N	2026-03-04 08:22:31.394621+00	2026-03-04 08:23:13.99684+00	0	2026-03-04 08:22:31.394621+00	\N	\N	f	\N	2026-03-04 08:22:30.706567+00	2026-03-04 08:23:13.998343+00
23	INV-2026-009023	902001	902001	per_company	cmp:902001	2026-03-04	2026-03-31	KES	17629683.60	0.00	17629683.60	1	{"currency": "KES", "bank_code": "111900002", "bank_name": "Goldman Sachs", "swift_code": "GOLDSXUS", "account_name": "Good Info Ltd", "account_number": "67436XXXXX", "payment_method": "bank_transfer"}	2026-03-04 08:22:34.621838+00	sent	HTTP-CompanyId	smoke-email-001-1772612524174903879-4946-10981	f	f	\N	2026-03-04 08:22:34.667812+00	2026-03-04 08:22:54.835036+00	0	2026-03-04 08:22:34.667812+00	\N	\N	f	\N	2026-03-04 08:22:34.363594+00	2026-03-04 08:22:54.836572+00
24	INV-2026-009024	902001	902001	per_company	cmp:902001	2026-04-01	2026-06-30	KES	58557408.00	0.00	58557408.00	1	{"currency": "KES", "bank_code": "111900002", "bank_name": "Goldman Sachs", "swift_code": "GOLDSXUS", "account_name": "Good Info Ltd", "account_number": "67436XXXXX", "payment_method": "bank_transfer"}	2026-03-04 08:22:34.70906+00	sent	HTTP-CompanyId	smoke-email-001-1772612524174903879-4946-10981	f	f	\N	2026-03-04 08:22:34.747439+00	2026-03-04 08:22:57.420478+00	0	2026-03-04 08:22:34.747439+00	\N	\N	f	\N	2026-03-04 08:22:34.474301+00	2026-03-04 08:22:57.421914+00
\.


--
-- Name: invoices_invoice_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoices_invoice_id_seq', 24, true);


--
-- PostgreSQL database dump complete
--

\unrestrict WpaJiQkfzPWYRyaEWDBb6BbBgxsMMb8wCASwJlEKHJrpfILhEMnW80xhjls3tvk

