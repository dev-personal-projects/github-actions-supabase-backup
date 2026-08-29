--
-- PostgreSQL database dump
--

\restrict VIVBI3nAcYtmYnIgyOjUKdjkyH5TY0w6e0dlcFFHPvdMoPLzIwynZeF9lxa6K1Q

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
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict VIVBI3nAcYtmYnIgyOjUKdjkyH5TY0w6e0dlcFFHPvdMoPLzIwynZeF9lxa6K1Q

