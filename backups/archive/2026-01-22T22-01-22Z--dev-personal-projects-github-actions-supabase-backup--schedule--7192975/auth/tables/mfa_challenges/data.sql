--
-- PostgreSQL database dump
--

\restrict 1X6yJDlRlw3cuokMbq3cJQtbrLE7K3TK6hXezGzaugYQgD8plqvQJlE7Ph5l9Fk

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
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 1X6yJDlRlw3cuokMbq3cJQtbrLE7K3TK6hXezGzaugYQgD8plqvQJlE7Ph5l9Fk

