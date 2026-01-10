--
-- PostgreSQL database dump
--

\restrict a5lkrOp802wDiOtVUGSRcL7331pLNwvaqT0dvuIWIY6SNp3GhfrYEdqtJZcEIGD

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
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subscriptions (id, plan_code, plan_name, plan_amount, plan_interval, plan_description, reference, channel, last4, brand, bank, exp_month, exp_year, customer_email, customer_code, status, paid_at, expires_at, previous_subscription_id, transition_type, created_at, updated_at, chama_id) FROM stdin;
0033b790-196e-447e-997d-2e94557310a8	PLN_vvgk28m52jsyeui	Basic	1500	monthly	Ideal for growing Chamas | Everything in Free | Up to 30 members | Mobile money integration | Automated reminders | Advanced reporting | PDF/Excel exports | Priority email support | Transaction history	oelg5hy50j	card	4081	visa	TEST BANK	12	2030	collinsentrepreneur@gmail.com	CUS_etqo2rtxk97fzgf	active	2025-12-09 22:56:19+00	2026-01-09 22:56:19+00	\N	new	2025-12-09 22:56:25.073714+00	2025-12-09 22:56:25.073714+00	b67d3479-8cb0-4a7c-ac72-8c9086769cfb
\.


--
-- PostgreSQL database dump complete
--

\unrestrict a5lkrOp802wDiOtVUGSRcL7331pLNwvaqT0dvuIWIY6SNp3GhfrYEdqtJZcEIGD

