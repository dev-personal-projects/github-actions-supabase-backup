--
-- PostgreSQL database dump
--

\restrict Jn9BM7aMZ3qe6iFXfJq4MgerGRoqJlnKqcX80T3Q17FOaQo11thWQb2hz1C5j8a

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
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict Jn9BM7aMZ3qe6iFXfJq4MgerGRoqJlnKqcX80T3Q17FOaQo11thWQb2hz1C5j8a

