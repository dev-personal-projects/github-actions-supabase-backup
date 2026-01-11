--
-- PostgreSQL database dump
--

\restrict AjXpgmYgoAA0xcB1y5jFcGEXGGQWIXwbvvoXgWBKcAhX39rBXy8dolP1KIFiqxg

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
-- Name: chamas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chamas (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    description text,
    created_by uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    profile_picture_url text
);


--
-- Name: chamas pk_chamas_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chamas
    ADD CONSTRAINT pk_chamas_id PRIMARY KEY (id);


--
-- Name: chamas uq_chamas_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chamas
    ADD CONSTRAINT uq_chamas_name UNIQUE (name);


--
-- Name: chamas fk_chamas_created_by; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chamas
    ADD CONSTRAINT fk_chamas_created_by FOREIGN KEY (created_by) REFERENCES public.profiles(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict AjXpgmYgoAA0xcB1y5jFcGEXGGQWIXwbvvoXgWBKcAhX39rBXy8dolP1KIFiqxg

