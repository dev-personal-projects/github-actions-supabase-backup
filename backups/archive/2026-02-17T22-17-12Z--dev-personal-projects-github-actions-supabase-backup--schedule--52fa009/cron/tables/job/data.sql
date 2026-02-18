--
-- PostgreSQL database dump
--

\restrict pChW0Qvy0J74hrgfAEOkbsdsMk22z6hC3GewyEjcyMDlfUU0CQMKX7mjxRkQ9E7

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
-- Data for Name: job; Type: TABLE DATA; Schema: cron; Owner: -
--

COPY cron.job (jobid, schedule, command, nodename, nodeport, database, username, active, jobname) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict pChW0Qvy0J74hrgfAEOkbsdsMk22z6hC3GewyEjcyMDlfUU0CQMKX7mjxRkQ9E7

