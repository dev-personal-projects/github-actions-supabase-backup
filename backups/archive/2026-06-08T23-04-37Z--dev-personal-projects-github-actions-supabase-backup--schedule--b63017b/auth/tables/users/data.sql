--
-- PostgreSQL database dump
--

\restrict Xo5LBwbOheTlxct5HPeGneO1yz9lpSB35lDbXvoOALY0j7fEhUi12PkoAFakZdR

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
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	36b02fdc-5fd4-4fa6-a6d3-96c4ee256ab7	authenticated	authenticated	kithinjiduane@gmail.com	\N	2025-12-19 16:52:06.061265+00	\N		\N		\N			\N	2025-12-19 16:52:08.493347+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "101117450151043027355", "name": "Duane Kithinji", "email": "kithinjiduane@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKTbF7_6Vb5HM-Y78Xnw1AIj0GBPdGIzQPIeptdXKDQZPIONg=s96-c", "full_name": "Duane Kithinji", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKTbF7_6Vb5HM-Y78Xnw1AIj0GBPdGIzQPIeptdXKDQZPIONg=s96-c", "provider_id": "101117450151043027355", "email_verified": true, "phone_verified": false}	\N	2025-12-19 16:52:06.003562+00	2025-12-19 16:52:08.522016+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	5a0de0c1-8777-423d-b209-36062a0f914d	authenticated	authenticated	duane@shipht.it	\N	2025-12-18 16:55:13.489144+00	\N		\N		\N			\N	2025-12-29 14:03:34.700177+00	{"provider": "azure", "providers": ["azure"]}	{"iss": "https://login.microsoftonline.com/b0a32a5f-1eac-47f8-bb2a-a0c9952485ee/v2.0", "sub": "516ICfC-JW8rWUIsL4AQXWkQIZUSTyBervA_jXaClfw", "email": "duane@shipht.it", "provider_id": "516ICfC-JW8rWUIsL4AQXWkQIZUSTyBervA_jXaClfw", "custom_claims": {"tid": "b0a32a5f-1eac-47f8-bb2a-a0c9952485ee", "email": "duane@shipht.it", "xms_edov": true}, "email_verified": true, "phone_verified": false}	\N	2025-12-18 16:55:13.484912+00	2025-12-29 14:03:34.728307+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	be3c4000-b9c6-48f4-97cc-5c442119a44f	authenticated	authenticated	duane@ktrain.org	\N	2025-12-18 16:55:25.185987+00	\N		\N		\N			\N	2025-12-19 16:21:32.268278+00	{"provider": "github", "providers": ["github"]}	{"iss": "https://api.github.com", "sub": "125078976", "email": "duane@ktrain.org", "user_name": "yhsparrow", "avatar_url": "https://avatars.githubusercontent.com/u/125078976?v=4", "provider_id": "125078976", "email_verified": true, "phone_verified": false, "preferred_username": "yhsparrow"}	\N	2025-12-18 16:55:25.181733+00	2025-12-19 16:21:32.271002+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	a475e822-2ab2-48c0-b789-282b2176a11f	authenticated	authenticated	duane.kithinji@gmail.com	\N	2025-12-18 16:54:27.908837+00	\N		\N		\N			\N	2025-12-23 16:05:40.440283+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "104393642001134493588", "name": "Duane Kithinji", "email": "duane.kithinji@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocLjBsHKpRyQIUiWmZTQPKyakuQRG2uKp2n7itW-BAGjmHsLtI0=s96-c", "full_name": "Duane Kithinji", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocLjBsHKpRyQIUiWmZTQPKyakuQRG2uKp2n7itW-BAGjmHsLtI0=s96-c", "provider_id": "104393642001134493588", "email_verified": true, "phone_verified": false}	\N	2025-12-18 16:54:27.897966+00	2025-12-23 16:05:40.496165+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	e322f800-4bcb-445e-bde9-5679ab96b92b	authenticated	authenticated	njeri@shipht.it	$2a$10$cPa6qKL0xkkX9tzHLDHgBeA9Qz96CmN57R26000FIuIzZHbb6Lfma	2025-12-17 13:39:25.441004+00	\N		\N		\N			\N	2025-12-17 13:40:24.438821+00	{"provider": "email", "providers": ["email"]}	{"sub": "e322f800-4bcb-445e-bde9-5679ab96b92b", "email": "njeri@shipht.it", "email_verified": true, "phone_verified": false}	\N	2025-12-17 13:39:07.672038+00	2025-12-17 13:40:40.718759+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	7c4d44ec-06bf-4c66-b63b-a8859b802f89	authenticated	authenticated	duane_ke@hotmail.com	$2a$10$3j3KDL5cY1LEdIzhaMedou.nYGlz/erb.L6TA1NeXvKTY1op.s3QK	2025-12-18 16:49:08.628424+00	\N		\N		\N			\N	2025-12-26 10:27:52.256654+00	{"provider": "email", "providers": ["email"]}	{"sub": "7c4d44ec-06bf-4c66-b63b-a8859b802f89", "email": "duane_ke@hotmail.com", "email_verified": true, "phone_verified": false}	\N	2025-12-18 16:48:44.658174+00	2025-12-26 10:27:52.275927+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	33208385-41a1-4494-8465-f50503baa702	authenticated	authenticated	collinsnesh04@gmail.com	\N	2026-05-20 12:34:57.844057+00	\N		\N		\N			\N	2026-05-20 12:35:00.057111+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "107237013198242225241", "name": "collins munene", "email": "collinsnesh04@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKJb8SnJOA9kRxo8Vdb_3WNXhlIAIDUg1qikQT0pk-VFWJCEcUn=s96-c", "full_name": "collins munene", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKJb8SnJOA9kRxo8Vdb_3WNXhlIAIDUg1qikQT0pk-VFWJCEcUn=s96-c", "provider_id": "107237013198242225241", "email_verified": true, "phone_verified": false}	\N	2026-05-20 12:34:57.750494+00	2026-05-20 12:35:00.114428+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	febc7588-0195-451b-ad0e-7a7bc7d75f4e	authenticated	authenticated	collinsentrepreneur@gmail.com	\N	2026-05-21 12:47:03.359074+00	\N		\N		\N			\N	2026-05-21 12:47:05.127014+00	{"provider": "google", "providers": ["google"]}	{"iss": "https://accounts.google.com", "sub": "110244621146354430195", "name": "Collins Munene", "email": "collinsentrepreneur@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocIEj8j7_V6NVvAUgUrkBCruhHN7Az094Mm3hKbLgywd0VFchXqE=s96-c", "full_name": "Collins Munene", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocIEj8j7_V6NVvAUgUrkBCruhHN7Az094Mm3hKbLgywd0VFchXqE=s96-c", "provider_id": "110244621146354430195", "email_verified": true, "phone_verified": false}	\N	2026-05-21 12:47:03.350478+00	2026-05-21 12:47:05.164048+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	797045f3-95c1-4956-aeca-36947cc51e7e	authenticated	authenticated	collins.munene@shipht.it	$2a$10$7pNd/NC8bhB6pxJ/2RdAYOuY9MmM097weJvQPGzOWlsmAb9wqZF1u	2026-05-21 14:17:19.743895+00	\N		2026-05-21 14:16:25.949337+00		\N			\N	2026-05-21 14:17:20.313688+00	{"provider": "email", "providers": ["email"]}	{"sub": "797045f3-95c1-4956-aeca-36947cc51e7e", "email": "collins.munene@shipht.it", "email_verified": true, "phone_verified": false}	\N	2026-05-21 14:15:24.143757+00	2026-05-21 14:17:20.318554+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	786587e0-efa9-4e71-b02a-ec9d990dfc14	authenticated	authenticated	dev-collins@outlook.com	$2a$10$WjW71WKL2dBgB4QetNBxiOqCOe4ekF.rQGcP5zv/8K6QInYO7cZCq	2026-05-21 14:09:16.517173+00	\N		2026-05-21 14:08:41.339908+00		\N			\N	2026-05-21 14:09:29.004806+00	{"provider": "email", "providers": ["email"]}	{"sub": "786587e0-efa9-4e71-b02a-ec9d990dfc14", "email": "dev-collins@outlook.com", "email_verified": true, "phone_verified": false}	\N	2026-05-21 12:46:32.971824+00	2026-05-21 14:09:29.006885+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- PostgreSQL database dump complete
--

\unrestrict Xo5LBwbOheTlxct5HPeGneO1yz9lpSB35lDbXvoOALY0j7fEhUi12PkoAFakZdR

