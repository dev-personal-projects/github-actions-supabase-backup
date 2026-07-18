--
-- PostgreSQL database dump
--

\restrict CI7BA3CRp9on6kf7Td65dL6kNafw57elj4bLtVRE5ixNKtfTIZj7XRC4XBcTt7p

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.10 (Ubuntu 17.10-1.pgdg24.04+1)

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
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.webauthn_challenges (id, user_id, challenge_type, session_data, created_at, expires_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict CI7BA3CRp9on6kf7Td65dL6kNafw57elj4bLtVRE5ixNKtfTIZj7XRC4XBcTt7p

