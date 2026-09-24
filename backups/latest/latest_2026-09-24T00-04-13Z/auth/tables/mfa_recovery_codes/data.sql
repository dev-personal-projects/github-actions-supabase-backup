--
-- PostgreSQL database dump
--

\restrict jxux0A0xRlvtziAU2F3Y5UY54hZ7YBHsr9ggDXvkM0YWkx0YVMNgyUsxEPyGQHz

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
-- Data for Name: mfa_recovery_codes; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_recovery_codes (id, mfa_recovery_code_set_id, code_hash, consumed_at, created_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict jxux0A0xRlvtziAU2F3Y5UY54hZ7YBHsr9ggDXvkM0YWkx0YVMNgyUsxEPyGQHz

