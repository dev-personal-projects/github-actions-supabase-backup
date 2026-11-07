--
-- PostgreSQL database dump
--

\restrict N9Sh2M11ftlLJtRDtce1LEn8ccoqP2NNU6huY5tm8tnA8WGyyuamJ9xqDSXz8Oy

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
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict N9Sh2M11ftlLJtRDtce1LEn8ccoqP2NNU6huY5tm8tnA8WGyyuamJ9xqDSXz8Oy

