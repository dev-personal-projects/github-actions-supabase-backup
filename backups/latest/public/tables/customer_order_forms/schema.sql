--
-- PostgreSQL database dump
--

\restrict aSLXswe3sh9sTbAqP36VKAZykd00HhYwJhANuTAz0Xi6vpTgG40YQygV1ctQu4u

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
-- Name: customer_order_forms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_order_forms (
    ofrm_id bigint NOT NULL,
    ofrm_prfx_id text,
    cctr_id bigint NOT NULL,
    cmp_id bigint NOT NULL,
    ofrm_issued_by character varying(255) NOT NULL,
    ofrm_issuer_role character varying(255) NOT NULL,
    ofrm_issued_date timestamp with time zone NOT NULL,
    ofrm_duration_type character varying(50) NOT NULL,
    ofrm_duration_days integer,
    ofrm_total_monthly_fee numeric(15,2) NOT NULL,
    ofrm_fee_currency character varying(10) NOT NULL,
    ofrm_total_roles integer NOT NULL,
    ofrm_url character varying(255),
    ofrm_status character varying(255) NOT NULL,
    ofrm_replaces bigint,
    ofrm_replaced_by bigint,
    ofrm_renewing boolean,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ofrm_duration_type_check CHECK (((ofrm_duration_type)::text = ANY (ARRAY[('Fixed'::character varying)::text, ('Perpetual'::character varying)::text]))),
    CONSTRAINT ofrm_status_check CHECK (((ofrm_status)::text = ANY (ARRAY[('Active'::character varying)::text, ('Expired'::character varying)::text, ('Suspended'::character varying)::text, ('Cancelled'::character varying)::text, ('Inactive'::character varying)::text])))
);


--
-- Name: customer_order_forms_ofrm_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customer_order_forms_ofrm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customer_order_forms_ofrm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customer_order_forms_ofrm_id_seq OWNED BY public.customer_order_forms.ofrm_id;


--
-- Name: customer_order_forms ofrm_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_order_forms ALTER COLUMN ofrm_id SET DEFAULT nextval('public.customer_order_forms_ofrm_id_seq'::regclass);


--
-- Name: customer_order_forms customer_order_forms_ofrm_prfx_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_order_forms
    ADD CONSTRAINT customer_order_forms_ofrm_prfx_id_key UNIQUE (ofrm_prfx_id);


--
-- Name: customer_order_forms customer_order_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_order_forms
    ADD CONSTRAINT customer_order_forms_pkey PRIMARY KEY (ofrm_id);


--
-- Name: customer_order_forms trg_generate_customer_order_forms_prefixed_id; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_generate_customer_order_forms_prefixed_id BEFORE INSERT OR UPDATE ON public.customer_order_forms FOR EACH ROW EXECUTE FUNCTION public.generate_customer_order_forms_prefixed_id();


--
-- Name: customer_order_forms trg_update_customer_order_form_expiry; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_update_customer_order_form_expiry BEFORE INSERT OR UPDATE ON public.customer_order_forms FOR EACH ROW EXECUTE FUNCTION public.update_customer_order_form_expiry_status();


--
-- Name: customer_order_forms trg_update_customer_order_forms_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_update_customer_order_forms_updated_at BEFORE UPDATE ON public.customer_order_forms FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: customer_order_forms ofrm_cctr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_order_forms
    ADD CONSTRAINT ofrm_cctr_id_fkey FOREIGN KEY (cctr_id) REFERENCES public.customer_contracts(cctr_id) ON DELETE CASCADE;


--
-- Name: customer_order_forms ofrm_cmp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_order_forms
    ADD CONSTRAINT ofrm_cmp_id_fkey FOREIGN KEY (cmp_id) REFERENCES public.companies(cmp_id) ON DELETE CASCADE;


--
-- Name: customer_order_forms ofrm_replaced_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_order_forms
    ADD CONSTRAINT ofrm_replaced_by_fkey FOREIGN KEY (ofrm_replaced_by) REFERENCES public.customer_order_forms(ofrm_id) ON DELETE SET NULL;


--
-- Name: customer_order_forms ofrm_replaces_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_order_forms
    ADD CONSTRAINT ofrm_replaces_fkey FOREIGN KEY (ofrm_replaces) REFERENCES public.customer_order_forms(ofrm_id) ON DELETE SET NULL;


--
-- Name: customer_order_forms; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.customer_order_forms ENABLE ROW LEVEL SECURITY;

--
-- PostgreSQL database dump complete
--

\unrestrict aSLXswe3sh9sTbAqP36VKAZykd00HhYwJhANuTAz0Xi6vpTgG40YQygV1ctQu4u

