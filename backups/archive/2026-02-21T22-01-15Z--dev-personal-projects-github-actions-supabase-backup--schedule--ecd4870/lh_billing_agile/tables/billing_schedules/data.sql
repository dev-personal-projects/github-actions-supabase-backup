--
-- PostgreSQL database dump
--

\restrict PC3Lt4exHgeXros9v6kz2jPTjq8jGdD3ViQ8DTzXmmye3oEQY9Tjk1kzwFgSHx8

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
-- Data for Name: billing_schedules; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.billing_schedules (billing_schedule_id, scope_type, cmp_id, cctr_id, ofrm_id, frequency, timing, issue_days_before, period_alignment, anchor_date, preferred_invoice_grouping, created_at, updated_at) FROM stdin;
2	order_form	\N	\N	900001	quarterly	in_advance	45	calendar_quarter	\N	per_company	2026-02-20 18:57:15.265245+00	2026-02-20 18:57:15.265245+00
\.


--
-- Name: billing_schedules_billing_schedule_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.billing_schedules_billing_schedule_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

\unrestrict PC3Lt4exHgeXros9v6kz2jPTjq8jGdD3ViQ8DTzXmmye3oEQY9Tjk1kzwFgSHx8

