--
-- PostgreSQL database dump
--

\restrict tfVXyPE4yGsDU5V7zzmUdX0s8SuMyaEhjGp7hffbaOkBGpA1Ru4JcNOKIji9k8S

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
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	1123e807-3ddc-4f5b-b601-8ee9f138ae13	authenticated	authenticated	collinsentrepreneur@gmail.com	$2a$10$eHaOrgH3ngev85XKefzr4uK6f1kPoOAKfuTKsn/.ikTq9qXWUH0Li	2025-12-09 22:15:41.057727+00	\N		2025-12-09 22:15:30.900451+00		\N			\N	2025-12-10 14:49:23.622419+00	{"provider": "email", "providers": ["email"]}	{"sub": "1123e807-3ddc-4f5b-b601-8ee9f138ae13", "email": "collinsentrepreneur@gmail.com", "email_verified": true, "phone_verified": false}	\N	2025-12-09 22:15:30.895414+00	2025-12-10 17:55:07.405237+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	441485d7-961d-4545-b137-3c4518d5852b	authenticated	authenticated	collinsnesh04@gmail.com	$2a$10$2ypnPTqSoFtSkj6M5lRbM.wTRP.Wkx2pTXhc5Th9PIyJuWV1lGtjS	2025-12-10 00:02:14.670864+00	\N		\N		\N			\N	2025-12-10 00:20:04.573328+00	{"provider": "email", "providers": ["email"]}	{"email_verified": true}	\N	2025-12-10 00:02:14.632012+00	2025-12-10 00:20:04.576023+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	3d684228-c711-47bf-b6bd-f9d3c81a6b8b	authenticated	authenticated	dev-collins@outlook.com	$2a$10$yw4.BSdVTxOinFVuDShOCu0KmK88/s9sMGS9XShp7r.pyxxp6GThq	2025-12-09 22:57:52.083126+00	\N		\N		\N			\N	2025-12-10 14:48:37.607086+00	{"provider": "email", "providers": ["email"]}	{"email_verified": true}	\N	2025-12-09 22:57:52.057615+00	2025-12-10 14:48:37.61953+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- PostgreSQL database dump complete
--

\unrestrict tfVXyPE4yGsDU5V7zzmUdX0s8SuMyaEhjGp7hffbaOkBGpA1Ru4JcNOKIji9k8S

