--
-- PostgreSQL database dump
--

\restrict d7lnfjDHBAqoZHWe4dYHou82AXMW38i0AYnpoUbXlWdysTB9x8YUiwW5jYbilIl

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
-- Name: expenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.expenses (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    amount numeric NOT NULL,
    date timestamp with time zone NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    chama_id uuid,
    created_by_id uuid
);


--
-- Name: expenses PK_94c3ceb17e3140abc9282c20610; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT "PK_94c3ceb17e3140abc9282c20610" PRIMARY KEY (id);


--
-- Name: expenses fk_expense_chama_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT fk_expense_chama_id FOREIGN KEY (chama_id) REFERENCES public.chamas(id) ON DELETE CASCADE;


--
-- Name: expenses fk_expense_created_by_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT fk_expense_created_by_id FOREIGN KEY (created_by_id) REFERENCES public.chama_profiles(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict d7lnfjDHBAqoZHWe4dYHou82AXMW38i0AYnpoUbXlWdysTB9x8YUiwW5jYbilIl

