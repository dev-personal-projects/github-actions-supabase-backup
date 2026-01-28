--
-- PostgreSQL database dump
--

\restrict CDMeSs2Keig6aAY0hLHDEJjlpxgaWcBJWA8yt6tAEzU2AmRwdjAnABFW8Fk2Zjl

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
\.


--
-- Name: invoice_delivery_outbox_invoice_delivery_outbox_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_delivery_outbox_invoice_delivery_outbox_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict CDMeSs2Keig6aAY0hLHDEJjlpxgaWcBJWA8yt6tAEzU2AmRwdjAnABFW8Fk2Zjl

