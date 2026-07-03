--
-- PostgreSQL database dump
--

\restrict lnKyXe4VHMO15Si7HFoOxyu8ZrhvnwsHHVMXE06jj0gO4Sby3c6pFsrjrl2smyW

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
-- Data for Name: cash_operations; Type: TABLE DATA; Schema: lh_tims_emulator; Owner: -
--

COPY lh_tims_emulator.cash_operations (id, operation_type, amount, performed_at, created_at, updated_at) FROM stdin;
1	0	2000.0000	2026-02-06 11:08:20.577436+00	2026-02-06 11:08:20.584677+00	2026-02-06 11:08:20.584677+00
2	0	100.0000	2026-02-23 08:37:32.389064+00	2026-02-23 08:37:32.660693+00	2026-02-23 08:37:32.660693+00
\.


--
-- Name: cash_operations_id_seq; Type: SEQUENCE SET; Schema: lh_tims_emulator; Owner: -
--

SELECT pg_catalog.setval('lh_tims_emulator.cash_operations_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

\unrestrict lnKyXe4VHMO15Si7HFoOxyu8ZrhvnwsHHVMXE06jj0gO4Sby3c6pFsrjrl2smyW

