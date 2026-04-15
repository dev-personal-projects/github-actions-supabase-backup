--
-- PostgreSQL database dump
--

\restrict c7LtdcGgnAhoqs9bm8cYn9ptCq5xpQtoAKctCRDrd2YaNTW18WarsyUo4apTgln

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
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.oauth_client_states (id, provider_type, code_verifier, created_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict c7LtdcGgnAhoqs9bm8cYn9ptCq5xpQtoAKctCRDrd2YaNTW18WarsyUo4apTgln

