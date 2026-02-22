--
-- PostgreSQL database dump
--

\restrict pOgnuZFmGzL0jvhgbpV3sxqrNyu2jf8j2TDangxKMOBhVxTJ4B0LZp07tsCjudl

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
-- Data for Name: invoice_order_forms; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoice_order_forms (invoice_order_form_id, invoice_id, ofrm_id, source_period_start, source_period_end, created_at, updated_at) FROM stdin;
3	3	900001	2026-02-20	2026-03-31	2026-02-20 18:58:09.826244+00	2026-02-20 18:58:09.826244+00
4	4	900001	2026-04-01	2026-06-30	2026-02-20 18:58:09.92715+00	2026-02-20 18:58:09.92715+00
\.


--
-- Name: invoice_order_forms_invoice_order_form_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_order_forms_invoice_order_form_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

\unrestrict pOgnuZFmGzL0jvhgbpV3sxqrNyu2jf8j2TDangxKMOBhVxTJ4B0LZp07tsCjudl

