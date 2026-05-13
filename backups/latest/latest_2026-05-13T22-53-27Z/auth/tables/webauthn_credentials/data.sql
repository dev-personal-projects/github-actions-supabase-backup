--
-- PostgreSQL database dump
--

\restrict gzw8kdypvDoV2LhgOsPUlsBcZGOdTyMkX5eHzAxqRIWeJG3jrah20kg7SKhIslq

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
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.webauthn_credentials (id, user_id, credential_id, public_key, attestation_type, aaguid, sign_count, transports, backup_eligible, backed_up, friendly_name, created_at, updated_at, last_used_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict gzw8kdypvDoV2LhgOsPUlsBcZGOdTyMkX5eHzAxqRIWeJG3jrah20kg7SKhIslq

