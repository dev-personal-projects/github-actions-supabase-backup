--
-- PostgreSQL database dump
--

\restrict kHcIFw1cy7tbbujXE546psCFuGvOBGG1MotoUafcxJInkDvxX0ADTZX5ZmWDW6z

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
-- Name: orderform_ordered_roles_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orderform_ordered_roles_history (
    ofrm_odrl_hist_id bigint NOT NULL,
    ofrm_odrl_hist_prfx_id text,
    odrl_id bigint NOT NULL,
    status character varying(255) NOT NULL,
    effective_from timestamp with time zone NOT NULL,
    effective_to timestamp with time zone,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT orderform_ordered_roles_history_status_check CHECK (((status)::text = ANY (ARRAY[('Active'::character varying)::text, ('Disabled'::character varying)::text])))
);


--
-- Name: orderform_ordered_roles_history_ofrm_odrl_hist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orderform_ordered_roles_history_ofrm_odrl_hist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orderform_ordered_roles_history_ofrm_odrl_hist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orderform_ordered_roles_history_ofrm_odrl_hist_id_seq OWNED BY public.orderform_ordered_roles_history.ofrm_odrl_hist_id;


--
-- Name: orderform_ordered_roles_history ofrm_odrl_hist_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderform_ordered_roles_history ALTER COLUMN ofrm_odrl_hist_id SET DEFAULT nextval('public.orderform_ordered_roles_history_ofrm_odrl_hist_id_seq'::regclass);


--
-- Name: orderform_ordered_roles_history orderform_ordered_roles_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderform_ordered_roles_history
    ADD CONSTRAINT orderform_ordered_roles_history_pkey PRIMARY KEY (ofrm_odrl_hist_id);


--
-- Name: orderform_ordered_roles_history trg_generate_orderform_ordered_roles_history_prefixed_id; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_generate_orderform_ordered_roles_history_prefixed_id BEFORE INSERT OR UPDATE ON public.orderform_ordered_roles_history FOR EACH ROW EXECUTE FUNCTION public.generate_orderform_ordered_roles_history_prefixed_id();


--
-- Name: orderform_ordered_roles_history trg_update_orderform_ordered_roles_history_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_update_orderform_ordered_roles_history_updated_at BEFORE UPDATE ON public.orderform_ordered_roles_history FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: orderform_ordered_roles_history orderform_ordered_roles_history_odrl_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderform_ordered_roles_history
    ADD CONSTRAINT orderform_ordered_roles_history_odrl_fk FOREIGN KEY (odrl_id) REFERENCES public.orderform_ordered_roles(odrl_id) ON DELETE CASCADE;


--
-- Name: orderform_ordered_roles_history; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.orderform_ordered_roles_history ENABLE ROW LEVEL SECURITY;

--
-- PostgreSQL database dump complete
--

\unrestrict kHcIFw1cy7tbbujXE546psCFuGvOBGG1MotoUafcxJInkDvxX0ADTZX5ZmWDW6z

