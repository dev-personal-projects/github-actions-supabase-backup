--
-- PostgreSQL database dump
--

\restrict 4HguZ6J4cN5BiIP05pbyXlrqf6ugJPaCPZcQWNO7zwZyWTEjnJRBKg5Rw1xZ7Uu

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
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 4HguZ6J4cN5BiIP05pbyXlrqf6ugJPaCPZcQWNO7zwZyWTEjnJRBKg5Rw1xZ7Uu

