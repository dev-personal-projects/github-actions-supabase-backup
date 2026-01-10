--
-- PostgreSQL database dump
--

\restrict RkDwNIdx8dzwuuGWj8hNf89CsDwOoUkhUPieo40Q1dhNKltJlBtcrhN0QesGZ6r

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
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.expenses (id, name, amount, date, description, created_at, updated_at, chama_id, created_by_id) FROM stdin;
809c36b4-668a-4350-96eb-daa84cf67d62	furnitures	50000	2025-10-20 00:00:00+00	jvkcvnkcbmlkxc	2025-12-09 23:04:48.183693+00	2025-12-09 23:04:48.183693+00	b67d3479-8cb0-4a7c-ac72-8c9086769cfb	3b1f4b2e-25ae-415e-82f2-e125aed86313
9148a47a-ba11-47f4-9d77-9f30f7637cf5	food	10000	2025-12-01 00:00:00+00	\N	2025-12-10 14:44:31.482349+00	2025-12-10 14:44:31.482349+00	5e0835fe-ef7c-4932-a76f-f515840ff7ef	0d37dd3f-69d5-48c8-a8bb-42c52fad80b6
\.


--
-- PostgreSQL database dump complete
--

\unrestrict RkDwNIdx8dzwuuGWj8hNf89CsDwOoUkhUPieo40Q1dhNKltJlBtcrhN0QesGZ6r

