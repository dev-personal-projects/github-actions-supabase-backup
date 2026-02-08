--
-- PostgreSQL database dump
--

\restrict 0NQEr6c6dZZpJHfbi9YnO1hw1dcR0lxiJKwuxTN5ovYB07bUR3umFTgHWIbH1j6

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
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 0NQEr6c6dZZpJHfbi9YnO1hw1dcR0lxiJKwuxTN5ovYB07bUR3umFTgHWIbH1j6

