--
-- PostgreSQL database dump
--

\restrict bIpdOXpvQb74pYK2gAdp9e4t59Ofgqrpypj8QMPvEEqZX3MK0cfSbKzzbVvsioJ

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
-- Data for Name: sent_logs; Type: TABLE DATA; Schema: lh_payproof; Owner: -
--

COPY lh_payproof.sent_logs (sent_log_id, primary_approver_id, primary_approver_email, year_month, trigger_type, filter_value, correlation_id, send_status, force_sent, sent_at, error_message, created_at, updated_at) FROM stdin;
1	3	duane@shipht.it	2026-01-01	Timer	ALL	b8cadd88-ba49-46dd-9b1a-e51972ab6c04	sent	f	2026-01-20 05:00:04.874803+00	\N	2026-01-20 05:00:03.286675+00	2026-01-20 05:00:04.874803+00
2	1	collins.munene@shipht.it	2026-01-01	Timer	ALL	b8cadd88-ba49-46dd-9b1a-e51972ab6c04	sent	f	2026-01-20 05:00:05.084688+00	\N	2026-01-20 05:00:04.897642+00	2026-01-20 05:00:05.084688+00
\.


--
-- Name: sent_logs_sent_log_id_seq; Type: SEQUENCE SET; Schema: lh_payproof; Owner: -
--

SELECT pg_catalog.setval('lh_payproof.sent_logs_sent_log_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

\unrestrict bIpdOXpvQb74pYK2gAdp9e4t59Ofgqrpypj8QMPvEEqZX3MK0cfSbKzzbVvsioJ

