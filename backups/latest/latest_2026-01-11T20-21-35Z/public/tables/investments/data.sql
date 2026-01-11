--
-- PostgreSQL database dump
--

\restrict f4zvVkwG7oHT6LJEqbbzTuVYhKX47ZHpQQAq9nNf5vrIZvRW6TlSEodMnRKGEBs

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
-- Data for Name: investments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.investments (id, name, amount, date, created_at, updated_at, chama_id, created_by_id) FROM stdin;
fe934554-12a3-4496-97df-59393154b5dc	investment p4	5000	2004-08-10 00:00:00+00	2025-12-09 22:59:34.365453+00	2025-12-09 22:59:51.547294+00	b67d3479-8cb0-4a7c-ac72-8c9086769cfb	3b1f4b2e-25ae-415e-82f2-e125aed86313
\.


--
-- PostgreSQL database dump complete
--

\unrestrict f4zvVkwG7oHT6LJEqbbzTuVYhKX47ZHpQQAq9nNf5vrIZvRW6TlSEodMnRKGEBs

