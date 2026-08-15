--
-- PostgreSQL database dump
--

\restrict TOVW8vDQR1M3eSRzzs27qgACuXagieyIXzSjneEgT5nIMWFrUj59sq6gk9KXUNc

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
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: -
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at, action_filter) FROM stdin;
\.


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: -
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

\unrestrict TOVW8vDQR1M3eSRzzs27qgACuXagieyIXzSjneEgT5nIMWFrUj59sq6gk9KXUNc

