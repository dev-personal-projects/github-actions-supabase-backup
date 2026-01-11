--
-- PostgreSQL database dump
--

\restrict zKHWirnhPprnAST7AfGY796LcfvRldclAQU9iY8cYlzPgPWQWQT1Yko1tflrAEj

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
-- Name: customer_contracts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_contracts (
    cctr_id bigint NOT NULL,
    cctr_prfx_id text,
    cmp_id bigint NOT NULL,
    cctr_service_name character varying(255) NOT NULL,
    cctr_selected_service_plan character varying(255),
    cctr_service_plan_monthly_price numeric(15,2),
    cctr_effective_date date NOT NULL,
    cctr_duration_days integer,
    cctr_url text,
    cctr_status character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: customer_contracts_cctr_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customer_contracts_cctr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customer_contracts_cctr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customer_contracts_cctr_id_seq OWNED BY public.customer_contracts.cctr_id;


--
-- Name: customer_contracts cctr_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_contracts ALTER COLUMN cctr_id SET DEFAULT nextval('public.customer_contracts_cctr_id_seq'::regclass);


--
-- Name: customer_contracts customer_contracts_cctr_prfx_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_contracts
    ADD CONSTRAINT customer_contracts_cctr_prfx_id_key UNIQUE (cctr_prfx_id);


--
-- Name: customer_contracts customer_contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_contracts
    ADD CONSTRAINT customer_contracts_pkey PRIMARY KEY (cctr_id);


--
-- Name: customer_contracts trg_generate_customer_contracts_prefixed_id; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_generate_customer_contracts_prefixed_id BEFORE INSERT OR UPDATE ON public.customer_contracts FOR EACH ROW EXECUTE FUNCTION public.generate_customer_contracts_prefixed_id();


--
-- Name: customer_contracts trg_update_customer_contracts_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_update_customer_contracts_updated_at BEFORE UPDATE ON public.customer_contracts FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: customer_contracts cctr_cmp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_contracts
    ADD CONSTRAINT cctr_cmp_id_fkey FOREIGN KEY (cmp_id) REFERENCES public.companies(cmp_id) ON DELETE CASCADE;


--
-- Name: customer_contracts; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.customer_contracts ENABLE ROW LEVEL SECURITY;

--
-- PostgreSQL database dump complete
--

\unrestrict zKHWirnhPprnAST7AfGY796LcfvRldclAQU9iY8cYlzPgPWQWQT1Yko1tflrAEj

