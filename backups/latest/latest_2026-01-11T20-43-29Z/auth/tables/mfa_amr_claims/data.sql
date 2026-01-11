--
-- PostgreSQL database dump
--

\restrict 8Jch07vs89kGkaCH2iBEVq1VKdXYyVdD6l06tnO0g7a2bRNHAcgBrluRuX15f9x

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
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
5d4b2fa0-8b86-4501-aa76-7091b02b6da7	2025-12-10 00:20:04.576332+00	2025-12-10 00:20:04.576332+00	password	955400ee-62e7-4cfe-b449-78c6a322edf0
6ef77502-6086-4bcd-9816-b98d0b296859	2025-12-10 14:49:23.62955+00	2025-12-10 14:49:23.62955+00	password	2103d78b-1408-437e-bd2b-b2713d39f36b
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 8Jch07vs89kGkaCH2iBEVq1VKdXYyVdD6l06tnO0g7a2bRNHAcgBrluRuX15f9x

