--
-- PostgreSQL database dump
--

\restrict YqYExXtdrUNQymYo1L40ZrSpn8r2mxpxDhSIsYclSS0WKBbxgCT2Kmi5kmmKsIn

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
-- Data for Name: invoice_charge_items; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoice_charge_items (invoice_charge_item_id, invoice_id, order_form_charge_id, ofrm_id, odrl_id, charge_type_code, charge_code, charge_description, role_level, role_description, resource_name, tax_category, unit_code, quantity, unit_fee, discount_percent, final_unit_fee, line_total, approval_reference, approved_at, approved_by, created_at, updated_at) FROM stdin;
\.


--
-- Name: invoice_charge_items_invoice_charge_item_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_charge_items_invoice_charge_item_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict YqYExXtdrUNQymYo1L40ZrSpn8r2mxpxDhSIsYclSS0WKBbxgCT2Kmi5kmmKsIn

