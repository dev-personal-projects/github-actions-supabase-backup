--
-- PostgreSQL database dump
--

\restrict JTepVMhzdu7iJkafrtJPp8W3VGMQu6IXnffncqiA0zgH8AUhL767DK8WWPRgfFT

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
-- Data for Name: invoice_postprocessing_queue; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoice_postprocessing_queue (invoice_postprocessing_queue_id, invoice_id, pipeline_version_id, status, attempt_count, next_attempt_at, max_attempts, locked_at, locked_by, blocked_reason, last_error, created_at, updated_at) FROM stdin;
\.


--
-- Name: invoice_postprocessing_queue_invoice_postprocessing_queue_i_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_postprocessing_queue_invoice_postprocessing_queue_i_seq', 72, true);


--
-- PostgreSQL database dump complete
--

\unrestrict JTepVMhzdu7iJkafrtJPp8W3VGMQu6IXnffncqiA0zgH8AUhL767DK8WWPRgfFT

