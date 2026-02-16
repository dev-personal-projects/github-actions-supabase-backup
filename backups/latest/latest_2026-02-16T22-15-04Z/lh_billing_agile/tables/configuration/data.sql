--
-- PostgreSQL database dump
--

\restrict jxVMRUHuVhT5L5iCXPsG12tXRqL0ljo7uKw8x54wdqKXM5BwTtnMok8LlMWhvrQ

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.8 (Ubuntu 17.8-1.pgdg24.04+1)

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
1	InvoiceSenderEmail	billing@shipht.it	Email address used to send customer invoices	\N	2026-02-10 14:27:55.269798+00	2026-02-10 14:27:55.269798+00
4	DefaultBillingFrequency	quarterly	Default billing frequency when not specified	\N	2026-02-10 14:27:55.269798+00	2026-02-10 14:27:55.269798+00
5	DefaultIssueWindowDaysMonthly	10	Days before period start to issue invoice (monthly)	\N	2026-02-10 14:27:55.269798+00	2026-02-10 14:27:55.269798+00
6	DefaultIssueWindowDaysQuarterly	45	Days before period start to issue invoice (quarterly)	\N	2026-02-10 14:27:55.269798+00	2026-02-10 14:27:55.269798+00
7	DefaultIssueWindowDaysSemiAnnual	45	Days before period start to issue invoice (semi-annual)	\N	2026-02-10 14:27:55.269798+00	2026-02-10 14:27:55.269798+00
8	DefaultIssueWindowDaysAnnual	45	Days before period start to issue invoice (annual)	\N	2026-02-10 14:27:55.269798+00	2026-02-10 14:27:55.269798+00
9	RetryMaxAttempts	3	Maximum retry attempts for failed email sends	\N	2026-02-10 14:27:55.269798+00	2026-02-10 14:27:55.269798+00
10	RetryBaseDelaySeconds	5	Base delay in seconds for exponential backoff retry	\N	2026-02-10 14:27:55.269798+00	2026-02-10 14:27:55.269798+00
11	RemittanceProfilesRequireApproval	true	Informational flag: Agile policy requires approval for active remittance profiles. Enforced by DB constraint + app logic; keep true for config parity across environments.	\N	2026-02-10 14:27:55.269798+00	2026-02-10 14:27:55.269798+00
2	AlertRecipients	ops@shipht.it,finance@shipht.it	Restored by dev smoke rollback	\N	2026-02-10 14:27:55.269798+00	2026-02-15 10:19:14.360601+00
3	AlertSubjectPrefix	[Invoicing Alert]	Restored by dev smoke rollback	\N	2026-02-10 14:27:55.269798+00	2026-02-15 10:19:15.796355+00
\.


--
-- Name: configuration_configuration_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.configuration_configuration_id_seq', 19, true);


--
-- PostgreSQL database dump complete
--

\unrestrict jxVMRUHuVhT5L5iCXPsG12tXRqL0ljo7uKw8x54wdqKXM5BwTtnMok8LlMWhvrQ

