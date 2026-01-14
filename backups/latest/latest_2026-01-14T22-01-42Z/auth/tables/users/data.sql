--
-- PostgreSQL database dump
--

\restrict RAhxUAAlvLygjgQ45UnWLBkhFHuvGW4V98hfGuAwKeeUHBYg6jwAyRVbdl7L7c3

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
00000000-0000-0000-0000-000000000000	36b02fdc-5fd4-4fa6-a6d3-96c4ee256ab7	authenticated	authenticated	kithinjiduane@gmail.com	\N	2025-12-19 16:52:06.061265+00	\N		\N		\N			\N	2025-12-19 16:52:08.493347+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "101117450151043027355", "name": "Duane Kithinji", "email": "kithinjiduane@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKTbF7_6Vb5HM-Y78Xnw1AIj0GBPdGIzQPIeptdXKDQZPIONg=s96-c", "full_name": "Duane Kithinji", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKTbF7_6Vb5HM-Y78Xnw1AIj0GBPdGIzQPIeptdXKDQZPIONg=s96-c", "provider_id": "101117450151043027355", "email_verified": true, "phone_verified": false}	\N	2025-12-19 16:52:06.003562+00	2025-12-19 16:52:08.522016+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	5a0de0c1-8777-423d-b209-36062a0f914d	authenticated	authenticated	duane@shipht.it	\N	2025-12-18 16:55:13.489144+00	\N		\N		\N			\N	2025-12-29 14:03:34.700177+00	{"provider": "azure", "providers": ["azure"]}	{"iss": "https://login.microsoftonline.com/b0a32a5f-1eac-47f8-bb2a-a0c9952485ee/v2.0", "sub": "516ICfC-JW8rWUIsL4AQXWkQIZUSTyBervA_jXaClfw", "email": "duane@shipht.it", "provider_id": "516ICfC-JW8rWUIsL4AQXWkQIZUSTyBervA_jXaClfw", "custom_claims": {"tid": "b0a32a5f-1eac-47f8-bb2a-a0c9952485ee", "email": "duane@shipht.it", "xms_edov": true}, "email_verified": true, "phone_verified": false}	\N	2025-12-18 16:55:13.484912+00	2025-12-29 14:03:34.728307+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	be3c4000-b9c6-48f4-97cc-5c442119a44f	authenticated	authenticated	duane@ktrain.org	\N	2025-12-18 16:55:25.185987+00	\N		\N		\N			\N	2025-12-19 16:21:32.268278+00	{"provider": "github", "providers": ["github"]}	{"iss": "https://api.github.com", "sub": "125078976", "email": "duane@ktrain.org", "user_name": "yhsparrow", "avatar_url": "https://avatars.githubusercontent.com/u/125078976?v=4", "provider_id": "125078976", "email_verified": true, "phone_verified": false, "preferred_username": "yhsparrow"}	\N	2025-12-18 16:55:25.181733+00	2025-12-19 16:21:32.271002+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	a475e822-2ab2-48c0-b789-282b2176a11f	authenticated	authenticated	duane.kithinji@gmail.com	\N	2025-12-18 16:54:27.908837+00	\N		\N		\N			\N	2025-12-23 16:05:40.440283+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "104393642001134493588", "name": "Duane Kithinji", "email": "duane.kithinji@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocLjBsHKpRyQIUiWmZTQPKyakuQRG2uKp2n7itW-BAGjmHsLtI0=s96-c", "full_name": "Duane Kithinji", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocLjBsHKpRyQIUiWmZTQPKyakuQRG2uKp2n7itW-BAGjmHsLtI0=s96-c", "provider_id": "104393642001134493588", "email_verified": true, "phone_verified": false}	\N	2025-12-18 16:54:27.897966+00	2025-12-23 16:05:40.496165+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	e322f800-4bcb-445e-bde9-5679ab96b92b	authenticated	authenticated	njeri@shipht.it	$2a$10$cPa6qKL0xkkX9tzHLDHgBeA9Qz96CmN57R26000FIuIzZHbb6Lfma	2025-12-17 13:39:25.441004+00	\N		\N		\N			\N	2025-12-17 13:40:24.438821+00	{"provider": "email", "providers": ["email"]}	{"sub": "e322f800-4bcb-445e-bde9-5679ab96b92b", "email": "njeri@shipht.it", "email_verified": true, "phone_verified": false}	\N	2025-12-17 13:39:07.672038+00	2025-12-17 13:40:40.718759+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	7c4d44ec-06bf-4c66-b63b-a8859b802f89	authenticated	authenticated	duane_ke@hotmail.com	$2a$10$3j3KDL5cY1LEdIzhaMedou.nYGlz/erb.L6TA1NeXvKTY1op.s3QK	2025-12-18 16:49:08.628424+00	\N		\N		\N			\N	2025-12-26 10:27:52.256654+00	{"provider": "email", "providers": ["email"]}	{"sub": "7c4d44ec-06bf-4c66-b63b-a8859b802f89", "email": "duane_ke@hotmail.com", "email_verified": true, "phone_verified": false}	\N	2025-12-18 16:48:44.658174+00	2025-12-26 10:27:52.275927+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- PostgreSQL database dump complete
--

\unrestrict RAhxUAAlvLygjgQ45UnWLBkhFHuvGW4V98hfGuAwKeeUHBYg6jwAyRVbdl7L7c3

