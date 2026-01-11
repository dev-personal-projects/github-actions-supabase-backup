--
-- PostgreSQL database dump
--

\restrict ZinEITBcNh4RkbGcsHWh3betFnoYkg4equiiByCursub3cSidJmdxUbLJCW7TUS

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
\.


--
-- Name: sent_logs_sent_log_id_seq; Type: SEQUENCE SET; Schema: lh_payproof; Owner: -
--

SELECT pg_catalog.setval('lh_payproof.sent_logs_sent_log_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict ZinEITBcNh4RkbGcsHWh3betFnoYkg4equiiByCursub3cSidJmdxUbLJCW7TUS

