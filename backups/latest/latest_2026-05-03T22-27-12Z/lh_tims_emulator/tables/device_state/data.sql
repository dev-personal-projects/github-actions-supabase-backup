--
-- PostgreSQL database dump
--

\restrict lAg6N5Ochszd61HsHeTLo90UGiEGYTpRMH7MEi1hfJD3gPLfKEihwglivYNP1nr

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.9 (Ubuntu 17.9-1.pgdg24.04+1)

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
5	auto_print	{"value": true}	2026-02-23 08:37:41.770863+00	2026-02-23 08:37:41.770863+00
1	pin_required	{"value": false}	2026-02-23 08:37:26.437938+00	2026-02-23 11:50:29.102925+00
\.


--
-- Name: device_state_id_seq; Type: SEQUENCE SET; Schema: lh_tims_emulator; Owner: -
--

SELECT pg_catalog.setval('lh_tims_emulator.device_state_id_seq', 10, true);


--
-- PostgreSQL database dump complete
--

\unrestrict lAg6N5Ochszd61HsHeTLo90UGiEGYTpRMH7MEi1hfJD3gPLfKEihwglivYNP1nr

