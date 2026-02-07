--
-- PostgreSQL database dump
--

\restrict w6L6rh9mxnx5GUS8cW3iFtwGqzCUoNPlgm51h7cRhEDDTZ2bjnOX3dJ0oIKxdI5

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
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at, nonce) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict w6L6rh9mxnx5GUS8cW3iFtwGqzCUoNPlgm51h7cRhEDDTZ2bjnOX3dJ0oIKxdI5

