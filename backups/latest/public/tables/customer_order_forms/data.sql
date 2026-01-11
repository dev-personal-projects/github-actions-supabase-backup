--
-- PostgreSQL database dump
--

\restrict WszQ1moAudtfcB6UzQCss9ZNsLPBCq7hdwRsnNCsDIrrdQEJWMfGw2PKexcHBrv

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
-- Data for Name: customer_order_forms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer_order_forms (ofrm_id, ofrm_prfx_id, cctr_id, cmp_id, ofrm_issued_by, ofrm_issuer_role, ofrm_issued_date, ofrm_duration_type, ofrm_duration_days, ofrm_total_monthly_fee, ofrm_fee_currency, ofrm_total_roles, ofrm_url, ofrm_status, ofrm_replaces, ofrm_replaced_by, ofrm_renewing, created_at, updated_at) FROM stdin;
1	OFRM-DEV-1	1	1	John Manager	Operations Manager	2024-01-15 10:00:00+00	Fixed	365	1500000.00	KES	5	https://example.com/orderforms/ofrm-dev-1.pdf	Expired	\N	\N	f	2026-01-09 09:27:26.063092+00	2026-01-09 09:27:26.063092+00
2	OFRM-DEV-2	2	2	Jane Director	Director of Engineering	2024-02-01 14:30:00+00	Fixed	365	1200000.00	KES	4	https://example.com/orderforms/ofrm-dev-2.pdf	Expired	\N	\N	f	2026-01-09 09:27:26.063092+00	2026-01-09 09:27:26.063092+00
3	OFRM-DEV-3	1	1	Robert Admin	Administrator	2023-06-01 09:00:00+00	Fixed	365	2000000.00	KES	8	https://example.com/orderforms/ofrm-dev-3.pdf	Expired	\N	\N	f	2026-01-09 09:27:26.063092+00	2026-01-09 09:27:26.063092+00
4	OFRM-DEV-4	3	4	Sarah Lead	Tech Lead	2024-03-10 11:00:00+00	Perpetual	\N	800000.00	KES	3	https://example.com/orderforms/ofrm-dev-4.pdf	Active	\N	\N	f	2026-01-09 09:27:26.063092+00	2026-01-09 09:27:26.063092+00
\.


--
-- Name: customer_order_forms_ofrm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customer_order_forms_ofrm_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

\unrestrict WszQ1moAudtfcB6UzQCss9ZNsLPBCq7hdwRsnNCsDIrrdQEJWMfGw2PKexcHBrv

