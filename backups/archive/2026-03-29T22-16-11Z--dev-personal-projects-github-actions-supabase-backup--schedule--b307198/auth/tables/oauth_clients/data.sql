--
-- PostgreSQL database dump
--

\restrict OxobFDf6bUeBEqL3oNtMx567nrCZY1hdFG9WW1fPOCirRuJdenshEuM5j7hXu8f

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
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type, token_endpoint_auth_method) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict OxobFDf6bUeBEqL3oNtMx567nrCZY1hdFG9WW1fPOCirRuJdenshEuM5j7hXu8f

