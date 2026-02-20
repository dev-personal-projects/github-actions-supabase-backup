--
-- PostgreSQL database dump
--

\restrict 8t1VQIUKiYzs0ui0GBPH4kqnQ3e0ANPuHx6NkLhXM9CJdb02MGBvMf3Dtwg54Hm

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.8 (Ubuntu 17.8-1.pgdg24.04+1)

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
-- Data for Name: invoice_postprocessing_events; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoice_postprocessing_events (invoice_postprocessing_event_id, invoice_id, pipeline_version_id, step_key, outcome, message, correlation_id, created_at) FROM stdin;
1	3	1	pipeline.no_postprocessing	succeeded	\N	smoke-email-001-1771613884	2026-02-20 18:58:28.323646+00
2	4	1	pipeline.no_postprocessing	succeeded	\N	smoke-email-001-1771613884	2026-02-20 18:58:28.488571+00
\.


--
-- Name: invoice_postprocessing_events_invoice_postprocessing_event__seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_postprocessing_events_invoice_postprocessing_event__seq', 2, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 8t1VQIUKiYzs0ui0GBPH4kqnQ3e0ANPuHx6NkLhXM9CJdb02MGBvMf3Dtwg54Hm

