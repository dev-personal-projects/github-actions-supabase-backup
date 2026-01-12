--
-- PostgreSQL database dump
--

\restrict PXaBYIF8ZAbwvm55DZkNRbUH5XFsPNVOtrCedR0k8UkrFut9XHbLsqqgZiZRZdU

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
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict PXaBYIF8ZAbwvm55DZkNRbUH5XFsPNVOtrCedR0k8UkrFut9XHbLsqqgZiZRZdU

