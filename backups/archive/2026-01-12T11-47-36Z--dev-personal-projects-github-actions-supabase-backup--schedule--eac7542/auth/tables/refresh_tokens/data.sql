--
-- PostgreSQL database dump
--

\restrict XPLhDc021ZvznbyYQOCqkyvcSK0lrPoGByIBQoEZZXwx3K0nF9rrxqSJiTqWXzx

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
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 108, true);


--
-- PostgreSQL database dump complete
--

\unrestrict XPLhDc021ZvznbyYQOCqkyvcSK0lrPoGByIBQoEZZXwx3K0nF9rrxqSJiTqWXzx

