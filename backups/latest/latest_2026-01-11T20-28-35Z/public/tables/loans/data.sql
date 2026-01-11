--
-- PostgreSQL database dump
--

\restrict 96hxmuxZG2boWp25wvmcbPJ92I6ZTEGqbhIUJ8lTx1Se5lI6acrk1z7CFBBmfoj

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
-- Data for Name: loans; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.loans (id, name, amount, interest_rate, duration, created_at, updated_at, chama_id, created_by_id) FROM stdin;
970bd485-7548-4ad0-9496-3728a9c89dec	farmers loan	400000	12	36	2025-12-09 23:02:18.945007+00	2025-12-09 23:02:18.945007+00	b67d3479-8cb0-4a7c-ac72-8c9086769cfb	3b1f4b2e-25ae-415e-82f2-e125aed86313
56e6a539-09f3-4f66-b1fc-8a4a126483db	business enhancement	600000	15	60	2025-12-10 12:37:04.756307+00	2025-12-10 12:37:04.756307+00	b67d3479-8cb0-4a7c-ac72-8c9086769cfb	3b1f4b2e-25ae-415e-82f2-e125aed86313
db00015c-c473-44b3-9964-914330aa1701	school fees	20000	12	3	2025-12-10 14:29:31.82359+00	2025-12-10 14:29:31.82359+00	5e0835fe-ef7c-4932-a76f-f515840ff7ef	0d37dd3f-69d5-48c8-a8bb-42c52fad80b6
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 96hxmuxZG2boWp25wvmcbPJ92I6ZTEGqbhIUJ8lTx1Se5lI6acrk1z7CFBBmfoj

