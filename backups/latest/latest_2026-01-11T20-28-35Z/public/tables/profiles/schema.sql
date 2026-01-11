--
-- PostgreSQL database dump
--

\restrict ABcTmpW74amGqL6bWCXKOdAjftaEUSJEy0zh3mQeRr2o9C2AIOLBS77shFvNweO

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

SET default_table_access_method = heap;

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profiles (
    id uuid NOT NULL,
    first_name text,
    middle_name text,
    last_name text,
    email text,
    phone text,
    avatar_url text,
    residence text,
    id_number numeric,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: profiles UQ_6ca5cd9bacd921599be9d920973; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT "UQ_6ca5cd9bacd921599be9d920973" UNIQUE (phone);


--
-- Name: profiles pk_profiles_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT pk_profiles_id PRIMARY KEY (id);


--
-- Name: profiles uq_profiles_email; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT uq_profiles_email UNIQUE (email);


--
-- Name: profiles uq_profiles_id_number; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT uq_profiles_id_number UNIQUE (id_number);


--
-- PostgreSQL database dump complete
--

\unrestrict ABcTmpW74amGqL6bWCXKOdAjftaEUSJEy0zh3mQeRr2o9C2AIOLBS77shFvNweO

