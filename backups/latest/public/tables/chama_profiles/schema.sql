--
-- PostgreSQL database dump
--

\restrict zxazzszg1DU5bdrndbAAANjiiCcHCEwWt6vVKTvIJtujp7uVMzAuRaqfQ1p8FdU

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
-- Name: chama_profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chama_profiles (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    chama_id uuid,
    profile_id uuid,
    role text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: chama_profiles pk_chama_profiles_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chama_profiles
    ADD CONSTRAINT pk_chama_profiles_id PRIMARY KEY (id);


--
-- Name: chama_profiles fk_chama_profiles_chama_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chama_profiles
    ADD CONSTRAINT fk_chama_profiles_chama_id FOREIGN KEY (chama_id) REFERENCES public.chamas(id) ON DELETE CASCADE;


--
-- Name: chama_profiles fk_chama_profiles_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chama_profiles
    ADD CONSTRAINT fk_chama_profiles_profile_id FOREIGN KEY (profile_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict zxazzszg1DU5bdrndbAAANjiiCcHCEwWt6vVKTvIJtujp7uVMzAuRaqfQ1p8FdU

