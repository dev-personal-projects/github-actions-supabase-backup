--
-- PostgreSQL database dump
--

\restrict QnWsGMHfiMFMBcPhumepBKffHylTxqJCS73oFkxtwKcwvzj5IZ7RDaKB4Ll4LZ5

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
-- Data for Name: charge_types; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.charge_types (charge_type_id, charge_type_code, charge_type_description, created_at, updated_at) FROM stdin;
1	good	Equipment/Goods (e.g., laptop, hardware)	2026-01-22 14:24:18.551636+00	2026-01-22 14:24:18.551636+00
2	expense	Travel & Expenses (e.g., accommodation, flights)	2026-01-22 14:24:18.551636+00	2026-01-22 14:24:18.551636+00
\.


--
-- Name: charge_types_charge_type_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.charge_types_charge_type_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

\unrestrict QnWsGMHfiMFMBcPhumepBKffHylTxqJCS73oFkxtwKcwvzj5IZ7RDaKB4Ll4LZ5

