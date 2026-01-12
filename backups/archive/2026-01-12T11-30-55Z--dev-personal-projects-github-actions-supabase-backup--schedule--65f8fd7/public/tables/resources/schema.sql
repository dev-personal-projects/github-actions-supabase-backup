--
-- PostgreSQL database dump
--

\restrict BfmU0nDiUXmERVFelQ6M3RbD93uhOqLXQmBEgaQcgRYl9Sx3G6OJorlr7kV5Djj

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
-- Name: resources; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resources (
    res_id bigint NOT NULL,
    res_prfx_id text,
    res_first_name character varying(100) NOT NULL,
    res_middle_name character varying(100),
    res_last_name character varying(100) NOT NULL,
    res_availability character varying(50) DEFAULT 'Available'::character varying NOT NULL,
    res_personal_email character varying(255) NOT NULL,
    res_work_email character varying(255),
    res_mobile_number character varying(50) NOT NULL,
    res_postal_address text,
    res_street_address_line1 character varying(255) NOT NULL,
    res_street_address_line2 character varying(255),
    res_city character varying(100) NOT NULL,
    res_state character varying(100),
    res_postal_code character varying(50),
    res_country character varying(100) NOT NULL,
    res_government_issued_id_number character varying(100) NOT NULL,
    res_government_id_url character varying(255) NOT NULL,
    res_birth_date date NOT NULL,
    res_tax_number character varying(100),
    res_blacklisted boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_res_availability CHECK (((res_availability)::text = ANY (ARRAY[('Available'::character varying)::text, ('Assigned'::character varying)::text, ('Unavailable'::character varying)::text])))
);


--
-- Name: resources_res_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.resources_res_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resources_res_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.resources_res_id_seq OWNED BY public.resources.res_id;


--
-- Name: resources res_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resources ALTER COLUMN res_id SET DEFAULT nextval('public.resources_res_id_seq'::regclass);


--
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (res_id);


--
-- Name: resources resources_res_mobile_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_res_mobile_number_key UNIQUE (res_mobile_number);


--
-- Name: resources resources_res_personal_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_res_personal_email_key UNIQUE (res_personal_email);


--
-- Name: resources resources_res_prfx_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_res_prfx_id_key UNIQUE (res_prfx_id);


--
-- Name: resources resources_res_work_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_res_work_email_key UNIQUE (res_work_email);


--
-- Name: resources trg_generate_resources_prefixed_id; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_generate_resources_prefixed_id BEFORE INSERT OR UPDATE ON public.resources FOR EACH ROW EXECUTE FUNCTION public.generate_resources_prefixed_id();


--
-- Name: resources trg_update_resources_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_update_resources_updated_at BEFORE UPDATE ON public.resources FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: resources; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.resources ENABLE ROW LEVEL SECURITY;

--
-- PostgreSQL database dump complete
--

\unrestrict BfmU0nDiUXmERVFelQ6M3RbD93uhOqLXQmBEgaQcgRYl9Sx3G6OJorlr7kV5Djj

