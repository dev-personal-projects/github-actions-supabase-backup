--
-- PostgreSQL database dump
--

\restrict UL9sILm3ZRzRq2ZPi1pDj9Oa8EeCoIbBDvC9Aqd6WaWip6tOdnIj5qFRPbv3deP

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
-- Name: ai_conversations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_conversations (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    chama_id uuid,
    initiator_id uuid
);


--
-- Name: ai_conversations PK_60db12765b82858ba00c8aa4ae2; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_conversations
    ADD CONSTRAINT "PK_60db12765b82858ba00c8aa4ae2" PRIMARY KEY (id);


--
-- Name: ai_conversations fk_ai_convo_chama_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_conversations
    ADD CONSTRAINT fk_ai_convo_chama_id FOREIGN KEY (chama_id) REFERENCES public.chamas(id) ON DELETE CASCADE;


--
-- Name: ai_conversations fk_ai_convo_initiator_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_conversations
    ADD CONSTRAINT fk_ai_convo_initiator_id FOREIGN KEY (initiator_id) REFERENCES public.chama_profiles(id);


--
-- PostgreSQL database dump complete
--

\unrestrict UL9sILm3ZRzRq2ZPi1pDj9Oa8EeCoIbBDvC9Aqd6WaWip6tOdnIj5qFRPbv3deP

