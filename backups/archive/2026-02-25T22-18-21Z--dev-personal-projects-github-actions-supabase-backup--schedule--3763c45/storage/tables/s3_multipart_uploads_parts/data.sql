--
-- PostgreSQL database dump
--

\restrict foOAAz4i1nw2ef93BSHw0OPopDkUjsjg7jEvGQLSdJuf9Efu01aFveDOxOhRNJH

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
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict foOAAz4i1nw2ef93BSHw0OPopDkUjsjg7jEvGQLSdJuf9Efu01aFveDOxOhRNJH

