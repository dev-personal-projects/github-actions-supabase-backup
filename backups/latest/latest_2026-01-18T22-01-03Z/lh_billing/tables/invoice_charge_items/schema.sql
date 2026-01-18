--
-- PostgreSQL database dump
--

\restrict eBXzawJsm6qogTtoPK3T7dbHTJTi4GdHAofFqLyxGeG6kBofNia95MAYx6xpazf

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
-- Name: invoice_charge_items; Type: TABLE; Schema: lh_billing; Owner: -
--

CREATE TABLE lh_billing.invoice_charge_items (
    invoice_charge_item_id bigint NOT NULL,
    invoice_id bigint NOT NULL,
    order_form_charge_id bigint,
    ofrm_id bigint,
    odrl_id bigint,
    charge_type_code text NOT NULL,
    charge_code text NOT NULL,
    charge_description text NOT NULL,
    role_level text,
    role_description text,
    resource_name text,
    tax_category text,
    unit_code text NOT NULL,
    quantity numeric(12,4) NOT NULL,
    unit_fee numeric(15,2) NOT NULL,
    discount_percent numeric(5,2) DEFAULT 0 NOT NULL,
    final_unit_fee numeric(15,2) NOT NULL,
    line_total numeric(15,2) NOT NULL,
    approval_reference text,
    approved_at timestamp with time zone,
    approved_by text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT ck_invoice_charge_items__approval_reference_required_for_ad_hoc CHECK (((order_form_charge_id IS NOT NULL) OR ((approval_reference IS NOT NULL) AND (btrim(approval_reference) <> ''::text)))),
    CONSTRAINT ck_invoice_charge_items__charge_code_not_blank CHECK ((btrim(charge_code) <> ''::text)),
    CONSTRAINT ck_invoice_charge_items__charge_description_not_blank CHECK ((btrim(charge_description) <> ''::text)),
    CONSTRAINT ck_invoice_charge_items__discount_percent_valid CHECK (((discount_percent >= (0)::numeric) AND (discount_percent <= (100)::numeric))),
    CONSTRAINT ck_invoice_charge_items__final_unit_fee_non_negative CHECK ((final_unit_fee >= (0)::numeric)),
    CONSTRAINT ck_invoice_charge_items__line_total_non_negative CHECK ((line_total >= (0)::numeric)),
    CONSTRAINT ck_invoice_charge_items__ofrm_id_required_for_order_form_charge CHECK (((order_form_charge_id IS NULL) OR (ofrm_id IS NOT NULL))),
    CONSTRAINT ck_invoice_charge_items__quantity_positive CHECK ((quantity > (0)::numeric)),
    CONSTRAINT ck_invoice_charge_items__resource_name_not_blank_or_null CHECK (((resource_name IS NULL) OR (btrim(resource_name) <> ''::text))),
    CONSTRAINT ck_invoice_charge_items__role_description_not_blank_or_null CHECK (((role_description IS NULL) OR (btrim(role_description) <> ''::text))),
    CONSTRAINT ck_invoice_charge_items__role_level_not_blank_or_null CHECK (((role_level IS NULL) OR (btrim(role_level) <> ''::text))),
    CONSTRAINT ck_invoice_charge_items__unit_fee_non_negative CHECK ((unit_fee >= (0)::numeric))
);


--
-- Name: TABLE invoice_charge_items; Type: COMMENT; Schema: lh_billing; Owner: -
--

COMMENT ON TABLE lh_billing.invoice_charge_items IS 'Goods/expense line items included on invoices (denormalized for auditability)';


--
-- Name: COLUMN invoice_charge_items.order_form_charge_id; Type: COMMENT; Schema: lh_billing; Owner: -
--

COMMENT ON COLUMN lh_billing.invoice_charge_items.order_form_charge_id IS 'Optional reference to the configured order-form charge that produced this invoice line item';


--
-- Name: COLUMN invoice_charge_items.odrl_id; Type: COMMENT; Schema: lh_billing; Owner: -
--

COMMENT ON COLUMN lh_billing.invoice_charge_items.odrl_id IS 'Optional: the ordered role this charge is linked to. NULL means order-form-wide (e.g., shared office)';


--
-- Name: COLUMN invoice_charge_items.role_level; Type: COMMENT; Schema: lh_billing; Owner: -
--

COMMENT ON COLUMN lh_billing.invoice_charge_items.role_level IS 'Denormalized role level at invoice time (e.g., Senior, Mid-Level); NULL if order-form-wide';


--
-- Name: COLUMN invoice_charge_items.role_description; Type: COMMENT; Schema: lh_billing; Owner: -
--

COMMENT ON COLUMN lh_billing.invoice_charge_items.role_description IS 'Denormalized role description at invoice time; NULL if order-form-wide';


--
-- Name: COLUMN invoice_charge_items.resource_name; Type: COMMENT; Schema: lh_billing; Owner: -
--

COMMENT ON COLUMN lh_billing.invoice_charge_items.resource_name IS 'Denormalized name of the current role holder at invoice time; NULL if order-form-wide or role unassigned';


--
-- Name: COLUMN invoice_charge_items.tax_category; Type: COMMENT; Schema: lh_billing; Owner: -
--

COMMENT ON COLUMN lh_billing.invoice_charge_items.tax_category IS 'Optional category used for future per-line tax treatment (if taxes differ by item type/category)';


--
-- Name: COLUMN invoice_charge_items.approval_reference; Type: COMMENT; Schema: lh_billing; Owner: -
--

COMMENT ON COLUMN lh_billing.invoice_charge_items.approval_reference IS 'Required when order_form_charge_id is NULL (TA Clause 11.7). External reference proving approval/request (e.g., email thread ID, PO number, change request ID)';


