--
-- PostgreSQL database dump
--

\restrict 0EMKtMWvtSnFzNQgp4KAZMiEKjPTsfIXaNSa5HVPjKL699upu0KY3OfYYGkih6B

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
-- Data for Name: orderform_ordered_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orderform_ordered_roles (odrl_id, odrl_prfx_id, ofrm_id, odrl_level, odrl_description, odrl_monthly_fee, odrl_fee_discount, odrl_final_monthly_fee, created_at, updated_at, odrl_status) FROM stdin;
1	ODRL-DEV-1	1	Level 3	Software Engineer	400000.00	0.00	400000.00	2026-01-09 09:27:26.258872+00	2026-01-09 09:27:26.258872+00	Active
2	ODRL-DEV-2	1	Level 3	Business Analyst	350000.00	0.00	350000.00	2026-01-09 09:27:26.258872+00	2026-01-09 09:27:26.258872+00	Active
3	ODRL-DEV-3	1	Level 2	Junior Developer	250000.00	0.00	250000.00	2026-01-09 09:27:26.258872+00	2026-01-09 09:27:26.258872+00	Active
4	ODRL-DEV-4	1	Level 3	QA Engineer	380000.00	5.00	361000.00	2026-01-09 09:27:26.258872+00	2026-01-09 09:27:26.258872+00	Active
5	ODRL-DEV-5	1	Level 1	Project Manager	500000.00	0.00	500000.00	2026-01-09 09:27:26.258872+00	2026-01-09 09:27:26.258872+00	Active
6	ODRL-DEV-6	2	Level 3	Frontend Software Engineer (React)	400000.00	0.00	400000.00	2026-01-09 09:27:26.258872+00	2026-01-09 09:27:26.258872+00	Active
7	ODRL-DEV-7	2	Level 3	Backend Software Engineer	420000.00	0.00	420000.00	2026-01-09 09:27:26.258872+00	2026-01-09 09:27:26.258872+00	Active
8	ODRL-DEV-8	2	Level 2	UX/UI Designer	320000.00	0.00	320000.00	2026-01-09 09:27:26.258872+00	2026-01-09 09:27:26.258872+00	Active
9	ODRL-DEV-9	2	Level 1	Tech Lead	600000.00	0.00	600000.00	2026-01-09 09:27:26.258872+00	2026-01-09 09:27:26.258872+00	Active
10	ODRL-DEV-10	4	Level 3	Full Stack Developer	450000.00	0.00	450000.00	2026-01-09 09:27:26.258872+00	2026-01-09 09:27:26.258872+00	Active
11	ODRL-DEV-11	4	Level 2	DevOps Engineer	380000.00	0.00	380000.00	2026-01-09 09:27:26.258872+00	2026-01-09 09:27:26.258872+00	Active
12	ODRL-DEV-12	4	Level 3	Data Engineer	400000.00	0.00	400000.00	2026-01-09 09:27:26.258872+00	2026-01-09 09:27:26.258872+00	Active
\.


--
-- Name: orderform_ordered_roles_odrl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orderform_ordered_roles_odrl_id_seq', 12, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 0EMKtMWvtSnFzNQgp4KAZMiEKjPTsfIXaNSa5HVPjKL699upu0KY3OfYYGkih6B

