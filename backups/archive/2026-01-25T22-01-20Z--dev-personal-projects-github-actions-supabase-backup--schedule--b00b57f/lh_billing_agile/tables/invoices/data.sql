--
-- PostgreSQL database dump
--

\restrict JHeMOPkfMk4bAoAJMjXdv0fI87L5soKpnDSeVwai1T6UxALoz2baON9rnYeF4X1

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
-- Data for Name: invoices; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoices (invoice_id, inv_prfx_id, cmp_id, cctr_id, invoice_grouping, billing_group_key, period_start, period_end, currency, subtotal, tax_total, grand_total, status, trigger_type, correlation_id, force_sent, is_dry_run, test_recipients, generated_at, sent_at, created_at, updated_at) FROM stdin;
1	DRY-RUN-f3fb57d250ec400aadd3016f11f57692	4	\N	per_order_form	ofrm:4	2026-01-23	2026-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:04:41.226632+00	\N	2026-01-23 11:04:35.314549+00	2026-01-23 11:04:41.226632+00
2	DRY-RUN-0ed2e9aa9a0c488f80d0ad8c850fe181	4	\N	per_order_form	ofrm:4	2026-04-01	2026-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:04:45.764093+00	\N	2026-01-23 11:04:41.909508+00	2026-01-23 11:04:45.764093+00
3	DRY-RUN-219abd0ef23c4ae68c8e779712f64a9c	4	\N	per_order_form	ofrm:4	2026-07-01	2026-09-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:04:50.021161+00	\N	2026-01-23 11:04:46.441599+00	2026-01-23 11:04:50.021161+00
4	DRY-RUN-bf4e8ac2841847ec854229addd46ccc8	4	\N	per_order_form	ofrm:4	2026-10-01	2026-12-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:04:53.808064+00	\N	2026-01-23 11:04:50.632165+00	2026-01-23 11:04:53.808064+00
5	DRY-RUN-2ec8eb2302a540a1a95507a2c4efaef5	4	\N	per_order_form	ofrm:4	2027-01-01	2027-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:04:58.013329+00	\N	2026-01-23 11:04:54.657093+00	2026-01-23 11:04:58.013329+00
6	DRY-RUN-f8ebbe8925d644e8ad3d61989f50bbf7	4	\N	per_order_form	ofrm:4	2027-04-01	2027-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:05:02.544176+00	\N	2026-01-23 11:04:58.696387+00	2026-01-23 11:05:02.544176+00
7	DRY-RUN-f07a087de6244d12a5ff1270a32b5fdb	4	\N	per_order_form	ofrm:4	2027-07-01	2027-09-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:05:06.909052+00	\N	2026-01-23 11:05:03.220898+00	2026-01-23 11:05:06.909052+00
8	DRY-RUN-f1b18036143247b797c1e94535e83236	4	\N	per_order_form	ofrm:4	2027-10-01	2027-12-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:05:11.446382+00	\N	2026-01-23 11:05:07.603793+00	2026-01-23 11:05:11.446382+00
9	DRY-RUN-24b62bf58cf243f18b4fe5f68024a0c5	4	\N	per_order_form	ofrm:4	2028-01-01	2028-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:05:15.640426+00	\N	2026-01-23 11:05:12.133087+00	2026-01-23 11:05:15.640426+00
10	DRY-RUN-a9be6e3bc47c418495f9edb43c672fc4	4	\N	per_order_form	ofrm:4	2028-04-01	2028-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:05:20.011477+00	\N	2026-01-23 11:05:16.319155+00	2026-01-23 11:05:20.011477+00
11	DRY-RUN-ef4911a0955b4fd8bde35445dbbc5cea	4	\N	per_order_form	ofrm:4	2026-01-23	2026-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	37bea091-57e0-453a-9194-410a4dac9ec5	f	t	\N	2026-01-23 11:07:44.512947+00	\N	2026-01-23 11:07:39.116983+00	2026-01-23 11:07:44.512947+00
12	DRY-RUN-1c67c555ea7a437c88595ca3fd334205	4	\N	per_order_form	ofrm:4	2026-04-01	2026-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	37bea091-57e0-453a-9194-410a4dac9ec5	f	t	\N	2026-01-23 11:07:49.229144+00	\N	2026-01-23 11:07:45.23274+00	2026-01-23 11:07:49.229144+00
13	DRY-RUN-c41f2912e71a4ecc9fb0811daa7ccdb0	4	\N	per_order_form	ofrm:4	2026-07-01	2026-09-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	37bea091-57e0-453a-9194-410a4dac9ec5	f	t	\N	2026-01-23 11:07:53.611407+00	\N	2026-01-23 11:07:49.77675+00	2026-01-23 11:07:53.611407+00
14	DRY-RUN-a7283b185e94471eb2e17aea1aaf0d86	4	\N	per_order_form	ofrm:4	2026-10-01	2026-12-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	37bea091-57e0-453a-9194-410a4dac9ec5	f	t	\N	2026-01-23 11:07:57.836747+00	\N	2026-01-23 11:07:54.15666+00	2026-01-23 11:07:57.836747+00
15	DRY-RUN-ac5aad07c2084db4842928a8a2a917db	4	\N	per_order_form	ofrm:4	2027-01-01	2027-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	37bea091-57e0-453a-9194-410a4dac9ec5	f	t	\N	2026-01-23 11:08:02.187278+00	\N	2026-01-23 11:07:58.519367+00	2026-01-23 11:08:02.187278+00
16	DRY-RUN-0349ac183e994ae291e784b2ed8e049b	4	\N	per_order_form	ofrm:4	2027-04-01	2027-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	37bea091-57e0-453a-9194-410a4dac9ec5	f	t	\N	2026-01-23 11:08:06.808447+00	\N	2026-01-23 11:08:02.864923+00	2026-01-23 11:08:06.808447+00
17	DRY-RUN-f5fc07bab959407ea741cc50eb5db3d8	4	\N	per_order_form	ofrm:4	2027-07-01	2027-09-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	37bea091-57e0-453a-9194-410a4dac9ec5	f	t	\N	2026-01-23 11:08:11.782616+00	\N	2026-01-23 11:08:07.583955+00	2026-01-23 11:08:11.782616+00
18	DRY-RUN-9f3071b5d0ea4e39a49e5915c53492a9	4	\N	per_order_form	ofrm:4	2027-10-01	2027-12-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	37bea091-57e0-453a-9194-410a4dac9ec5	f	t	\N	2026-01-23 11:08:16.081874+00	\N	2026-01-23 11:08:12.477835+00	2026-01-23 11:08:16.081874+00
19	DRY-RUN-fb9c922ab34f469fb63c4dfe5fd078f9	4	\N	per_order_form	ofrm:4	2028-01-01	2028-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	37bea091-57e0-453a-9194-410a4dac9ec5	f	t	\N	2026-01-23 11:08:19.993049+00	\N	2026-01-23 11:08:16.67676+00	2026-01-23 11:08:19.993049+00
20	DRY-RUN-28dec95ed01e4062901d85b9085098c7	4	\N	per_order_form	ofrm:4	2028-04-01	2028-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	37bea091-57e0-453a-9194-410a4dac9ec5	f	t	\N	2026-01-23 11:08:24.458049+00	\N	2026-01-23 11:08:20.686078+00	2026-01-23 11:08:24.458049+00
23	DRY-RUN-4a60226a3ec54c2f972af69da8d70b08	4	\N	per_order_form	ofrm:4	2026-07-01	2026-09-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:09:25.869436+00	\N	2026-01-23 11:09:22.225457+00	2026-01-23 11:09:25.869436+00
21	DRY-RUN-0af15e413b0248a0b6d0b42a9128a9ce	4	\N	per_order_form	ofrm:4	2026-01-23	2026-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:09:17.337761+00	\N	2026-01-23 11:09:13.1301+00	2026-01-23 11:09:17.337761+00
22	DRY-RUN-3552b1f55e48412abee39d6ecdbeb4c2	4	\N	per_order_form	ofrm:4	2026-04-01	2026-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:09:21.681175+00	\N	2026-01-23 11:09:17.944935+00	2026-01-23 11:09:21.681175+00
27	DRY-RUN-e55369001fb143bbbe1b4ce472b2f9f0	4	\N	per_order_form	ofrm:4	2027-07-01	2027-09-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:09:44.07384+00	\N	2026-01-23 11:09:40.392105+00	2026-01-23 11:09:44.07384+00
24	DRY-RUN-84157ed1d767402ba5712c0988915e33	4	\N	per_order_form	ofrm:4	2026-10-01	2026-12-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:09:30.422723+00	\N	2026-01-23 11:09:26.428422+00	2026-01-23 11:09:30.422723+00
26	DRY-RUN-319bb3a781f54183a46c8f42bcbddefa	4	\N	per_order_form	ofrm:4	2027-04-01	2027-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:09:39.857272+00	\N	2026-01-23 11:09:35.313544+00	2026-01-23 11:09:39.857272+00
25	DRY-RUN-b2af95504d9f4cd7ab8ab66cf510a392	4	\N	per_order_form	ofrm:4	2027-01-01	2027-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:09:34.638875+00	\N	2026-01-23 11:09:30.954736+00	2026-01-23 11:09:34.638875+00
28	DRY-RUN-4c867164841747aeb5af9e9b5dc10b17	4	\N	per_order_form	ofrm:4	2027-10-01	2027-12-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:09:47.733391+00	\N	2026-01-23 11:09:44.588324+00	2026-01-23 11:09:47.733391+00
29	DRY-RUN-0a12138b7fd942b5b04db5a64037062f	4	\N	per_order_form	ofrm:4	2028-01-01	2028-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:09:51.905576+00	\N	2026-01-23 11:09:48.245631+00	2026-01-23 11:09:51.905576+00
30	DRY-RUN-affe6ec11fbe4fbbb1b6268ab7dcbfcb	4	\N	per_order_form	ofrm:4	2028-04-01	2028-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:09:55.944272+00	\N	2026-01-23 11:09:52.440497+00	2026-01-23 11:09:55.944272+00
31	DRY-RUN-342466dd423a42499f2c1a9542a5c5b7	4	\N	per_order_form	ofrm:4	2026-01-23	2026-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:10:15.258396+00	\N	2026-01-23 11:10:11.303858+00	2026-01-23 11:10:15.258396+00
32	DRY-RUN-f56af6810c0549d083fcbb353adae9a1	4	\N	per_order_form	ofrm:4	2026-04-01	2026-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:10:19.955594+00	\N	2026-01-23 11:10:15.867538+00	2026-01-23 11:10:19.955594+00
46	INV-2026-009006	4	\N	per_order_form	ofrm:4	2027-04-01	2027-06-30	KES	0.00	0.00	0.00	generated	HTTP-OrderformId-Admin	smoke-3	t	f	\N	2026-01-23 11:11:26.288465+00	\N	2026-01-23 11:11:22.728855+00	2026-01-23 11:11:26.288465+00
33	DRY-RUN-80e3a48c0b8e495ab41e568b898d6214	4	\N	per_order_form	ofrm:4	2026-07-01	2026-09-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:10:24.618907+00	\N	2026-01-23 11:10:20.754648+00	2026-01-23 11:10:24.618907+00
48	INV-2026-009008	4	\N	per_order_form	ofrm:4	2027-10-01	2027-12-31	KES	0.00	0.00	0.00	generated	HTTP-OrderformId-Admin	smoke-3	t	f	\N	2026-01-23 11:11:35.904008+00	\N	2026-01-23 11:11:31.891229+00	2026-01-23 11:11:35.904008+00
35	DRY-RUN-0feb05a5a1a044adb63417d075ad7405	4	\N	per_order_form	ofrm:4	2027-01-01	2027-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:10:33.841925+00	\N	2026-01-23 11:10:30.185599+00	2026-01-23 11:10:33.841925+00
37	DRY-RUN-4f47eaf04250420c89569ae3ad073057	4	\N	per_order_form	ofrm:4	2027-07-01	2027-09-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:10:43.48972+00	\N	2026-01-23 11:10:39.320264+00	2026-01-23 11:10:43.48972+00
50	INV-2026-009010	4	\N	per_order_form	ofrm:4	2028-04-01	2028-06-30	KES	0.00	0.00	0.00	generated	HTTP-OrderformId-Admin	smoke-3	t	f	\N	2026-01-23 11:11:45.690363+00	\N	2026-01-23 11:11:41.3321+00	2026-01-23 11:11:45.690363+00
39	DRY-RUN-5cce200bdaf14ca9b99276c3143d159b	4	\N	per_order_form	ofrm:4	2028-01-01	2028-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:10:51.693727+00	\N	2026-01-23 11:10:48.533655+00	2026-01-23 11:10:51.693727+00
51	DRY-RUN-24cb911c90294828ae6b6e8597d8c15e	4	\N	per_order_form	ofrm:4	2026-01-23	2026-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:15:53.686238+00	\N	2026-01-23 11:15:48.79017+00	2026-01-23 11:15:53.686238+00
42	INV-2026-009002	4	\N	per_order_form	ofrm:4	2026-04-01	2026-06-30	KES	0.00	0.00	0.00	generated	HTTP-OrderformId-Admin	smoke-3	t	f	\N	2026-01-23 11:11:08.690009+00	\N	2026-01-23 11:11:04.257505+00	2026-01-23 11:11:08.690009+00
44	INV-2026-009004	4	\N	per_order_form	ofrm:4	2026-10-01	2026-12-31	KES	0.00	0.00	0.00	generated	HTTP-OrderformId-Admin	smoke-3	t	f	\N	2026-01-23 11:11:17.920756+00	\N	2026-01-23 11:11:14.232317+00	2026-01-23 11:11:17.920756+00
53	DRY-RUN-301344866ebc4c93880c0d2d6bb8c6b1	4	\N	per_order_form	ofrm:4	2026-07-01	2026-09-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:16:02.040766+00	\N	2026-01-23 11:15:58.37685+00	2026-01-23 11:16:02.040766+00
55	DRY-RUN-cb82ad2a8daa4ac3a28018b413d53390	4	\N	per_order_form	ofrm:4	2027-01-01	2027-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:16:10.155923+00	\N	2026-01-23 11:16:06.772847+00	2026-01-23 11:16:10.155923+00
57	DRY-RUN-babf9b5df582443fa2c6523c29bd75a7	4	\N	per_order_form	ofrm:4	2027-07-01	2027-09-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:16:18.329595+00	\N	2026-01-23 11:16:14.98078+00	2026-01-23 11:16:18.329595+00
59	DRY-RUN-c7baf65c1ce44b04bacc416568936daf	4	\N	per_order_form	ofrm:4	2028-01-01	2028-03-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:16:25.820816+00	\N	2026-01-23 11:16:22.6746+00	2026-01-23 11:16:25.820816+00
45	INV-2026-009005	4	\N	per_order_form	ofrm:4	2027-01-01	2027-03-31	KES	0.00	0.00	0.00	generated	HTTP-OrderformId-Admin	smoke-3	t	f	\N	2026-01-23 11:11:22.197526+00	\N	2026-01-23 11:11:18.625703+00	2026-01-23 11:11:22.197526+00
34	DRY-RUN-4812ec7109e64dbe9bd156648ef4d8ab	4	\N	per_order_form	ofrm:4	2026-10-01	2026-12-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:10:29.341335+00	\N	2026-01-23 11:10:25.299652+00	2026-01-23 11:10:29.341335+00
36	DRY-RUN-2b3c1d9dd5d74e509c63c0c648395f9a	4	\N	per_order_form	ofrm:4	2027-04-01	2027-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:10:38.590276+00	\N	2026-01-23 11:10:34.388+00	2026-01-23 11:10:38.590276+00
47	INV-2026-009007	4	\N	per_order_form	ofrm:4	2027-07-01	2027-09-30	KES	0.00	0.00	0.00	generated	HTTP-OrderformId-Admin	smoke-3	t	f	\N	2026-01-23 11:11:31.220218+00	\N	2026-01-23 11:11:26.809406+00	2026-01-23 11:11:31.220218+00
38	DRY-RUN-168f775002e248afa9261315e65d7978	4	\N	per_order_form	ofrm:4	2027-10-01	2027-12-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:10:47.846891+00	\N	2026-01-23 11:10:44.195034+00	2026-01-23 11:10:47.846891+00
49	INV-2026-009009	4	\N	per_order_form	ofrm:4	2028-01-01	2028-03-31	KES	0.00	0.00	0.00	generated	HTTP-OrderformId-Admin	smoke-3	t	f	\N	2026-01-23 11:11:40.673392+00	\N	2026-01-23 11:11:36.45411+00	2026-01-23 11:11:40.673392+00
40	DRY-RUN-afd9e3887de8425798ca34aeb0694127	4	\N	per_order_form	ofrm:4	2028-04-01	2028-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-2	f	t	{duane@shipht.it}	2026-01-23 11:10:56.23874+00	\N	2026-01-23 11:10:52.316156+00	2026-01-23 11:10:56.23874+00
41	INV-2026-009001	4	\N	per_order_form	ofrm:4	2026-01-23	2026-03-31	KES	0.00	0.00	0.00	generated	HTTP-OrderformId-Admin	smoke-3	t	f	\N	2026-01-23 11:11:03.437766+00	\N	2026-01-23 11:10:58.697896+00	2026-01-23 11:11:03.437766+00
52	DRY-RUN-a9a2fbb810314bb38db495a84ab8d67c	4	\N	per_order_form	ofrm:4	2026-04-01	2026-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:15:57.850063+00	\N	2026-01-23 11:15:54.397608+00	2026-01-23 11:15:57.850063+00
43	INV-2026-009003	4	\N	per_order_form	ofrm:4	2026-07-01	2026-09-30	KES	0.00	0.00	0.00	generated	HTTP-OrderformId-Admin	smoke-3	t	f	\N	2026-01-23 11:11:13.709524+00	\N	2026-01-23 11:11:09.51096+00	2026-01-23 11:11:13.709524+00
54	DRY-RUN-924b64c5134449f3a5fc308a679b6a32	4	\N	per_order_form	ofrm:4	2026-10-01	2026-12-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:16:06.084023+00	\N	2026-01-23 11:16:02.581793+00	2026-01-23 11:16:06.084023+00
56	DRY-RUN-a48e90ca448a4640b52a5fd156ebe28d	4	\N	per_order_form	ofrm:4	2027-04-01	2027-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:16:14.30427+00	\N	2026-01-23 11:16:10.956866+00	2026-01-23 11:16:14.30427+00
58	DRY-RUN-2f4ea68f70334ee686c4ab4d6f9d596c	4	\N	per_order_form	ofrm:4	2027-10-01	2027-12-31	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:16:22.148092+00	\N	2026-01-23 11:16:19.012431+00	2026-01-23 11:16:22.148092+00
60	DRY-RUN-0a0bf9d6f27d4c5ca46253d99b075950	4	\N	per_order_form	ofrm:4	2028-04-01	2028-06-30	KES	0.00	0.00	0.00	dry_run	HTTP-OrderformId-Admin	smoke-1	f	t	\N	2026-01-23 11:16:29.487796+00	\N	2026-01-23 11:16:26.352148+00	2026-01-23 11:16:29.487796+00
\.


--
-- Name: invoices_invoice_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoices_invoice_id_seq', 60, true);


--
-- PostgreSQL database dump complete
--

\unrestrict JHeMOPkfMk4bAoAJMjXdv0fI87L5soKpnDSeVwai1T6UxALoz2baON9rnYeF4X1

