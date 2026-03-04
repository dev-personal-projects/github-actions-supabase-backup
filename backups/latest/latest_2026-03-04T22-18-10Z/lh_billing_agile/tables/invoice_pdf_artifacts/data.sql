--
-- PostgreSQL database dump
--

\restrict xgR9ztFjtSHUYVyqE96qr3VBmKe3Nz52U5aZbbTb8KuT5oT1VQNDr02bvRYIYHG

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
-- Data for Name: invoice_pdf_artifacts; Type: TABLE DATA; Schema: lh_billing_agile; Owner: -
--

COPY lh_billing_agile.invoice_pdf_artifacts (invoice_pdf_artifact_id, invoice_id, original_pdf_blob_path, original_pdf_sha256, postprocessed_pdf_blob_path, postprocessed_pdf_sha256, stamp_rule_id, created_at, updated_at) FROM stdin;
24	24	2026/06/902001/24.pdf	b686df2ba363cc7a3de049075b96427645679d690a20d8c93585006fd70f95a3	2026/06/902001/24.postprocessed.pdf	5076281901eeb1bb2fb819115925e0bff89b7dfc5a4df78d184577abbe6dc2ee	pdf.overlay_qr_stamp	2026-03-04 08:22:34.747439+00	2026-03-04 08:22:52.528239+00
20	20	2026/06/900001/20.pdf	a7b6fc1c9c3254c69137d615377917587679dd39b7803a9d5e6fabdcd88a9bb0	2026/06/900001/20.postprocessed.pdf	d9ee86b77e6c4cc5ada9fa98f987e5250424296405c21a4bdb1db810fe97f17d	pdf.overlay_qr_stamp	2026-03-04 08:22:31.394621+00	2026-03-04 08:22:52.652573+00
21	21	2026/03/901001/21.pdf	2da714c3a84658f366eef7f5a884a6e78f76588416a58667bcb3277539a7b7d0	\N	\N	\N	2026-03-04 08:22:33.181587+00	2026-03-04 08:22:33.181587+00
22	22	2026/06/901001/22.pdf	53f35542d02dd551026b70aebe6e06c1b1988f89d4bc490dafa682e79607696d	\N	\N	\N	2026-03-04 08:22:33.24028+00	2026-03-04 08:22:33.24028+00
19	19	2026/03/900001/19.pdf	ea92a28497f30f7d7442de7b6e9dd6f8decfbf7e3bb3911cceb892655eea0f9c	2026/03/900001/19.postprocessed.pdf	09b162998e974dbef668b98bc579540ce48f23a756e84e633a9ca9101cf9cf43	pdf.overlay_qr_stamp	2026-03-04 08:22:31.32361+00	2026-03-04 08:22:52.31359+00
23	23	2026/03/902001/23.pdf	0dde5ceb900e1d620aa829b9e3099e8234c4c14db32c401714e2625e8850f58e	2026/03/902001/23.postprocessed.pdf	40f001e493d0ab38e6c9505b88af525e27a906a7aa8df3491320bf93e500a32c	pdf.overlay_qr_stamp	2026-03-04 08:22:34.667812+00	2026-03-04 08:22:52.33057+00
\.


--
-- Name: invoice_pdf_artifacts_invoice_pdf_artifact_id_seq; Type: SEQUENCE SET; Schema: lh_billing_agile; Owner: -
--

SELECT pg_catalog.setval('lh_billing_agile.invoice_pdf_artifacts_invoice_pdf_artifact_id_seq', 24, true);


--
-- PostgreSQL database dump complete
--

\unrestrict xgR9ztFjtSHUYVyqE96qr3VBmKe3Nz52U5aZbbTb8KuT5oT1VQNDr02bvRYIYHG

