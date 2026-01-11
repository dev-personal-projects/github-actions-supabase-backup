--
-- PostgreSQL database dump
--

\restrict msRuSMsNpUGPWTzcMll9ZTaZqCvCRg3Ugc4rcUmvCtPBpGana1jlbTHMNAahGa9

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
-- Name: loans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.loans (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    amount numeric NOT NULL,
    interest_rate numeric NOT NULL,
    duration integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    chama_id uuid,
    created_by_id uuid
);


--
-- Name: loans PK_5c6942c1e13e4de135c5203ee61; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT "PK_5c6942c1e13e4de135c5203ee61" PRIMARY KEY (id);


--
-- Name: loans uq_loan_chama_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT uq_loan_chama_name UNIQUE (chama_id, name);


--
-- Name: loans fk_loan_chama_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT fk_loan_chama_id FOREIGN KEY (chama_id) REFERENCES public.chamas(id) ON DELETE CASCADE;


--
-- Name: loans fk_loan_created_by_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT fk_loan_created_by_id FOREIGN KEY (created_by_id) REFERENCES public.chama_profiles(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict msRuSMsNpUGPWTzcMll9ZTaZqCvCRg3Ugc4rcUmvCtPBpGana1jlbTHMNAahGa9

