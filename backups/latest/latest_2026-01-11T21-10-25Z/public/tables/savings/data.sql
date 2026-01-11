--
-- PostgreSQL database dump
--

\restrict VOEZguw6OVemtpHc1Ey32HhzGozxTFPJBmUMeWnQ4sbPGqx448HQ8nTH1uF719G

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
-- Data for Name: savings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.savings (id, amount, date, type, created_at, updated_at, owner_id, chama_id, created_by_id) FROM stdin;
eb58403e-d2d0-49e1-bcc1-a2e4db036d4d	7000	2004-08-10 00:00:00+00	weekly	2025-12-09 22:58:42.801902+00	2025-12-09 22:58:42.801902+00	0bc6fb57-1e42-40ae-af9e-f3e81695437d	b67d3479-8cb0-4a7c-ac72-8c9086769cfb	3b1f4b2e-25ae-415e-82f2-e125aed86313
5b8b15ba-d3d9-495d-978d-2f8ca0490c45	500	2025-12-20 00:00:00+00	monthly	2025-12-10 00:46:51.232589+00	2025-12-10 00:46:51.232589+00	26181be5-417e-4023-8442-27ac46ec9d93	b67d3479-8cb0-4a7c-ac72-8c9086769cfb	3b1f4b2e-25ae-415e-82f2-e125aed86313
3ff11c3e-de42-4116-8d2c-599a0abab041	600000000	2025-12-27 00:00:00+00	monthly	2025-12-10 01:03:20.221668+00	2025-12-10 01:03:20.221668+00	3b1f4b2e-25ae-415e-82f2-e125aed86313	b67d3479-8cb0-4a7c-ac72-8c9086769cfb	3b1f4b2e-25ae-415e-82f2-e125aed86313
1a9f98f5-e652-4d3c-bef4-bfc0ebb0550f	4000	2025-12-10 00:00:00+00	monthly	2025-12-10 14:51:37.605008+00	2025-12-10 14:51:37.605008+00	f95649a7-2900-4b73-b9e6-02254340c463	5e0835fe-ef7c-4932-a76f-f515840ff7ef	0d37dd3f-69d5-48c8-a8bb-42c52fad80b6
\.


--
-- PostgreSQL database dump complete
--

\unrestrict VOEZguw6OVemtpHc1Ey32HhzGozxTFPJBmUMeWnQ4sbPGqx448HQ8nTH1uF719G

