--
-- PostgreSQL database dump
--

\restrict jpH7Kcyyr5ZhAbcVlbmYA9hf7geLqjFTK7v5Aoqblc8O1eIwcDUEylelp4hWt5g

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
-- Name: resource_contracts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resource_contracts (
    rsctr_id bigint NOT NULL,
    rsctr_prfx_id text,
    res_id bigint NOT NULL,
    rsctr_effective_date date NOT NULL,
    rsctr_sign_date date NOT NULL,
    rsctr_duration_days integer NOT NULL,
    rsctr_expiry_date date,
    rsctr_max_monthly_fee numeric(10,2) NOT NULL,
    rsctr_max_daily_fee numeric(10,2) NOT NULL,
    rsctr_payment_currency character varying(10) NOT NULL,
    rsctr_status character varying(50) DEFAULT 'Active'::character varying,
    rsctr_contract_url character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_rsctr_status CHECK (((rsctr_status)::text = ANY (ARRAY[('Active'::character varying)::text, ('Expired'::character varying)::text, ('Suspended'::character varying)::text, ('Cancelled'::character varying)::text])))
);


--
-- Name: resource_contracts_rsctr_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resource_contracts_rsctr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_contracts_rsctr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resource_contracts_rsctr_id_seq OWNED BY public.resource_contracts.rsctr_id;


--
-- Name: resource_contracts rsctr_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_contracts ALTER COLUMN rsctr_id SET DEFAULT nextval('public.resource_contracts_rsctr_id_seq'::regclass);


--
-- Name: resource_contracts resource_contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_contracts
    ADD CONSTRAINT resource_contracts_pkey PRIMARY KEY (rsctr_id);


--
-- Name: resource_contracts resource_contracts_rsctr_prfx_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_contracts
    ADD CONSTRAINT resource_contracts_rsctr_prfx_id_key UNIQUE (rsctr_prfx_id);


--
-- Name: resource_contracts trg_generate_resource_contracts_prefixed_id; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_generate_resource_contracts_prefixed_id BEFORE INSERT OR UPDATE ON public.resource_contracts FOR EACH ROW EXECUTE FUNCTION public.generate_resource_contracts_prefixed_id();


--
-- Name: resource_contracts trg_update_resource_contract_expiry_status; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_update_resource_contract_expiry_status BEFORE INSERT OR UPDATE ON public.resource_contracts FOR EACH ROW EXECUTE FUNCTION public.update_resource_contract_expiry_status();


--
-- Name: resource_contracts trg_update_resource_contracts_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_update_resource_contracts_updated_at BEFORE UPDATE ON public.resource_contracts FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: resource_contracts rsctr_res_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resource_contracts
    ADD CONSTRAINT rsctr_res_id_fkey FOREIGN KEY (res_id) REFERENCES public.resources(res_id) ON DELETE CASCADE;


--
-- Name: resource_contracts; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.resource_contracts ENABLE ROW LEVEL SECURITY;

--
-- PostgreSQL database dump complete
--

\unrestrict jpH7Kcyyr5ZhAbcVlbmYA9hf7geLqjFTK7v5Aoqblc8O1eIwcDUEylelp4hWt5g

