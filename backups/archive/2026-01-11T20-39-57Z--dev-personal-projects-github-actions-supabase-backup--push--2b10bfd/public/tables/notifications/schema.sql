--
-- PostgreSQL database dump
--

\restrict usDDwdn91Pdrk8a6RBO4HCvebiL0b7j8Aalkk2eWBG7mBnHS3XaBvAHFN6ZYe5o

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
-- Name: notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notifications (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    type character varying(100) NOT NULL,
    title character varying(255) NOT NULL,
    message text NOT NULL,
    is_read boolean DEFAULT false NOT NULL,
    metadata jsonb,
    action_url character varying(500),
    read_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    recipient_id uuid NOT NULL,
    triggered_by_id uuid,
    chama_id uuid NOT NULL
);


--
-- Name: notifications PK_6a72c3c0f683f6462415e653c3a; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT "PK_6a72c3c0f683f6462415e653c3a" PRIMARY KEY (id);


--
-- Name: idx_notifications_chama_created; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_notifications_chama_created ON public.notifications USING btree (chama_id, created_at);


--
-- Name: idx_notifications_recipient_read; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_notifications_recipient_read ON public.notifications USING btree (recipient_id, is_read);


--
-- Name: notifications FK_5332a4daa46fd3f4e6625dd275d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT "FK_5332a4daa46fd3f4e6625dd275d" FOREIGN KEY (recipient_id) REFERENCES public.chama_profiles(id) ON DELETE CASCADE;


--
-- Name: notifications FK_d1581251e41e9186ed75f28d0f0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT "FK_d1581251e41e9186ed75f28d0f0" FOREIGN KEY (triggered_by_id) REFERENCES public.chama_profiles(id) ON DELETE SET NULL;


--
-- Name: notifications FK_db3810767382b4c89c8a77970c3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT "FK_db3810767382b4c89c8a77970c3" FOREIGN KEY (chama_id) REFERENCES public.chamas(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict usDDwdn91Pdrk8a6RBO4HCvebiL0b7j8Aalkk2eWBG7mBnHS3XaBvAHFN6ZYe5o

