--
-- PostgreSQL database dump
--

\restrict N4zUAGrXrOmstIrDt9Gk4odgj49v92eljBUiPpp9ZefhyoeU0xM8kHAv79hbLc0

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
-- Name: invoice_delivery_outbox; Type: TABLE; Schema: lh_billing_agile; Owner: -
--

CREATE TABLE lh_billing_agile.invoice_delivery_outbox (
    invoice_delivery_outbox_id bigint NOT NULL,
    invoice_id bigint NOT NULL,
    correlation_id text NOT NULL,
    status text DEFAULT 'pending'::text NOT NULL,
    blocked_reason text,
    sender_email text NOT NULL,
    to_recipients text[] DEFAULT '{}'::text[] NOT NULL,
    cc_recipients text[] DEFAULT '{}'::text[] NOT NULL,
    bcc_recipients text[] DEFAULT '{}'::text[] NOT NULL,
    is_test_email boolean DEFAULT false NOT NULL,
    invoice_number text NOT NULL,
    company_id bigint NOT NULL,
    period_end date NOT NULL,
    blob_path text NOT NULL,
    attempt_count integer DEFAULT 0 NOT NULL,
    next_attempt_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    locked_at timestamp with time zone,
    locked_by text,
    last_error text,
    sent_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT ck_invoice_delivery_outbox__attempt_count_non_negative CHECK ((attempt_count >= 0)),
    CONSTRAINT ck_invoice_delivery_outbox__blob_path_not_blank CHECK ((btrim(blob_path) <> ''::text)),
    CONSTRAINT ck_invoice_delivery_outbox__blocked_reason_required CHECK (((status <> 'blocked'::text) OR (btrim(COALESCE(blocked_reason, ''::text)) <> ''::text))),
    CONSTRAINT ck_invoice_delivery_outbox__correlation_id_not_blank CHECK ((btrim(correlation_id) <> ''::text)),
    CONSTRAINT ck_invoice_delivery_outbox__invoice_number_not_blank CHECK ((btrim(invoice_number) <> ''::text)),
    CONSTRAINT ck_invoice_delivery_outbox__sender_email_not_blank CHECK ((btrim(sender_email) <> ''::text)),
    CONSTRAINT ck_invoice_delivery_outbox__status CHECK ((status = ANY (ARRAY['blocked'::text, 'pending'::text, 'processing'::text, 'sent'::text, 'failed'::text, 'cancelled'::text])))
);


--
-- Name: TABLE invoice_delivery_outbox; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON TABLE lh_billing_agile.invoice_delivery_outbox IS 'Durable outbox for invoice email delivery (one row per invoice). Supports retries, concurrency-safe claiming (SKIP LOCKED), and recipient snapshotting at generation time.';


--
-- Name: COLUMN invoice_delivery_outbox.status; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON COLUMN lh_billing_agile.invoice_delivery_outbox.status IS 'Delivery workflow state: blocked, pending, processing, sent, failed, cancelled';


--
-- Name: COLUMN invoice_delivery_outbox.blocked_reason; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON COLUMN lh_billing_agile.invoice_delivery_outbox.blocked_reason IS 'Optional reason when status=blocked (approval readiness)';


--
-- Name: COLUMN invoice_delivery_outbox.sender_email; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON COLUMN lh_billing_agile.invoice_delivery_outbox.sender_email IS 'From address to use when sending the invoice email (snapshotted at enqueue time)';


--
-- Name: COLUMN invoice_delivery_outbox.to_recipients; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON COLUMN lh_billing_agile.invoice_delivery_outbox.to_recipients IS 'To recipients (snapshotted at enqueue time)';


--
-- Name: COLUMN invoice_delivery_outbox.cc_recipients; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON COLUMN lh_billing_agile.invoice_delivery_outbox.cc_recipients IS 'Cc recipients (snapshotted at enqueue time)';


--
-- Name: COLUMN invoice_delivery_outbox.bcc_recipients; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON COLUMN lh_billing_agile.invoice_delivery_outbox.bcc_recipients IS 'Bcc recipients (snapshotted at enqueue time)';


--
-- Name: COLUMN invoice_delivery_outbox.is_test_email; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON COLUMN lh_billing_agile.invoice_delivery_outbox.is_test_email IS 'True when the delivery is a test/dry-run email';


--
-- Name: COLUMN invoice_delivery_outbox.invoice_number; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON COLUMN lh_billing_agile.invoice_delivery_outbox.invoice_number IS 'Invoice number (copied from invoices.inv_prfx_id at enqueue time)';


--
-- Name: COLUMN invoice_delivery_outbox.company_id; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON COLUMN lh_billing_agile.invoice_delivery_outbox.company_id IS 'Company id (copied from invoices.cmp_id at enqueue time)';


--
-- Name: COLUMN invoice_delivery_outbox.period_end; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON COLUMN lh_billing_agile.invoice_delivery_outbox.period_end IS 'Invoice billing period end (copied from invoices.period_end at enqueue time)';


