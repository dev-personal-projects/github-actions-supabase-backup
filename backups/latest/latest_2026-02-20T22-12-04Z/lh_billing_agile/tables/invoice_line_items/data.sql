--
-- PostgreSQL database dump
--

\restrict aMqaegajSwmKnc5DxbbKgoi6cCrLyN5a51oEUWDn3fOQnaAf2U3SlxK0230WAaC

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
-- Data for Name: invoice_line_items; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoice_line_items (invoice_line_item_id, invoice_id, ofast_id, odrl_id, res_id, resource_name, role_level, role_description, service_code, unit_code, quantity, unit_fee, discount_percent, final_unit_fee, line_total, is_prorated, proration_days, proration_total_days, created_at, updated_at) FROM stdin;
3	3	900001	900001	900001	Smoke Tester	Senior	Developer	\N	month	1.3214	100000.00	0.00	100000.00	132140.00	t	40	40	2026-02-20 18:58:09.841316+00	2026-02-20 18:58:09.841316+00
4	4	900001	900001	900001	Smoke Tester	Senior	Developer	\N	month	3.0000	100000.00	0.00	100000.00	300000.00	f	\N	\N	2026-02-20 18:58:09.936283+00	2026-02-20 18:58:09.936283+00
\.


--
-- Name: invoice_line_items_invoice_line_item_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_line_items_invoice_line_item_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

\unrestrict aMqaegajSwmKnc5DxbbKgoi6cCrLyN5a51oEUWDn3fOQnaAf2U3SlxK0230WAaC

