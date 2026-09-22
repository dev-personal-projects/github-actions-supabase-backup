--
-- PostgreSQL database dump
--

\restrict 6jEuDBGOFnQOeX0Qpa9thhkgmcpakad6VaGR8519a4zXRegwYlqyVOb3EVqiSwE

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.11 (Ubuntu 17.11-1.pgdg24.04+2)

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
-- Data for Name: scim_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.scim_tokens (id, sso_provider_id, token_hash, prefix, created_at, expires_at, revoked_at, last_used_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 6jEuDBGOFnQOeX0Qpa9thhkgmcpakad6VaGR8519a4zXRegwYlqyVOb3EVqiSwE

