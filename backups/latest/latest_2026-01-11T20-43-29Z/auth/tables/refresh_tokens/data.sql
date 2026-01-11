--
-- PostgreSQL database dump
--

\restrict p1wZnLpTc7zXOKnzna392E0uWgoJdRjyJVLSBHCZkf6Sfa6KYjebdYUavZsd7d5

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
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	21	2nvditlvwkop	441485d7-961d-4545-b137-3c4518d5852b	f	2025-12-10 00:20:04.574413+00	2025-12-10 00:20:04.574413+00	\N	5d4b2fa0-8b86-4501-aa76-7091b02b6da7
00000000-0000-0000-0000-000000000000	31	lgthxka5u3vu	1123e807-3ddc-4f5b-b601-8ee9f138ae13	t	2025-12-10 14:49:23.623573+00	2025-12-10 17:55:07.356206+00	\N	6ef77502-6086-4bcd-9816-b98d0b296859
00000000-0000-0000-0000-000000000000	32	w4gost5jx2jm	1123e807-3ddc-4f5b-b601-8ee9f138ae13	f	2025-12-10 17:55:07.386902+00	2025-12-10 17:55:07.386902+00	lgthxka5u3vu	6ef77502-6086-4bcd-9816-b98d0b296859
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 32, true);


--
-- PostgreSQL database dump complete
--

\unrestrict p1wZnLpTc7zXOKnzna392E0uWgoJdRjyJVLSBHCZkf6Sfa6KYjebdYUavZsd7d5

