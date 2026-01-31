--
-- PostgreSQL database dump
--

\restrict Z6iyfVkHo4oFliwTZmXrBVmy7aOkd3986kY4hfpgIgsHUHGqZ51cebDrxa0DAgW

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
-- Data for Name: billing_units; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.billing_units (billing_unit_id, unit_code, unit_description, created_at, updated_at) FROM stdin;
1	month	Monthly billing	2026-01-27 13:12:17.97089+00	2026-01-27 13:12:17.97089+00
2	day	Daily billing	2026-01-27 13:12:17.97089+00	2026-01-27 13:12:17.97089+00
3	hour	Hourly billing	2026-01-27 13:12:17.97089+00	2026-01-27 13:12:17.97089+00
4	fixed	Fixed/one-time fee	2026-01-27 13:12:17.97089+00	2026-01-27 13:12:17.97089+00
5	each	Per-item charge (e.g., goods)	2026-01-27 13:12:17.97089+00	2026-01-27 13:12:17.97089+00
\.


--
-- Name: billing_units_billing_unit_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.billing_units_billing_unit_id_seq', 5, true);


--
-- PostgreSQL database dump complete
--

\unrestrict Z6iyfVkHo4oFliwTZmXrBVmy7aOkd3986kY4hfpgIgsHUHGqZ51cebDrxa0DAgW

