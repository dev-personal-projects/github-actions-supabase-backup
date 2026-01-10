--
-- PostgreSQL database dump
--

\restrict VgwPbtn2d0guTfUMZ5yH1wJR4RRb2kfTDhWCvtms794dPL3a2qtm1lEIlhbHz8F

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
-- Data for Name: billing_schedules; Type: TABLE DATA; Schema: lh_billing; Owner: -
--

COPY lh_billing.billing_schedules (billing_schedule_id, scope_type, cmp_id, cctr_id, ofrm_id, frequency, timing, issue_days_before, period_alignment, anchor_date, preferred_invoice_grouping, last_invoiced_period_end, created_at, updated_at) FROM stdin;
\.


--
-- Name: billing_schedules_billing_schedule_id_seq; Type: SEQUENCE SET; Schema: lh_billing; Owner: -
--

SELECT pg_catalog.setval('lh_billing.billing_schedules_billing_schedule_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict VgwPbtn2d0guTfUMZ5yH1wJR4RRb2kfTDhWCvtms794dPL3a2qtm1lEIlhbHz8F

