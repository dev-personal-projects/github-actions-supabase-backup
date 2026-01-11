--
-- PostgreSQL database dump
--

\restrict R7p5twYYs2lLhCs5wsQuVKf31T7BJyMh2QCsqpGkPGJE0hlZkybj2OnGo4L4DoC

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
-- Data for Name: job; Type: TABLE DATA; Schema: cron; Owner: -
--

COPY cron.job (jobid, schedule, command, nodename, nodeport, database, username, active, jobname) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict R7p5twYYs2lLhCs5wsQuVKf31T7BJyMh2QCsqpGkPGJE0hlZkybj2OnGo4L4DoC

