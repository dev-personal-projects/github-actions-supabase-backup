--
-- PostgreSQL database dump
--

\restrict suzcXD0Qume83CgJg79d0xwNVEXAHhE9mQMZFdm2ldC7m4knyNvrm7JrKVS5JVb

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
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict suzcXD0Qume83CgJg79d0xwNVEXAHhE9mQMZFdm2ldC7m4knyNvrm7JrKVS5JVb

