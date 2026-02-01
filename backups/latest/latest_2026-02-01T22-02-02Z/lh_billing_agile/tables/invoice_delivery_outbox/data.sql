--
-- PostgreSQL database dump
--

\restrict vLSZ4jBwwP1egedcwVuLvzFdjcQ5iGx9coRBGvAHHSuUpPIL5EkaQMnBLXJEEsK

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
-- Data for Name: invoice_delivery_outbox; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoice_delivery_outbox (invoice_delivery_outbox_id, invoice_id, correlation_id, status, blocked_reason, sender_email, to_recipients, cc_recipients, bcc_recipients, is_test_email, invoice_number, company_id, period_end, blob_path, invoice_is_dry_run, attempt_count, next_attempt_at, locked_at, locked_by, last_error, graph_message_id, graph_message_created_at, graph_message_sent_at, sent_at, created_at, updated_at) FROM stdin;
1	1	local-dryrun-1769954928	cancelled	\N	billing@shipht.it	{}	{}	{}	t	DRY-RUN-144c50fdf19f41dc8746c6b649ec65b8	2	2026-03-31	2026/03/2/DRY-RUN-144c50fdf19f41dc8746c6b649ec65b8.pdf	t	0	2026-02-01 14:08:58.984871+00	\N	\N	no testRecipients	\N	\N	\N	\N	2026-02-01 14:08:58.984871+00	2026-02-01 14:08:58.984871+00
2	2	local-dryrun-1769955684	cancelled	\N	billing@shipht.it	{}	{}	{}	t	DRY-RUN-123401baaf314b42bc6c98cfa38bbd21	2	2026-03-31	2026/03/2/DRY-RUN-123401baaf314b42bc6c98cfa38bbd21.pdf	t	0	2026-02-01 14:21:35.888695+00	\N	\N	no testRecipients	\N	\N	\N	\N	2026-02-01 14:21:35.888695+00	2026-02-01 14:21:35.888695+00
3	3	local-dryrun-1769955894	cancelled	\N	billing@shipht.it	{}	{}	{}	t	DRY-RUN-04474e5f517d4b49877edd5ac34e9ea2	2	2026-03-31	2026/03/2/DRY-RUN-04474e5f517d4b49877edd5ac34e9ea2.pdf	t	0	2026-02-01 14:25:05.281569+00	\N	\N	no testRecipients	\N	\N	\N	\N	2026-02-01 14:25:05.281569+00	2026-02-01 14:25:05.281569+00
\.


--
-- Name: invoice_delivery_outbox_invoice_delivery_outbox_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_delivery_outbox_invoice_delivery_outbox_id_seq', 23, true);


--
-- PostgreSQL database dump complete
--

\unrestrict vLSZ4jBwwP1egedcwVuLvzFdjcQ5iGx9coRBGvAHHSuUpPIL5EkaQMnBLXJEEsK

