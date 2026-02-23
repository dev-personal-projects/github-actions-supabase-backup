--
-- PostgreSQL database dump
--

\restrict qOKpP1S8WwsoUycThju7BJNfyHXacTSuH8Kr8Dli0EY7pcfkW2A5mZmelUhQyCl

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.8 (Ubuntu 17.8-1.pgdg24.04+1)

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
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict qOKpP1S8WwsoUycThju7BJNfyHXacTSuH8Kr8Dli0EY7pcfkW2A5mZmelUhQyCl

