--
-- PostgreSQL database dump
--

\restrict NVdW1LC8dZmJnhPgn9bhk2LDrtOTuhLesUP1MF8oxtbOo06uVfiFDF9c1nrDvs2

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
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subscriptions (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    plan_code text NOT NULL,
    plan_name text NOT NULL,
    plan_amount numeric NOT NULL,
    plan_interval text NOT NULL,
    plan_description text NOT NULL,
    reference text NOT NULL,
    channel text,
    last4 text,
    brand text,
    bank text,
    exp_month text,
    exp_year text,
    customer_email text NOT NULL,
    customer_code text NOT NULL,
    status public.subscriptions_status_enum DEFAULT 'attention'::public.subscriptions_status_enum NOT NULL,
    paid_at timestamp with time zone NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    previous_subscription_id uuid,
    transition_type public.subscriptions_transition_type_enum DEFAULT 'new'::public.subscriptions_transition_type_enum NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    chama_id uuid
);


--
-- Name: subscriptions PK_a87248d73155605cf782be9ee5e; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT "PK_a87248d73155605cf782be9ee5e" PRIMARY KEY (id);


--
-- Name: subscriptions UQ_170a8e7c388939041319cdd5333; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT "UQ_170a8e7c388939041319cdd5333" UNIQUE (reference);


--
-- Name: subscriptions fk_subscriptions_chama_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT fk_subscriptions_chama_id FOREIGN KEY (chama_id) REFERENCES public.chamas(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict NVdW1LC8dZmJnhPgn9bhk2LDrtOTuhLesUP1MF8oxtbOo06uVfiFDF9c1nrDvs2

