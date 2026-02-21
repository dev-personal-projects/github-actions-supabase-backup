--
-- PostgreSQL database dump
--

\restrict xdGTUqiJqRL8Umv3b5eDnNeycghqUfpUVcn0RdXW0anQxYuNlwkMQdRMtduxqkS

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.8 (Ubuntu 17.8-1.pgdg24.04+1)

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
-- Data for Name: device_state; Type: TABLE DATA; Schema: lh_tims_emulator; Owner: -
--

COPY lh_tims_emulator.device_state (id, state_key, state_value, created_at, updated_at) FROM stdin;
\.


--
-- Name: device_state_id_seq; Type: SEQUENCE SET; Schema: lh_tims_emulator; Owner: -
--

SELECT pg_catalog.setval('lh_tims_emulator.device_state_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict xdGTUqiJqRL8Umv3b5eDnNeycghqUfpUVcn0RdXW0anQxYuNlwkMQdRMtduxqkS

