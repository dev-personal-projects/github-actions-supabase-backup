--
-- PostgreSQL database dump
--

\restrict U0oe15SpDgzUU6nOMVlHi6LWYc90xPXhbZhvuhZdMvdxfrldoO12r44KhnJXc6f

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
-- Data for Name: orderform_primaries; Type: TABLE DATA; Schema: lh_payproof; Owner: -
--

COPY lh_payproof.orderform_primaries (orderform_primary_id, order_form_id, primary_approver_id, created_at, updated_at) FROM stdin;
1	1	3	2026-01-09 09:27:27.204643+00	2026-01-09 09:27:27.204643+00
2	2	1	2026-01-09 09:27:27.204643+00	2026-01-09 09:27:27.204643+00
3	3	2	2026-01-09 09:27:27.204643+00	2026-01-09 09:27:27.204643+00
\.


--
-- Name: orderform_primaries_orderform_primary_id_seq; Type: SEQUENCE SET; Schema: lh_payproof; Owner: -
--

SELECT pg_catalog.setval('lh_payproof.orderform_primaries_orderform_primary_id_seq', 3, true);


--
-- PostgreSQL database dump complete
--

\unrestrict U0oe15SpDgzUU6nOMVlHi6LWYc90xPXhbZhvuhZdMvdxfrldoO12r44KhnJXc6f

