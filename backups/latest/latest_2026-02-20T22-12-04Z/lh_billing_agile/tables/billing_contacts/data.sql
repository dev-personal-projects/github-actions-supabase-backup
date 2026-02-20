--
-- PostgreSQL database dump
--

\restrict nElwOdcTjuI0NRIkBk7Oumd1h1XtCmIZQCULWxtf4ckhHNRIhcwdk6yrbbP8elz

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
-- Data for Name: billing_contacts; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.billing_contacts (billing_contact_id, cmp_id, cctr_id, ofrm_id, contact_type, email, name, created_at, updated_at) FROM stdin;
2	900001	\N	\N	Primary	devops@shipht.it	Smoke Billing Contact	2026-02-20 18:57:15.062404+00	2026-02-20 18:57:15.062404+00
\.


--
-- Name: billing_contacts_billing_contact_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.billing_contacts_billing_contact_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

\unrestrict nElwOdcTjuI0NRIkBk7Oumd1h1XtCmIZQCULWxtf4ckhHNRIhcwdk6yrbbP8elz

