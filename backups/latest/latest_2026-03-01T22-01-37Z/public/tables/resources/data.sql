--
-- PostgreSQL database dump
--

\restrict TzbWHJcLFSbkbjGHWR0m0E0wi2HD4dskc9j4hK7Ij1Df4BdafZqZqOP9ePJWRPR

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
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.resources (res_id, res_prfx_id, res_first_name, res_middle_name, res_last_name, res_availability, res_personal_email, res_work_email, res_mobile_number, res_postal_address, res_street_address_line1, res_street_address_line2, res_city, res_state, res_postal_code, res_country, res_government_issued_id_number, res_government_id_url, res_birth_date, res_tax_number, res_blacklisted, created_at, updated_at) FROM stdin;
1	RES-DEV-1	John	Michael	Doe	Available	john.doe@example.com	john.doe@work.example.com	+254712345678	P.O. Box 5001	100 Main Street	Apartment 5A	Nairobi	Nairobi County	00100	Kenya	ID-DEV-001	https://example.com/docs/id-dev-001.pdf	1990-05-15	TAX-RES-DEV-001	f	2026-02-05 13:36:22.492746+00	2026-02-05 13:36:22.492746+00
2	RES-DEV-2	Jane	\N	Smith	Assigned	jane.smith@example.com	jane.smith@work.example.com	+254712345679	P.O. Box 5002	200 Oak Avenue	\N	Nairobi	Nairobi County	00100	Kenya	ID-DEV-002	https://example.com/docs/id-dev-002.pdf	1988-08-22	TAX-RES-DEV-002	f	2026-02-05 13:36:22.492746+00	2026-02-05 13:36:22.492746+00
3	RES-DEV-3	Robert	James	Johnson	Assigned	robert.johnson@example.com	robert.johnson@work.example.com	+254712345680	P.O. Box 5003	300 Pine Road	Suite 10	Mombasa	Mombasa County	80100	Kenya	ID-DEV-003	https://example.com/docs/id-dev-003.pdf	1992-03-10	TAX-RES-DEV-003	f	2026-02-05 13:36:22.492746+00	2026-02-05 13:36:22.492746+00
4	RES-DEV-4	Sarah	Elizabeth	Williams	Available	sarah.williams@example.com	sarah.williams@work.example.com	+254712345681	P.O. Box 5004	400 Elm Street	\N	Nairobi	Nairobi County	00200	Kenya	ID-DEV-004	https://example.com/docs/id-dev-004.pdf	1991-11-30	TAX-RES-DEV-004	f	2026-02-05 13:36:22.492746+00	2026-02-05 13:36:22.492746+00
5	RES-DEV-5	Michael	\N	Brown	Unavailable	michael.brown@example.com	michael.brown@work.example.com	+254712345682	P.O. Box 5005	500 Maple Drive	Unit 3B	Kisumu	Kisumu County	40100	Kenya	ID-DEV-005	https://example.com/docs/id-dev-005.pdf	1989-07-18	TAX-RES-DEV-005	f	2026-02-05 13:36:22.492746+00	2026-02-05 13:36:22.492746+00
6	RES-DEV-6	Emily	Rose	Davis	Assigned	emily.davis@example.com	emily.davis@work.example.com	+254712345683	P.O. Box 5006	600 Cedar Lane	\N	Nairobi	Nairobi County	00100	Kenya	ID-DEV-006	https://example.com/docs/id-dev-006.pdf	1993-02-14	TAX-RES-DEV-006	f	2026-02-05 13:36:22.492746+00	2026-02-05 13:36:22.492746+00
900002	RES-900002	Maya	\N	Njeri	Available	maya.njeri.900002@savannah-crest.invalid	\N	+254700900002	\N	Kileleshwa, Oloitoktok Rd	\N	Nairobi	\N	\N	Kenya	00900002	https://example.invalid/id/ke-00900002	1992-04-11	\N	f	2026-02-27 07:37:48.764451+00	2026-02-27 07:37:48.764451+00
902002	RES-902002	Maya	\N	Njeri	Available	maya.njeri.902002@savannah-crest.invalid	\N	+254700902002	\N	Kileleshwa, Oloitoktok Rd	\N	Nairobi	\N	\N	Kenya	00902002	https://example.invalid/id/ke-00902002	1990-01-02	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
902003	RES-902003	Noah	\N	Ochieng	Available	noah.ochieng.902003@savannah-crest.invalid	\N	+254700902003	\N	Upper Hill, Ralph Bunche Rd	\N	Nairobi	\N	\N	Kenya	00902003	https://example.invalid/id/ke-00902003	1990-01-03	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
902004	RES-902004	Bo	\N	Li	Available	bo.li.902004@savannah-crest.invalid	\N	+254700902004	\N	Westlands, Parklands Rd	\N	Nairobi	\N	\N	Kenya	00902004	https://example.invalid/id/ke-00902004	1990-01-04	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
901002	RES-901002	Ava	\N	Chen	Available	ava.chen.901002@apple.invalid	\N	+14080901002	\N	North Wolfe Rd	\N	Cupertino, CA	\N	\N	United States	00901002	https://example.invalid/id/us-00901002	1991-06-14	\N	f	2026-02-27 07:52:32.188593+00	2026-02-27 07:52:32.188593+00
901003	RES-901003	Liam	\N	Patel	Available	liam.patel.901003@apple.invalid	\N	+14150901003	\N	Market St	\N	San Francisco, CA	\N	\N	United States	00901003	https://example.invalid/id/us-00901003	1988-02-03	\N	f	2026-02-27 07:52:32.188593+00	2026-02-27 07:52:32.188593+00
901004	RES-901004	Sophia	\N	Martinez	Available	sophia.martinez.901004@apple.invalid	\N	+14080901004	\N	Stevens Creek Blvd	\N	San Jose, CA	\N	\N	United States	00901004	https://example.invalid/id/us-00901004	1993-09-27	\N	f	2026-02-27 07:52:32.188593+00	2026-02-27 07:52:32.188593+00
902009	RES-902009	Grace	\N	Achieng	Available	grace.achieng.902009@savannah-crest.invalid	\N	+254700902009	\N	South C, Mombasa Rd	\N	Nairobi	\N	\N	Kenya	00902009	https://example.invalid/id/ke-00902009	1990-01-09	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
902010	RES-902010	Omar	\N	Hassan	Available	omar.hassan.902010@savannah-crest.invalid	\N	+254700902010	\N	Kilimani, Lenana Rd	\N	Nairobi	\N	\N	Kenya	00902010	https://example.invalid/id/ke-00902010	1990-01-10	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
902011	RES-902011	Joy	\N	Kamau	Available	joy.kamau.902011@savannah-crest.invalid	\N	+254700902011	\N	Westlands, Ring Rd	\N	Nairobi	\N	\N	Kenya	00902011	https://example.invalid/id/ke-00902011	1990-01-11	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
902015	RES-902015	Wanjiku	\N	Barasa	Available	wanjiku.barasa.902015@savannah-crest.invalid	\N	+254700902015	\N	Westlands, Peponi Rd	\N	Nairobi	\N	\N	Kenya	00902015	https://example.invalid/id/ke-00902015	1990-01-15	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
902016	RES-902016	Otieno	\N	Were	Available	otieno.were.902016@savannah-crest.invalid	\N	+254700902016	\N	Kilimani, Dennis Pritt Rd	\N	Nairobi	\N	\N	Kenya	00902016	https://example.invalid/id/ke-00902016	1990-01-16	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
900003	RES-900003	Noah	\N	Ochieng	Available	noah.ochieng.900003@savannah-crest.invalid	\N	+254700900003	\N	Upper Hill, Ralph Bunche Rd	\N	Nairobi	\N	\N	Kenya	00900003	https://example.invalid/id/ke-00900003	1989-09-03	\N	f	2026-02-26 11:27:13.013047+00	2026-02-26 11:27:13.013047+00
900004	RES-900004	Bo	\N	Li	Available	bo.li.900004@savannah-crest.invalid	\N	+254700900004	\N	Westlands, Parklands Rd	\N	Nairobi	\N	\N	Kenya	00900004	https://example.invalid/id/ke-00900004	1993-12-19	\N	f	2026-02-26 11:27:13.013047+00	2026-02-26 11:27:13.013047+00
902017	RES-902017	Njeri	\N	Gathoni	Available	njeri.gathoni.902017@savannah-crest.invalid	\N	+254700902017	\N	Kileleshwa, Mandera Rd	\N	Nairobi	\N	\N	Kenya	00902017	https://example.invalid/id/ke-00902017	1990-01-17	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
900001	RES-900001	Ethan	\N	Kariuki	Available	ethan.kariuki.900001@savannah-crest.invalid	\N	+254700900001	\N	Kilimani, Kindaruma Rd	\N	Nairobi	\N	\N	Kenya	00900001	https://example.invalid/id/ke-00900001	1990-01-01	\N	f	2026-03-01 16:08:43.420435+00	2026-03-01 16:08:43.420435+00
901001	RES-901001	Nia	\N	Otieno	Available	nia.otieno.901001@acacia-ridge.invalid	\N	+254700901001	\N	Muthithi Rd, Westlands	\N	Nairobi	\N	\N	Kenya	00901001	https://example.invalid/id/ke-00901001	1990-01-01	\N	f	2026-03-01 16:08:49.185266+00	2026-03-01 16:08:49.185266+00
902001	RES-902001	Ethan	\N	Kariuki	Available	ethan.kariuki.902001@savannah-crest.invalid	\N	+254700902001	\N	Kilimani, Kindaruma Rd	\N	Nairobi	\N	\N	Kenya	00902001	https://example.invalid/id/ke-00902001	1990-01-01	\N	f	2026-03-01 16:08:53.902744+00	2026-03-01 16:08:53.902744+00
902005	RES-902005	Amina	\N	Wanjiku	Available	amina.wanjiku.902005@savannah-crest.invalid	\N	+254700902005	\N	Lavington, James Gichuru Rd	\N	Nairobi	\N	\N	Kenya	00902005	https://example.invalid/id/ke-00902005	1990-01-05	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
902006	RES-902006	Kevin	\N	Otieno	Available	kevin.otieno.902006@savannah-crest.invalid	\N	+254700902006	\N	Kilimani, Ngong Rd	\N	Nairobi	\N	\N	Kenya	00902006	https://example.invalid/id/ke-00902006	1990-01-06	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
902007	RES-902007	Faith	\N	Mwangi	Available	faith.mwangi.902007@savannah-crest.invalid	\N	+254700902007	\N	Westlands, Waiyaki Way	\N	Nairobi	\N	\N	Kenya	00902007	https://example.invalid/id/ke-00902007	1990-01-07	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
902008	RES-902008	Brian	\N	Kimani	Available	brian.kimani.902008@savannah-crest.invalid	\N	+254700902008	\N	Kasarani, Thika Rd	\N	Nairobi	\N	\N	Kenya	00902008	https://example.invalid/id/ke-00902008	1990-01-08	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
902018	RES-902018	Kariuki	\N	Cheruiyot	Available	kariuki.cheruiyot.902018@savannah-crest.invalid	\N	+254700902018	\N	Upper Hill, Elgon Rd	\N	Nairobi	\N	\N	Kenya	00902018	https://example.invalid/id/ke-00902018	1990-01-18	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
902019	RES-902019	Asha	\N	Abdalla	Available	asha.abdalla.902019@savannah-crest.invalid	\N	+254700902019	\N	Westlands, Rhapta Rd	\N	Nairobi	\N	\N	Kenya	00902019	https://example.invalid/id/ke-00902019	1990-01-19	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
902012	RES-902012	Peter	\N	Odhiambo	Available	peter.odhiambo.902012@savannah-crest.invalid	\N	+254700902012	\N	Upper Hill, Hospital Rd	\N	Nairobi	\N	\N	Kenya	00902012	https://example.invalid/id/ke-00902012	1990-01-12	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
902013	RES-902013	Sarah	\N	Muthoni	Available	sarah.muthoni.902013@savannah-crest.invalid	\N	+254700902013	\N	Kileleshwa, Gatundu Rd	\N	Nairobi	\N	\N	Kenya	00902013	https://example.invalid/id/ke-00902013	1990-01-13	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
902014	RES-902014	Daniel	\N	Kiptoo	Available	daniel.kiptoo.902014@savannah-crest.invalid	\N	+254700902014	\N	Lavington, Gitanga Rd	\N	Nairobi	\N	\N	Kenya	00902014	https://example.invalid/id/ke-00902014	1990-01-14	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
902020	RES-902020	Ali	\N	Said	Available	ali.said.902020@savannah-crest.invalid	\N	+254700902020	\N	South B, Outering Rd	\N	Nairobi	\N	\N	Kenya	00902020	https://example.invalid/id/ke-00902020	1990-01-20	\N	f	2026-02-27 13:40:38.964815+00	2026-03-01 16:08:53.902744+00
\.


--
-- Name: resources_res_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.resources_res_id_seq', 6, true);


--
-- PostgreSQL database dump complete
--

\unrestrict TzbWHJcLFSbkbjGHWR0m0E0wi2HD4dskc9j4hK7Ij1Df4BdafZqZqOP9ePJWRPR

