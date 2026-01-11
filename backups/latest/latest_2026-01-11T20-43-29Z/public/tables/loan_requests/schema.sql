--
-- PostgreSQL database dump
--

\restrict WcLWECRcu21tZuxH7xDgxTLKlVnJ4NVNP5HEoF3Sdt1Uzpc77Wjp3krujO6o8B5

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
-- Name: loan_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.loan_requests (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    principal numeric NOT NULL,
    amount_payable numeric,
    amount_paid numeric DEFAULT '0'::numeric NOT NULL,
    balance numeric NOT NULL,
    installments jsonb DEFAULT '[]'::jsonb NOT NULL,
    due_date date,
    approval_status public.loan_requests_approval_status_enum DEFAULT 'pending'::public.loan_requests_approval_status_enum NOT NULL,
    repayment_status public.loan_requests_repayment_status_enum DEFAULT 'unpaid'::public.loan_requests_repayment_status_enum NOT NULL,
    approved_at timestamp with time zone,
    repayment_history jsonb DEFAULT '[]'::jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    loan_type_id uuid,
    requested_by_id uuid,
    approved_by_id uuid
);


--
-- Name: loan_requests PK_502363f47cde20394e748d4562f; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.loan_requests
    ADD CONSTRAINT "PK_502363f47cde20394e748d4562f" PRIMARY KEY (id);


--
-- Name: loan_requests fk_loan_request_approved_by_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.loan_requests
    ADD CONSTRAINT fk_loan_request_approved_by_id FOREIGN KEY (approved_by_id) REFERENCES public.chama_profiles(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: loan_requests fk_loan_requested_by_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.loan_requests
    ADD CONSTRAINT fk_loan_requested_by_id FOREIGN KEY (requested_by_id) REFERENCES public.chama_profiles(id) ON DELETE RESTRICT;


--
-- Name: loan_requests fk_loan_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.loan_requests
    ADD CONSTRAINT fk_loan_type_id FOREIGN KEY (loan_type_id) REFERENCES public.loans(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict WcLWECRcu21tZuxH7xDgxTLKlVnJ4NVNP5HEoF3Sdt1Uzpc77Wjp3krujO6o8B5

