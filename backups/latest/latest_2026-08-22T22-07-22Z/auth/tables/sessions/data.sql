--
-- PostgreSQL database dump
--

\restrict pM5h76tABaws4UHLQAMrm2qfYxYgQaHbDHH4gZkhzaj99HpeM7EG268YnFJPTFf

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.11 (Ubuntu 17.11-1.pgdg24.04+2)

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
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
c6234ef1-56c1-4e5a-ac31-28e0840fcdeb	797045f3-95c1-4956-aeca-36947cc51e7e	2026-05-21 14:17:20.31479+00	2026-05-21 14:17:20.31479+00	\N	aal1	\N	\N	node	129.222.187.142	\N	\N	\N	\N	\N
\.


--
-- PostgreSQL database dump complete
--

\unrestrict pM5h76tABaws4UHLQAMrm2qfYxYgQaHbDHH4gZkhzaj99HpeM7EG268YnFJPTFf

