--
-- PostgreSQL database dump
--

\restrict dhOoBpXsHcq7BdzqyfROi74kTAsGSf7SnYLA5kiVR2QNrIsA3XXwPb01MHAUTOU

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.9 (Ubuntu 17.9-1.pgdg24.04+1)

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
-- Name: remittance_profiles; Type: TABLE; Schema: lh_billing_system; Owner: -
--

CREATE TABLE lh_billing_system.remittance_profiles (
    remittance_profile_id bigint NOT NULL,
    country_code character(2),
    currency character(3) NOT NULL,
    country_code_scope text GENERATED ALWAYS AS (COALESCE((country_code)::text, '__GLOBAL__'::text)) STORED,
    effective_from timestamp with time zone NOT NULL,
    effective_to timestamp with time zone,
    is_active boolean DEFAULT true NOT NULL,
    created_by text NOT NULL,
    change_reason text NOT NULL,
    approved_by text,
    approved_at timestamp with time zone,
    payload jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT ck_remittance_profiles__approved_at_required_when_active CHECK (((is_active = false) OR (approved_at IS NOT NULL))),
    CONSTRAINT ck_remittance_profiles__approved_by_not_blank_or_null CHECK (((approved_by IS NULL) OR (btrim(approved_by) <> ''::text))),
    CONSTRAINT ck_remittance_profiles__approved_by_required_when_approved CHECK (((approved_at IS NULL) OR (approved_by IS NOT NULL))),
    CONSTRAINT ck_remittance_profiles__change_reason_not_blank CHECK ((btrim(change_reason) <> ''::text)),
    CONSTRAINT ck_remittance_profiles__country_code_not_blank_or_null CHECK (((country_code IS NULL) OR ((btrim((country_code)::text) <> ''::text) AND (length(btrim((country_code)::text)) = 2) AND (btrim((country_code)::text) = upper(btrim((country_code)::text)))))),
    CONSTRAINT ck_remittance_profiles__created_by_not_blank CHECK ((btrim(created_by) <> ''::text)),
    CONSTRAINT ck_remittance_profiles__currency_not_blank CHECK (((btrim((currency)::text) <> ''::text) AND (length(btrim((currency)::text)) = 3) AND (btrim((currency)::text) = upper(btrim((currency)::text))))),
    CONSTRAINT ck_remittance_profiles__effective_window_valid CHECK (((effective_to IS NULL) OR (effective_to > effective_from)))
);


--
-- Name: TABLE remittance_profiles; Type: COMMENT; Schema: lh_billing_system; Owner: -
--

COMMENT ON TABLE lh_billing_system.remittance_profiles IS 'Source of truth for remittance instructions with temporal validity and governance fields. Resolved at PDF generation time and snapshotted onto invoices.';


--
-- Name: COLUMN remittance_profiles.country_code; Type: COMMENT; Schema: lh_billing_system; Owner: -
--

COMMENT ON COLUMN lh_billing_system.remittance_profiles.country_code IS 'ISO 3166-1 alpha-2 bill-to country; NULL means global default.';


--
-- Name: COLUMN remittance_profiles.currency; Type: COMMENT; Schema: lh_billing_system; Owner: -
--

COMMENT ON COLUMN lh_billing_system.remittance_profiles.currency IS 'ISO 4217 invoice currency (currency-specific profiles only).';


--
-- Name: COLUMN remittance_profiles.country_code_scope; Type: COMMENT; Schema: lh_billing_system; Owner: -
--

COMMENT ON COLUMN lh_billing_system.remittance_profiles.country_code_scope IS 'Internal key used for deterministic overlap enforcement (coalesce(country_code,''__GLOBAL__'')).';


--
-- Name: COLUMN remittance_profiles.created_by; Type: COMMENT; Schema: lh_billing_system; Owner: -
--

COMMENT ON COLUMN lh_billing_system.remittance_profiles.created_by IS 'Actor id that created this profile (recommended: user:<email> or svc:<name>).';


--
-- Name: COLUMN remittance_profiles.change_reason; Type: COMMENT; Schema: lh_billing_system; Owner: -
--

COMMENT ON COLUMN lh_billing_system.remittance_profiles.change_reason IS 'Reason for the change (auditable).';


--
-- Name: COLUMN remittance_profiles.approved_by; Type: COMMENT; Schema: lh_billing_system; Owner: -
--

COMMENT ON COLUMN lh_billing_system.remittance_profiles.approved_by IS 'Actor id that approved this profile.';


--
-- Name: COLUMN remittance_profiles.approved_at; Type: COMMENT; Schema: lh_billing_system; Owner: -
--

COMMENT ON COLUMN lh_billing_system.remittance_profiles.approved_at IS 'Approval timestamp when environment policy requires approval.';


--
-- Name: COLUMN remittance_profiles.payload; Type: COMMENT; Schema: lh_billing_system; Owner: -
--

COMMENT ON COLUMN lh_billing_system.remittance_profiles.payload IS 'Remittance instructions payload (JSON). Snapshotted onto invoices as remittance_details.';


--
-- Name: remittance_profiles_remittance_profile_id_seq; Type: SEQUENCE; Schema: lh_billing_system; Owner: -
--

ALTER TABLE lh_billing_system.remittance_profiles ALTER COLUMN remittance_profile_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME lh_billing_system.remittance_profiles_remittance_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: remittance_profiles excl_remittance_profiles__no_overlap; Type: CONSTRAINT; Schema: lh_billing_system; Owner: -
--

ALTER TABLE ONLY lh_billing_system.remittance_profiles
    ADD CONSTRAINT excl_remittance_profiles__no_overlap EXCLUDE USING gist (country_code_scope WITH =, currency WITH =, tstzrange(effective_from, COALESCE(effective_to, 'infinity'::timestamp with time zone), '[)'::text) WITH &&) WHERE ((is_active = true));


--
-- Name: remittance_profiles remittance_profiles_pkey; Type: CONSTRAINT; Schema: lh_billing_system; Owner: -
--

ALTER TABLE ONLY lh_billing_system.remittance_profiles
    ADD CONSTRAINT remittance_profiles_pkey PRIMARY KEY (remittance_profile_id);


--
-- Name: ix_remittance_profiles__active_lookup; Type: INDEX; Schema: lh_billing_system; Owner: -
--

CREATE INDEX ix_remittance_profiles__active_lookup ON lh_billing_system.remittance_profiles USING btree (country_code, currency, effective_from) WHERE (is_active = true);


--
-- Name: remittance_profiles trg_update_remittance_profiles_updated_at; Type: TRIGGER; Schema: lh_billing_system; Owner: -
--

CREATE TRIGGER trg_update_remittance_profiles_updated_at BEFORE UPDATE ON lh_billing_system.remittance_profiles FOR EACH ROW EXECUTE FUNCTION lh_billing_system.set_updated_at();


--
-- Name: remittance_profiles; Type: ROW SECURITY; Schema: lh_billing_system; Owner: -
--

ALTER TABLE lh_billing_system.remittance_profiles ENABLE ROW LEVEL SECURITY;

--
-- PostgreSQL database dump complete
--

\unrestrict dhOoBpXsHcq7BdzqyfROi74kTAsGSf7SnYLA5kiVR2QNrIsA3XXwPb01MHAUTOU

