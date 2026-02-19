--
-- PostgreSQL database dump
--

\restrict tM5eczFycigpDOplfPqTDwJTsTExKPZQu0MDdbqk5MeZgTPZwQ13IiDUPeHXGMd

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.8 (Ubuntu 17.8-1.pgdg24.04+1)

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
-- Data for Name: invoices; Type: TABLE DATA; Schema: lh_tims_emulator; Owner: -
--

COPY lh_tims_emulator.invoices (id, request_id, mtn, invoice_number, doc_no, transaction_type, invoice_type, total_amount, total_items, issued_at, request_payload, response_payload, created_at, updated_at) FROM stdin;
\.


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: lh_tims_emulator; Owner: -
--

SELECT pg_catalog.setval('lh_tims_emulator.invoices_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict tM5eczFycigpDOplfPqTDwJTsTExKPZQu0MDdbqk5MeZgTPZwQ13IiDUPeHXGMd

