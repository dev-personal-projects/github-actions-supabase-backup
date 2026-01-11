--
-- PostgreSQL database dump
--

\restrict JS3YCGMHy98o5NeMUcYF8laYQP0RIEartS7dHi3MgNPyJBoSURHbvK8bgNAYDob

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
-- Data for Name: orderform_assignments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orderform_assignments (ofast_id, ofast_prfx_id, odrl_id, res_id, ofast_start_date, ofast_end_date, ofast_duration_days, ofast_monthly_fee, ofast_daily_fee, ofast_hourly_fee, ofast_special_withholdings_percent, ofast_special_withholdings, ofast_sla_availability_critical, ofast_sla_availability_standard, ofast_specific_notes, ofast_status, ofast_url, created_at, updated_at) FROM stdin;
1	OFAST-DEV-1	1	1	2024-01-15 00:00:00+00	2025-01-14 00:00:00+00	365	400000.00	15000.00	2000.00	0.0500000	20000.00	24 x 7	8 x 5, Mon-Fri	Primary assignment for Q1 2025	Active	https://example.com/assignments/ofast-dev-1.pdf	2026-01-09 09:27:26.634965+00	2026-01-09 09:27:26.634965+00
2	OFAST-DEV-2	2	2	2024-01-15 00:00:00+00	2025-01-14 00:00:00+00	365	350000.00	13000.00	1800.00	0.0500000	17500.00	24 x 7	8 x 5, Mon-Fri	Business analysis role	Active	https://example.com/assignments/ofast-dev-2.pdf	2026-01-09 09:27:26.634965+00	2026-01-09 09:27:26.634965+00
3	OFAST-DEV-3	3	4	2024-01-20 00:00:00+00	2025-01-19 00:00:00+00	365	250000.00	10000.00	1500.00	0.0300000	7500.00	24 x 7	8 x 5, Mon-Fri	Junior developer assignment	Active	https://example.com/assignments/ofast-dev-3.pdf	2026-01-09 09:27:26.634965+00	2026-01-09 09:27:26.634965+00
4	OFAST-DEV-4	4	6	2024-02-01 00:00:00+00	2025-01-31 00:00:00+00	365	361000.00	14000.00	1900.00	0.0500000	18050.00	24 x 7	8 x 5, Mon-Fri	QA engineer role	Active	https://example.com/assignments/ofast-dev-4.pdf	2026-01-09 09:27:26.634965+00	2026-01-09 09:27:26.634965+00
5	OFAST-DEV-5	6	3	2024-02-01 00:00:00+00	2025-01-31 00:00:00+00	365	400000.00	15000.00	2000.00	0.0500000	20000.00	24 x 7	8 x 5, Mon-Fri	Frontend developer assignment	Active	https://example.com/assignments/ofast-dev-5.pdf	2026-01-09 09:27:26.634965+00	2026-01-09 09:27:26.634965+00
6	OFAST-DEV-6	7	1	2024-02-05 00:00:00+00	2025-02-04 00:00:00+00	365	420000.00	16000.00	2100.00	0.0500000	21000.00	24 x 7	8 x 5, Mon-Fri	Backend developer assignment	Active	https://example.com/assignments/ofast-dev-6.pdf	2026-01-09 09:27:26.634965+00	2026-01-09 09:27:26.634965+00
7	OFAST-DEV-7	10	2	2024-03-10 00:00:00+00	2025-03-10 00:00:00+00	365	450000.00	17000.00	2200.00	0.0500000	22500.00	24 x 7	8 x 5, Mon-Fri	Full stack developer assignment	Active	https://example.com/assignments/ofast-dev-7.pdf	2026-01-09 09:27:26.634965+00	2026-01-09 09:27:26.634965+00
8	OFAST-DEV-8	11	4	2024-03-15 00:00:00+00	2025-03-15 00:00:00+00	365	380000.00	14500.00	1950.00	0.0500000	19000.00	24 x 7	8 x 5, Mon-Fri	DevOps engineer assignment	Active	https://example.com/assignments/ofast-dev-8.pdf	2026-01-09 09:27:26.634965+00	2026-01-09 09:27:26.634965+00
\.


--
-- Name: orderform_assignments_ofast_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orderform_assignments_ofast_id_seq', 8, true);


--
-- PostgreSQL database dump complete
--

\unrestrict JS3YCGMHy98o5NeMUcYF8laYQP0RIEartS7dHi3MgNPyJBoSURHbvK8bgNAYDob

