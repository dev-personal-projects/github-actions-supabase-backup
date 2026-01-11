--
-- PostgreSQL database dump
--

\restrict 9g64hSakq1rz7NHRRRgyOHvEYQFVvF7ebJXSM2qD43Adft3ZGwFGD9eCbtCronW

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
-- Data for Name: chama_profiles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.chama_profiles (id, chama_id, profile_id, role, created_at, updated_at) FROM stdin;
3b1f4b2e-25ae-415e-82f2-e125aed86313	b67d3479-8cb0-4a7c-ac72-8c9086769cfb	1123e807-3ddc-4f5b-b601-8ee9f138ae13	admin	2025-12-09 22:53:23.717121+00	2025-12-09 22:53:23.717121+00
0bc6fb57-1e42-40ae-af9e-f3e81695437d	b67d3479-8cb0-4a7c-ac72-8c9086769cfb	3d684228-c711-47bf-b6bd-f9d3c81a6b8b	member	2025-12-09 22:57:53.030306+00	2025-12-09 22:57:53.030306+00
26181be5-417e-4023-8442-27ac46ec9d93	b67d3479-8cb0-4a7c-ac72-8c9086769cfb	441485d7-961d-4545-b137-3c4518d5852b	member	2025-12-10 00:02:15.561325+00	2025-12-10 00:02:15.561325+00
0d37dd3f-69d5-48c8-a8bb-42c52fad80b6	5e0835fe-ef7c-4932-a76f-f515840ff7ef	1123e807-3ddc-4f5b-b601-8ee9f138ae13	admin	2025-12-10 14:16:13.263616+00	2025-12-10 14:16:13.263616+00
f95649a7-2900-4b73-b9e6-02254340c463	5e0835fe-ef7c-4932-a76f-f515840ff7ef	3d684228-c711-47bf-b6bd-f9d3c81a6b8b	member	2025-12-10 14:18:55.301196+00	2025-12-10 14:18:55.301196+00
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 9g64hSakq1rz7NHRRRgyOHvEYQFVvF7ebJXSM2qD43Adft3ZGwFGD9eCbtCronW

