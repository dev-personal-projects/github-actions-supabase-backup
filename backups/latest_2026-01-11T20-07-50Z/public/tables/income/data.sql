--
-- PostgreSQL database dump
--

\restrict l2db9pCRjpUlccpJBadV6WtgRmrheWNtvN9WmcCGTixsFnjro2NFR7XuhQeeCRn

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
-- Data for Name: income; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.income (id, name, amount, date, created_at, updated_at, owner_id, chama_id, created_by_id) FROM stdin;
cd859c01-46f5-4233-9566-b60574576f7b	income v1	3000	2004-08-10 00:00:00+00	2025-12-09 23:00:23.826246+00	2025-12-09 23:00:23.826246+00	3b1f4b2e-25ae-415e-82f2-e125aed86313	b67d3479-8cb0-4a7c-ac72-8c9086769cfb	3b1f4b2e-25ae-415e-82f2-e125aed86313
\.


--
-- PostgreSQL database dump complete
--

\unrestrict l2db9pCRjpUlccpJBadV6WtgRmrheWNtvN9WmcCGTixsFnjro2NFR7XuhQeeCRn

