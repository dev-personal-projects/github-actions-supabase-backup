--
-- PostgreSQL database dump
--

\restrict h0JF81HzbGl1gNlwKUiXE0GrDFhB0BRPWCORxGCMCoc4DWbIjZLPj9v8t09pvsh

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
-- Data for Name: remittance_profiles; Type: TABLE DATA; Schema: lh_billing_system; Owner: -
--

COPY lh_billing_system.remittance_profiles (remittance_profile_id, country_code, currency, effective_from, effective_to, is_active, created_by, change_reason, approved_by, approved_at, payload, created_at, updated_at) FROM stdin;
1	\N	KES	2000-01-01 00:00:00+00	\N	t	svc:db-migration	Seed global default remittance profile (KES).	svc:db-migration	2000-01-01 00:00:00+00	{"currency": "KES", "bank_code": "111900002", "bank_name": "Goldman Sachs", "swift_code": "GOLDSXUS", "account_name": "Good Info Ltd", "account_number": "67436XXXXX", "payment_method": "bank_transfer"}	2026-03-03 15:53:53.305057+00	2026-03-03 15:53:53.305057+00
2	\N	USD	2000-01-01 00:00:00+00	\N	t	svc:db-migration	Seed global default remittance profile (USD).	svc:db-migration	2000-01-01 00:00:00+00	{"currency": "USD", "bank_code": "111900002", "bank_name": "Goldman Sachs", "swift_code": "GOLDSXUS", "account_name": "Good Info Ltd", "account_number": "67436XXXXX", "payment_method": "bank_transfer"}	2026-03-03 15:53:53.305057+00	2026-03-03 15:53:53.305057+00
\.


--
-- Name: remittance_profiles_remittance_profile_id_seq; Type: SEQUENCE SET; Schema: lh_billing_system; Owner: -
--

SELECT pg_catalog.setval('lh_billing_system.remittance_profiles_remittance_profile_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

\unrestrict h0JF81HzbGl1gNlwKUiXE0GrDFhB0BRPWCORxGCMCoc4DWbIjZLPj9v8t09pvsh

