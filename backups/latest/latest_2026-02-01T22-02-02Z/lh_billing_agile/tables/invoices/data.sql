--
-- PostgreSQL database dump
--

\restrict 7N9tW41KSoFNijZz0nvDDODW7wguHEwwsVikr4HoBwZu4jmbobOWZa1TwaHrPfg

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
-- Data for Name: invoices; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoices (invoice_id, inv_prfx_id, cmp_id, cctr_id, invoice_grouping, billing_group_key, period_start, period_end, currency, subtotal, tax_total, grand_total, status, trigger_type, correlation_id, force_sent, is_dry_run, test_recipients, generated_at, sent_at, created_at, updated_at) FROM stdin;
1	DRY-RUN-144c50fdf19f41dc8746c6b649ec65b8	2	\N	per_order_form	ofrm:2	2026-02-01	2026-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	local-dryrun-1769954928	f	t	\N	2026-02-01 14:08:58.984871+00	\N	2026-02-01 14:08:53.637347+00	2026-02-01 14:08:58.984871+00
2	DRY-RUN-123401baaf314b42bc6c98cfa38bbd21	2	\N	per_order_form	ofrm:2	2026-02-01	2026-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	local-dryrun-1769955684	f	t	\N	2026-02-01 14:21:35.888695+00	\N	2026-02-01 14:21:30.544844+00	2026-02-01 14:21:35.888695+00
3	DRY-RUN-04474e5f517d4b49877edd5ac34e9ea2	2	\N	per_order_form	ofrm:2	2026-02-01	2026-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	local-dryrun-1769955894	f	t	\N	2026-02-01 14:25:05.281569+00	\N	2026-02-01 14:25:00.141282+00	2026-02-01 14:25:05.281569+00
\.


--
-- Name: invoices_invoice_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoices_invoice_id_seq', 23, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 7N9tW41KSoFNijZz0nvDDODW7wguHEwwsVikr4HoBwZu4jmbobOWZa1TwaHrPfg

