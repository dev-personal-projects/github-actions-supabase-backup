--
-- PostgreSQL database dump
--

\restrict Zpxd55CbPfjtrqytorezpXnCONKpoUdKfjRTxpkCw0fgokJ7T4x9b1eeWgyYrnX

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
-- Name: contributions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contributions (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    title text NOT NULL,
    due_date date NOT NULL,
    amount numeric NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    chama_id uuid,
    created_by_id uuid
);


--
-- Name: contributions PK_ca2b4f39eb9e32a61278c711f79; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributions
    ADD CONSTRAINT "PK_ca2b4f39eb9e32a61278c711f79" PRIMARY KEY (id);


--
-- Name: contributions fk_contribution_chama_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributions
    ADD CONSTRAINT fk_contribution_chama_id FOREIGN KEY (chama_id) REFERENCES public.chamas(id) ON DELETE CASCADE;


--
-- Name: contributions fk_contribution_created_by_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contributions
    ADD CONSTRAINT fk_contribution_created_by_id FOREIGN KEY (created_by_id) REFERENCES public.chama_profiles(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict Zpxd55CbPfjtrqytorezpXnCONKpoUdKfjRTxpkCw0fgokJ7T4x9b1eeWgyYrnX

