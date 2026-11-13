--
-- PostgreSQL database dump
--

\restrict 9rcqsiKBIYEdd1amIf0D58OEadF82x2J1o8dN4a1mg3A3tEanX1GPW7oFwN5PXq

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.12 (Ubuntu 17.12-1.pgdg24.04+1)

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

SET default_table_access_method = heap;

--
-- Name: snapshot_agile_ordered_revenue_forecast; Type: TABLE; Schema: kristol_fpna; Owner: -
--

CREATE TABLE kristol_fpna.snapshot_agile_ordered_revenue_forecast (
    sequential_month integer,
    year integer,
    month_number integer,
    month text,
    revenue_projection numeric,
    snapshot_date timestamp with time zone DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'UTC'::text)
);


--
-- Name: snapshot_agile_ordered_revenue_forecast; Type: ROW SECURITY; Schema: kristol_fpna; Owner: -
--

ALTER TABLE kristol_fpna.snapshot_agile_ordered_revenue_forecast ENABLE ROW LEVEL SECURITY;

--
-- PostgreSQL database dump complete
--

\unrestrict 9rcqsiKBIYEdd1amIf0D58OEadF82x2J1o8dN4a1mg3A3tEanX1GPW7oFwN5PXq

