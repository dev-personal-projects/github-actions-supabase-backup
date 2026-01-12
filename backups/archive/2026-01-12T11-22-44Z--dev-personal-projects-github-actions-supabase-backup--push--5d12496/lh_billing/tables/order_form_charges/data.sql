--
-- PostgreSQL database dump
--

\restrict F9NCD0N2FWpAELng3FY35Jnno1t1RHjC6NUVXuexNOsuxdijJCzbrzcKgD11Jz1

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
-- Data for Name: order_form_charges; Type: TABLE DATA; Schema: lh_billing; Owner: -
--

COPY lh_billing.order_form_charges (order_form_charge_id, ofrm_id, odrl_id, charge_type_code, charge_code, charge_description, currency, unit_code, unit_fee, discount_percent, is_recurring, one_off_date, effective_start, effective_end, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Name: order_form_charges_order_form_charge_id_seq; Type: SEQUENCE SET; Schema: lh_billing; Owner: -
--

SELECT pg_catalog.setval('lh_billing.order_form_charges_order_form_charge_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict F9NCD0N2FWpAELng3FY35Jnno1t1RHjC6NUVXuexNOsuxdijJCzbrzcKgD11Jz1

