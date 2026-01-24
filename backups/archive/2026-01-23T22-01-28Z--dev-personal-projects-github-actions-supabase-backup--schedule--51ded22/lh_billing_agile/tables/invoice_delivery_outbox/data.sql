--
-- PostgreSQL database dump
--

\restrict Nubfl9nopdvAsaK1xIzTnTdErRVxqQWCdvAokE0rvA9jqVmfeid4bqy0AOHzAs8

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
-- Data for Name: invoice_delivery_outbox; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoice_delivery_outbox (invoice_delivery_outbox_id, invoice_id, correlation_id, status, blocked_reason, sender_email, to_recipients, cc_recipients, bcc_recipients, is_test_email, invoice_number, company_id, period_end, blob_path, attempt_count, next_attempt_at, locked_at, locked_by, last_error, sent_at, created_at, updated_at) FROM stdin;
1	1	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-f3fb57d250ec400aadd3016f11f57692	4	2026-03-31	2026/03/4/DRY-RUN-f3fb57d250ec400aadd3016f11f57692.pdf	0	2026-01-23 11:04:41.038605+00	\N	\N	missing testRecipients	\N	2026-01-23 11:04:41.038605+00	2026-01-23 11:04:41.038605+00
2	2	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-0ed2e9aa9a0c488f80d0ad8c850fe181	4	2026-06-30	2026/06/4/DRY-RUN-0ed2e9aa9a0c488f80d0ad8c850fe181.pdf	0	2026-01-23 11:04:45.588277+00	\N	\N	missing testRecipients	\N	2026-01-23 11:04:45.588277+00	2026-01-23 11:04:45.588277+00
3	3	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-219abd0ef23c4ae68c8e779712f64a9c	4	2026-09-30	2026/09/4/DRY-RUN-219abd0ef23c4ae68c8e779712f64a9c.pdf	0	2026-01-23 11:04:49.617237+00	\N	\N	missing testRecipients	\N	2026-01-23 11:04:49.617237+00	2026-01-23 11:04:49.617237+00
4	4	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-bf4e8ac2841847ec854229addd46ccc8	4	2026-12-31	2026/12/4/DRY-RUN-bf4e8ac2841847ec854229addd46ccc8.pdf	0	2026-01-23 11:04:53.632839+00	\N	\N	missing testRecipients	\N	2026-01-23 11:04:53.632839+00	2026-01-23 11:04:53.632839+00
5	5	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-2ec8eb2302a540a1a95507a2c4efaef5	4	2027-03-31	2027/03/4/DRY-RUN-2ec8eb2302a540a1a95507a2c4efaef5.pdf	0	2026-01-23 11:04:57.809992+00	\N	\N	missing testRecipients	\N	2026-01-23 11:04:57.809992+00	2026-01-23 11:04:57.809992+00
6	6	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-f8ebbe8925d644e8ad3d61989f50bbf7	4	2027-06-30	2027/06/4/DRY-RUN-f8ebbe8925d644e8ad3d61989f50bbf7.pdf	0	2026-01-23 11:05:02.364155+00	\N	\N	missing testRecipients	\N	2026-01-23 11:05:02.364155+00	2026-01-23 11:05:02.364155+00
7	7	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-f07a087de6244d12a5ff1270a32b5fdb	4	2027-09-30	2027/09/4/DRY-RUN-f07a087de6244d12a5ff1270a32b5fdb.pdf	0	2026-01-23 11:05:06.729064+00	\N	\N	missing testRecipients	\N	2026-01-23 11:05:06.729064+00	2026-01-23 11:05:06.729064+00
8	8	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-f1b18036143247b797c1e94535e83236	4	2027-12-31	2027/12/4/DRY-RUN-f1b18036143247b797c1e94535e83236.pdf	0	2026-01-23 11:05:11.123918+00	\N	\N	missing testRecipients	\N	2026-01-23 11:05:11.123918+00	2026-01-23 11:05:11.123918+00
9	9	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-24b62bf58cf243f18b4fe5f68024a0c5	4	2028-03-31	2028/03/4/DRY-RUN-24b62bf58cf243f18b4fe5f68024a0c5.pdf	0	2026-01-23 11:05:15.468355+00	\N	\N	missing testRecipients	\N	2026-01-23 11:05:15.468355+00	2026-01-23 11:05:15.468355+00
10	10	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-a9be6e3bc47c418495f9edb43c672fc4	4	2028-06-30	2028/06/4/DRY-RUN-a9be6e3bc47c418495f9edb43c672fc4.pdf	0	2026-01-23 11:05:19.835371+00	\N	\N	missing testRecipients	\N	2026-01-23 11:05:19.835371+00	2026-01-23 11:05:19.835371+00
11	11	37bea091-57e0-453a-9194-410a4dac9ec5	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-ef4911a0955b4fd8bde35445dbbc5cea	4	2026-03-31	2026/03/4/DRY-RUN-ef4911a0955b4fd8bde35445dbbc5cea.pdf	0	2026-01-23 11:07:44.224776+00	\N	\N	missing testRecipients	\N	2026-01-23 11:07:44.224776+00	2026-01-23 11:07:44.224776+00
12	12	37bea091-57e0-453a-9194-410a4dac9ec5	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-1c67c555ea7a437c88595ca3fd334205	4	2026-06-30	2026/06/4/DRY-RUN-1c67c555ea7a437c88595ca3fd334205.pdf	0	2026-01-23 11:07:48.912843+00	\N	\N	missing testRecipients	\N	2026-01-23 11:07:48.912843+00	2026-01-23 11:07:48.912843+00
13	13	37bea091-57e0-453a-9194-410a4dac9ec5	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-c41f2912e71a4ecc9fb0811daa7ccdb0	4	2026-09-30	2026/09/4/DRY-RUN-c41f2912e71a4ecc9fb0811daa7ccdb0.pdf	0	2026-01-23 11:07:53.430869+00	\N	\N	missing testRecipients	\N	2026-01-23 11:07:53.430869+00	2026-01-23 11:07:53.430869+00
14	14	37bea091-57e0-453a-9194-410a4dac9ec5	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-a7283b185e94471eb2e17aea1aaf0d86	4	2026-12-31	2026/12/4/DRY-RUN-a7283b185e94471eb2e17aea1aaf0d86.pdf	0	2026-01-23 11:07:57.6287+00	\N	\N	missing testRecipients	\N	2026-01-23 11:07:57.6287+00	2026-01-23 11:07:57.6287+00
15	15	37bea091-57e0-453a-9194-410a4dac9ec5	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-ac5aad07c2084db4842928a8a2a917db	4	2027-03-31	2027/03/4/DRY-RUN-ac5aad07c2084db4842928a8a2a917db.pdf	0	2026-01-23 11:08:02.002126+00	\N	\N	missing testRecipients	\N	2026-01-23 11:08:02.002126+00	2026-01-23 11:08:02.002126+00
16	16	37bea091-57e0-453a-9194-410a4dac9ec5	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-0349ac183e994ae291e784b2ed8e049b	4	2027-06-30	2027/06/4/DRY-RUN-0349ac183e994ae291e784b2ed8e049b.pdf	0	2026-01-23 11:08:06.620907+00	\N	\N	missing testRecipients	\N	2026-01-23 11:08:06.620907+00	2026-01-23 11:08:06.620907+00
17	17	37bea091-57e0-453a-9194-410a4dac9ec5	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-f5fc07bab959407ea741cc50eb5db3d8	4	2027-09-30	2027/09/4/DRY-RUN-f5fc07bab959407ea741cc50eb5db3d8.pdf	0	2026-01-23 11:08:11.460096+00	\N	\N	missing testRecipients	\N	2026-01-23 11:08:11.460096+00	2026-01-23 11:08:11.460096+00
18	18	37bea091-57e0-453a-9194-410a4dac9ec5	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-9f3071b5d0ea4e39a49e5915c53492a9	4	2027-12-31	2027/12/4/DRY-RUN-9f3071b5d0ea4e39a49e5915c53492a9.pdf	0	2026-01-23 11:08:15.646055+00	\N	\N	missing testRecipients	\N	2026-01-23 11:08:15.646055+00	2026-01-23 11:08:15.646055+00
19	19	37bea091-57e0-453a-9194-410a4dac9ec5	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-fb9c922ab34f469fb63c4dfe5fd078f9	4	2028-03-31	2028/03/4/DRY-RUN-fb9c922ab34f469fb63c4dfe5fd078f9.pdf	0	2026-01-23 11:08:19.82489+00	\N	\N	missing testRecipients	\N	2026-01-23 11:08:19.82489+00	2026-01-23 11:08:19.82489+00
20	20	37bea091-57e0-453a-9194-410a4dac9ec5	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-28dec95ed01e4062901d85b9085098c7	4	2028-06-30	2028/06/4/DRY-RUN-28dec95ed01e4062901d85b9085098c7.pdf	0	2026-01-23 11:08:24.038834+00	\N	\N	missing testRecipients	\N	2026-01-23 11:08:24.038834+00	2026-01-23 11:08:24.038834+00
21	21	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-0af15e413b0248a0b6d0b42a9128a9ce	4	2026-03-31	2026/03/4/DRY-RUN-0af15e413b0248a0b6d0b42a9128a9ce.pdf	0	2026-01-23 11:09:17.158813+00	\N	\N	\N	\N	2026-01-23 11:09:17.158813+00	2026-01-23 11:09:17.158813+00
22	22	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-3552b1f55e48412abee39d6ecdbeb4c2	4	2026-06-30	2026/06/4/DRY-RUN-3552b1f55e48412abee39d6ecdbeb4c2.pdf	0	2026-01-23 11:09:21.508913+00	\N	\N	\N	\N	2026-01-23 11:09:21.508913+00	2026-01-23 11:09:21.508913+00
23	23	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-4a60226a3ec54c2f972af69da8d70b08	4	2026-09-30	2026/09/4/DRY-RUN-4a60226a3ec54c2f972af69da8d70b08.pdf	0	2026-01-23 11:09:25.697666+00	\N	\N	\N	\N	2026-01-23 11:09:25.697666+00	2026-01-23 11:09:25.697666+00
24	24	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-84157ed1d767402ba5712c0988915e33	4	2026-12-31	2026/12/4/DRY-RUN-84157ed1d767402ba5712c0988915e33.pdf	0	2026-01-23 11:09:30.246756+00	\N	\N	\N	\N	2026-01-23 11:09:30.246756+00	2026-01-23 11:09:30.246756+00
25	25	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-b2af95504d9f4cd7ab8ab66cf510a392	4	2027-03-31	2027/03/4/DRY-RUN-b2af95504d9f4cd7ab8ab66cf510a392.pdf	0	2026-01-23 11:09:34.462818+00	\N	\N	\N	\N	2026-01-23 11:09:34.462818+00	2026-01-23 11:09:34.462818+00
26	26	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-319bb3a781f54183a46c8f42bcbddefa	4	2027-06-30	2027/06/4/DRY-RUN-319bb3a781f54183a46c8f42bcbddefa.pdf	0	2026-01-23 11:09:39.619513+00	\N	\N	\N	\N	2026-01-23 11:09:39.619513+00	2026-01-23 11:09:39.619513+00
27	27	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-e55369001fb143bbbe1b4ce472b2f9f0	4	2027-09-30	2027/09/4/DRY-RUN-e55369001fb143bbbe1b4ce472b2f9f0.pdf	0	2026-01-23 11:09:43.889693+00	\N	\N	\N	\N	2026-01-23 11:09:43.889693+00	2026-01-23 11:09:43.889693+00
29	29	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-0a12138b7fd942b5b04db5a64037062f	4	2028-03-31	2028/03/4/DRY-RUN-0a12138b7fd942b5b04db5a64037062f.pdf	0	2026-01-23 11:09:51.581457+00	\N	\N	\N	\N	2026-01-23 11:09:51.581457+00	2026-01-23 11:09:51.581457+00
32	32	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-f56af6810c0549d083fcbb353adae9a1	4	2026-06-30	2026/06/4/DRY-RUN-f56af6810c0549d083fcbb353adae9a1.pdf	0	2026-01-23 11:10:19.71188+00	\N	\N	\N	\N	2026-01-23 11:10:19.71188+00	2026-01-23 11:10:19.71188+00
34	34	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-4812ec7109e64dbe9bd156648ef4d8ab	4	2026-12-31	2026/12/4/DRY-RUN-4812ec7109e64dbe9bd156648ef4d8ab.pdf	0	2026-01-23 11:10:29.150804+00	\N	\N	\N	\N	2026-01-23 11:10:29.150804+00	2026-01-23 11:10:29.150804+00
36	36	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-2b3c1d9dd5d74e509c63c0c648395f9a	4	2027-06-30	2027/06/4/DRY-RUN-2b3c1d9dd5d74e509c63c0c648395f9a.pdf	0	2026-01-23 11:10:38.413658+00	\N	\N	\N	\N	2026-01-23 11:10:38.413658+00	2026-01-23 11:10:38.413658+00
38	38	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-168f775002e248afa9261315e65d7978	4	2027-12-31	2027/12/4/DRY-RUN-168f775002e248afa9261315e65d7978.pdf	0	2026-01-23 11:10:47.670908+00	\N	\N	\N	\N	2026-01-23 11:10:47.670908+00	2026-01-23 11:10:47.670908+00
40	40	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-afd9e3887de8425798ca34aeb0694127	4	2028-06-30	2028/06/4/DRY-RUN-afd9e3887de8425798ca34aeb0694127.pdf	0	2026-01-23 11:10:56.058785+00	\N	\N	\N	\N	2026-01-23 11:10:56.058785+00	2026-01-23 11:10:56.058785+00
41	41	smoke-3	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	f	INV-2026-009001	4	2026-03-31	2026/03/4/INV-2026-009001.pdf	0	2026-01-23 11:11:03.244701+00	\N	\N	\N	\N	2026-01-23 11:11:03.244701+00	2026-01-23 11:11:03.244701+00
43	43	smoke-3	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	f	INV-2026-009003	4	2026-09-30	2026/09/4/INV-2026-009003.pdf	0	2026-01-23 11:11:13.533502+00	\N	\N	\N	\N	2026-01-23 11:11:13.533502+00	2026-01-23 11:11:13.533502+00
45	45	smoke-3	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	f	INV-2026-009005	4	2027-03-31	2027/03/4/INV-2026-009005.pdf	0	2026-01-23 11:11:22.021694+00	\N	\N	\N	\N	2026-01-23 11:11:22.021694+00	2026-01-23 11:11:22.021694+00
47	47	smoke-3	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	f	INV-2026-009007	4	2027-09-30	2027/09/4/INV-2026-009007.pdf	0	2026-01-23 11:11:31.004477+00	\N	\N	\N	\N	2026-01-23 11:11:31.004477+00	2026-01-23 11:11:31.004477+00
49	49	smoke-3	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	f	INV-2026-009009	4	2028-03-31	2028/03/4/INV-2026-009009.pdf	0	2026-01-23 11:11:40.472709+00	\N	\N	\N	\N	2026-01-23 11:11:40.472709+00	2026-01-23 11:11:40.472709+00
28	28	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-4c867164841747aeb5af9e9b5dc10b17	4	2027-12-31	2027/12/4/DRY-RUN-4c867164841747aeb5af9e9b5dc10b17.pdf	0	2026-01-23 11:09:47.556581+00	\N	\N	\N	\N	2026-01-23 11:09:47.556581+00	2026-01-23 11:09:47.556581+00
30	30	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-affe6ec11fbe4fbbb1b6268ab7dcbfcb	4	2028-06-30	2028/06/4/DRY-RUN-affe6ec11fbe4fbbb1b6268ab7dcbfcb.pdf	0	2026-01-23 11:09:55.764177+00	\N	\N	\N	\N	2026-01-23 11:09:55.764177+00	2026-01-23 11:09:55.764177+00
31	31	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-342466dd423a42499f2c1a9542a5c5b7	4	2026-03-31	2026/03/4/DRY-RUN-342466dd423a42499f2c1a9542a5c5b7.pdf	0	2026-01-23 11:10:14.986809+00	\N	\N	\N	\N	2026-01-23 11:10:14.986809+00	2026-01-23 11:10:14.986809+00
33	33	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-80e3a48c0b8e495ab41e568b898d6214	4	2026-09-30	2026/09/4/DRY-RUN-80e3a48c0b8e495ab41e568b898d6214.pdf	0	2026-01-23 11:10:24.438866+00	\N	\N	\N	\N	2026-01-23 11:10:24.438866+00	2026-01-23 11:10:24.438866+00
35	35	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-0feb05a5a1a044adb63417d075ad7405	4	2027-03-31	2027/03/4/DRY-RUN-0feb05a5a1a044adb63417d075ad7405.pdf	0	2026-01-23 11:10:33.521676+00	\N	\N	\N	\N	2026-01-23 11:10:33.521676+00	2026-01-23 11:10:33.521676+00
37	37	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-4f47eaf04250420c89569ae3ad073057	4	2027-09-30	2027/09/4/DRY-RUN-4f47eaf04250420c89569ae3ad073057.pdf	0	2026-01-23 11:10:43.297854+00	\N	\N	\N	\N	2026-01-23 11:10:43.297854+00	2026-01-23 11:10:43.297854+00
39	39	smoke-2	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	t	DRY-RUN-5cce200bdaf14ca9b99276c3143d159b	4	2028-03-31	2028/03/4/DRY-RUN-5cce200bdaf14ca9b99276c3143d159b.pdf	0	2026-01-23 11:10:51.509809+00	\N	\N	\N	\N	2026-01-23 11:10:51.509809+00	2026-01-23 11:10:51.509809+00
42	42	smoke-3	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	f	INV-2026-009002	4	2026-06-30	2026/06/4/INV-2026-009002.pdf	0	2026-01-23 11:11:08.503334+00	\N	\N	\N	\N	2026-01-23 11:11:08.503334+00	2026-01-23 11:11:08.503334+00
44	44	smoke-3	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	f	INV-2026-009004	4	2026-12-31	2026/12/4/INV-2026-009004.pdf	0	2026-01-23 11:11:17.740424+00	\N	\N	\N	\N	2026-01-23 11:11:17.740424+00	2026-01-23 11:11:17.740424+00
46	46	smoke-3	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	f	INV-2026-009006	4	2027-06-30	2027/06/4/INV-2026-009006.pdf	0	2026-01-23 11:11:26.108375+00	\N	\N	\N	\N	2026-01-23 11:11:26.108375+00	2026-01-23 11:11:26.108375+00
48	48	smoke-3	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	f	INV-2026-009008	4	2027-12-31	2027/12/4/INV-2026-009008.pdf	0	2026-01-23 11:11:35.719323+00	\N	\N	\N	\N	2026-01-23 11:11:35.719323+00	2026-01-23 11:11:35.719323+00
50	50	smoke-3	pending	\N	billing-test@lh.example	{duane@shipht.it}	{}	{}	f	INV-2026-009010	4	2028-06-30	2028/06/4/INV-2026-009010.pdf	0	2026-01-23 11:11:45.378036+00	\N	\N	\N	\N	2026-01-23 11:11:45.378036+00	2026-01-23 11:11:45.378036+00
51	51	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-24cb911c90294828ae6b6e8597d8c15e	4	2026-03-31	2026/03/4/DRY-RUN-24cb911c90294828ae6b6e8597d8c15e.pdf	0	2026-01-23 11:15:53.510009+00	\N	\N	missing testRecipients	\N	2026-01-23 11:15:53.510009+00	2026-01-23 11:15:53.510009+00
52	52	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-a9a2fbb810314bb38db495a84ab8d67c	4	2026-06-30	2026/06/4/DRY-RUN-a9a2fbb810314bb38db495a84ab8d67c.pdf	0	2026-01-23 11:15:57.532308+00	\N	\N	missing testRecipients	\N	2026-01-23 11:15:57.532308+00	2026-01-23 11:15:57.532308+00
53	53	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-301344866ebc4c93880c0d2d6bb8c6b1	4	2026-09-30	2026/09/4/DRY-RUN-301344866ebc4c93880c0d2d6bb8c6b1.pdf	0	2026-01-23 11:16:01.721095+00	\N	\N	missing testRecipients	\N	2026-01-23 11:16:01.721095+00	2026-01-23 11:16:01.721095+00
54	54	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-924b64c5134449f3a5fc308a679b6a32	4	2026-12-31	2026/12/4/DRY-RUN-924b64c5134449f3a5fc308a679b6a32.pdf	0	2026-01-23 11:16:05.907033+00	\N	\N	missing testRecipients	\N	2026-01-23 11:16:05.907033+00	2026-01-23 11:16:05.907033+00
55	55	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-cb82ad2a8daa4ac3a28018b413d53390	4	2027-03-31	2027/03/4/DRY-RUN-cb82ad2a8daa4ac3a28018b413d53390.pdf	0	2026-01-23 11:16:09.943637+00	\N	\N	missing testRecipients	\N	2026-01-23 11:16:09.943637+00	2026-01-23 11:16:09.943637+00
56	56	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-a48e90ca448a4640b52a5fd156ebe28d	4	2027-06-30	2027/06/4/DRY-RUN-a48e90ca448a4640b52a5fd156ebe28d.pdf	0	2026-01-23 11:16:14.120484+00	\N	\N	missing testRecipients	\N	2026-01-23 11:16:14.120484+00	2026-01-23 11:16:14.120484+00
57	57	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-babf9b5df582443fa2c6523c29bd75a7	4	2027-09-30	2027/09/4/DRY-RUN-babf9b5df582443fa2c6523c29bd75a7.pdf	0	2026-01-23 11:16:18.152884+00	\N	\N	missing testRecipients	\N	2026-01-23 11:16:18.152884+00	2026-01-23 11:16:18.152884+00
58	58	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-2f4ea68f70334ee686c4ab4d6f9d596c	4	2027-12-31	2027/12/4/DRY-RUN-2f4ea68f70334ee686c4ab4d6f9d596c.pdf	0	2026-01-23 11:16:21.976216+00	\N	\N	missing testRecipients	\N	2026-01-23 11:16:21.976216+00	2026-01-23 11:16:21.976216+00
59	59	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-c7baf65c1ce44b04bacc416568936daf	4	2028-03-31	2028/03/4/DRY-RUN-c7baf65c1ce44b04bacc416568936daf.pdf	0	2026-01-23 11:16:25.645313+00	\N	\N	missing testRecipients	\N	2026-01-23 11:16:25.645313+00	2026-01-23 11:16:25.645313+00
60	60	smoke-1	cancelled	\N	billing-test@lh.example	{}	{}	{}	t	DRY-RUN-0a0bf9d6f27d4c5ca46253d99b075950	4	2028-06-30	2028/06/4/DRY-RUN-0a0bf9d6f27d4c5ca46253d99b075950.pdf	0	2026-01-23 11:16:29.320074+00	\N	\N	missing testRecipients	\N	2026-01-23 11:16:29.320074+00	2026-01-23 11:16:29.320074+00
\.


--
-- Name: invoice_delivery_outbox_invoice_delivery_outbox_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_delivery_outbox_invoice_delivery_outbox_id_seq', 60, true);


--
-- PostgreSQL database dump complete
--

\unrestrict Nubfl9nopdvAsaK1xIzTnTdErRVxqQWCdvAokE0rvA9jqVmfeid4bqy0AOHzAs8

