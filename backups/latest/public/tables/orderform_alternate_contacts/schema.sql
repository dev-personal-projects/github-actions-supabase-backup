--
-- PostgreSQL database dump
--

\restrict ikOgyAlpeEyVH2AvvKOzVbcogUEWYcEg1p8Cokbp6CIIdhC8MDPCJmFgmcEzkj4

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
-- Name: orderform_alternate_contacts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orderform_alternate_contacts (
    ofaltct_id bigint DEFAULT nextval('public.orderform_alternate_contacts_ofaltct_id_seq'::regclass) NOT NULL,
    ofrm_id bigint NOT NULL,
    ofaltct_first_name character varying,
    ofaltct_middle_name character varying,
    ofaltct_last_name character varying,
    ofaltct_contact_description character varying,
    ofaltct_lh_role character varying NOT NULL,
    ofaltct_contact_type character varying NOT NULL,
    ofaltct_work_email character varying NOT NULL,
    ofaltct_mobile_number character varying,
    ofaltct_postal_address text,
    ofaltct_street_address_line1 character varying,
    ofaltct_street_address_line2 character varying,
    ofaltct_city character varying,
    ofaltct_state character varying,
    ofaltct_postal_code character varying,
    ofaltct_country character varying,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ck_ofaltct_mobile_e164 CHECK (((ofaltct_mobile_number IS NULL) OR ((ofaltct_mobile_number)::text ~ '^\+[1-9]\d{1,14}$'::text))),
    CONSTRAINT ck_ofaltct_work_email_len_fmt CHECK (((length((ofaltct_work_email)::text) <= 254) AND ((ofaltct_work_email)::text ~ '^[^@]+@[^@]+\.[^@]+$'::text))),
    CONSTRAINT orderform_alternate_contacts_ofaltct_contact_type_check CHECK (((ofaltct_contact_type)::text = ANY (ARRAY[('Primary'::character varying)::text, ('Cc'::character varying)::text, ('Bcc'::character varying)::text])))
);


--
-- Name: TABLE orderform_alternate_contacts; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.orderform_alternate_contacts IS 'Stores alternate contacts for order forms, including PayProof approvers and other role-based contacts';


--
-- Name: COLUMN orderform_alternate_contacts.ofaltct_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.orderform_alternate_contacts.ofaltct_id IS 'Primary key, auto-incremented';


--
-- Name: COLUMN orderform_alternate_contacts.ofrm_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.orderform_alternate_contacts.ofrm_id IS 'Foreign key to customer_order_forms.ofrm_id';


--
-- Name: COLUMN orderform_alternate_contacts.ofaltct_first_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.orderform_alternate_contacts.ofaltct_first_name IS 'First name (nullable for distribution lists/functional emails)';


--
-- Name: COLUMN orderform_alternate_contacts.ofaltct_last_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.orderform_alternate_contacts.ofaltct_last_name IS 'Last name (nullable for distribution lists/functional emails)';


--
-- Name: COLUMN orderform_alternate_contacts.ofaltct_contact_description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.orderform_alternate_contacts.ofaltct_contact_description IS 'Contact description or designation (e.g., "Program Manager" for individuals, "Finance Department Distribution List" for functional emails)';


--
-- Name: COLUMN orderform_alternate_contacts.ofaltct_lh_role; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.orderform_alternate_contacts.ofaltct_lh_role IS 'Role identifier (e.g., PayProofApprover, DataProtectionContact)';


--
-- Name: COLUMN orderform_alternate_contacts.ofaltct_contact_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.orderform_alternate_contacts.ofaltct_contact_type IS 'Contact type: Primary (To recipient), Cc (CC recipient), or Bcc (BCC recipient)';


--
-- Name: COLUMN orderform_alternate_contacts.ofaltct_work_email; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.orderform_alternate_contacts.ofaltct_work_email IS 'Work email address for sending PayProof forms';


--
-- Name: orderform_alternate_contacts orderform_alternate_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderform_alternate_contacts
    ADD CONSTRAINT orderform_alternate_contacts_pkey PRIMARY KEY (ofaltct_id);


--
-- Name: idx_orderform_alternate_contacts_contact_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_orderform_alternate_contacts_contact_type ON public.orderform_alternate_contacts USING btree (ofaltct_contact_type);


--
-- Name: idx_orderform_alternate_contacts_lh_role; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_orderform_alternate_contacts_lh_role ON public.orderform_alternate_contacts USING btree (ofaltct_lh_role);


--
-- Name: idx_orderform_alternate_contacts_ofrm_email_role_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_orderform_alternate_contacts_ofrm_email_role_unique ON public.orderform_alternate_contacts USING btree (ofrm_id, lower((ofaltct_work_email)::text), ofaltct_lh_role);


--
-- Name: idx_orderform_alternate_contacts_ofrm_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_orderform_alternate_contacts_ofrm_id ON public.orderform_alternate_contacts USING btree (ofrm_id);


--
-- Name: idx_orderform_alternate_contacts_ofrm_role; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_orderform_alternate_contacts_ofrm_role ON public.orderform_alternate_contacts USING btree (ofrm_id, ofaltct_lh_role) WHERE ((ofaltct_lh_role)::text = 'PayProofApprover'::text);


--
-- Name: idx_orderform_alternate_contacts_work_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_orderform_alternate_contacts_work_email ON public.orderform_alternate_contacts USING btree (lower((ofaltct_work_email)::text));


--
-- Name: orderform_alternate_contacts trg_update_orderform_alternate_contacts_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_update_orderform_alternate_contacts_updated_at BEFORE UPDATE ON public.orderform_alternate_contacts FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: orderform_alternate_contacts ofaltct_ofrm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderform_alternate_contacts
    ADD CONSTRAINT ofaltct_ofrm_id_fkey FOREIGN KEY (ofrm_id) REFERENCES public.customer_order_forms(ofrm_id) ON DELETE CASCADE;


--
-- Name: orderform_alternate_contacts; Type: ROW SECURITY; Schema: public; Owner: -
--

ALTER TABLE public.orderform_alternate_contacts ENABLE ROW LEVEL SECURITY;

--
-- PostgreSQL database dump complete
--

\unrestrict ikOgyAlpeEyVH2AvvKOzVbcogUEWYcEg1p8Cokbp6CIIdhC8MDPCJmFgmcEzkj4

