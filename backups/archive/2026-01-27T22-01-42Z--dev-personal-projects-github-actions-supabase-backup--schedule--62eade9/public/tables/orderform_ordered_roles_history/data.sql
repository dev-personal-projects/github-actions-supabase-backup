--
-- PostgreSQL database dump
--

\restrict EZE5FXvlgQolyTEPXGLWgBWZVsC9x86T7dOAZK67OOQ4LeYhgcrOMK1Sc4FlOqZ

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
-- Data for Name: orderform_ordered_roles_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orderform_ordered_roles_history (ofrm_odrl_hist_id, ofrm_odrl_hist_prfx_id, odrl_id, status, effective_from, effective_to, updated_at) FROM stdin;
1	ODRLHST-1	1	Active	2026-01-27 13:07:49.548908+00	\N	2026-01-27 13:07:49.548908+00
2	ODRLHST-2	2	Active	2026-01-27 13:07:49.548908+00	\N	2026-01-27 13:07:49.548908+00
3	ODRLHST-3	3	Active	2026-01-27 13:07:49.548908+00	\N	2026-01-27 13:07:49.548908+00
4	ODRLHST-4	4	Active	2026-01-27 13:07:49.548908+00	\N	2026-01-27 13:07:49.548908+00
5	ODRLHST-5	5	Active	2026-01-27 13:07:49.548908+00	\N	2026-01-27 13:07:49.548908+00
6	ODRLHST-6	6	Active	2026-01-27 13:07:49.548908+00	\N	2026-01-27 13:07:49.548908+00
7	ODRLHST-7	7	Active	2026-01-27 13:07:49.548908+00	\N	2026-01-27 13:07:49.548908+00
8	ODRLHST-8	8	Active	2026-01-27 13:07:49.548908+00	\N	2026-01-27 13:07:49.548908+00
9	ODRLHST-9	9	Active	2026-01-27 13:07:49.548908+00	\N	2026-01-27 13:07:49.548908+00
10	ODRLHST-10	10	Active	2026-01-27 13:07:49.548908+00	\N	2026-01-27 13:07:49.548908+00
11	ODRLHST-11	11	Active	2026-01-27 13:07:49.548908+00	\N	2026-01-27 13:07:49.548908+00
12	ODRLHST-12	12	Active	2026-01-27 13:07:49.548908+00	\N	2026-01-27 13:07:49.548908+00
\.


--
-- Name: orderform_ordered_roles_history_ofrm_odrl_hist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orderform_ordered_roles_history_ofrm_odrl_hist_id_seq', 12, true);


--
-- PostgreSQL database dump complete
--

\unrestrict EZE5FXvlgQolyTEPXGLWgBWZVsC9x86T7dOAZK67OOQ4LeYhgcrOMK1Sc4FlOqZ

