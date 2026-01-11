--
-- PostgreSQL database dump
--

\restrict vH2YdzGngzT55Hy8vy5ceBve64HQ3ypPhz0nH3hl0ZbA7syCZBn7gsaaIAp0aTQ

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
-- Name: orderform_ordered_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orderform_ordered_roles (
    odrl_id bigint NOT NULL,
    odrl_prfx_id text,
    ofrm_id bigint NOT NULL,
    odrl_level character varying(255) NOT NULL,
    odrl_description character varying(255) NOT NULL,
    odrl_monthly_fee numeric(15,2) NOT NULL,
    odrl_fee_discount numeric(5,2) NOT NULL,
    odrl_final_monthly_fee numeric(15,2) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    odrl_status character varying(8) DEFAULT 'Active'::character varying NOT NULL,
    CONSTRAINT odrl_fee_discount_check CHECK (((odrl_fee_discount >= (0)::numeric) AND (odrl_fee_discount <= (100)::numeric))),
    CONSTRAINT orderform_ordered_roles_odrl_status_check CHECK (((odrl_status)::text = ANY (ARRAY[('Active'::character varying)::text, ('Disabled'::character varying)::text])))
);


--
-- Name: orderform_ordered_roles_odrl_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orderform_ordered_roles_odrl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orderform_ordered_roles_odrl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orderform_ordered_roles_odrl_id_seq OWNED BY public.orderform_ordered_roles.odrl_id;


--
-- Name: orderform_ordered_roles odrl_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderform_ordered_roles ALTER COLUMN odrl_id SET DEFAULT nextval('public.orderform_ordered_roles_odrl_id_seq'::regclass);


--
-- Name: orderform_ordered_roles orderform_ordered_roles_odrl_prfx_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderform_ordered_roles
    ADD CONSTRAINT orderform_ordered_roles_odrl_prfx_id_key UNIQUE (odrl_prfx_id);


--
-- Name: orderform_ordered_roles orderform_ordered_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderform_ordered_roles
    ADD CONSTRAINT orderform_ordered_roles_pkey PRIMARY KEY (odrl_id);


--
-- Name: orderform_ordered_roles trg_generate_orderform_ordered_roles_prefixed_id; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_generate_orderform_ordered_roles_prefixed_id BEFORE INSERT OR UPDATE ON public.orderform_ordered_roles FOR EACH ROW EXECUTE FUNCTION public.generate_orderform_ordered_roles_prefixed_id();


--
-- Name: orderform_ordered_roles trg_track_ordered_role_status_history; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_track_ordered_role_status_history AFTER INSERT OR UPDATE OF odrl_status ON public.orderform_ordered_roles FOR EACH ROW EXECUTE FUNCTION public.track_ordered_role_status_history();


--
-- Name: orderform_ordered_roles trg_update_orderform_ordered_roles_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_update_orderform_ordered_roles_updated_at BEFORE UPDATE ON public.orderform_ordered_roles FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: orderform_ordered_roles odrl_ofrm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderform_ordered_roles
    ADD CONSTRAINT odrl_ofrm_id_fkey FOREIGN KEY (ofrm_id) REFERENCES public.customer_order_forms(ofrm_id) ON DELETE CASCADE;


--
-- Name: orderform_ordered_roles; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.orderform_ordered_roles ENABLE ROW LEVEL SECURITY;

--
-- PostgreSQL database dump complete
--

\unrestrict vH2YdzGngzT55Hy8vy5ceBve64HQ3ypPhz0nH3hl0ZbA7syCZBn7gsaaIAp0aTQ

