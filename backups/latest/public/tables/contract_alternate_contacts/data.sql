--
-- PostgreSQL database dump
--

\restrict Rd6FCg1hiGAb81sPyV0o9J6RXFtgrLeGWclhpHz6u9lIJnLHcbdy3Ux2rMnbK9R

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
-- Data for Name: contract_alternate_contacts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contract_alternate_contacts (cctraltct_id, cctr_id, cctraltct_first_name, cctraltct_middle_name, cctraltct_last_name, cctraltct_contact_description, cctraltct_role, cctraltct_contact_type, cctraltct_work_email, cctraltct_mobile_number, cctraltct_postal_address, cctraltct_street_address_line1, cctraltct_street_address_line2, cctraltct_city, cctraltct_state, cctraltct_postal_code, cctraltct_country, created_at, updated_at) FROM stdin;
\.


--
-- Name: contract_alternate_contacts_cctraltct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contract_alternate_contacts_cctraltct_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict Rd6FCg1hiGAb81sPyV0o9J6RXFtgrLeGWclhpHz6u9lIJnLHcbdy3Ux2rMnbK9R

