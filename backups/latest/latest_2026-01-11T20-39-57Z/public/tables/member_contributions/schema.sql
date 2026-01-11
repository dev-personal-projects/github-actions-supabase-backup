--
-- PostgreSQL database dump
--

\restrict PhW19TKuic76nL6rHNVlc01yhroqPVq0TFUMXixjBoeaYLidonCY2Mw1Xqu2VeR

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
-- Name: member_contributions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.member_contributions (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    amount_paid numeric DEFAULT '0'::numeric NOT NULL,
    balance numeric NOT NULL,
    status public.member_contributions_status_enum DEFAULT 'unpaid'::public.member_contributions_status_enum NOT NULL,
    payment_date timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    contribution_id uuid,
    member_id uuid,
    contribution_history jsonb DEFAULT '[]'::jsonb NOT NULL
);


--
-- Name: member_contributions PK_55c9f06fcbf09f0fe5f6287925d; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_contributions
    ADD CONSTRAINT "PK_55c9f06fcbf09f0fe5f6287925d" PRIMARY KEY (id);


--
-- Name: member_contributions fk_member_contributions_contribution_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_contributions
    ADD CONSTRAINT fk_member_contributions_contribution_id FOREIGN KEY (contribution_id) REFERENCES public.contributions(id) ON DELETE CASCADE;


--
-- Name: member_contributions fk_member_contributions_member_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.member_contributions
    ADD CONSTRAINT fk_member_contributions_member_id FOREIGN KEY (member_id) REFERENCES public.chama_profiles(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict PhW19TKuic76nL6rHNVlc01yhroqPVq0TFUMXixjBoeaYLidonCY2Mw1Xqu2VeR

