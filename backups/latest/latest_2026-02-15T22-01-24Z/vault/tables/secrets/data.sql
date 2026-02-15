--
-- PostgreSQL database dump
--

\restrict Dc1x5qcNM8jXTd5yraPfSJuO1WBTx2EknGhyeDcdVtVYUb8e2ME8FYX4CcE5P5L

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.8 (Ubuntu 17.8-1.pgdg24.04+1)

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
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: -
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict Dc1x5qcNM8jXTd5yraPfSJuO1WBTx2EknGhyeDcdVtVYUb8e2ME8FYX4CcE5P5L

