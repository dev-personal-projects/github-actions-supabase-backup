--
-- PostgreSQL database dump
--

\restrict NkdsBUsXmb2OsIDMWZXeJdrIuWlyV9g6eXcN8hhmHDxDSTJWE12oYM0M81WM54e

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
-- Data for Name: member_contributions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.member_contributions (id, amount_paid, balance, status, payment_date, created_at, updated_at, contribution_id, member_id, contribution_history) FROM stdin;
24cc7538-89b4-4afe-a31e-b8bb4dd5c614	0	600	unpaid	\N	2025-12-09 23:01:04.082329+00	2025-12-09 23:01:04.082329+00	78baeaa9-dfec-4612-8d55-1bf02506101b	3b1f4b2e-25ae-415e-82f2-e125aed86313	[]
b7bfa8b5-d599-453a-87ec-16d95b8985b3	0	600	unpaid	\N	2025-12-09 23:01:04.082329+00	2025-12-09 23:01:04.082329+00	78baeaa9-dfec-4612-8d55-1bf02506101b	0bc6fb57-1e42-40ae-af9e-f3e81695437d	[]
7e2b417c-bc85-4a6d-987e-c6eb67e527d5	0	500	unpaid	\N	2025-12-10 14:48:20.074578+00	2025-12-10 14:48:20.074578+00	b9e13cab-593a-452e-b823-c337c53d4ec5	0d37dd3f-69d5-48c8-a8bb-42c52fad80b6	[]
08331226-6abb-4f3a-98e5-4a489bdc085e	300	200	partial	2025-12-10 00:00:00+00	2025-12-10 14:48:20.074578+00	2025-12-10 14:50:44.661692+00	b9e13cab-593a-452e-b823-c337c53d4ec5	f95649a7-2900-4b73-b9e6-02254340c463	[{"updated_at": "2025-12-10T14:50:43.627Z", "updated_by": "", "amount_paid": 300, "payment_date": "2025-12-10", "balance_after": 200}]
\.


--
-- PostgreSQL database dump complete
--

\unrestrict NkdsBUsXmb2OsIDMWZXeJdrIuWlyV9g6eXcN8hhmHDxDSTJWE12oYM0M81WM54e

