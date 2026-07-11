--
-- PostgreSQL database dump
--

\restrict dL8nnbczZJOFYgTWKJWdfKhIrrNdDf5drnmF7Bg1onDKbzL4fwRzlFaeIs7RL8f

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.10 (Ubuntu 17.10-1.pgdg24.04+1)

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
00000000-0000-0000-0000-000000000000	113	vutaq53mfiox	797045f3-95c1-4956-aeca-36947cc51e7e	f	2026-05-21 14:17:20.316013+00	2026-05-21 14:17:20.316013+00	\N	c6234ef1-56c1-4e5a-ac31-28e0840fcdeb
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: -
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 113, true);


--
-- PostgreSQL database dump complete
--

\unrestrict dL8nnbczZJOFYgTWKJWdfKhIrrNdDf5drnmF7Bg1onDKbzL4fwRzlFaeIs7RL8f

