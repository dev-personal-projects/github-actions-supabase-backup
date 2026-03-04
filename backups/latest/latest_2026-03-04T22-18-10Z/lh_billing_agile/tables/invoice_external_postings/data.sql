--
-- PostgreSQL database dump
--

\restrict 5MMHKGTwnUsLuh7cSo3gbIuCuLpnZDe7WapOVd1wQua2EECgrze88QZcOx4Ly8N

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
-- Data for Name: invoice_external_postings; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoice_external_postings (invoice_external_posting_id, invoice_id, system, external_id, idempotency_key, posted_at, metadata, last_error, created_at, updated_at) FROM stdin;
30	24	tims	0000000000000000044	tims:tims.register_invoice:24	2026-02-26 15:17:44.3703+00	{"msn": "KRAMW000000000000000", "raw": "{\\"messages\\":\\"Success\\",\\"DateTime\\":\\"2026-02-26T15:17:44.3703008\\\\u002B00:00\\",\\"invoiceNumber\\":\\"0000000000000000044\\",\\"invoiceExtension\\":\\"TAX INVOICE\\",\\"msn\\":\\"KRAMW000000000000000\\",\\"relevantNumber\\":null,\\"totalAmount\\":1065000.000000,\\"totalItems\\":4,\\"verificationUrl\\":\\"https://tims-test.kra.go.ke/KRA-Portal/invoiceChk.htm?actionCode=loadPage\\\\u0026invoiceNo=0000000000000000044\\"}", "totals": {"totalItems": 4, "totalAmount": 1065000.000000}, "issuedAt": "2026-02-26T15:17:44.3703008+00:00", "requestId": "14c94e6eac6d309868b017eff44f2502", "timsBaseUrl": "https://tims-test.kra.go.ke:443/", "invoiceNumber": "0000000000000000044", "relevantNumber": "", "verificationUrl": "https://tims-test.kra.go.ke/KRA-Portal/invoiceChk.htm?actionCode=loadPage&invoiceNo=0000000000000000044", "invoiceExtension": "TAX INVOICE", "deviceSerialNumber": "AAA0000000000"}	\N	2026-03-04 08:22:52.430681+00	2026-03-04 08:22:52.477055+00
26	20	tims	0000000000000000040	tims:tims.register_invoice:20	2026-02-26 11:27:56.717476+00	{"msn": "KRAMW000000000000000", "raw": "{\\"messages\\":\\"Success\\",\\"DateTime\\":\\"2026-02-26T11:27:56.7174767\\\\u002B00:00\\",\\"invoiceNumber\\":\\"0000000000000000040\\",\\"invoiceExtension\\":\\"TAX INVOICE\\",\\"msn\\":\\"KRAMW000000000000000\\",\\"relevantNumber\\":null,\\"totalAmount\\":1065000.000000,\\"totalItems\\":4,\\"verificationUrl\\":\\"https://tims-test.kra.go.ke/KRA-Portal/invoiceChk.htm?actionCode=loadPage\\\\u0026invoiceNo=0000000000000000040\\"}", "totals": {"totalItems": 4, "totalAmount": 1065000.000000}, "issuedAt": "2026-02-26T11:27:56.7174767+00:00", "requestId": "817e668a9280af705ba8503c1081332c", "timsBaseUrl": "https://tims-test.kra.go.ke:443/", "invoiceNumber": "0000000000000000040", "relevantNumber": "", "verificationUrl": "https://tims-test.kra.go.ke/KRA-Portal/invoiceChk.htm?actionCode=loadPage&invoiceNo=0000000000000000040", "invoiceExtension": "TAX INVOICE", "deviceSerialNumber": "AAA0000000000"}	\N	2026-03-04 08:22:48.619077+00	2026-03-04 08:22:52.609737+00
25	19	tims	0000000000000000039	tims:tims.register_invoice:19	2026-02-26 11:27:48.988803+00	{"msn": "KRAMW000000000000000", "raw": "{\\"messages\\":\\"Success\\",\\"DateTime\\":\\"2026-02-26T11:27:48.9888038\\\\u002B00:00\\",\\"invoiceNumber\\":\\"0000000000000000039\\",\\"invoiceExtension\\":\\"TAX INVOICE\\",\\"msn\\":\\"KRAMW000000000000000\\",\\"relevantNumber\\":null,\\"totalAmount\\":393020.500000,\\"totalItems\\":4,\\"verificationUrl\\":\\"https://tims-test.kra.go.ke/KRA-Portal/invoiceChk.htm?actionCode=loadPage\\\\u0026invoiceNo=0000000000000000039\\"}", "totals": {"totalItems": 4, "totalAmount": 393020.500000}, "issuedAt": "2026-02-26T11:27:48.9888038+00:00", "requestId": "606c317c785fa4a2addbf2694c49818f", "timsBaseUrl": "https://tims-test.kra.go.ke:443/", "invoiceNumber": "0000000000000000039", "relevantNumber": "", "verificationUrl": "https://tims-test.kra.go.ke/KRA-Portal/invoiceChk.htm?actionCode=loadPage&invoiceNo=0000000000000000039", "invoiceExtension": "TAX INVOICE", "deviceSerialNumber": "AAA0000000000"}	\N	2026-03-04 08:22:48.619046+00	2026-03-04 08:22:51.976043+00
27	23	tims	0000000000000000043	tims:tims.register_invoice:23	2026-02-26 15:17:36.955612+00	{"msn": "KRAMW000000000000000", "raw": "{\\"messages\\":\\"Success\\",\\"DateTime\\":\\"2026-02-26T15:17:36.9556128\\\\u002B00:00\\",\\"invoiceNumber\\":\\"0000000000000000043\\",\\"invoiceExtension\\":\\"TAX INVOICE\\",\\"msn\\":\\"KRAMW000000000000000\\",\\"relevantNumber\\":null,\\"totalAmount\\":393020.500000,\\"totalItems\\":4,\\"verificationUrl\\":\\"https://tims-test.kra.go.ke/KRA-Portal/invoiceChk.htm?actionCode=loadPage\\\\u0026invoiceNo=0000000000000000043\\"}", "totals": {"totalItems": 4, "totalAmount": 393020.500000}, "issuedAt": "2026-02-26T15:17:36.9556128+00:00", "requestId": "7400c0cf921d10baa39789e07f39dcb9", "timsBaseUrl": "https://tims-test.kra.go.ke:443/", "invoiceNumber": "0000000000000000043", "relevantNumber": "", "verificationUrl": "https://tims-test.kra.go.ke/KRA-Portal/invoiceChk.htm?actionCode=loadPage&invoiceNo=0000000000000000043", "invoiceExtension": "TAX INVOICE", "deviceSerialNumber": "AAA0000000000"}	\N	2026-03-04 08:22:48.713261+00	2026-03-04 08:22:52.294569+00
\.


--
-- Name: invoice_external_postings_invoice_external_posting_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_external_postings_invoice_external_posting_id_seq', 32, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 5MMHKGTwnUsLuh7cSo3gbIuCuLpnZDe7WapOVd1wQua2EECgrze88QZcOx4Ly8N

