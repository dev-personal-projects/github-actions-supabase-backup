--
-- PostgreSQL database dump
--

\restrict ywmbyKGnHp9rQE3zJ3gJ8kvDeLe7HCIyf5wxa2UClwyHrgteyfbIftE5UdQgRtO

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
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: lh_tims_emulator; Owner: -
--

COPY lh_tims_emulator.payment_methods (id, method_index, pay_name, created_at, updated_at) FROM stdin;
1	0	CASH	2026-02-03 10:27:33.716817+00	2026-02-03 10:27:33.716817+00
3	2	CHECK	2026-02-03 10:27:33.716817+00	2026-02-03 10:27:33.716817+00
4	3	TRANSFER	2026-02-03 10:27:33.716817+00	2026-02-03 10:27:33.716817+00
5	4	VOUCHER	2026-02-03 10:27:33.716817+00	2026-02-03 10:27:33.716817+00
6	5	COUPON	2026-02-03 10:27:33.716817+00	2026-02-03 10:27:33.716817+00
2	1	VISA	2026-02-03 10:27:33.716817+00	2026-02-23 08:37:59.377229+00
\.


--
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: lh_tims_emulator; Owner: -
--

SELECT pg_catalog.setval('lh_tims_emulator.payment_methods_id_seq', 6, true);


--
-- PostgreSQL database dump complete
--

\unrestrict ywmbyKGnHp9rQE3zJ3gJ8kvDeLe7HCIyf5wxa2UClwyHrgteyfbIftE5UdQgRtO

