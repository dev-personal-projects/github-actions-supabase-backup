--
-- PostgreSQL database dump
--

\restrict IVjpRa2eeboFJeGvDM6C00j9MFiV4n31JAc4d66gaTQRcZWF0xnZjbY354Eq2oo

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
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict IVjpRa2eeboFJeGvDM6C00j9MFiV4n31JAc4d66gaTQRcZWF0xnZjbY354Eq2oo

