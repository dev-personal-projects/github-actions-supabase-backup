--
-- PostgreSQL database dump
--

\restrict 0bJuE5rERmNoXihyo3hLM8kNmKViDAhw2zX7u2afwXIyPJJ7t5GKfB0ira2fAZW

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
-- Data for Name: sent_logs; Type: TABLE DATA; Schema: lh_payproof; Owner: -
--

COPY lh_payproof.sent_logs (sent_log_id, primary_approver_id, primary_approver_email, year_month, trigger_type, filter_value, correlation_id, send_status, force_sent, sent_at, error_message, created_at, updated_at) FROM stdin;
1	3	duane@shipht.it	2026-02-01	Timer	ALL	dd9ffbaa-a9cc-4e04-9959-ccbf7a7fbf1b	sent	f	2026-02-20 05:00:07.668079+00	\N	2026-02-20 05:00:06.444711+00	2026-02-20 05:00:07.668079+00
2	1	collins.munene@shipht.it	2026-02-01	Timer	ALL	dd9ffbaa-a9cc-4e04-9959-ccbf7a7fbf1b	sent	f	2026-02-20 05:00:08.113591+00	\N	2026-02-20 05:00:07.698455+00	2026-02-20 05:00:08.113591+00
3	3	duane@shipht.it	2026-03-01	Timer	ALL	4b08ce21-16b4-4ce9-b7c9-82f92fd0604d	sent	f	2026-03-20 05:00:02.708819+00	\N	2026-03-20 05:00:01.015241+00	2026-03-20 05:00:02.708819+00
4	1	collins.munene@shipht.it	2026-03-01	Timer	ALL	4b08ce21-16b4-4ce9-b7c9-82f92fd0604d	sent	f	2026-03-20 05:00:03.4384+00	\N	2026-03-20 05:00:02.725809+00	2026-03-20 05:00:03.4384+00
5	3	duane@shipht.it	2026-06-01	Timer	ALL	fc6dadd4-0ce7-4bd5-999a-f07c51a1e36a	sent	f	2026-06-20 04:58:46.497016+00	\N	2026-06-20 04:58:44.569389+00	2026-06-20 04:58:46.497016+00
6	1	collins.munene@shipht.it	2026-06-01	Timer	ALL	fc6dadd4-0ce7-4bd5-999a-f07c51a1e36a	sent	f	2026-06-20 04:58:47.142634+00	\N	2026-06-20 04:58:46.512598+00	2026-06-20 04:58:47.142634+00
\.


--
-- Name: sent_logs_sent_log_id_seq; Type: SEQUENCE SET; Schema: lh_payproof; Owner: -
--

SELECT pg_catalog.setval('lh_payproof.sent_logs_sent_log_id_seq', 6, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 0bJuE5rERmNoXihyo3hLM8kNmKViDAhw2zX7u2afwXIyPJJ7t5GKfB0ira2fAZW

