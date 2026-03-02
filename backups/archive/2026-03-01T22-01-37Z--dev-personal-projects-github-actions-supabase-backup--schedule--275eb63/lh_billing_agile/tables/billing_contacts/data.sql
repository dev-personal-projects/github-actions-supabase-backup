--
-- PostgreSQL database dump
--

\restrict ahpqFQ0XjhIjHHpd3bDVdMZL0Q8c8umv2UIgtQ3SA2k1Md0cetc1lMC8fR1LcXV

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
-- Data for Name: billing_contacts; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.billing_contacts (billing_contact_id, cmp_id, cctr_id, ofrm_id, contact_type, email, name, created_at, updated_at) FROM stdin;
133	900001	\N	\N	Primary	devops@shipht.it	Accounts Payable	2026-03-01 16:08:42.896221+00	2026-03-01 16:08:42.896221+00
134	901001	\N	\N	Primary	devops@shipht.it	Accounts Payable	2026-03-01 16:08:48.824646+00	2026-03-01 16:08:48.824646+00
135	902001	\N	\N	Primary	devops@shipht.it	Accounts Payable	2026-03-01 16:08:53.542975+00	2026-03-01 16:08:53.542975+00
\.


--
-- Name: billing_contacts_billing_contact_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.billing_contacts_billing_contact_id_seq', 135, true);


--
-- PostgreSQL database dump complete
--

\unrestrict ahpqFQ0XjhIjHHpd3bDVdMZL0Q8c8umv2UIgtQ3SA2k1Md0cetc1lMC8fR1LcXV

