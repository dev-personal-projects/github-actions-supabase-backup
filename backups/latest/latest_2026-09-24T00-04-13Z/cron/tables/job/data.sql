--
-- PostgreSQL database dump
--

\restrict AXfE067m6PW9Kh7UQmQiuz3BYPDnxFEn1ktFb2tjehirgb440oY4mTdN2rRsApK

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
-- Data for Name: job; Type: TABLE DATA; Schema: cron; Owner: -
--

COPY cron.job (jobid, schedule, command, nodename, nodeport, database, username, active, jobname) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict AXfE067m6PW9Kh7UQmQiuz3BYPDnxFEn1ktFb2tjehirgb440oY4mTdN2rRsApK

