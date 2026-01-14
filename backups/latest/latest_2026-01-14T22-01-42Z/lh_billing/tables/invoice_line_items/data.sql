--
-- PostgreSQL database dump
--

\restrict Qm2vfQoMPsHekkoKTNQknbOCiCvbDgBFxSeBWdLrzZ0FqAtyyiIhVCCMiFIfSMf

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
-- Data for Name: invoice_line_items; Type: TABLE DATA; Schema: lh_billing; Owner: -
--

COPY lh_billing.invoice_line_items (invoice_line_item_id, invoice_id, ofast_id, odrl_id, res_id, resource_name, role_level, role_description, service_code, unit_code, quantity, unit_fee, discount_percent, final_unit_fee, line_total, is_prorated, proration_days, proration_total_days, created_at, updated_at) FROM stdin;
\.


--
-- Name: invoice_line_items_invoice_line_item_id_seq; Type: SEQUENCE SET; Schema: lh_billing; Owner: -
--

SELECT pg_catalog.setval('lh_billing.invoice_line_items_invoice_line_item_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict Qm2vfQoMPsHekkoKTNQknbOCiCvbDgBFxSeBWdLrzZ0FqAtyyiIhVCCMiFIfSMf

