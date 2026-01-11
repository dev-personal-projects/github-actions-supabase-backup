--
-- PostgreSQL database dump
--

\restrict fXS8pMos5VZeR3bFC78VCxH6qcc6M6VA3L3EJ7qL5X0Xvt3adaWfxloGsny4ts8

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
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict fXS8pMos5VZeR3bFC78VCxH6qcc6M6VA3L3EJ7qL5X0Xvt3adaWfxloGsny4ts8

