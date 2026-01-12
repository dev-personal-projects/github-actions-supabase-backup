--
-- PostgreSQL database dump
--

\restrict 9N2J3seha1lysFeEQHkKw4AdFrf6mT07l2S1gw732Faw6cB4d289u9wZEfiHB4o

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
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 9N2J3seha1lysFeEQHkKw4AdFrf6mT07l2S1gw732Faw6cB4d289u9wZEfiHB4o

