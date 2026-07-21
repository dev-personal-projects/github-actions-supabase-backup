--
-- PostgreSQL database dump
--

\restrict l2UXKioHp3RgFrVGvMnxj2Z3nzq5ulPhwE9n0TeEakv6x5xRuwlNe6W5dHu7cHW

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
-- Data for Name: global_configurations; Type: TABLE DATA; Schema: lh_billing_system; Owner: -
--

COPY lh_billing_system.global_configurations (global_configuration_id, cfg_key, cfg_value, cfg_description, created_at, updated_at) FROM stdin;
1	InvoiceSellerDefaults	{\n  "name": "Good Info Ltd",\n  "attention": null,\n  "email": "billing@goodinfo.consulting",\n  "phone": "+254 (070) 700-3521",\n  "addressLine1": "Ikigai Westlands, Peponi Road.",\n  "addressLine2": "P.O. Box 52627-00100,",\n  "city": "Nairobi",\n  "country": "Kenya",\n  "taxId": "P051350348U"\n}	Default invoice seller details (global fallback). JSON payload maps to InvoiceParty fields.	2026-03-03 15:53:53.116999+00	2026-03-03 15:53:53.116999+00
2	InvoiceSellerDefaults.KE	{\n  "name": "Good Info Ltd",\n  "attention": null,\n  "email": "billing@goodinfo.consulting",\n  "phone": "+254 (070) 700-3521",\n  "addressLine1": "Ikigai Westlands, Peponi Road.",\n  "addressLine2": "P.O. Box 52627-00100,",\n  "city": "Nairobi",\n  "country": "Kenya",\n  "taxId": "P051350348U"\n}	Invoice seller details override for Kenya (KE).	2026-03-03 15:53:53.116999+00	2026-03-03 15:53:53.116999+00
\.


--
-- Name: global_configurations_global_configuration_id_seq; Type: SEQUENCE SET; Schema: lh_billing_system; Owner: -
--

SELECT pg_catalog.setval('lh_billing_system.global_configurations_global_configuration_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

\unrestrict l2UXKioHp3RgFrVGvMnxj2Z3nzq5ulPhwE9n0TeEakv6x5xRuwlNe6W5dHu7cHW

