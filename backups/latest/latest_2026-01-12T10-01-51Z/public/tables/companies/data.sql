--
-- PostgreSQL database dump
--

\restrict 6CQRUViVTw91BbttprWJTeY1AgtFfxMgl2WotxvqKjgC9vWDZ6beyi0BszJEtTw

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
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.companies (cmp_id, cmp_prfx_id, cmp_name, cmp_registration_number, cmp_customer_since, cmp_email, cmp_phone_number, cmp_physical_address, cmp_postal_address, cmp_city, cmp_country, cmp_zip_code, cmp_website, cmp_industry, cmp_tax_id, cmp_status, cmp_date_registered_in_db, cmp_parent_id, created_at, updated_at) FROM stdin;
1	CMP-DEV-1	Acme Corporation	REG-DEV-001	2020-01-15	contact@acme-corp.example.com	+254700000001	123 Business Street, Tech Park	P.O. Box 1000	Nairobi	Kenya	00100	https://www.acme-corp.example.com	Technology	TAX-DEV-001	Active	2026-01-09 09:27:25.107082+00	\N	2026-01-09 09:27:25.107082+00	2026-01-09 09:27:25.107082+00
2	CMP-DEV-2	Savanna Tech Solutions Ltd	REG-DEV-002	2021-03-20	hello@savanna-tech.example.com	+254700000002	456 Innovation Avenue, Tech Park	P.O. Box 2000	Nairobi	Kenya	00100	https://www.savanna-tech.example.com	Software Development	TAX-DEV-002	Active	2026-01-09 09:27:25.30153+00	1	2026-01-09 09:27:25.30153+00	2026-01-09 09:27:25.30153+00
3	CMP-DEV-3	Coastal Field Services Inc	REG-DEV-003	2022-06-10	support@coastal-field.example.com	+254700000003	789 Service Road, Business District	P.O. Box 3000	Mombasa	Kenya	80100	https://www.coastal-field.example.com	Professional Services	TAX-DEV-003	Active	2026-01-09 09:27:25.30153+00	1	2026-01-09 09:27:25.30153+00	2026-01-09 09:27:25.30153+00
4	CMP-DEV-4	Nairobi Corporation Ltd	REG-DEV-004	2023-01-05	contact@nairobi-corp.example.com	+254700000004	321 Business District, Westlands	P.O. Box 4000	Nairobi	Kenya	00200	https://www.nairobi-corp.example.com	Financial Services	TAX-DEV-004	Active	2026-01-09 09:27:25.30153+00	\N	2026-01-09 09:27:25.30153+00	2026-01-09 09:27:25.30153+00
\.


--
-- Name: companies_cmp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.companies_cmp_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 6CQRUViVTw91BbttprWJTeY1AgtFfxMgl2WotxvqKjgC9vWDZ6beyi0BszJEtTw

