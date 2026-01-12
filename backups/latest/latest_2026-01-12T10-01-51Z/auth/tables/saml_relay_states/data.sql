--
-- PostgreSQL database dump
--

\restrict Zq46aQ0kqQRWMNFH2cSLvyQofTBxPqVXPdmac6uLGlTGsxrbzdY72rxHWYcSpjs

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
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict Zq46aQ0kqQRWMNFH2cSLvyQofTBxPqVXPdmac6uLGlTGsxrbzdY72rxHWYcSpjs

