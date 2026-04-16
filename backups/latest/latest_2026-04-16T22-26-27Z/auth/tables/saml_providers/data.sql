--
-- PostgreSQL database dump
--

\restrict WffVSUXRmcfnGvcw9tCqMkqcZYJb4PQpjbK9E33W4sDQTdtGWT4bWGK0aG1BNRb

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
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict WffVSUXRmcfnGvcw9tCqMkqcZYJb4PQpjbK9E33W4sDQTdtGWT4bWGK0aG1BNRb

