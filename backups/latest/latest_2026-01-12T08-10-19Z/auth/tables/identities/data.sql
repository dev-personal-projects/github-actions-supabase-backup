--
-- PostgreSQL database dump
--

\restrict 2bFujb7G4Fwiy78CkMs2bCH1dEBKuvjCWIJCUhTA0lLcIO2O6ucad5Tx2ltImJK

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
dNRIhcqys9fwNyxyYBXu4doyhcPDhds676OvG6WwG7E	5a0de0c1-8777-423d-b209-36062a0f914d	{"iss": "https://login.microsoftonline.com/b0a32a5f-1eac-47f8-bb2a-a0c9952485ee/v2.0", "sub": "dNRIhcqys9fwNyxyYBXu4doyhcPDhds676OvG6WwG7E", "email": "duane@shipht.it", "provider_id": "dNRIhcqys9fwNyxyYBXu4doyhcPDhds676OvG6WwG7E", "custom_claims": {"tid": "b0a32a5f-1eac-47f8-bb2a-a0c9952485ee", "email": "duane@shipht.it", "xms_edov": true}, "email_verified": true, "phone_verified": false}	azure	2025-12-18 16:55:13.486732+00	2025-12-18 16:55:13.48678+00	2025-12-18 16:55:13.48678+00	17862b2e-6907-40dd-be27-f26071bd3592
e322f800-4bcb-445e-bde9-5679ab96b92b	e322f800-4bcb-445e-bde9-5679ab96b92b	{"sub": "e322f800-4bcb-445e-bde9-5679ab96b92b", "email": "njeri@shipht.it", "email_verified": true, "phone_verified": false}	email	2025-12-17 13:39:07.674389+00	2025-12-17 13:39:07.674454+00	2025-12-17 13:39:07.674454+00	585b7e0b-5151-4267-b3d6-b470642a089c
7c4d44ec-06bf-4c66-b63b-a8859b802f89	7c4d44ec-06bf-4c66-b63b-a8859b802f89	{"sub": "7c4d44ec-06bf-4c66-b63b-a8859b802f89", "email": "duane_ke@hotmail.com", "email_verified": true, "phone_verified": false}	email	2025-12-18 16:48:44.661493+00	2025-12-18 16:48:44.661543+00	2025-12-18 16:48:44.661543+00	75fc102f-0c0c-4d22-aed0-ef76c1a07318
125078976	be3c4000-b9c6-48f4-97cc-5c442119a44f	{"iss": "https://api.github.com", "sub": "125078976", "email": "duane@ktrain.org", "user_name": "yhsparrow", "avatar_url": "https://avatars.githubusercontent.com/u/125078976?v=4", "provider_id": "125078976", "email_verified": true, "phone_verified": false, "preferred_username": "yhsparrow"}	github	2025-12-18 16:55:25.183563+00	2025-12-18 16:55:25.183613+00	2025-12-19 16:21:31.315637+00	d251edd1-8d89-4688-b7e7-1a10f60cbcd2
101117450151043027355	36b02fdc-5fd4-4fa6-a6d3-96c4ee256ab7	{"iss": "https://accounts.google.com", "sub": "101117450151043027355", "name": "Duane Kithinji", "email": "kithinjiduane@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocKTbF7_6Vb5HM-Y78Xnw1AIj0GBPdGIzQPIeptdXKDQZPIONg=s96-c", "full_name": "Duane Kithinji", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocKTbF7_6Vb5HM-Y78Xnw1AIj0GBPdGIzQPIeptdXKDQZPIONg=s96-c", "provider_id": "101117450151043027355", "email_verified": true, "phone_verified": false}	google	2025-12-19 16:52:06.045607+00	2025-12-19 16:52:06.045674+00	2025-12-19 16:52:06.045674+00	b0fe53ff-ac37-414f-80fd-9e099be897fa
104393642001134493588	a475e822-2ab2-48c0-b789-282b2176a11f	{"iss": "https://accounts.google.com", "sub": "104393642001134493588", "name": "Duane Kithinji", "email": "duane.kithinji@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocLjBsHKpRyQIUiWmZTQPKyakuQRG2uKp2n7itW-BAGjmHsLtI0=s96-c", "full_name": "Duane Kithinji", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocLjBsHKpRyQIUiWmZTQPKyakuQRG2uKp2n7itW-BAGjmHsLtI0=s96-c", "provider_id": "104393642001134493588", "email_verified": true, "phone_verified": false}	google	2025-12-18 16:54:27.902503+00	2025-12-18 16:54:27.902556+00	2025-12-23 16:05:38.94938+00	0581f0c2-3808-4a86-97d9-5040c5137718
516ICfC-JW8rWUIsL4AQXWkQIZUSTyBervA_jXaClfw	5a0de0c1-8777-423d-b209-36062a0f914d	{"iss": "https://login.microsoftonline.com/b0a32a5f-1eac-47f8-bb2a-a0c9952485ee/v2.0", "sub": "516ICfC-JW8rWUIsL4AQXWkQIZUSTyBervA_jXaClfw", "email": "duane@shipht.it", "provider_id": "516ICfC-JW8rWUIsL4AQXWkQIZUSTyBervA_jXaClfw", "custom_claims": {"tid": "b0a32a5f-1eac-47f8-bb2a-a0c9952485ee", "email": "duane@shipht.it", "xms_edov": true}, "email_verified": true, "phone_verified": false}	azure	2025-12-19 15:49:40.183304+00	2025-12-19 15:49:40.183354+00	2025-12-29 14:03:32.802439+00	ed8154d5-f1b0-4329-82e6-10b14a55b7c8
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 2bFujb7G4Fwiy78CkMs2bCH1dEBKuvjCWIJCUhTA0lLcIO2O6ucad5Tx2ltImJK

