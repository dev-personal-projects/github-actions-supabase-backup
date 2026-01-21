--
-- PostgreSQL database dump
--

\restrict DHPNV4zGDlld59dnMdW9ToBW3QX0fKF0slX0gcWHZboRWgS8dZhyiPQP5cjdobO

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
-- Data for Name: orderform_primary_gaps; Type: TABLE DATA; Schema: lh_payproof; Owner: -
--

COPY lh_payproof.orderform_primary_gaps (orderform_primary_gap_id, order_form_id, orderform_alternate_contact_id, reason, created_at, updated_at) FROM stdin;
\.


--
-- Name: orderform_primary_gaps_orderform_primary_gap_id_seq; Type: SEQUENCE SET; Schema: lh_payproof; Owner: -
--

SELECT pg_catalog.setval('lh_payproof.orderform_primary_gaps_orderform_primary_gap_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict DHPNV4zGDlld59dnMdW9ToBW3QX0fKF0slX0gcWHZboRWgS8dZhyiPQP5cjdobO

