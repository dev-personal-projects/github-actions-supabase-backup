--
-- PostgreSQL database dump
--

\restrict qFivWGKVFcOYdx1rRZ3PCMjYg3oDSIu2OxG6eQ8FcMHwa35JdjSDOfvGFGREaTg

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
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, level) FROM stdin;
5a2a9917-4006-486f-906b-86c32fdde08f	chama-profile-pictures	chamas/masters/1765320466464-photo_2025-12-04_05-21-25.jpg	\N	2025-12-09 22:47:47.705194+00	2025-12-09 22:47:47.705194+00	2025-12-09 22:47:47.705194+00	{"eTag": "\\"8f2c561833b97eb7f692673076f4e523\\"", "size": 246334, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-12-09T22:47:48.000Z", "contentLength": 246334, "httpStatusCode": 200}	68778342-3835-4bed-870f-4fcb1dee85ee	\N	{}	3
a24725b6-e491-4009-8544-70666cec47c8	chama-profile-pictures	chamas/masters/1765320500934-photo_2025-12-04_05-21-25.jpg	\N	2025-12-09 22:48:21.992813+00	2025-12-09 22:48:21.992813+00	2025-12-09 22:48:21.992813+00	{"eTag": "\\"8f2c561833b97eb7f692673076f4e523\\"", "size": 246334, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-12-09T22:48:22.000Z", "contentLength": 246334, "httpStatusCode": 200}	508e0a24-869a-4016-a069-76dcb0caf3be	\N	{}	3
6aa073f6-1ec5-4994-900d-f31101a4731b	chama-profile-pictures	chamas/Masters chama/1765320799982-photo_2025-12-04_05-21-25.jpg	\N	2025-12-09 22:53:22.306158+00	2025-12-09 22:53:22.306158+00	2025-12-09 22:53:22.306158+00	{"eTag": "\\"8f2c561833b97eb7f692673076f4e523\\"", "size": 246334, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-12-09T22:53:23.000Z", "contentLength": 246334, "httpStatusCode": 200}	7cdcddb9-6d61-49b0-9aeb-bc02900d52e6	\N	{}	3
c067bbdd-41ed-4955-9c8b-051789463ddc	user-profile-photos	profiles/441485d7-961d-4545-b137-3c4518d5852b/1765326216555-Screenshot 2025-11-21 at 09.32.02.png	\N	2025-12-10 00:23:39.235131+00	2025-12-10 00:23:39.235131+00	2025-12-10 00:23:39.235131+00	{"eTag": "\\"4e4a31c2b6055c46266d5befc2aeca74\\"", "size": 482355, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-12-10T00:23:40.000Z", "contentLength": 482355, "httpStatusCode": 200}	5df77ce0-b926-4149-b6e9-ec696adef70c	\N	{}	3
860387d8-6162-4265-95d3-5f735d7091c8	user-profile-photos	profiles/1123e807-3ddc-4f5b-b601-8ee9f138ae13/1765327681913-photo_2025-12-04_05-21-21.jpg	\N	2025-12-10 00:48:03.734735+00	2025-12-10 00:48:03.734735+00	2025-12-10 00:48:03.734735+00	{"eTag": "\\"534ea2d8e494c05ada91a78ffa106a09\\"", "size": 129426, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2025-12-10T00:48:04.000Z", "contentLength": 129426, "httpStatusCode": 200}	0096b2db-262d-430d-8741-2a5a5ddffcf9	\N	{}	3
fef136e1-15ea-4f74-83b7-790179a29483	chama-profile-pictures	chamas/cedar/1765376168523-Screenshot 2025-11-21 at 09.32.02.png	\N	2025-12-10 14:16:11.761399+00	2025-12-10 14:16:11.761399+00	2025-12-10 14:16:11.761399+00	{"eTag": "\\"4e4a31c2b6055c46266d5befc2aeca74\\"", "size": 482355, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2025-12-10T14:16:12.000Z", "contentLength": 482355, "httpStatusCode": 200}	8e3b83a2-72fb-49d3-abc5-5d5c7ca42141	\N	{}	3
\.


--
-- PostgreSQL database dump complete
--

\unrestrict qFivWGKVFcOYdx1rRZ3PCMjYg3oDSIu2OxG6eQ8FcMHwa35JdjSDOfvGFGREaTg

