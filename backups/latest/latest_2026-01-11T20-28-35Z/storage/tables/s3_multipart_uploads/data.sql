--
-- PostgreSQL database dump
--

\restrict 68ZSmN4bGGguHwUte8ZCI2yYYJyLZ0flk4WbOZ4yI82SWhPbIDcwH2cxMyKzkqo

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.7 (Ubuntu 17.7-3.pgdg24.04+1)

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
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 68ZSmN4bGGguHwUte8ZCI2yYYJyLZ0flk4WbOZ4yI82SWhPbIDcwH2cxMyKzkqo

