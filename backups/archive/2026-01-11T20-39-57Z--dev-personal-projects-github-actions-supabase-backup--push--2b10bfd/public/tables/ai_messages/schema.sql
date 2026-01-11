--
-- PostgreSQL database dump
--

\restrict nVLua3A3w4oYCjGhCJRhzYYOw6C9FbuQuRaazftfMOYNsfHaKnPhLPGexfZf3UF

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
-- Name: ai_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ai_messages (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    role public.ai_messages_role_enum NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    conversation_id uuid,
    sender_id uuid
);


--
-- Name: ai_messages PK_a390434d4a515ba18a41bc996c2; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_messages
    ADD CONSTRAINT "PK_a390434d4a515ba18a41bc996c2" PRIMARY KEY (id);


--
-- Name: idx_ai_msg_conversation_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ai_msg_conversation_created_at ON public.ai_messages USING btree (conversation_id, created_at);


--
-- Name: ai_messages fk_ai_msg_conversation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_messages
    ADD CONSTRAINT fk_ai_msg_conversation_id FOREIGN KEY (conversation_id) REFERENCES public.ai_conversations(id) ON DELETE CASCADE;


--
-- Name: ai_messages fk_ai_msg_sender_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ai_messages
    ADD CONSTRAINT fk_ai_msg_sender_id FOREIGN KEY (sender_id) REFERENCES public.chama_profiles(id);


--
-- PostgreSQL database dump complete
--

\unrestrict nVLua3A3w4oYCjGhCJRhzYYOw6C9FbuQuRaazftfMOYNsfHaKnPhLPGexfZf3UF

