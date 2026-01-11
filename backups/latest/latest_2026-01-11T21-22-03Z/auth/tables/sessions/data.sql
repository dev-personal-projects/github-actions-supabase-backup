--
-- PostgreSQL database dump
--

\restrict eIeeDhG1lTAmPiavhoc8WMbUATZVWNjngXNjXM0fpEDu2Yicj1ghi3NAghE1dmH

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
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter, scopes) FROM stdin;
5d4b2fa0-8b86-4501-aa76-7091b02b6da7	441485d7-961d-4545-b137-3c4518d5852b	2025-12-10 00:20:04.573419+00	2025-12-10 00:20:04.573419+00	\N	aal1	\N	\N	node	197.248.227.183	\N	\N	\N	\N	\N
6ef77502-6086-4bcd-9816-b98d0b296859	1123e807-3ddc-4f5b-b601-8ee9f138ae13	2025-12-10 14:49:23.622529+00	2025-12-10 17:55:07.4175+00	\N	aal1	\N	2025-12-10 17:55:07.4174	node	197.248.227.183	\N	\N	\N	\N	\N
\.


--
-- PostgreSQL database dump complete
--

\unrestrict eIeeDhG1lTAmPiavhoc8WMbUATZVWNjngXNjXM0fpEDu2Yicj1ghi3NAghE1dmH

