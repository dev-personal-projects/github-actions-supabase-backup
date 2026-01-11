--
-- PostgreSQL database dump
--

\restrict IpEoZMm9gefuWvIMMZ0kfQQwh6HJz6rkO0slrYQizZAhBp1bDMgQU7NoT9Vrddm

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
-- Data for Name: orderform_alternate_contacts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orderform_alternate_contacts (ofaltct_id, ofrm_id, ofaltct_first_name, ofaltct_middle_name, ofaltct_last_name, ofaltct_contact_description, ofaltct_lh_role, ofaltct_contact_type, ofaltct_work_email, ofaltct_mobile_number, ofaltct_postal_address, ofaltct_street_address_line1, ofaltct_street_address_line2, ofaltct_city, ofaltct_state, ofaltct_postal_code, ofaltct_country, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict IpEoZMm9gefuWvIMMZ0kfQQwh6HJz6rkO0slrYQizZAhBp1bDMgQU7NoT9Vrddm

