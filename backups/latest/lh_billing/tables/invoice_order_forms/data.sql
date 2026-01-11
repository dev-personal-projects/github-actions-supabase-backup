--
-- PostgreSQL database dump
--

\restrict Hej7pRt03RVbPwe5Hc0fo9QncESPm1CubaVOabHnlkZiLGsUTkT4mF8o89oQYcW

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
-- Data for Name: invoice_order_forms; Type: TABLE DATA; Schema: lh_billing; Owner: -
--

COPY lh_billing.invoice_order_forms (invoice_order_form_id, invoice_id, ofrm_id, source_period_start, source_period_end, created_at, updated_at) FROM stdin;
\.


--
-- Name: invoice_order_forms_invoice_order_form_id_seq; Type: SEQUENCE SET; Schema: lh_billing; Owner: -
--

SELECT pg_catalog.setval('lh_billing.invoice_order_forms_invoice_order_form_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict Hej7pRt03RVbPwe5Hc0fo9QncESPm1CubaVOabHnlkZiLGsUTkT4mF8o89oQYcW

