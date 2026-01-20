--
-- PostgreSQL database dump
--

\restrict 2I4jiUXllcdrGjpwS5taeixAgAnVPfz3grVpXUrGJ9WQGnWSOLlkJFLA0Ab2VMn

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
1	DRY-RUN-96c44d807ccc46f08e2d1a73bbc33aa4	4	\N	per_company	cmp:4	2026-01-11	2026-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-CompanyId	local-dryrun-1768161969	f	t	\N	2026-01-11 20:06:19.851823+00	\N	2026-01-11 20:06:16.527937+00	2026-01-11 20:06:19.851823+00
2	DRY-RUN-0f6739faf2ed4e76b459311da99ec0df	4	\N	per_company	cmp:4	2026-04-01	2026-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-CompanyId	local-dryrun-1768161969	f	t	\N	2026-01-11 20:06:25.623853+00	\N	2026-01-11 20:06:22.787822+00	2026-01-11 20:06:25.623853+00
3	DRY-RUN-4c789821e7d64a5097e6fc87bb29ccb2	4	\N	per_company	cmp:4	2026-07-01	2026-09-30	KES	0.00	0.00	0.00	dry_run	HTTP-CompanyId	local-dryrun-1768161969	f	t	\N	2026-01-11 20:06:30.151343+00	\N	2026-01-11 20:06:27.164964+00	2026-01-11 20:06:30.151343+00
4	DRY-RUN-a88547bef4fd45e9b0c7da82543be50f	4	\N	per_company	cmp:4	2026-10-01	2026-12-31	KES	0.00	0.00	0.00	dry_run	HTTP-CompanyId	local-dryrun-1768161969	f	t	\N	2026-01-11 20:06:34.843681+00	\N	2026-01-11 20:06:31.703458+00	2026-01-11 20:06:34.843681+00
5	DRY-RUN-62cbcbf9ab7d465e8fcfaea7a9e71178	4	\N	per_company	cmp:4	2027-01-01	2027-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-CompanyId	local-dryrun-1768161969	f	t	\N	2026-01-11 20:06:39.564758+00	\N	2026-01-11 20:06:36.417729+00	2026-01-11 20:06:39.564758+00
6	DRY-RUN-de2f02f272cf487ca19cd733e4e8d7d9	4	\N	per_company	cmp:4	2027-04-01	2027-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-CompanyId	local-dryrun-1768161969	f	t	\N	2026-01-11 20:06:43.999226+00	\N	2026-01-11 20:06:41.157745+00	2026-01-11 20:06:43.999226+00
7	DRY-RUN-13fdc968036849439917e572508c56c3	4	\N	per_company	cmp:4	2027-07-01	2027-09-30	KES	0.00	0.00	0.00	dry_run	HTTP-CompanyId	local-dryrun-1768161969	f	t	\N	2026-01-11 20:06:48.461537+00	\N	2026-01-11 20:06:45.514649+00	2026-01-11 20:06:48.461537+00
8	DRY-RUN-30108ab7268d47e08b46667c909e402d	4	\N	per_company	cmp:4	2027-10-01	2027-12-31	KES	0.00	0.00	0.00	dry_run	HTTP-CompanyId	local-dryrun-1768161969	f	t	\N	2026-01-11 20:06:52.359646+00	\N	2026-01-11 20:06:49.713807+00	2026-01-11 20:06:52.359646+00
9	DRY-RUN-f2747c8ff58945ca9d8b50ecfcff9bfa	4	\N	per_company	cmp:4	2028-01-01	2028-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-CompanyId	local-dryrun-1768161969	f	t	\N	2026-01-11 20:06:56.858897+00	\N	2026-01-11 20:06:53.882957+00	2026-01-11 20:06:56.858897+00
10	DRY-RUN-3b9615d0ec7e45d99ec22af22687528e	4	\N	per_company	cmp:4	2028-04-01	2028-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-CompanyId	local-dryrun-1768161969	f	t	\N	2026-01-11 20:07:00.541937+00	\N	2026-01-11 20:06:58.266752+00	2026-01-11 20:07:00.541937+00
\.


--
-- Name: invoices_invoice_id_seq; Type: SEQUENCE SET; Schema: lh_billing; Owner: -
--

SELECT pg_catalog.setval('lh_billing.invoices_invoice_id_seq', 37, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 2I4jiUXllcdrGjpwS5taeixAgAnVPfz3grVpXUrGJ9WQGnWSOLlkJFLA0Ab2VMn

