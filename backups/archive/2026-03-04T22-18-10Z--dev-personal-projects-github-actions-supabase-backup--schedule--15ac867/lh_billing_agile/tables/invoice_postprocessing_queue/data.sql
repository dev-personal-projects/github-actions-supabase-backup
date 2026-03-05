--
-- PostgreSQL database dump
--

\restrict 9NdPxHoRc3kknDJiC3CezFtID1ZbAl4crBvG0A3HxvfxrLk9ZGHMNrXdyECh0c3

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.9 (Ubuntu 17.9-1.pgdg24.04+1)

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
41	21	1	completed	0	2026-03-04 08:22:48.299963+00	10	\N	\N	\N	\N	2026-03-04 08:22:48.299963+00	2026-03-04 08:22:48.57474+00
42	22	1	completed	0	2026-03-04 08:22:48.299963+00	10	\N	\N	\N	\N	2026-03-04 08:22:48.299963+00	2026-03-04 08:22:48.647581+00
43	23	2	completed	0	2026-03-04 08:22:48.299963+00	10	\N	\N	\N	\N	2026-03-04 08:22:48.299963+00	2026-03-04 08:22:52.370288+00
38	19	2	completed	0	2026-03-04 08:22:48.299963+00	10	\N	\N	\N	\N	2026-03-04 08:22:48.299963+00	2026-03-04 08:22:52.422241+00
44	24	2	completed	0	2026-03-04 08:22:48.299963+00	10	\N	\N	\N	\N	2026-03-04 08:22:48.299963+00	2026-03-04 08:22:52.543238+00
40	20	2	completed	0	2026-03-04 08:22:48.299963+00	10	\N	\N	\N	\N	2026-03-04 08:22:48.299963+00	2026-03-04 08:22:52.688291+00
\.


--
-- Name: invoice_postprocessing_queue_invoice_postprocessing_queue_i_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_postprocessing_queue_invoice_postprocessing_queue_i_seq', 54, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 9NdPxHoRc3kknDJiC3CezFtID1ZbAl4crBvG0A3HxvfxrLk9ZGHMNrXdyECh0c3

