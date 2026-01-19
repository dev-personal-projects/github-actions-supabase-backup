--
-- PostgreSQL database dump
--

\restrict o85O6d5fo1crnSwfKF61UnUlOv1vk3TD0FbNZD0tgBhKeaDSNmDScdrFBbV2c7F

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
-- Data for Name: customer_contracts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer_contracts (cctr_id, cctr_prfx_id, cmp_id, cctr_service_name, cctr_selected_service_plan, cctr_service_plan_monthly_price, cctr_effective_date, cctr_duration_days, cctr_url, cctr_status, created_at, updated_at) FROM stdin;
1	CCTR-DEV-1	1	AGILE	Enterprise Plan	500000.00	2023-07-07	365	https://example.com/contracts/cctr-dev-1.pdf	Active	2026-01-09 09:27:25.678907+00	2026-01-09 09:27:25.678907+00
2	CCTR-DEV-2	2	AGILE	Professional Plan	300000.00	2023-09-01	365	https://example.com/contracts/cctr-dev-2.pdf	Active	2026-01-09 09:27:25.678907+00	2026-01-09 09:27:25.678907+00
3	CCTR-DEV-3	4	AGILE	Starter Plan	150000.00	2024-01-15	180	https://example.com/contracts/cctr-dev-3.pdf	Active	2026-01-09 09:27:25.678907+00	2026-01-09 09:27:25.678907+00
\.


--
-- Name: customer_contracts_cctr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customer_contracts_cctr_id_seq', 3, true);


--
-- PostgreSQL database dump complete
--

\unrestrict o85O6d5fo1crnSwfKF61UnUlOv1vk3TD0FbNZD0tgBhKeaDSNmDScdrFBbV2c7F

