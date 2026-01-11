--
-- PostgreSQL database dump
--

\restrict 1FGn0DQgE5VnYiwyljn6qtcEbsyONaJNVF77BUf2qFbxCa1ZldqQ4Q7yFPVWG8e

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
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
1123e807-3ddc-4f5b-b601-8ee9f138ae13	1123e807-3ddc-4f5b-b601-8ee9f138ae13	{"sub": "1123e807-3ddc-4f5b-b601-8ee9f138ae13", "email": "collinsentrepreneur@gmail.com", "email_verified": true, "phone_verified": false}	email	2025-12-09 22:15:30.898358+00	2025-12-09 22:15:30.898405+00	2025-12-09 22:15:30.898405+00	8375c1a5-50c9-4ac5-b0f2-b1742238628c
3d684228-c711-47bf-b6bd-f9d3c81a6b8b	3d684228-c711-47bf-b6bd-f9d3c81a6b8b	{"sub": "3d684228-c711-47bf-b6bd-f9d3c81a6b8b", "email": "dev-collins@outlook.com", "email_verified": false, "phone_verified": false}	email	2025-12-09 22:57:52.0719+00	2025-12-09 22:57:52.071961+00	2025-12-09 22:57:52.071961+00	4960f133-6e6b-472f-afad-264baf185500
441485d7-961d-4545-b137-3c4518d5852b	441485d7-961d-4545-b137-3c4518d5852b	{"sub": "441485d7-961d-4545-b137-3c4518d5852b", "email": "collinsnesh04@gmail.com", "email_verified": false, "phone_verified": false}	email	2025-12-10 00:02:14.66085+00	2025-12-10 00:02:14.660914+00	2025-12-10 00:02:14.660914+00	3a47db4f-2eab-466a-afcd-d35e312817b9
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 1FGn0DQgE5VnYiwyljn6qtcEbsyONaJNVF77BUf2qFbxCa1ZldqQ4Q7yFPVWG8e

