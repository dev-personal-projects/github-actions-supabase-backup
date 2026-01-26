--
-- PostgreSQL database dump
--

\restrict tWN4qpXAKWOS0VP1hMWAVoIcW4fvBYU934jffr0gK4t66Z6iPUuqA5FvZuqqof0

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
-- Data for Name: configuration; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.configuration (configuration_id, cfg_key, cfg_value, cfg_description, cmp_id, created_at, updated_at) FROM stdin;
4	DefaultBillingFrequency	quarterly	Default billing frequency when not specified	\N	2026-01-22 14:24:18.867767+00	2026-01-22 14:24:18.867767+00
5	DefaultIssueWindowDaysMonthly	10	Days before period start to issue invoice (monthly)	\N	2026-01-22 14:24:18.867767+00	2026-01-22 14:24:18.867767+00
6	DefaultIssueWindowDaysQuarterly	45	Days before period start to issue invoice (quarterly)	\N	2026-01-22 14:24:18.867767+00	2026-01-22 14:24:18.867767+00
7	DefaultIssueWindowDaysSemiAnnual	45	Days before period start to issue invoice (semi-annual)	\N	2026-01-22 14:24:18.867767+00	2026-01-22 14:24:18.867767+00
8	DefaultIssueWindowDaysAnnual	45	Days before period start to issue invoice (annual)	\N	2026-01-22 14:24:18.867767+00	2026-01-22 14:24:18.867767+00
9	RetryMaxAttempts	3	Maximum retry attempts for failed email sends	\N	2026-01-22 14:24:18.867767+00	2026-01-22 14:24:18.867767+00
10	RetryBaseDelaySeconds	5	Base delay in seconds for exponential backoff retry	\N	2026-01-22 14:24:18.867767+00	2026-01-22 14:24:18.867767+00
1	InvoiceSenderEmail	billing-test@lh.example	Smoke test sender	\N	2026-01-22 14:24:18.867767+00	2026-01-23 11:04:29.657932+00
12	AlertSenderEmail	alerts-test@lh.example	Smoke test alert sender	\N	2026-01-23 11:04:29.657932+00	2026-01-23 11:04:29.657932+00
2	AlertRecipients	alerts-test@lh.example	Smoke test alert recipients	\N	2026-01-22 14:24:18.867767+00	2026-01-23 11:04:29.657932+00
3	AlertSubjectPrefix	[SMOKE]	Smoke test alert subject prefix	\N	2026-01-22 14:24:18.867767+00	2026-01-23 11:04:29.657932+00
\.


--
-- Name: configuration_configuration_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.configuration_configuration_id_seq', 14, true);


--
-- PostgreSQL database dump complete
--

\unrestrict tWN4qpXAKWOS0VP1hMWAVoIcW4fvBYU934jffr0gK4t66Z6iPUuqA5FvZuqqof0

