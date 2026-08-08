--
-- PostgreSQL database dump
--

\restrict 2j2Vgv6G86su2GN7Qd2EL93ykfwOwRQRreU5bnmHHQKmgRlgvciT8ME3dkie54A

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.10 (Ubuntu 17.10-1.pgdg24.04+1)

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

\unrestrict 2j2Vgv6G86su2GN7Qd2EL93ykfwOwRQRreU5bnmHHQKmgRlgvciT8ME3dkie54A

