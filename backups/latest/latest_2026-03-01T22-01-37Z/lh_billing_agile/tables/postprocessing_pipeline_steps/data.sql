--
-- PostgreSQL database dump
--

\restrict tJ95B2E6Tw59ZbT4VIHMFLUNb1MfiVqZaDveG8wizBhTn0fiRo1rBoAex0AYv3X

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
-- Data for Name: postprocessing_pipeline_steps; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.postprocessing_pipeline_steps (postprocessing_pipeline_step_id, postprocessing_pipeline_version_id, step_order, step_key, step_config, created_at, updated_at) FROM stdin;
197	100	1	tims.register_invoice	\N	2026-03-01 16:08:45.512352+00	2026-03-01 16:08:45.512352+00
198	100	2	pdf.overlay_qr_stamp	\N	2026-03-01 16:08:45.512352+00	2026-03-01 16:08:45.512352+00
199	101	1	tims.register_invoice	\N	2026-03-01 16:08:55.826928+00	2026-03-01 16:08:55.826928+00
200	101	2	pdf.overlay_qr_stamp	\N	2026-03-01 16:08:55.826928+00	2026-03-01 16:08:55.826928+00
\.


--
-- Name: postprocessing_pipeline_steps_postprocessing_pipeline_step__seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.postprocessing_pipeline_steps_postprocessing_pipeline_step__seq', 200, true);


--
-- PostgreSQL database dump complete
--

\unrestrict tJ95B2E6Tw59ZbT4VIHMFLUNb1MfiVqZaDveG8wizBhTn0fiRo1rBoAex0AYv3X

