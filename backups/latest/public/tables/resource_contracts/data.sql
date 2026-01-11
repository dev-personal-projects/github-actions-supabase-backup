--
-- PostgreSQL database dump
--

\restrict 3NFIWxjWWHYJB5y9pTszSilr6YO0FxqB0bgEstZN3XDqqdc7T2N7yQdDZnODiVv

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
-- Data for Name: resource_contracts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.resource_contracts (rsctr_id, rsctr_prfx_id, res_id, rsctr_effective_date, rsctr_sign_date, rsctr_duration_days, rsctr_expiry_date, rsctr_max_monthly_fee, rsctr_max_daily_fee, rsctr_payment_currency, rsctr_status, rsctr_contract_url, created_at, updated_at) FROM stdin;
1	RSCTR-DEV-1	1	2024-01-15	2024-01-10	365	2025-01-14	500000.00	20000.00	KES	Expired	https://example.com/contracts/rsctr-dev-1.pdf	2026-01-09 09:27:25.867124+00	2026-01-09 09:27:25.867124+00
2	RSCTR-DEV-2	2	2024-02-01	2024-01-28	365	2025-01-31	450000.00	18000.00	KES	Expired	https://example.com/contracts/rsctr-dev-2.pdf	2026-01-09 09:27:25.867124+00	2026-01-09 09:27:25.867124+00
3	RSCTR-DEV-3	3	2024-01-20	2024-01-15	365	2025-01-19	480000.00	19000.00	KES	Expired	https://example.com/contracts/rsctr-dev-3.pdf	2026-01-09 09:27:25.867124+00	2026-01-09 09:27:25.867124+00
4	RSCTR-DEV-4	4	2024-03-01	2024-02-25	365	2025-03-01	420000.00	17000.00	KES	Expired	https://example.com/contracts/rsctr-dev-4.pdf	2026-01-09 09:27:25.867124+00	2026-01-09 09:27:25.867124+00
5	RSCTR-DEV-5	6	2024-02-15	2024-02-10	365	2025-02-14	460000.00	18500.00	KES	Expired	https://example.com/contracts/rsctr-dev-5.pdf	2026-01-09 09:27:25.867124+00	2026-01-09 09:27:25.867124+00
\.


--
-- Name: resource_contracts_rsctr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.resource_contracts_rsctr_id_seq', 5, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 3NFIWxjWWHYJB5y9pTszSilr6YO0FxqB0bgEstZN3XDqqdc7T2N7yQdDZnODiVv

