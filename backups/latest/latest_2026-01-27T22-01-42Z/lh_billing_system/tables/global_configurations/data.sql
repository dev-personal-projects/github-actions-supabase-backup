--
-- PostgreSQL database dump
--

\restrict D535Nv3J3aBY9hRSSwmJHX5WgE3eNsIALtqdNyr9XnwOVdtoEhpDmcyrYMHEbWa

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
-- Data for Name: global_configurations; Type: TABLE DATA; Schema: lh_billing_system; Owner: -
--

COPY lh_billing_system.global_configurations (global_configuration_id, cfg_key, cfg_value, cfg_description, created_at, updated_at) FROM stdin;
\.


--
-- Name: global_configurations_global_configuration_id_seq; Type: SEQUENCE SET; Schema: lh_billing_system; Owner: -
--

SELECT pg_catalog.setval('lh_billing_system.global_configurations_global_configuration_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict D535Nv3J3aBY9hRSSwmJHX5WgE3eNsIALtqdNyr9XnwOVdtoEhpDmcyrYMHEbWa

