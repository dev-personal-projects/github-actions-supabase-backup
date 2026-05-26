--
-- PostgreSQL database dump
--

\restrict LKL3ut3caIshEb0iwEl2nrrrxXeO22fsDFePevhMR3MTlfHnVqvxxN8Vnn6z92F

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.10 (Ubuntu 17.10-1.pgdg24.04+1)

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
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-11-13 11:21:44.576661
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-11-13 11:21:44.581511
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-11-13 11:21:44.612392
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-11-13 11:21:44.667261
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-11-13 11:21:44.670981
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-11-13 11:21:44.679078
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-11-13 11:21:44.682316
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-11-13 11:21:44.696926
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-11-13 11:21:44.703326
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-11-13 11:21:44.707503
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-11-13 11:21:44.71121
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-11-13 11:21:44.73495
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-11-13 11:21:44.738808
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-11-13 11:21:44.742471
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-11-13 11:21:44.74838
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-11-13 11:21:44.7579
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-11-13 11:21:44.762081
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-11-13 11:21:44.768254
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-11-13 11:21:44.782275
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-11-13 11:21:44.792736
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-11-13 11:21:44.797396
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-11-13 11:21:44.802621
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-11-13 11:21:45.118832
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2025-11-18 01:22:05.90369
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2025-11-18 01:22:05.929567
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2025-11-18 01:22:06.006286
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2025-11-18 01:22:06.014265
49	buckets-objects-grants-postgres	072b1195d0d5a2f888af6b2302a1938dd94b8b3d	2025-12-19 08:24:49.209502
2	storage-schema	f6a1fa2c93cbcd16d4e487b362e45fca157a8dbd	2025-11-13 11:21:44.587079
6	change-column-name-in-get-size	ded78e2f1b5d7e616117897e6443a925965b30d2	2025-11-13 11:21:44.675392
9	fix-search-function	af597a1b590c70519b464a4ab3be54490712796b	2025-11-13 11:21:44.686424
10	search-files-search-function	b595f05e92f7e91211af1bbfe9c6a13bb3391e16	2025-11-13 11:21:44.691982
26	objects-prefixes	215cabcb7f78121892a5a2037a09fedf9a1ae322	2025-11-13 11:21:44.806821
27	search-v2	859ba38092ac96eb3964d83bf53ccc0b141663a6	2025-11-13 11:21:44.821685
28	object-bucket-name-sorting	c73a2b5b5d4041e39705814fd3a1b95502d38ce4	2025-11-13 11:21:45.048532
29	create-prefixes	ad2c1207f76703d11a9f9007f821620017a66c21	2025-11-13 11:21:45.05718
30	update-object-levels	2be814ff05c8252fdfdc7cfb4b7f5c7e17f0bed6	2025-11-13 11:21:45.063382
31	objects-level-index	b40367c14c3440ec75f19bbce2d71e914ddd3da0	2025-11-13 11:21:45.070286
32	backward-compatible-index-on-objects	e0c37182b0f7aee3efd823298fb3c76f1042c0f7	2025-11-13 11:21:45.080133
33	backward-compatible-index-on-prefixes	b480e99ed951e0900f033ec4eb34b5bdcb4e3d49	2025-11-13 11:21:45.087608
34	optimize-search-function-v1	ca80a3dc7bfef894df17108785ce29a7fc8ee456	2025-11-13 11:21:45.091077
35	add-insert-trigger-prefixes	458fe0ffd07ec53f5e3ce9df51bfdf4861929ccc	2025-11-13 11:21:45.09805
36	optimise-existing-functions	6ae5fca6af5c55abe95369cd4f93985d1814ca8f	2025-11-13 11:21:45.112096
38	iceberg-catalog-flag-on-buckets	02716b81ceec9705aed84aa1501657095b32e5c5	2025-11-13 11:21:45.122943
39	add-search-v2-sort-support	6706c5f2928846abee18461279799ad12b279b78	2025-11-13 11:21:45.133718
40	fix-prefix-race-conditions-optimized	7ad69982ae2d372b21f48fc4829ae9752c518f6b	2025-11-13 11:21:45.138215
41	add-object-level-update-trigger	07fcf1a22165849b7a029deed059ffcde08d1ae0	2025-11-13 11:21:45.147132
42	rollback-prefix-triggers	771479077764adc09e2ea2043eb627503c034cd4	2025-11-13 11:21:45.15168
43	fix-object-level	84b35d6caca9d937478ad8a797491f38b8c2979f	2025-11-13 11:21:45.156863
48	iceberg-catalog-ids	e0e8b460c609b9999ccd0df9ad14294613eed939	2025-11-18 01:22:06.019125
50	search-v2-optimised	6323ac4f850aa14e7387eb32102869578b5bd478	2026-02-11 15:59:53.718474
51	index-backward-compatible-search	2ee395d433f76e38bcd3856debaf6e0e5b674011	2026-02-11 15:59:53.790393
52	drop-not-used-indexes-and-functions	5cc44c8696749ac11dd0dc37f2a3802075f3a171	2026-02-11 15:59:53.791549
53	drop-index-lower-name	d0cb18777d9e2a98ebe0bc5cc7a42e57ebe41854	2026-02-11 15:59:53.830469
54	drop-index-object-level	6289e048b1472da17c31a7eba1ded625a6457e67	2026-02-11 15:59:53.831869
55	prevent-direct-deletes	262a4798d5e0f2e7c8970232e03ce8be695d5819	2026-02-11 15:59:53.83273
56	fix-optimized-search-function	b823ed1e418101032fa01374edc9a436e54e3ed4	2026-02-11 15:59:53.844323
57	s3-multipart-uploads-metadata	f127886e00d1b374fadbc7c6b31e09336aad5287	2026-05-22 12:29:08.03616
58	operation-ergonomics	00ca5d483b3fe0d522133d9002ccc5df98365120	2026-05-22 12:29:08.04703
59	drop-unused-functions	38456f13e39691c2bbb4b5151d0d1cdbabd4a8c4	2026-05-22 12:29:08.055374
60	optimize-existing-functions-again	db35e1c91a9201e59f4fef8d972c2f277d68b157	2026-05-22 12:29:08.066634
\.


--
-- PostgreSQL database dump complete
--

\unrestrict LKL3ut3caIshEb0iwEl2nrrrxXeO22fsDFePevhMR3MTlfHnVqvxxN8Vnn6z92F

