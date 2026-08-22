--
-- PostgreSQL database dump
--

\restrict l6jYPViBjme8hp5JbyEkhev9ZM465gcM1WzkZbdab2nB9jWsBOWm2oHiQnlhm2J

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.11 (Ubuntu 17.11-1.pgdg24.04+2)

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
\.


--
-- PostgreSQL database dump complete
--

\unrestrict l6jYPViBjme8hp5JbyEkhev9ZM465gcM1WzkZbdab2nB9jWsBOWm2oHiQnlhm2J

