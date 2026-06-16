--
-- PostgreSQL database dump
--

\restrict veS9NdCD4jY21aayyypSCV6SsQbubr4qOtCxWnIxD4ShU5IuUBzsuI2KM2F4kGi

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.10 (Ubuntu 17.10-1.pgdg24.04+1)

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
-- Data for Name: billing_schedules; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.billing_schedules (billing_schedule_id, scope_type, cmp_id, cctr_id, ofrm_id, frequency, timing, issue_days_before, period_alignment, anchor_date, preferred_invoice_grouping, created_at, updated_at) FROM stdin;
\.


--
-- Name: billing_schedules_billing_schedule_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.billing_schedules_billing_schedule_id_seq', 21, true);


--
-- PostgreSQL database dump complete
--

\unrestrict veS9NdCD4jY21aayyypSCV6SsQbubr4qOtCxWnIxD4ShU5IuUBzsuI2KM2F4kGi

