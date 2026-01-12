--
-- PostgreSQL database dump
--

\restrict lxFIxJF8UHV61QixHhL6H93DQrYiE3wJQnHaNzF1UIFuJxqEN7CWWdqKdUNTPp5

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
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: -
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict lxFIxJF8UHV61QixHhL6H93DQrYiE3wJQnHaNzF1UIFuJxqEN7CWWdqKdUNTPp5

