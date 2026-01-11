--
-- PostgreSQL database dump
--

\restrict BP94eNLrMUkZADfZc6vnrr2KoTQijLFRcgsiK1xN0De4F3dTPgqIuRizjPrZJd8

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
-- Data for Name: invoice_taxes; Type: TABLE DATA; Schema: lh_billing; Owner: -
--

COPY lh_billing.invoice_taxes (invoice_tax_id, invoice_id, tax_type, tax_rate, taxable_amount, tax_amount, created_at, updated_at) FROM stdin;
\.


--
-- Name: invoice_taxes_invoice_tax_id_seq; Type: SEQUENCE SET; Schema: lh_billing; Owner: -
--

SELECT pg_catalog.setval('lh_billing.invoice_taxes_invoice_tax_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict BP94eNLrMUkZADfZc6vnrr2KoTQijLFRcgsiK1xN0De4F3dTPgqIuRizjPrZJd8

