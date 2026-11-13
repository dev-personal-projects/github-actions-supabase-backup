--
-- PostgreSQL database dump
--

\restrict 5ipyBawcl2lA9obL1rDhhRzVxufJdKASigUbdxHjjJ1hK0M6BF8RbjLZ7eohbpO

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.12 (Ubuntu 17.12-1.pgdg24.04+1)

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

\unrestrict 5ipyBawcl2lA9obL1rDhhRzVxufJdKASigUbdxHjjJ1hK0M6BF8RbjLZ7eohbpO

