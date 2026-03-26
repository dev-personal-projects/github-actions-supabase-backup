--
-- PostgreSQL database dump
--

\restrict ZbFSoqw0CDqpgyg1BsqWZeinON3OOu0OeEzIXdXxrp0mOqR7LgB7qVsxAl5lQvJ

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
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict ZbFSoqw0CDqpgyg1BsqWZeinON3OOu0OeEzIXdXxrp0mOqR7LgB7qVsxAl5lQvJ

