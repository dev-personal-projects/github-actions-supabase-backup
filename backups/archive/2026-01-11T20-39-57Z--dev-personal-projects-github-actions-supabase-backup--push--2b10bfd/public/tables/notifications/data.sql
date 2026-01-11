--
-- PostgreSQL database dump
--

\restrict rzt2z5Xlu6UX6DpYCyGY0OyeGXaX889BU73RmghjNqsNyhw9sqa5J2lAnNx15GV

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
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notifications (id, type, title, message, is_read, metadata, action_url, read_at, created_at, updated_at, recipient_id, triggered_by_id, chama_id) FROM stdin;
7ef47223-6363-4369-91e2-1bde52f9eb18	SAVING_CREATED	New Saving Created	New saving "weekly" created with amount KSh 7,000	f	{"amount": 7000, "savingName": "weekly"}	\N	\N	2025-12-09 22:58:43.531546+00	2025-12-09 22:58:43.531546+00	0bc6fb57-1e42-40ae-af9e-f3e81695437d	3b1f4b2e-25ae-415e-82f2-e125aed86313	b67d3479-8cb0-4a7c-ac72-8c9086769cfb
97489117-5424-4a5c-8279-d10eab1cf800	CONTRIBUTION_CREATED	New Contribution	New contribution "health care" of KSh 600 has been created	f	{"amount": 600, "contributionId": "78baeaa9-dfec-4612-8d55-1bf02506101b", "contributionName": "health care"}	\N	\N	2025-12-09 23:01:05.273472+00	2025-12-09 23:01:05.273472+00	0bc6fb57-1e42-40ae-af9e-f3e81695437d	3b1f4b2e-25ae-415e-82f2-e125aed86313	b67d3479-8cb0-4a7c-ac72-8c9086769cfb
d765e352-3a27-4d85-a210-8504dafd59da	SAVING_CREATED	New Saving Created	New saving "monthly" created with amount KSh 500	f	{"amount": 500, "savingName": "monthly"}	\N	\N	2025-12-10 00:46:52.050809+00	2025-12-10 00:46:52.050809+00	26181be5-417e-4023-8442-27ac46ec9d93	3b1f4b2e-25ae-415e-82f2-e125aed86313	b67d3479-8cb0-4a7c-ac72-8c9086769cfb
0e2d2418-756b-4ce3-877e-c7211cd245a1	SAVING_CREATED	New Saving Created	New saving "weekly" created with amount KSh 7,000	t	{"amount": 7000, "savingName": "weekly"}	\N	2025-12-10 00:53:02.806+00	2025-12-09 22:58:44.216873+00	2025-12-10 00:53:02.8909+00	3b1f4b2e-25ae-415e-82f2-e125aed86313	3b1f4b2e-25ae-415e-82f2-e125aed86313	b67d3479-8cb0-4a7c-ac72-8c9086769cfb
a8c5b9cb-62d7-46f7-9e3c-627bedbef522	INVESTMENT_CREATED	New Investment	New investment "investment p1" worth KSh 5,000 has been added	t	{"amount": 5000, "investmentName": "investment p1"}	\N	2025-12-10 00:53:02.806+00	2025-12-09 22:59:35.037076+00	2025-12-10 00:53:02.8909+00	3b1f4b2e-25ae-415e-82f2-e125aed86313	3b1f4b2e-25ae-415e-82f2-e125aed86313	b67d3479-8cb0-4a7c-ac72-8c9086769cfb
c3b403e5-9a5f-4af9-b860-fbdbe9370657	INVESTMENT_UPDATED	Investment Updated	Investment "investment p4" has been updated	t	{"amount": "5000", "investmentName": "investment p4"}	\N	2025-12-10 00:53:02.806+00	2025-12-09 22:59:52.432474+00	2025-12-10 00:53:02.8909+00	3b1f4b2e-25ae-415e-82f2-e125aed86313	3b1f4b2e-25ae-415e-82f2-e125aed86313	b67d3479-8cb0-4a7c-ac72-8c9086769cfb
f17d13dd-4782-4f97-aff9-1192ea7dd2c4	INCOME_CREATED	New Income Recorded	New income "income v1" recorded: KSh 3,000	t	{"amount": 3000, "incomeName": "income v1"}	\N	2025-12-10 00:53:02.806+00	2025-12-09 23:00:24.590129+00	2025-12-10 00:53:02.8909+00	3b1f4b2e-25ae-415e-82f2-e125aed86313	3b1f4b2e-25ae-415e-82f2-e125aed86313	b67d3479-8cb0-4a7c-ac72-8c9086769cfb
ad443f06-74f9-4fb5-9717-7e698355a8e8	CONTRIBUTION_CREATED	New Contribution	New contribution "health care" of KSh 600 has been created	t	{"amount": 600, "contributionId": "78baeaa9-dfec-4612-8d55-1bf02506101b", "contributionName": "health care"}	\N	2025-12-10 00:53:02.806+00	2025-12-09 23:01:04.522711+00	2025-12-10 00:53:02.8909+00	3b1f4b2e-25ae-415e-82f2-e125aed86313	3b1f4b2e-25ae-415e-82f2-e125aed86313	b67d3479-8cb0-4a7c-ac72-8c9086769cfb
07b70872-70bc-4ab1-b3ae-69585e634107	LOAN_REQUESTED	Loan Request	Loan request for KSh 400,000 has been submitted	t	{"loanId": "970bd485-7548-4ad0-9496-3728a9c89dec", "loanName": "farmers loan", "loanAmount": 400000}	\N	2025-12-10 00:53:02.806+00	2025-12-09 23:02:19.685468+00	2025-12-10 00:53:02.8909+00	3b1f4b2e-25ae-415e-82f2-e125aed86313	3b1f4b2e-25ae-415e-82f2-e125aed86313	b67d3479-8cb0-4a7c-ac72-8c9086769cfb
e5f4bc55-da2a-4253-8a6f-adfa8eda0ba2	EXPENSE_CREATED	New Expense	New expense "furnitures" of KSh 50,000 has been recorded	t	{"amount": 50000, "expenseId": "809c36b4-668a-4350-96eb-daa84cf67d62", "expenseName": "furnitures"}	\N	2025-12-10 00:53:02.806+00	2025-12-09 23:04:48.983071+00	2025-12-10 00:53:02.8909+00	3b1f4b2e-25ae-415e-82f2-e125aed86313	3b1f4b2e-25ae-415e-82f2-e125aed86313	b67d3479-8cb0-4a7c-ac72-8c9086769cfb
e8aee6b7-cc85-4f14-870e-362cc870aa19	SAVING_CREATED	New Saving Created	New saving "monthly" created with amount KSh 500	t	{"amount": 500, "savingName": "monthly"}	\N	2025-12-10 00:53:02.806+00	2025-12-10 00:46:52.050534+00	2025-12-10 00:53:02.8909+00	3b1f4b2e-25ae-415e-82f2-e125aed86313	3b1f4b2e-25ae-415e-82f2-e125aed86313	b67d3479-8cb0-4a7c-ac72-8c9086769cfb
a9ca3541-3d26-4b41-bed1-a7c4f07b9009	SAVING_CREATED	New Saving Created	New saving "monthly" created with amount KSh 600,000,000	f	{"amount": 600000000, "savingName": "monthly"}	\N	\N	2025-12-10 01:03:20.995144+00	2025-12-10 01:03:20.995144+00	3b1f4b2e-25ae-415e-82f2-e125aed86313	3b1f4b2e-25ae-415e-82f2-e125aed86313	b67d3479-8cb0-4a7c-ac72-8c9086769cfb
7479ebff-1260-455a-bb0f-e9085770c134	LOAN_REQUESTED	Loan Request	Loan request for KSh 600,000 has been submitted	f	{"loanId": "56e6a539-09f3-4f66-b1fc-8a4a126483db", "loanName": "business enhancement", "loanAmount": 600000}	\N	\N	2025-12-10 12:37:05.57164+00	2025-12-10 12:37:05.57164+00	3b1f4b2e-25ae-415e-82f2-e125aed86313	3b1f4b2e-25ae-415e-82f2-e125aed86313	b67d3479-8cb0-4a7c-ac72-8c9086769cfb
dce21d93-b22e-4fcf-b55c-12017a10d0fd	LOAN_REQUESTED	Loan Request	Loan request for KSh 20,000 has been submitted	f	{"loanId": "db00015c-c473-44b3-9964-914330aa1701", "loanName": "school fees", "loanAmount": 20000}	\N	\N	2025-12-10 14:29:32.647197+00	2025-12-10 14:29:32.647197+00	0d37dd3f-69d5-48c8-a8bb-42c52fad80b6	0d37dd3f-69d5-48c8-a8bb-42c52fad80b6	5e0835fe-ef7c-4932-a76f-f515840ff7ef
ef9cdd73-ea9d-471c-9b61-2d26aa617992	EXPENSE_CREATED	New Expense	New expense "food" of KSh 10,000 has been recorded	f	{"amount": 10000, "expenseId": "9148a47a-ba11-47f4-9d77-9f30f7637cf5", "expenseName": "food"}	\N	\N	2025-12-10 14:44:32.231359+00	2025-12-10 14:44:32.231359+00	0d37dd3f-69d5-48c8-a8bb-42c52fad80b6	0d37dd3f-69d5-48c8-a8bb-42c52fad80b6	5e0835fe-ef7c-4932-a76f-f515840ff7ef
19d293df-87fd-4583-aa70-234464e16a6c	CONTRIBUTION_CREATED	New Contribution	New contribution "furnitures" of KSh 500 has been created	f	{"amount": 500, "contributionId": "b9e13cab-593a-452e-b823-c337c53d4ec5", "contributionName": "furnitures"}	\N	\N	2025-12-10 14:48:20.490164+00	2025-12-10 14:48:20.490164+00	0d37dd3f-69d5-48c8-a8bb-42c52fad80b6	0d37dd3f-69d5-48c8-a8bb-42c52fad80b6	5e0835fe-ef7c-4932-a76f-f515840ff7ef
eb0f936a-dc54-4941-92fc-c833ebecdafc	CONTRIBUTION_CREATED	New Contribution	New contribution "furnitures" of KSh 500 has been created	f	{"amount": 500, "contributionId": "b9e13cab-593a-452e-b823-c337c53d4ec5", "contributionName": "furnitures"}	\N	\N	2025-12-10 14:48:21.228124+00	2025-12-10 14:48:21.228124+00	f95649a7-2900-4b73-b9e6-02254340c463	0d37dd3f-69d5-48c8-a8bb-42c52fad80b6	5e0835fe-ef7c-4932-a76f-f515840ff7ef
2e37448f-11ea-4a0c-ac7c-d531068c8d57	SAVING_CREATED	New Saving Created	New saving "monthly" created with amount KSh 4,000	f	{"amount": 4000, "savingName": "monthly"}	\N	\N	2025-12-10 14:51:38.320205+00	2025-12-10 14:51:38.320205+00	f95649a7-2900-4b73-b9e6-02254340c463	0d37dd3f-69d5-48c8-a8bb-42c52fad80b6	5e0835fe-ef7c-4932-a76f-f515840ff7ef
deaf7501-683e-4bce-8a49-5fdb6a1c3276	SAVING_CREATED	New Saving Created	New saving "monthly" created with amount KSh 4,000	f	{"amount": 4000, "savingName": "monthly"}	\N	\N	2025-12-10 14:51:39.137298+00	2025-12-10 14:51:39.137298+00	0d37dd3f-69d5-48c8-a8bb-42c52fad80b6	0d37dd3f-69d5-48c8-a8bb-42c52fad80b6	5e0835fe-ef7c-4932-a76f-f515840ff7ef
\.


--
-- PostgreSQL database dump complete
--

\unrestrict rzt2z5Xlu6UX6DpYCyGY0OyeGXaX889BU73RmghjNqsNyhw9sqa5J2lAnNx15GV

