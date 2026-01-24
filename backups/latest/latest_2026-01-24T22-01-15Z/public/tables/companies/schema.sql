--
-- PostgreSQL database dump
--

\restrict 3armnwuwMVSgiRZWYB5qcFlw66hyxBBXb3ahivzChMC7xydCHSm8hTnnRfOXXJs

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
-- Name: companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.companies (
    cmp_id bigint NOT NULL,
    cmp_prfx_id text NOT NULL,
    cmp_name character varying(255) NOT NULL,
    cmp_registration_number character varying(100),
    cmp_customer_since date,
    cmp_email character varying(255) NOT NULL,
    cmp_phone_number character varying(50) NOT NULL,
    cmp_physical_address text NOT NULL,
    cmp_postal_address text,
    cmp_city character varying(100) NOT NULL,
    cmp_country character varying(100) NOT NULL,
    cmp_zip_code character varying(50),
    cmp_website character varying(255),
    cmp_industry character varying(100),
    cmp_tax_id character varying(100),
    cmp_status character varying(50) NOT NULL,
    cmp_date_registered_in_db timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    cmp_parent_id bigint,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: companies_cmp_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.companies_cmp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: companies_cmp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.companies_cmp_id_seq OWNED BY public.companies.cmp_id;


--
-- Name: companies cmp_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies ALTER COLUMN cmp_id SET DEFAULT nextval('public.companies_cmp_id_seq'::regclass);


--
-- Name: companies companies_cmp_prfx_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_cmp_prfx_id_key UNIQUE (cmp_prfx_id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (cmp_id);


--
-- Name: unique_cmp_name_country_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_cmp_name_country_idx ON public.companies USING btree (lower((cmp_name)::text), lower((cmp_country)::text));


--
-- Name: companies trg_generate_companies_prefixed_id; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_generate_companies_prefixed_id BEFORE INSERT OR UPDATE ON public.companies FOR EACH ROW EXECUTE FUNCTION public.generate_companies_prefixed_id();


--
-- Name: companies trg_update_companies_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_update_companies_updated_at BEFORE UPDATE ON public.companies FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: companies companies_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_parent_id_fkey FOREIGN KEY (cmp_parent_id) REFERENCES public.companies(cmp_id) ON DELETE SET NULL;


--
-- Name: companies; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.companies ENABLE ROW LEVEL SECURITY;

--
-- PostgreSQL database dump complete
--

\unrestrict 3armnwuwMVSgiRZWYB5qcFlw66hyxBBXb3ahivzChMC7xydCHSm8hTnnRfOXXJs

