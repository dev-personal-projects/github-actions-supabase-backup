--
-- PostgreSQL database dump
--

\restrict 4NrreoZLEfj0WT0qg0UCyLsy0wmsj1LhYo7ZgUjIXIJgWinMw1b4pnNU1o4loTN

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
-- Data for Name: billing_contacts; Type: TABLE DATA; Schema: lh_billing; Owner: -
--

COPY lh_billing.billing_contacts (billing_contact_id, cmp_id, cctr_id, ofrm_id, contact_type, email, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: billing_contacts_billing_contact_id_seq; Type: SEQUENCE SET; Schema: lh_billing; Owner: -
--

SELECT pg_catalog.setval('lh_billing.billing_contacts_billing_contact_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict 4NrreoZLEfj0WT0qg0UCyLsy0wmsj1LhYo7ZgUjIXIJgWinMw1b4pnNU1o4loTN

