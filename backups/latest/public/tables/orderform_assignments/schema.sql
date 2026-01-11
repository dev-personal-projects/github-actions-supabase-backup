--
-- PostgreSQL database dump
--

\restrict 3MkkrwTmJpnKIQYfRU3yuHRvdaSuzYD7ceevlhnFVkhSTAkPweWQg9EsyVUOPS2

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
-- Name: orderform_assignments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orderform_assignments (
    ofast_id bigint NOT NULL,
    ofast_prfx_id text,
    odrl_id bigint NOT NULL,
    res_id bigint NOT NULL,
    ofast_start_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ofast_end_date timestamp with time zone,
    ofast_duration_days integer,
    ofast_monthly_fee numeric(15,2),
    ofast_daily_fee numeric(15,2),
    ofast_hourly_fee numeric(15,2),
    ofast_special_withholdings_percent numeric(9,7) NOT NULL,
    ofast_special_withholdings numeric(15,2) NOT NULL,
    ofast_sla_availability_critical character varying(255) DEFAULT '24 x 7'::character varying,
    ofast_sla_availability_standard character varying(255) DEFAULT '8 x 5, Mon-Fri'::character varying,
    ofast_specific_notes text,
    ofast_status character varying(255) NOT NULL,
    ofast_url character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ofast_special_withholdings_percent_check CHECK (((ofast_special_withholdings_percent >= (0)::numeric) AND (ofast_special_withholdings_percent <= (1)::numeric)))
);


--
-- Name: orderform_assignments_ofast_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orderform_assignments_ofast_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orderform_assignments_ofast_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orderform_assignments_ofast_id_seq OWNED BY public.orderform_assignments.ofast_id;


--
-- Name: orderform_assignments ofast_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderform_assignments ALTER COLUMN ofast_id SET DEFAULT nextval('public.orderform_assignments_ofast_id_seq'::regclass);


--
-- Name: orderform_assignments orderform_assignments_ofast_prfx_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderform_assignments
    ADD CONSTRAINT orderform_assignments_ofast_prfx_id_key UNIQUE (ofast_prfx_id);


--
-- Name: orderform_assignments orderform_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderform_assignments
    ADD CONSTRAINT orderform_assignments_pkey PRIMARY KEY (ofast_id);


--
-- Name: orderform_assignments trg_calculate_orderform_assignment_end_date; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_calculate_orderform_assignment_end_date BEFORE INSERT OR UPDATE ON public.orderform_assignments FOR EACH ROW EXECUTE FUNCTION public.calculate_orderform_assignment_end_date();


--
-- Name: orderform_assignments trg_generate_orderform_assignments_prefixed_id; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_generate_orderform_assignments_prefixed_id BEFORE INSERT OR UPDATE ON public.orderform_assignments FOR EACH ROW EXECUTE FUNCTION public.generate_orderform_assignments_prefixed_id();


--
-- Name: orderform_assignments trg_update_orderform_assignments_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_update_orderform_assignments_updated_at BEFORE UPDATE ON public.orderform_assignments FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: orderform_assignments ofast_odrl_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderform_assignments
    ADD CONSTRAINT ofast_odrl_id_fkey FOREIGN KEY (odrl_id) REFERENCES public.orderform_ordered_roles(odrl_id) ON DELETE CASCADE;


--
-- Name: orderform_assignments ofast_res_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderform_assignments
    ADD CONSTRAINT ofast_res_id_fkey FOREIGN KEY (res_id) REFERENCES public.resources(res_id) ON DELETE CASCADE;


--
-- Name: orderform_assignments; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.orderform_assignments ENABLE ROW LEVEL SECURITY;

--
-- PostgreSQL database dump complete
--

\unrestrict 3MkkrwTmJpnKIQYfRU3yuHRvdaSuzYD7ceevlhnFVkhSTAkPweWQg9EsyVUOPS2

