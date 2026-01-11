--
-- PostgreSQL database dump
--

\restrict cMaOnp4hM82NC3vXALXudiFlaDCNSjM9FFZQVo9ejrIKdAYrssbZouaT24ezsU2

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
-- Data for Name: contributions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contributions (id, title, due_date, amount, created_at, updated_at, chama_id, created_by_id) FROM stdin;
78baeaa9-dfec-4612-8d55-1bf02506101b	health care	2010-08-10	600	2025-12-09 23:01:03.349385+00	2025-12-09 23:01:03.349385+00	b67d3479-8cb0-4a7c-ac72-8c9086769cfb	3b1f4b2e-25ae-415e-82f2-e125aed86313
b9e13cab-593a-452e-b823-c337c53d4ec5	furnitures	2025-12-12	500	2025-12-10 14:48:19.401221+00	2025-12-10 14:48:19.401221+00	5e0835fe-ef7c-4932-a76f-f515840ff7ef	0d37dd3f-69d5-48c8-a8bb-42c52fad80b6
\.


--
-- PostgreSQL database dump complete
--

\unrestrict cMaOnp4hM82NC3vXALXudiFlaDCNSjM9FFZQVo9ejrIKdAYrssbZouaT24ezsU2

