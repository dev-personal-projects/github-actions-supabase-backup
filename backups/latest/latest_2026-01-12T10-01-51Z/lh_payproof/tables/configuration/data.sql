--
-- PostgreSQL database dump
--

\restrict P36IzcGNaUOb6wQzL6wggOh0BttfbWXLA35e759JXOHTdpCcsxiHAtwRuNPVA5l

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
-- Data for Name: configuration; Type: TABLE DATA; Schema: lh_payproof; Owner: -
--

COPY lh_payproof.configuration (configuration_id, cfg_key, cfg_value, cfg_description, cmp_id, created_at, updated_at) FROM stdin;
1	PayProofSenderEmail	payproof@shipht.it	Sender email address used by PayProof when sending rating sheets (NULL cmp_id = global default).	\N	2026-01-09 09:27:27.396784+00	2026-01-09 09:27:27.396784+00
2	PayProofSenderEmail	duane@shipht.it	Company-scoped PayProof sender email override.	1	2026-01-09 09:27:27.577975+00	2026-01-09 09:27:27.577975+00
\.


--
-- Name: configuration_configuration_id_seq; Type: SEQUENCE SET; Schema: lh_payproof; Owner: -
--

SELECT pg_catalog.setval('lh_payproof.configuration_configuration_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

\unrestrict P36IzcGNaUOb6wQzL6wggOh0BttfbWXLA35e759JXOHTdpCcsxiHAtwRuNPVA5l

