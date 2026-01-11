--
-- PostgreSQL database dump
--

\restrict yJVFr9RawFLCpIYWWENmrpvWzSI6v11keeglwXFLQxVDuks7vFr8qfBWR7d6BjP

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
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
chama-profile-pictures	chama-profile-pictures	\N	2025-12-09 22:44:30.216274+00	2025-12-09 22:44:30.216274+00	t	f	\N	\N	\N	STANDARD
user-profile-photos	user-profile-photos	\N	2025-12-10 00:23:37.954047+00	2025-12-10 00:23:37.954047+00	t	f	5242880	{image/jpeg,image/png,image/webp,image/gif}	\N	STANDARD
\.


--
-- PostgreSQL database dump complete
--

\unrestrict yJVFr9RawFLCpIYWWENmrpvWzSI6v11keeglwXFLQxVDuks7vFr8qfBWR7d6BjP

