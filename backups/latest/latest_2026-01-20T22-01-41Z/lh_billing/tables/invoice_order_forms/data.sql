--
-- PostgreSQL database dump
--

\restrict I8VykqyRb5vSnzYQkcd6AulJk7BZ2LYrayxBZ6fFDNGEnhLRgUcZnb8fpggGOOu

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
-- Data for Name: invoice_order_forms; Type: TABLE DATA; Schema: lh_billing; Owner: -
--

COPY lh_billing.invoice_order_forms (invoice_order_form_id, invoice_id, ofrm_id, source_period_start, source_period_end, created_at, updated_at) FROM stdin;
1	1	4	2026-01-11	2026-03-31	2026-01-11 20:06:17.540037+00	2026-01-11 20:06:17.540037+00
2	2	4	2026-04-01	2026-06-30	2026-01-11 20:06:23.839217+00	2026-01-11 20:06:23.839217+00
3	3	4	2026-07-01	2026-09-30	2026-01-11 20:06:28.217792+00	2026-01-11 20:06:28.217792+00
4	4	4	2026-10-01	2026-12-31	2026-01-11 20:06:32.750601+00	2026-01-11 20:06:32.750601+00
5	5	4	2027-01-01	2027-03-31	2026-01-11 20:06:37.478089+00	2026-01-11 20:06:37.478089+00
6	6	4	2027-04-01	2027-06-30	2026-01-11 20:06:42.180627+00	2026-01-11 20:06:42.180627+00
7	7	4	2027-07-01	2027-09-30	2026-01-11 20:06:46.568409+00	2026-01-11 20:06:46.568409+00
8	8	4	2027-10-01	2027-12-31	2026-01-11 20:06:50.74856+00	2026-01-11 20:06:50.74856+00
9	9	4	2028-01-01	2028-03-31	2026-01-11 20:06:54.765636+00	2026-01-11 20:06:54.765636+00
10	10	4	2028-04-01	2028-06-30	2026-01-11 20:06:59.130238+00	2026-01-11 20:06:59.130238+00
\.


--
-- Name: invoice_order_forms_invoice_order_form_id_seq; Type: SEQUENCE SET; Schema: lh_billing; Owner: -
--

SELECT pg_catalog.setval('lh_billing.invoice_order_forms_invoice_order_form_id_seq', 10, true);


--
-- PostgreSQL database dump complete
--

\unrestrict I8VykqyRb5vSnzYQkcd6AulJk7BZ2LYrayxBZ6fFDNGEnhLRgUcZnb8fpggGOOu