--
-- Name: COLUMN invoice_charge_items.approved_at; Type: COMMENT; Schema: lh_billing; Owner: -
--

COMMENT ON COLUMN lh_billing.invoice_charge_items.approved_at IS 'Optional timestamp of approval (ad hoc charges)';


--
-- Name: COLUMN invoice_charge_items.approved_by; Type: COMMENT; Schema: lh_billing; Owner: -
--

COMMENT ON COLUMN lh_billing.invoice_charge_items.approved_by IS 'Optional approver name/email (ad hoc charges)';


--
-- Name: invoice_charge_items_invoice_charge_item_id_seq; Type: SEQUENCE; Schema: lh_billing; Owner: -
--

ALTER TABLE lh_billing.invoice_charge_items ALTER COLUMN invoice_charge_item_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME lh_billing.invoice_charge_items_invoice_charge_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: invoice_charge_items invoice_charge_items_pkey; Type: CONSTRAINT; Schema: lh_billing; Owner: -
--

ALTER TABLE ONLY lh_billing.invoice_charge_items
    ADD CONSTRAINT invoice_charge_items_pkey PRIMARY KEY (invoice_charge_item_id);


--
-- Name: ix_invoice_charge_items__charge_type; Type: INDEX; Schema: lh_billing; Owner: -
--

CREATE INDEX ix_invoice_charge_items__charge_type ON lh_billing.invoice_charge_items USING btree (charge_type_code);


--
-- Name: ix_invoice_charge_items__invoice_id; Type: INDEX; Schema: lh_billing; Owner: -
--

CREATE INDEX ix_invoice_charge_items__invoice_id ON lh_billing.invoice_charge_items USING btree (invoice_id);


--
-- Name: ix_invoice_charge_items__odrl_id; Type: INDEX; Schema: lh_billing; Owner: -
--

CREATE INDEX ix_invoice_charge_items__odrl_id ON lh_billing.invoice_charge_items USING btree (odrl_id) WHERE (odrl_id IS NOT NULL);


--
-- Name: ix_invoice_charge_items__ofrm_id; Type: INDEX; Schema: lh_billing; Owner: -
--

CREATE INDEX ix_invoice_charge_items__ofrm_id ON lh_billing.invoice_charge_items USING btree (ofrm_id);


--
-- Name: invoice_charge_items trg_update_invoice_charge_items_updated_at; Type: TRIGGER; Schema: lh_billing; Owner: -
--

CREATE TRIGGER trg_update_invoice_charge_items_updated_at BEFORE UPDATE ON lh_billing.invoice_charge_items FOR EACH ROW EXECUTE FUNCTION lh_billing.set_updated_at();


--
-- Name: invoice_charge_items fk_invoice_charge_items__billing_units; Type: FK CONSTRAINT; Schema: lh_billing; Owner: -
--

ALTER TABLE ONLY lh_billing.invoice_charge_items
    ADD CONSTRAINT fk_invoice_charge_items__billing_units FOREIGN KEY (unit_code) REFERENCES lh_billing.billing_units(unit_code) ON DELETE RESTRICT;


--
-- Name: invoice_charge_items fk_invoice_charge_items__charge_types; Type: FK CONSTRAINT; Schema: lh_billing; Owner: -
--

ALTER TABLE ONLY lh_billing.invoice_charge_items
    ADD CONSTRAINT fk_invoice_charge_items__charge_types FOREIGN KEY (charge_type_code) REFERENCES lh_billing.charge_types(charge_type_code) ON DELETE RESTRICT;


--
-- Name: invoice_charge_items fk_invoice_charge_items__customer_order_forms; Type: FK CONSTRAINT; Schema: lh_billing; Owner: -
--

ALTER TABLE ONLY lh_billing.invoice_charge_items
    ADD CONSTRAINT fk_invoice_charge_items__customer_order_forms FOREIGN KEY (ofrm_id) REFERENCES public.customer_order_forms(ofrm_id) ON DELETE RESTRICT;


--
-- Name: invoice_charge_items fk_invoice_charge_items__invoices; Type: FK CONSTRAINT; Schema: lh_billing; Owner: -
--

ALTER TABLE ONLY lh_billing.invoice_charge_items
    ADD CONSTRAINT fk_invoice_charge_items__invoices FOREIGN KEY (invoice_id) REFERENCES lh_billing.invoices(invoice_id) ON DELETE RESTRICT;


--
-- Name: invoice_charge_items fk_invoice_charge_items__order_form_charges; Type: FK CONSTRAINT; Schema: lh_billing; Owner: -
--

ALTER TABLE ONLY lh_billing.invoice_charge_items
    ADD CONSTRAINT fk_invoice_charge_items__order_form_charges FOREIGN KEY (order_form_charge_id) REFERENCES lh_billing.order_form_charges(order_form_charge_id) ON DELETE RESTRICT;


--
-- Name: invoice_charge_items fk_invoice_charge_items__orderform_ordered_roles; Type: FK CONSTRAINT; Schema: lh_billing; Owner: -
--

ALTER TABLE ONLY lh_billing.invoice_charge_items
    ADD CONSTRAINT fk_invoice_charge_items__orderform_ordered_roles FOREIGN KEY (odrl_id) REFERENCES public.orderform_ordered_roles(odrl_id) ON DELETE RESTRICT;


--
-- Name: invoice_charge_items; Type: ROW SECURITY; Schema: lh_billing; Owner: -
--

ALTER TABLE lh_billing.invoice_charge_items ENABLE ROW LEVEL SECURITY;

--
-- PostgreSQL database dump complete
--

\unrestrict eBXzawJsm6qogTtoPK3T7dbHTJTi4GdHAofFqLyxGeG6kBofNia95MAYx6xpazf

