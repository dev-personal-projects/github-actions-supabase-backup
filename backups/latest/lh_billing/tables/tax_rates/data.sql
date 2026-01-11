--
-- PostgreSQL database dump
--

\restrict w5C2ARc7zCXGyMlStvd7ZdI3bNdh2rY1dBBC2432l2isU5F3nHUDRjbDGnFT36A

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
-- Data for Name: tax_rates; Type: TABLE DATA; Schema: lh_billing; Owner: -
--

COPY lh_billing.tax_rates (tax_rate_id, country_code, tax_type, service_category, rate, is_inclusive, effective_date, end_date, created_at, updated_at) FROM stdin;
\.


--
-- Name: tax_rates_tax_rate_id_seq; Type: SEQUENCE SET; Schema: lh_billing; Owner: -
--

SELECT pg_catalog.setval('lh_billing.tax_rates_tax_rate_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict w5C2ARc7zCXGyMlStvd7ZdI3bNdh2rY1dBBC2432l2isU5F3nHUDRjbDGnFT36A