--
-- Name: COLUMN invoice_delivery_outbox.blob_path; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON COLUMN lh_billing_agile.invoice_delivery_outbox.blob_path IS 'Blob storage path to the invoice PDF (snapshotted so future path changes do not break delivery)';


--
-- Name: COLUMN invoice_delivery_outbox.attempt_count; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON COLUMN lh_billing_agile.invoice_delivery_outbox.attempt_count IS 'Number of send attempts performed for this outbox row';


--
-- Name: COLUMN invoice_delivery_outbox.next_attempt_at; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON COLUMN lh_billing_agile.invoice_delivery_outbox.next_attempt_at IS 'Next scheduled attempt time (polling uses status + next_attempt_at)';


--
-- Name: COLUMN invoice_delivery_outbox.locked_at; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON COLUMN lh_billing_agile.invoice_delivery_outbox.locked_at IS 'Timestamp when a worker claimed this row (FOR UPDATE SKIP LOCKED)';


--
-- Name: COLUMN invoice_delivery_outbox.locked_by; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON COLUMN lh_billing_agile.invoice_delivery_outbox.locked_by IS 'Worker identifier that claimed this row';


--
-- Name: COLUMN invoice_delivery_outbox.last_error; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON COLUMN lh_billing_agile.invoice_delivery_outbox.last_error IS 'Most recent error (if any) from a send attempt';


--
-- Name: COLUMN invoice_delivery_outbox.sent_at; Type: COMMENT; Schema: lh_billing_agile; Owner: -
--

COMMENT ON COLUMN lh_billing_agile.invoice_delivery_outbox.sent_at IS 'Timestamp when the invoice was successfully sent';


--
-- Name: invoice_delivery_outbox_invoice_delivery_outbox_id_seq; Type: SEQUENCE; Schema: lh_billing_agile; Owner: -
--

ALTER TABLE lh_billing_agile.invoice_delivery_outbox ALTER COLUMN invoice_delivery_outbox_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME lh_billing_agile.invoice_delivery_outbox_invoice_delivery_outbox_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: invoice_delivery_outbox invoice_delivery_outbox_pkey; Type: CONSTRAINT; Schema: lh_billing_agile; Owner: -
--

ALTER TABLE ONLY lh_billing_agile.invoice_delivery_outbox
    ADD CONSTRAINT invoice_delivery_outbox_pkey PRIMARY KEY (invoice_delivery_outbox_id);


--
-- Name: invoice_delivery_outbox uq_invoice_delivery_outbox__invoice_id; Type: CONSTRAINT; Schema: lh_billing_agile; Owner: -
--

ALTER TABLE ONLY lh_billing_agile.invoice_delivery_outbox
    ADD CONSTRAINT uq_invoice_delivery_outbox__invoice_id UNIQUE (invoice_id);


--
-- Name: ix_invoice_delivery_outbox__correlation_id; Type: INDEX; Schema: lh_billing_agile; Owner: -
--

CREATE INDEX ix_invoice_delivery_outbox__correlation_id ON lh_billing_agile.invoice_delivery_outbox USING btree (correlation_id);


--
-- Name: ix_invoice_delivery_outbox__polling; Type: INDEX; Schema: lh_billing_agile; Owner: -
--

CREATE INDEX ix_invoice_delivery_outbox__polling ON lh_billing_agile.invoice_delivery_outbox USING btree (status, next_attempt_at, invoice_delivery_outbox_id);


--
-- Name: invoice_delivery_outbox trg_update_invoice_delivery_outbox_updated_at; Type: TRIGGER; Schema: lh_billing_agile; Owner: -
--

CREATE TRIGGER trg_update_invoice_delivery_outbox_updated_at BEFORE UPDATE ON lh_billing_agile.invoice_delivery_outbox FOR EACH ROW EXECUTE FUNCTION lh_billing_agile.set_updated_at();


--
-- Name: invoice_delivery_outbox fk_invoice_delivery_outbox__invoices; Type: FK CONSTRAINT; Schema: lh_billing_agile; Owner: -
--

ALTER TABLE ONLY lh_billing_agile.invoice_delivery_outbox
    ADD CONSTRAINT fk_invoice_delivery_outbox__invoices FOREIGN KEY (invoice_id) REFERENCES lh_billing_agile.invoices(invoice_id) ON DELETE RESTRICT;


--
-- Name: invoice_delivery_outbox; Type: ROW SECURITY; Schema: lh_billing_agile; Owner: -
--

ALTER TABLE lh_billing_agile.invoice_delivery_outbox ENABLE ROW LEVEL SECURITY;

--
-- PostgreSQL database dump complete
--

\unrestrict N4zUAGrXrOmstIrDt9Gk4odgj49v92eljBUiPpp9ZefhyoeU0xM8kHAv79hbLc0

