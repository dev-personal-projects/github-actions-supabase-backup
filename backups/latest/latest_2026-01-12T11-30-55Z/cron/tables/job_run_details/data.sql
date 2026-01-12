--
-- PostgreSQL database dump
--

\restrict 35hLxmBPN8l2XXcChO9MeGDCeTOktbBZHgCmItHVtsz1wPmc5gSu4POY6FwzS4g

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
-- Data for Name: job_run_details; Type: TABLE DATA; Schema: cron; Owner: -
--

COPY cron.job_run_details (jobid, runid, job_pid, database, username, command, status, return_message, start_time, end_time) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 35hLxmBPN8l2XXcChO9MeGDCeTOktbBZHgCmItHVtsz1wPmc5gSu4POY6FwzS4g

