--
-- PostgreSQL database dump
--

\restrict YsaDwBx9TSzbxALo4nXBlOgs5lCFXPhQfXk8uWGOy9x0c1p9Prv6ueuV8vcchHC

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
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
c6234ef1-56c1-4e5a-ac31-28e0840fcdeb	2026-05-21 14:17:20.319001+00	2026-05-21 14:17:20.319001+00	email/signup	2d42fd5d-8345-418a-8f15-c9d94c731ef1
\.


--
-- PostgreSQL database dump complete
--

\unrestrict YsaDwBx9TSzbxALo4nXBlOgs5lCFXPhQfXk8uWGOy9x0c1p9Prv6ueuV8vcchHC

