--
-- PostgreSQL database dump
--

\restrict AJbMEHPuDghj6nBMLkDeyLBpdap1QS9PlMegtwsgoUihfCzbe9EC70Yfw2TbUft

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
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.companies (cmp_id, cmp_prfx_id, cmp_name, cmp_registration_number, cmp_customer_since, cmp_email, cmp_phone_number, cmp_physical_address, cmp_postal_address, cmp_city, cmp_country, cmp_zip_code, cmp_website, cmp_industry, cmp_tax_id, cmp_status, cmp_date_registered_in_db, cmp_parent_id, created_at, updated_at, cmp_country_iso2) FROM stdin;
1	CMP-DEV-1	Acme Corporation	REG-DEV-001	2020-01-15	contact@acme-corp.example.com	+254700000001	123 Business Street, Tech Park	P.O. Box 1000	Nairobi	Kenya	00100	https://www.acme-corp.example.com	Technology	TAX-DEV-001	Active	2026-02-05 13:36:22.084554+00	\N	2026-02-05 13:36:22.084554+00	2026-02-23 18:30:44.39625+00	KE
2	CMP-DEV-2	Savanna Tech Solutions Ltd	REG-DEV-002	2021-03-20	hello@savanna-tech.example.com	+254700000002	456 Innovation Avenue, Tech Park	P.O. Box 2000	Nairobi	Kenya	00100	https://www.savanna-tech.example.com	Software Development	TAX-DEV-002	Active	2026-02-05 13:36:22.29609+00	1	2026-02-05 13:36:22.29609+00	2026-02-23 18:30:44.39625+00	KE
3	CMP-DEV-3	Coastal Field Services Inc	REG-DEV-003	2022-06-10	support@coastal-field.example.com	+254700000003	789 Service Road, Business District	P.O. Box 3000	Mombasa	Kenya	80100	https://www.coastal-field.example.com	Professional Services	TAX-DEV-003	Active	2026-02-05 13:36:22.29609+00	1	2026-02-05 13:36:22.29609+00	2026-02-23 18:30:44.39625+00	KE
4	CMP-DEV-4	Nairobi Corporation Ltd	REG-DEV-004	2023-01-05	contact@nairobi-corp.example.com	+254700000004	321 Business District, Westlands	P.O. Box 4000	Nairobi	Kenya	00200	https://www.nairobi-corp.example.com	Financial Services	TAX-DEV-004	Active	2026-02-05 13:36:22.29609+00	\N	2026-02-05 13:36:22.29609+00	2026-02-23 18:30:44.39625+00	KE
900001	CMP-900001	Microsoft Kenya	\N	\N	accounts.ke.900001@microsoft.invalid	+254202868000	Microsoft, Dunhill Towers, Waiyaki Way, Westlands	\N	Nairobi	Kenya	\N	\N	\N	P123456789A	Active	2026-03-01 16:08:40.987752+00	\N	2026-03-01 16:08:40.987752+00	2026-03-01 16:08:41.850772+00	KE
901001	CMP-901001	Apple Inc.	\N	\N	ap.901001@apple.invalid	+14089961010	One Apple Park Way	\N	Cupertino, CA 95014	United States	\N	\N	\N	\N	Active	2026-03-01 16:08:47.44065+00	\N	2026-03-01 16:08:47.44065+00	2026-03-01 16:08:48.12871+00	US
902001	CMP-902001	Google Africa	\N	\N	accounts.ke.902001@google.invalid	+254202868000	Purshottam Place, 5th Floor, Waiyaki Way, Westlands	\N	Nairobi	Kenya	\N	\N	\N	P123456789A	Active	2026-03-01 16:08:52.006242+00	\N	2026-03-01 16:08:52.006242+00	2026-03-01 16:08:52.670617+00	KE
\.


--
-- Name: companies_cmp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.companies_cmp_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

\unrestrict AJbMEHPuDghj6nBMLkDeyLBpdap1QS9PlMegtwsgoUihfCzbe9EC70Yfw2TbUft

