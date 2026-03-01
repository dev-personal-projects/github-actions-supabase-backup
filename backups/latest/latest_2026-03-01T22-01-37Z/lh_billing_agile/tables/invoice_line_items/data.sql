--
-- PostgreSQL database dump
--

\restrict KPHGfMcn7zKdypgjRebQNlFGdvQYlUyNwdoV8lMCsz7OxA7VEML5PLCetKM8wir

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
-- Data for Name: invoice_line_items; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoice_line_items (invoice_line_item_id, invoice_id, ofast_id, odrl_id, res_id, resource_name, role_level, role_description, service_code, unit_code, quantity, unit_fee, discount_percent, final_unit_fee, line_total, is_prorated, proration_days, proration_total_days, created_at, updated_at) FROM stdin;
1397	253	900001	900001	900001	Ethan Kariuki	Level 2	Senior Software Engineer	\N	month	1.0000	978272.10	0.00	978272.10	978272.10	f	\N	\N	2026-03-01 16:09:04.452924+00	2026-03-01 16:09:04.452924+00
1398	253	900002	900002	900002	Maya Njeri	Level 2	Senior UX/UI Designer	\N	month	1.0000	978272.10	0.00	978272.10	978272.10	f	\N	\N	2026-03-01 16:09:04.452924+00	2026-03-01 16:09:04.452924+00
1399	253	900003	900003	900003	Noah Ochieng	Level 3	Scrum Master	\N	month	1.0000	714138.10	0.00	714138.10	714138.10	f	\N	\N	2026-03-01 16:09:04.452924+00	2026-03-01 16:09:04.452924+00
1400	253	900004	900004	900004	Bo Li	Level 4	Digital Marketing Specialist	\N	month	1.0000	573920.10	0.00	573920.10	573920.10	f	\N	\N	2026-03-01 16:09:04.452924+00	2026-03-01 16:09:04.452924+00
1401	254	900001	900001	900001	Ethan Kariuki	Level 2	Senior Software Engineer	\N	month	3.0000	978272.10	0.00	978272.10	2934816.30	f	\N	\N	2026-03-01 16:09:10.668866+00	2026-03-01 16:09:10.668866+00
1402	254	900002	900002	900002	Maya Njeri	Level 2	Senior UX/UI Designer	\N	month	3.0000	978272.10	0.00	978272.10	2934816.30	f	\N	\N	2026-03-01 16:09:10.668866+00	2026-03-01 16:09:10.668866+00
1403	254	900003	900003	900003	Noah Ochieng	Level 3	Scrum Master	\N	month	3.0000	714138.10	0.00	714138.10	2142414.30	f	\N	\N	2026-03-01 16:09:10.668866+00	2026-03-01 16:09:10.668866+00
1404	254	900004	900004	900004	Bo Li	Level 4	Digital Marketing Specialist	\N	month	3.0000	573920.10	0.00	573920.10	1721760.30	f	\N	\N	2026-03-01 16:09:10.668866+00	2026-03-01 16:09:10.668866+00
\.


--
-- Name: invoice_line_items_invoice_line_item_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_line_items_invoice_line_item_id_seq', 1404, true);


--
-- PostgreSQL database dump complete
--

\unrestrict KPHGfMcn7zKdypgjRebQNlFGdvQYlUyNwdoV8lMCsz7OxA7VEML5PLCetKM8wir

