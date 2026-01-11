--
-- PostgreSQL database dump
--

\restrict HFEj9fyR38Wdz9BkUjotWzSUASkay0QYU95Pp4Uv4agJeGPw3nJYQ3bAnK8kB9n

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
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict HFEj9fyR38Wdz9BkUjotWzSUASkay0QYU95Pp4Uv4agJeGPw3nJYQ3bAnK8kB9n

