--
-- PostgreSQL database dump
--

\restrict OMsRC0QDEKe389rWbNxLHF8UU1SmR5YoiBtkv9j3bFgJyiye9IVm4as1jxqxCJr

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
-- Data for Name: billing_contacts; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.billing_contacts (billing_contact_id, cmp_id, cctr_id, ofrm_id, contact_type, email, name, created_at, updated_at) FROM stdin;
1	4	\N	\N	Primary	duane@shipht.it	Duane	2026-01-23 11:04:29.657932+00	2026-01-23 11:04:29.657932+00
\.


--
-- Name: billing_contacts_billing_contact_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.billing_contacts_billing_contact_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

\unrestrict OMsRC0QDEKe389rWbNxLHF8UU1SmR5YoiBtkv9j3bFgJyiye9IVm4as1jxqxCJr

