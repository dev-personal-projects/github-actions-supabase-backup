--
-- PostgreSQL database dump
--

\restrict KeBsCuybByXLZEqTMSqq7EvIyBqjlsM6gPmj45ZnAqrVZMkOhTgnec8C9btTOBx

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
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
40	1749633596470	AddProfilesTable1749633596470
41	1750057645059	UpdatedProfilesTable1750057645059
42	1750087022055	CreateChamaTable1750087022055
43	1750447634356	CreateChamaProfilesTable1750447634356
44	1750849373168	CreateProfilePicture1750849373168
45	1751450280915	RemoveOnDeleteCascadeInChamasEntity1751450280915
46	1751878503890	CreateIncomeTable1751878503890
47	1751878647720	CreateInvestmentsTable1751878647720
48	1751878728619	CreateSavingsTable1751878728619
49	1752231957134	CreateContributionsTable1752231957134
50	1752231999396	CreateMemberContributionsTable1752231999396
51	1752306419826	CreateExpensesTable1752306419826
52	1752318250183	UpdateMemberContributionsTable1752318250183
53	1753706768921	CreateLoansTable1753706768921
54	1753706822980	CreateLoanRequestsTable1753706822980
55	1754053705752	CreateAiAgentConversations1754053705752
56	1754286317440	UpdateChamaEntity1754286317440
57	1754286800091	UpdateExpensesEntity1754286800091
58	1754286987218	UpdateContributionsEntity1754286987218
59	1754287160809	UpdateIncomeEntity1754287160809
60	1754287331357	UpdateInvestmentsEntity1754287331357
61	1754287476249	UpdateSavingsEntity1754287476249
62	1754288109526	UpdateLoanRequestEntity1754288109526
63	1754458874735	CreateSubscriptionsTable1754458874735
64	1755200911815	CreateNotificationsTable1755200911815
65	1755201000000	FixChamasIdDefault1755201000000
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 65, true);


--
-- PostgreSQL database dump complete
--

\unrestrict KeBsCuybByXLZEqTMSqq7EvIyBqjlsM6gPmj45ZnAqrVZMkOhTgnec8C9btTOBx

