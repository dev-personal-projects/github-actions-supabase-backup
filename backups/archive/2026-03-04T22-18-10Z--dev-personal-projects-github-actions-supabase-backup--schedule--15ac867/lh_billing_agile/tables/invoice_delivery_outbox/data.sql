--
-- PostgreSQL database dump
--

\restrict dOGC3BVroRDGkpvpVRocSJQqvqVEB9PnOmke887AyE5HXcIrQru6HOa8c5Tgjke

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
-- Data for Name: invoice_delivery_outbox; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoice_delivery_outbox (invoice_delivery_outbox_id, invoice_id, correlation_id, status, blocked_reason, sender_email, to_recipients, cc_recipients, bcc_recipients, is_test_email, invoice_number, company_id, period_end, blob_path, invoice_is_dry_run, attempt_count, next_attempt_at, locked_at, locked_by, last_error, graph_message_id, graph_message_created_at, graph_message_sent_at, sent_at, created_at, updated_at) FROM stdin;
19	21	smoke-email-001-1772612524174903879-4946-10981	sent	\N	billing@shipht.it	{devops@shipht.it}	{}	{}	f	INV-2026-009021	901001	2026-03-31	2026/03/901001/21.pdf	f	0	2026-03-04 08:22:48.57474+00	\N	\N	\N	AAkALgAAAAAAHYQDEapmEc2byACqAC-EWg0AMT8RfGI_kEi3Eizuc3qUhwAAKBLeugAA	2026-03-04 08:22:53.774346+00	2026-03-04 08:22:53.955897+00	2026-03-04 08:22:53.962748+00	2026-03-04 08:22:48.57474+00	2026-03-04 08:22:53.969591+00
20	22	smoke-email-001-1772612524174903879-4946-10981	sent	\N	billing@shipht.it	{devops@shipht.it}	{}	{}	f	INV-2026-009022	901001	2026-06-30	2026/06/901001/22.pdf	f	0	2026-03-04 08:22:48.647581+00	\N	\N	\N	AAkALgAAAAAAHYQDEapmEc2byACqAC-EWg0AMT8RfGI_kEi3Eizuc3qUhwAAKBLevQAA	2026-03-04 08:22:54.221565+00	2026-03-04 08:22:54.366125+00	2026-03-04 08:22:54.370227+00	2026-03-04 08:22:48.647581+00	2026-03-04 08:22:54.371632+00
24	20	smoke-email-001-1772612524174903879-4946-10981	sent	\N	billing@shipht.it	{devops@shipht.it}	{}	{}	f	INV-2026-009020	900001	2026-06-30	2026/06/900001/20.postprocessed.pdf	f	0	2026-03-04 08:22:52.688291+00	\N	\N	\N	AAkALgAAAAAAHYQDEapmEc2byACqAC-EWg0AMT8RfGI_kEi3Eizuc3qUhwAAKBLe0wAA	2026-03-04 08:23:13.85663+00	2026-03-04 08:23:13.992863+00	2026-03-04 08:23:13.99684+00	2026-03-04 08:22:52.688291+00	2026-03-04 08:23:13.998343+00
21	23	smoke-email-001-1772612524174903879-4946-10981	sent	\N	billing@shipht.it	{devops@shipht.it}	{}	{}	f	INV-2026-009023	902001	2026-03-31	2026/03/902001/23.postprocessed.pdf	f	0	2026-03-04 08:22:52.370288+00	\N	\N	\N	AAkALgAAAAAAHYQDEapmEc2byACqAC-EWg0AMT8RfGI_kEi3Eizuc3qUhwAAKBLewAAA	2026-03-04 08:22:54.614369+00	2026-03-04 08:22:54.830885+00	2026-03-04 08:22:54.835036+00	2026-03-04 08:22:52.370288+00	2026-03-04 08:22:54.836572+00
22	19	smoke-email-001-1772612524174903879-4946-10981	sent	\N	billing@shipht.it	{devops@shipht.it}	{}	{}	f	INV-2026-009019	900001	2026-03-31	2026/03/900001/19.postprocessed.pdf	f	0	2026-03-04 08:22:52.422241+00	\N	\N	\N	AAkALgAAAAAAHYQDEapmEc2byACqAC-EWg0AMT8RfGI_kEi3Eizuc3qUhwAAKBLeyQAA	2026-03-04 08:22:56.829632+00	2026-03-04 08:22:56.976601+00	2026-03-04 08:22:56.980706+00	2026-03-04 08:22:52.422241+00	2026-03-04 08:22:56.982085+00
23	24	smoke-email-001-1772612524174903879-4946-10981	sent	\N	billing@shipht.it	{devops@shipht.it}	{}	{}	f	INV-2026-009024	902001	2026-06-30	2026/06/902001/24.postprocessed.pdf	f	0	2026-03-04 08:22:52.543238+00	\N	\N	\N	AAkALgAAAAAAHYQDEapmEc2byACqAC-EWg0AMT8RfGI_kEi3Eizuc3qUhwAAKBLezAAA	2026-03-04 08:22:57.258109+00	2026-03-04 08:22:57.416494+00	2026-03-04 08:22:57.420478+00	2026-03-04 08:22:52.543238+00	2026-03-04 08:22:57.421914+00
\.


--
-- Name: invoice_delivery_outbox_invoice_delivery_outbox_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_delivery_outbox_invoice_delivery_outbox_id_seq', 24, true);


--
-- PostgreSQL database dump complete
--

\unrestrict dOGC3BVroRDGkpvpVRocSJQqvqVEB9PnOmke887AyE5HXcIrQru6HOa8c5Tgjke

