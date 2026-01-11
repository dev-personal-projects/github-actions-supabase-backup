--
-- PostgreSQL database dump
--

\restrict dUHcV9P1KHqwhurd7Ix7TwKUEsjMSBr2Bu9pkqCnufeDfIIknchZfUaKjwIdNB4

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
-- Data for Name: company_alternate_contacts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.company_alternate_contacts (cmpaltct_id, cmp_id, cmpaltct_first_name, cmpaltct_middle_name, cmpaltct_last_name, cmpaltct_contact_description, cmpaltct_role, cmpaltct_contact_type, cmpaltct_work_email, cmpaltct_mobile_number, cmpaltct_postal_address, cmpaltct_street_address_line1, cmpaltct_street_address_line2, cmpaltct_city, cmpaltct_state, cmpaltct_postal_code, cmpaltct_country, created_at, updated_at) FROM stdin;
\.


--
-- Name: company_alternate_contacts_cmpaltct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.company_alternate_contacts_cmpaltct_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict dUHcV9P1KHqwhurd7Ix7TwKUEsjMSBr2Bu9pkqCnufeDfIIknchZfUaKjwIdNB4

