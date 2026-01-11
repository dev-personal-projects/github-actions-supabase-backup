--
-- PostgreSQL database dump
--

\restrict kdobfEUIGhqh0mpsxZeeK0U0AUCzhbkejJnG6PaWkvsXUvYcdqYuLv2lwhFbPSa

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
-- Data for Name: secondary_approvers; Type: TABLE DATA; Schema: lh_payproof; Owner: -
--

COPY lh_payproof.secondary_approvers (secondary_approver_id, primary_approver_id, recipient_type, work_email, first_name, middle_name, last_name, contact_description, mobile_number, postal_address, street_address_line1, street_address_line2, city, state, postal_code, country, notes, created_at, updated_at) FROM stdin;
1	3	Cc	njeri@shipht.it	Njeri	\N	Mbugua	Scrum Master	\N	\N	\N	\N	\N	\N	\N	Kenya	\N	2026-01-09 09:27:27.006962+00	2026-01-09 09:27:27.006962+00
2	3	Bcc	ops@shipht.it	John	\N	Smith	Compliance Officer	\N	\N	\N	\N	\N	\N	\N	Kenya	\N	2026-01-09 09:27:27.006962+00	2026-01-09 09:27:27.006962+00
3	1	Cc	finance@shipht.it	\N	\N	\N	Finance Department Distribution List	\N	\N	\N	\N	\N	\N	\N	Kenya	\N	2026-01-09 09:27:27.006962+00	2026-01-09 09:27:27.006962+00
4	2	Cc	duane@shipht.it	Duane	\N	Kingoriah	Program Manager	\N	\N	\N	\N	\N	\N	\N	Kenya	\N	2026-01-09 09:27:27.006962+00	2026-01-09 09:27:27.006962+00
\.


--
-- Name: secondary_approvers_secondary_approver_id_seq; Type: SEQUENCE SET; Schema: lh_payproof; Owner: -
--

SELECT pg_catalog.setval('lh_payproof.secondary_approvers_secondary_approver_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

\unrestrict kdobfEUIGhqh0mpsxZeeK0U0AUCzhbkejJnG6PaWkvsXUvYcdqYuLv2lwhFbPSa

