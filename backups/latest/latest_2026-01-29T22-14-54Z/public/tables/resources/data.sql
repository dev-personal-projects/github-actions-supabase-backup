--
-- PostgreSQL database dump
--

\restrict JePcUzjewxd4Ne7XQ2cW3HvdaEaWzl9OBezNgANxhNlNxpraBejNFOSr1iPAlE1

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
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.resources (res_id, res_prfx_id, res_first_name, res_middle_name, res_last_name, res_availability, res_personal_email, res_work_email, res_mobile_number, res_postal_address, res_street_address_line1, res_street_address_line2, res_city, res_state, res_postal_code, res_country, res_government_issued_id_number, res_government_id_url, res_birth_date, res_tax_number, res_blacklisted, created_at, updated_at) FROM stdin;
1	RES-DEV-1	John	Michael	Doe	Available	john.doe@example.com	john.doe@work.example.com	+254712345678	P.O. Box 5001	100 Main Street	Apartment 5A	Nairobi	Nairobi County	00100	Kenya	ID-DEV-001	https://example.com/docs/id-dev-001.pdf	1990-05-15	TAX-RES-DEV-001	f	2026-01-27 13:07:48.503556+00	2026-01-27 13:07:48.503556+00
2	RES-DEV-2	Jane	\N	Smith	Assigned	jane.smith@example.com	jane.smith@work.example.com	+254712345679	P.O. Box 5002	200 Oak Avenue	\N	Nairobi	Nairobi County	00100	Kenya	ID-DEV-002	https://example.com/docs/id-dev-002.pdf	1988-08-22	TAX-RES-DEV-002	f	2026-01-27 13:07:48.503556+00	2026-01-27 13:07:48.503556+00
3	RES-DEV-3	Robert	James	Johnson	Assigned	robert.johnson@example.com	robert.johnson@work.example.com	+254712345680	P.O. Box 5003	300 Pine Road	Suite 10	Mombasa	Mombasa County	80100	Kenya	ID-DEV-003	https://example.com/docs/id-dev-003.pdf	1992-03-10	TAX-RES-DEV-003	f	2026-01-27 13:07:48.503556+00	2026-01-27 13:07:48.503556+00
4	RES-DEV-4	Sarah	Elizabeth	Williams	Available	sarah.williams@example.com	sarah.williams@work.example.com	+254712345681	P.O. Box 5004	400 Elm Street	\N	Nairobi	Nairobi County	00200	Kenya	ID-DEV-004	https://example.com/docs/id-dev-004.pdf	1991-11-30	TAX-RES-DEV-004	f	2026-01-27 13:07:48.503556+00	2026-01-27 13:07:48.503556+00
5	RES-DEV-5	Michael	\N	Brown	Unavailable	michael.brown@example.com	michael.brown@work.example.com	+254712345682	P.O. Box 5005	500 Maple Drive	Unit 3B	Kisumu	Kisumu County	40100	Kenya	ID-DEV-005	https://example.com/docs/id-dev-005.pdf	1989-07-18	TAX-RES-DEV-005	f	2026-01-27 13:07:48.503556+00	2026-01-27 13:07:48.503556+00
6	RES-DEV-6	Emily	Rose	Davis	Assigned	emily.davis@example.com	emily.davis@work.example.com	+254712345683	P.O. Box 5006	600 Cedar Lane	\N	Nairobi	Nairobi County	00100	Kenya	ID-DEV-006	https://example.com/docs/id-dev-006.pdf	1993-02-14	TAX-RES-DEV-006	f	2026-01-27 13:07:48.503556+00	2026-01-27 13:07:48.503556+00
\.


--
-- Name: resources_res_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.resources_res_id_seq', 6, true);


--
-- PostgreSQL database dump complete
--

\unrestrict JePcUzjewxd4Ne7XQ2cW3HvdaEaWzl9OBezNgANxhNlNxpraBejNFOSr1iPAlE1

