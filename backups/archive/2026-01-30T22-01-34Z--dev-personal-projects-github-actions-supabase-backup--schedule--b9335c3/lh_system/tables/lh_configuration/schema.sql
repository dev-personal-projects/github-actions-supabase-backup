--
-- PostgreSQL database dump
--

\restrict ypcDz67uLvHvcNBa2N9Z6TARFinK4SFuct0u2qQFy0i6vsTAIPNslT3MC6dWR5q

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
-- Name: lh_configuration; Type: TABLE; Schema: lh_system; Owner: -
--

CREATE TABLE lh_system.lh_configuration (
    cfg_id bigint NOT NULL,
    cfg_service text,
    cfg_key text NOT NULL,
    cfg_value text NOT NULL,
    cmp_id bigint,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT lh_configuration_cfg_key_not_blank CHECK ((length(btrim(cfg_key)) > 0))
);


--
-- Name: lh_configuration_cfg_id_seq; Type: SEQUENCE; Schema: lh_system; Owner: -
--

CREATE SEQUENCE lh_system.lh_configuration_cfg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lh_configuration_cfg_id_seq; Type: SEQUENCE OWNED BY; Schema: lh_system; Owner: -
--

ALTER SEQUENCE lh_system.lh_configuration_cfg_id_seq OWNED BY lh_system.lh_configuration.cfg_id;


--
-- Name: lh_configuration cfg_id; Type: DEFAULT; Schema: lh_system; Owner: -
--

ALTER TABLE ONLY lh_system.lh_configuration ALTER COLUMN cfg_id SET DEFAULT nextval('lh_system.lh_configuration_cfg_id_seq'::regclass);


--
-- Name: lh_configuration lh_configuration_cfg_service_key_cmp_id_key; Type: CONSTRAINT; Schema: lh_system; Owner: -
--

ALTER TABLE ONLY lh_system.lh_configuration
    ADD CONSTRAINT lh_configuration_cfg_service_key_cmp_id_key UNIQUE (cfg_service, cfg_key, cmp_id);


--
-- Name: lh_configuration lh_configuration_pkey; Type: CONSTRAINT; Schema: lh_system; Owner: -
--

ALTER TABLE ONLY lh_system.lh_configuration
    ADD CONSTRAINT lh_configuration_pkey PRIMARY KEY (cfg_id);


--
-- Name: unique_lh_configuration_global_key_value_idx; Type: INDEX; Schema: lh_system; Owner: -
--

CREATE UNIQUE INDEX unique_lh_configuration_global_key_value_idx ON lh_system.lh_configuration USING btree (cfg_key, cfg_value) WHERE (cmp_id IS NULL);


--
-- Name: lh_configuration trg_update_lh_configuration_updated_at; Type: TRIGGER; Schema: lh_system; Owner: -
--

CREATE TRIGGER trg_update_lh_configuration_updated_at BEFORE UPDATE ON lh_system.lh_configuration FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: lh_configuration lh_configuration_cmp_id_fkey; Type: FK CONSTRAINT; Schema: lh_system; Owner: -
--

ALTER TABLE ONLY lh_system.lh_configuration
    ADD CONSTRAINT lh_configuration_cmp_id_fkey FOREIGN KEY (cmp_id) REFERENCES public.companies(cmp_id) ON DELETE CASCADE;


--
-- Name: lh_configuration; Type: ROW SECURITY; Schema: lh_system; Owner: -
--

ALTER TABLE lh_system.lh_configuration ENABLE ROW LEVEL SECURITY;

--
-- PostgreSQL database dump complete
--

\unrestrict ypcDz67uLvHvcNBa2N9Z6TARFinK4SFuct0u2qQFy0i6vsTAIPNslT3MC6dWR5q

