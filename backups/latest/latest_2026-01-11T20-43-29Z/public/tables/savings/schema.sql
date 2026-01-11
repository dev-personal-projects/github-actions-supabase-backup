--
-- PostgreSQL database dump
--

\restrict Y4PFt61r2rUtDdxeoKMn8wvaZqdQ8R3lIlH1Ohn8j8PlbrETxAZCEKW5dmajXgj

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
-- Name: savings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.savings (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    amount numeric NOT NULL,
    date timestamp with time zone NOT NULL,
    type public.savings_type_enum NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    owner_id uuid,
    chama_id uuid,
    created_by_id uuid
);


--
-- Name: savings PK_12862ba6871fc7be04cbd26230c; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.savings
    ADD CONSTRAINT "PK_12862ba6871fc7be04cbd26230c" PRIMARY KEY (id);


--
-- Name: savings fk_savings_chama_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.savings
    ADD CONSTRAINT fk_savings_chama_id FOREIGN KEY (chama_id) REFERENCES public.chamas(id) ON DELETE CASCADE;


--
-- Name: savings fk_savings_created_by_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.savings
    ADD CONSTRAINT fk_savings_created_by_id FOREIGN KEY (created_by_id) REFERENCES public.chama_profiles(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: savings fk_savings_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.savings
    ADD CONSTRAINT fk_savings_owner_id FOREIGN KEY (owner_id) REFERENCES public.chama_profiles(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict Y4PFt61r2rUtDdxeoKMn8wvaZqdQ8R3lIlH1Ohn8j8PlbrETxAZCEKW5dmajXgj

