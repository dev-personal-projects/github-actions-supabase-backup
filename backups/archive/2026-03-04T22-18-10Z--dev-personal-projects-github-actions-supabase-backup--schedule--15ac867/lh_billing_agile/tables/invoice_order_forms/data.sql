--
-- PostgreSQL database dump
--

\restrict SKYNPEO1wQUMGm0Q6HDIgl4Olzq3pqcVv35AgR00I55Uqkd24Sqn4ZvRVR020yu

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
-- Data for Name: invoice_order_forms; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoice_order_forms (invoice_order_form_id, invoice_id, ofrm_id, source_period_start, source_period_end, created_at, updated_at) FROM stdin;
19	19	900001	2026-03-04	2026-03-31	2026-03-04 08:22:30.585998+00	2026-03-04 08:22:30.585998+00
20	20	900001	2026-04-01	2026-06-30	2026-03-04 08:22:30.733113+00	2026-03-04 08:22:30.733113+00
21	21	901001	2026-03-04	2026-03-31	2026-03-04 08:22:32.971822+00	2026-03-04 08:22:32.971822+00
22	22	901001	2026-04-01	2026-06-30	2026-03-04 08:22:33.059108+00	2026-03-04 08:22:33.059108+00
23	23	902001	2026-03-04	2026-03-31	2026-03-04 08:22:34.380965+00	2026-03-04 08:22:34.380965+00
24	24	902001	2026-04-01	2026-06-30	2026-03-04 08:22:34.497798+00	2026-03-04 08:22:34.497798+00
\.


--
-- Name: invoice_order_forms_invoice_order_form_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_order_forms_invoice_order_form_id_seq', 24, true);


--
-- PostgreSQL database dump complete
--

\unrestrict SKYNPEO1wQUMGm0Q6HDIgl4Olzq3pqcVv35AgR00I55Uqkd24Sqn4ZvRVR020yu

