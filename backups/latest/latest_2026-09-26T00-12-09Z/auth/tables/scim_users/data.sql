--
-- PostgreSQL database dump
--

\restrict AEJ9LEFzcH5kfFdJrC1HHbGXdkz01Rdake960oGKb7bbV5P6nmKTlnpd27mzR6v

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.11 (Ubuntu 17.11-1.pgdg24.04+2)

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
-- Data for Name: scim_users; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.scim_users (id, sso_provider_id, user_id, resource, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict AEJ9LEFzcH5kfFdJrC1HHbGXdkz01Rdake960oGKb7bbV5P6nmKTlnpd27mzR6v

