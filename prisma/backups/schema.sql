


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE TYPE "public"."ai_messages_role_enum" AS ENUM (
    'user',
    'assistant'
);


ALTER TYPE "public"."ai_messages_role_enum" OWNER TO "postgres";


CREATE TYPE "public"."loan_requests_approval_status_enum" AS ENUM (
    'pending',
    'accepted',
    'rejected'
);


ALTER TYPE "public"."loan_requests_approval_status_enum" OWNER TO "postgres";


CREATE TYPE "public"."loan_requests_repayment_status_enum" AS ENUM (
    'unpaid',
    'completed',
    'active',
    'overdue',
    'defaulted'
);


ALTER TYPE "public"."loan_requests_repayment_status_enum" OWNER TO "postgres";


CREATE TYPE "public"."member_contributions_status_enum" AS ENUM (
    'paid',
    'partial',
    'unpaid'
);


ALTER TYPE "public"."member_contributions_status_enum" OWNER TO "postgres";


CREATE TYPE "public"."savings_type_enum" AS ENUM (
    'daily',
    'weekly',
    'monthly',
    'yearly'
);


ALTER TYPE "public"."savings_type_enum" OWNER TO "postgres";


CREATE TYPE "public"."subscriptions_status_enum" AS ENUM (
    'active',
    'non-renewing',
    'attention',
    'completed',
    'cancelled',
    'expired'
);


ALTER TYPE "public"."subscriptions_status_enum" OWNER TO "postgres";


CREATE TYPE "public"."subscriptions_transition_type_enum" AS ENUM (
    'new',
    'upgrade',
    'downgrade',
    'renew'
);


ALTER TYPE "public"."subscriptions_transition_type_enum" OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."ai_conversations" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "chama_id" "uuid",
    "initiator_id" "uuid"
);


ALTER TABLE "public"."ai_conversations" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."ai_messages" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "role" "public"."ai_messages_role_enum" NOT NULL,
    "content" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "conversation_id" "uuid",
    "sender_id" "uuid"
);


ALTER TABLE "public"."ai_messages" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."chama_profiles" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "chama_id" "uuid",
    "profile_id" "uuid",
    "role" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."chama_profiles" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."chamas" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "name" "text" NOT NULL,
    "description" "text",
    "created_by" "uuid" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "profile_picture_url" "text"
);


ALTER TABLE "public"."chamas" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."contributions" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "title" "text" NOT NULL,
    "due_date" "date" NOT NULL,
    "amount" numeric NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "chama_id" "uuid",
    "created_by_id" "uuid"
);


ALTER TABLE "public"."contributions" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."expenses" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "name" "text" NOT NULL,
    "amount" numeric NOT NULL,
    "date" timestamp with time zone NOT NULL,
    "description" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "chama_id" "uuid",
    "created_by_id" "uuid"
);


ALTER TABLE "public"."expenses" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."income" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "name" "text" NOT NULL,
    "amount" numeric NOT NULL,
    "date" timestamp with time zone NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "owner_id" "uuid",
    "chama_id" "uuid",
    "created_by_id" "uuid"
);


ALTER TABLE "public"."income" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."investments" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "name" "text" NOT NULL,
    "amount" numeric NOT NULL,
    "date" timestamp with time zone NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "chama_id" "uuid",
    "created_by_id" "uuid"
);


ALTER TABLE "public"."investments" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."loan_requests" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "principal" numeric NOT NULL,
    "amount_payable" numeric,
    "amount_paid" numeric DEFAULT '0'::numeric NOT NULL,
    "balance" numeric NOT NULL,
    "installments" "jsonb" DEFAULT '[]'::"jsonb" NOT NULL,
    "due_date" "date",
    "approval_status" "public"."loan_requests_approval_status_enum" DEFAULT 'pending'::"public"."loan_requests_approval_status_enum" NOT NULL,
    "repayment_status" "public"."loan_requests_repayment_status_enum" DEFAULT 'unpaid'::"public"."loan_requests_repayment_status_enum" NOT NULL,
    "approved_at" timestamp with time zone,
    "repayment_history" "jsonb" DEFAULT '[]'::"jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "loan_type_id" "uuid",
    "requested_by_id" "uuid",
    "approved_by_id" "uuid"
);


ALTER TABLE "public"."loan_requests" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."loans" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "name" "text" NOT NULL,
    "amount" numeric NOT NULL,
    "interest_rate" numeric NOT NULL,
    "duration" integer NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "chama_id" "uuid",
    "created_by_id" "uuid"
);


ALTER TABLE "public"."loans" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."member_contributions" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "amount_paid" numeric DEFAULT '0'::numeric NOT NULL,
    "balance" numeric NOT NULL,
    "status" "public"."member_contributions_status_enum" DEFAULT 'unpaid'::"public"."member_contributions_status_enum" NOT NULL,
    "payment_date" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "contribution_id" "uuid",
    "member_id" "uuid",
    "contribution_history" "jsonb" DEFAULT '[]'::"jsonb" NOT NULL
);


ALTER TABLE "public"."member_contributions" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."migrations" (
    "id" integer NOT NULL,
    "timestamp" bigint NOT NULL,
    "name" character varying NOT NULL
);


ALTER TABLE "public"."migrations" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."migrations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."migrations_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."migrations_id_seq" OWNED BY "public"."migrations"."id";



CREATE TABLE IF NOT EXISTS "public"."notifications" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "type" character varying(100) NOT NULL,
    "title" character varying(255) NOT NULL,
    "message" "text" NOT NULL,
    "is_read" boolean DEFAULT false NOT NULL,
    "metadata" "jsonb",
    "action_url" character varying(500),
    "read_at" timestamp with time zone,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "recipient_id" "uuid" NOT NULL,
    "triggered_by_id" "uuid",
    "chama_id" "uuid" NOT NULL
);


ALTER TABLE "public"."notifications" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."profiles" (
    "id" "uuid" NOT NULL,
    "first_name" "text",
    "middle_name" "text",
    "last_name" "text",
    "email" "text",
    "phone" "text",
    "avatar_url" "text",
    "residence" "text",
    "id_number" numeric,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."profiles" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."savings" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "amount" numeric NOT NULL,
    "date" timestamp with time zone NOT NULL,
    "type" "public"."savings_type_enum" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "owner_id" "uuid",
    "chama_id" "uuid",
    "created_by_id" "uuid"
);


ALTER TABLE "public"."savings" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."subscriptions" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "plan_code" "text" NOT NULL,
    "plan_name" "text" NOT NULL,
    "plan_amount" numeric NOT NULL,
    "plan_interval" "text" NOT NULL,
    "plan_description" "text" NOT NULL,
    "reference" "text" NOT NULL,
    "channel" "text",
    "last4" "text",
    "brand" "text",
    "bank" "text",
    "exp_month" "text",
    "exp_year" "text",
    "customer_email" "text" NOT NULL,
    "customer_code" "text" NOT NULL,
    "status" "public"."subscriptions_status_enum" DEFAULT 'attention'::"public"."subscriptions_status_enum" NOT NULL,
    "paid_at" timestamp with time zone NOT NULL,
    "expires_at" timestamp with time zone NOT NULL,
    "previous_subscription_id" "uuid",
    "transition_type" "public"."subscriptions_transition_type_enum" DEFAULT 'new'::"public"."subscriptions_transition_type_enum" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "chama_id" "uuid"
);


ALTER TABLE "public"."subscriptions" OWNER TO "postgres";


ALTER TABLE ONLY "public"."migrations" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."migrations_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."savings"
    ADD CONSTRAINT "PK_12862ba6871fc7be04cbd26230c" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."income"
    ADD CONSTRAINT "PK_29a10f17b97568f70cee8586d58" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."loan_requests"
    ADD CONSTRAINT "PK_502363f47cde20394e748d4562f" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."member_contributions"
    ADD CONSTRAINT "PK_55c9f06fcbf09f0fe5f6287925d" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."loans"
    ADD CONSTRAINT "PK_5c6942c1e13e4de135c5203ee61" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."ai_conversations"
    ADD CONSTRAINT "PK_60db12765b82858ba00c8aa4ae2" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."notifications"
    ADD CONSTRAINT "PK_6a72c3c0f683f6462415e653c3a" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."migrations"
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."expenses"
    ADD CONSTRAINT "PK_94c3ceb17e3140abc9282c20610" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."investments"
    ADD CONSTRAINT "PK_a1263853f1a4fb8b849c1c9aff4" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."ai_messages"
    ADD CONSTRAINT "PK_a390434d4a515ba18a41bc996c2" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."subscriptions"
    ADD CONSTRAINT "PK_a87248d73155605cf782be9ee5e" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."contributions"
    ADD CONSTRAINT "PK_ca2b4f39eb9e32a61278c711f79" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."subscriptions"
    ADD CONSTRAINT "UQ_170a8e7c388939041319cdd5333" UNIQUE ("reference");



ALTER TABLE ONLY "public"."profiles"
    ADD CONSTRAINT "UQ_6ca5cd9bacd921599be9d920973" UNIQUE ("phone");



ALTER TABLE ONLY "public"."chama_profiles"
    ADD CONSTRAINT "pk_chama_profiles_id" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."chamas"
    ADD CONSTRAINT "pk_chamas_id" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."profiles"
    ADD CONSTRAINT "pk_profiles_id" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."chamas"
    ADD CONSTRAINT "uq_chamas_name" UNIQUE ("name");



ALTER TABLE ONLY "public"."loans"
    ADD CONSTRAINT "uq_loan_chama_name" UNIQUE ("chama_id", "name");



ALTER TABLE ONLY "public"."profiles"
    ADD CONSTRAINT "uq_profiles_email" UNIQUE ("email");



ALTER TABLE ONLY "public"."profiles"
    ADD CONSTRAINT "uq_profiles_id_number" UNIQUE ("id_number");



CREATE INDEX "idx_ai_msg_conversation_created_at" ON "public"."ai_messages" USING "btree" ("conversation_id", "created_at");



CREATE INDEX "idx_notifications_chama_created" ON "public"."notifications" USING "btree" ("chama_id", "created_at");



CREATE INDEX "idx_notifications_recipient_read" ON "public"."notifications" USING "btree" ("recipient_id", "is_read");



ALTER TABLE ONLY "public"."notifications"
    ADD CONSTRAINT "FK_5332a4daa46fd3f4e6625dd275d" FOREIGN KEY ("recipient_id") REFERENCES "public"."chama_profiles"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."notifications"
    ADD CONSTRAINT "FK_d1581251e41e9186ed75f28d0f0" FOREIGN KEY ("triggered_by_id") REFERENCES "public"."chama_profiles"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."notifications"
    ADD CONSTRAINT "FK_db3810767382b4c89c8a77970c3" FOREIGN KEY ("chama_id") REFERENCES "public"."chamas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."ai_conversations"
    ADD CONSTRAINT "fk_ai_convo_chama_id" FOREIGN KEY ("chama_id") REFERENCES "public"."chamas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."ai_conversations"
    ADD CONSTRAINT "fk_ai_convo_initiator_id" FOREIGN KEY ("initiator_id") REFERENCES "public"."chama_profiles"("id");



ALTER TABLE ONLY "public"."ai_messages"
    ADD CONSTRAINT "fk_ai_msg_conversation_id" FOREIGN KEY ("conversation_id") REFERENCES "public"."ai_conversations"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."ai_messages"
    ADD CONSTRAINT "fk_ai_msg_sender_id" FOREIGN KEY ("sender_id") REFERENCES "public"."chama_profiles"("id");



ALTER TABLE ONLY "public"."chama_profiles"
    ADD CONSTRAINT "fk_chama_profiles_chama_id" FOREIGN KEY ("chama_id") REFERENCES "public"."chamas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."chama_profiles"
    ADD CONSTRAINT "fk_chama_profiles_profile_id" FOREIGN KEY ("profile_id") REFERENCES "public"."profiles"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."chamas"
    ADD CONSTRAINT "fk_chamas_created_by" FOREIGN KEY ("created_by") REFERENCES "public"."profiles"("id") ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE ONLY "public"."contributions"
    ADD CONSTRAINT "fk_contribution_chama_id" FOREIGN KEY ("chama_id") REFERENCES "public"."chamas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."contributions"
    ADD CONSTRAINT "fk_contribution_created_by_id" FOREIGN KEY ("created_by_id") REFERENCES "public"."chama_profiles"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."expenses"
    ADD CONSTRAINT "fk_expense_chama_id" FOREIGN KEY ("chama_id") REFERENCES "public"."chamas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."expenses"
    ADD CONSTRAINT "fk_expense_created_by_id" FOREIGN KEY ("created_by_id") REFERENCES "public"."chama_profiles"("id") ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE ONLY "public"."income"
    ADD CONSTRAINT "fk_income_chama_id" FOREIGN KEY ("chama_id") REFERENCES "public"."chamas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."income"
    ADD CONSTRAINT "fk_income_created_by_id" FOREIGN KEY ("created_by_id") REFERENCES "public"."chama_profiles"("id") ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE ONLY "public"."income"
    ADD CONSTRAINT "fk_income_owner_id" FOREIGN KEY ("owner_id") REFERENCES "public"."chama_profiles"("id") ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE ONLY "public"."investments"
    ADD CONSTRAINT "fk_investment_chama_id" FOREIGN KEY ("chama_id") REFERENCES "public"."chamas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."investments"
    ADD CONSTRAINT "fk_investment_created_by_id" FOREIGN KEY ("created_by_id") REFERENCES "public"."chama_profiles"("id") ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE ONLY "public"."loans"
    ADD CONSTRAINT "fk_loan_chama_id" FOREIGN KEY ("chama_id") REFERENCES "public"."chamas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."loans"
    ADD CONSTRAINT "fk_loan_created_by_id" FOREIGN KEY ("created_by_id") REFERENCES "public"."chama_profiles"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."loan_requests"
    ADD CONSTRAINT "fk_loan_request_approved_by_id" FOREIGN KEY ("approved_by_id") REFERENCES "public"."chama_profiles"("id") ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE ONLY "public"."loan_requests"
    ADD CONSTRAINT "fk_loan_requested_by_id" FOREIGN KEY ("requested_by_id") REFERENCES "public"."chama_profiles"("id") ON DELETE RESTRICT;



ALTER TABLE ONLY "public"."loan_requests"
    ADD CONSTRAINT "fk_loan_type_id" FOREIGN KEY ("loan_type_id") REFERENCES "public"."loans"("id") ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE ONLY "public"."member_contributions"
    ADD CONSTRAINT "fk_member_contributions_contribution_id" FOREIGN KEY ("contribution_id") REFERENCES "public"."contributions"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."member_contributions"
    ADD CONSTRAINT "fk_member_contributions_member_id" FOREIGN KEY ("member_id") REFERENCES "public"."chama_profiles"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."savings"
    ADD CONSTRAINT "fk_savings_chama_id" FOREIGN KEY ("chama_id") REFERENCES "public"."chamas"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."savings"
    ADD CONSTRAINT "fk_savings_created_by_id" FOREIGN KEY ("created_by_id") REFERENCES "public"."chama_profiles"("id") ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE ONLY "public"."savings"
    ADD CONSTRAINT "fk_savings_owner_id" FOREIGN KEY ("owner_id") REFERENCES "public"."chama_profiles"("id") ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE ONLY "public"."subscriptions"
    ADD CONSTRAINT "fk_subscriptions_chama_id" FOREIGN KEY ("chama_id") REFERENCES "public"."chamas"("id") ON DELETE CASCADE;





ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";


GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";








































































































































































GRANT ALL ON TABLE "public"."ai_conversations" TO "anon";
GRANT ALL ON TABLE "public"."ai_conversations" TO "authenticated";
GRANT ALL ON TABLE "public"."ai_conversations" TO "service_role";



GRANT ALL ON TABLE "public"."ai_messages" TO "anon";
GRANT ALL ON TABLE "public"."ai_messages" TO "authenticated";
GRANT ALL ON TABLE "public"."ai_messages" TO "service_role";



GRANT ALL ON TABLE "public"."chama_profiles" TO "anon";
GRANT ALL ON TABLE "public"."chama_profiles" TO "authenticated";
GRANT ALL ON TABLE "public"."chama_profiles" TO "service_role";



GRANT ALL ON TABLE "public"."chamas" TO "anon";
GRANT ALL ON TABLE "public"."chamas" TO "authenticated";
GRANT ALL ON TABLE "public"."chamas" TO "service_role";



GRANT ALL ON TABLE "public"."contributions" TO "anon";
GRANT ALL ON TABLE "public"."contributions" TO "authenticated";
GRANT ALL ON TABLE "public"."contributions" TO "service_role";



GRANT ALL ON TABLE "public"."expenses" TO "anon";
GRANT ALL ON TABLE "public"."expenses" TO "authenticated";
GRANT ALL ON TABLE "public"."expenses" TO "service_role";



GRANT ALL ON TABLE "public"."income" TO "anon";
GRANT ALL ON TABLE "public"."income" TO "authenticated";
GRANT ALL ON TABLE "public"."income" TO "service_role";



GRANT ALL ON TABLE "public"."investments" TO "anon";
GRANT ALL ON TABLE "public"."investments" TO "authenticated";
GRANT ALL ON TABLE "public"."investments" TO "service_role";



GRANT ALL ON TABLE "public"."loan_requests" TO "anon";
GRANT ALL ON TABLE "public"."loan_requests" TO "authenticated";
GRANT ALL ON TABLE "public"."loan_requests" TO "service_role";



GRANT ALL ON TABLE "public"."loans" TO "anon";
GRANT ALL ON TABLE "public"."loans" TO "authenticated";
GRANT ALL ON TABLE "public"."loans" TO "service_role";



GRANT ALL ON TABLE "public"."member_contributions" TO "anon";
GRANT ALL ON TABLE "public"."member_contributions" TO "authenticated";
GRANT ALL ON TABLE "public"."member_contributions" TO "service_role";



GRANT ALL ON TABLE "public"."migrations" TO "anon";
GRANT ALL ON TABLE "public"."migrations" TO "authenticated";
GRANT ALL ON TABLE "public"."migrations" TO "service_role";



GRANT ALL ON SEQUENCE "public"."migrations_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."migrations_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."migrations_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."notifications" TO "anon";
GRANT ALL ON TABLE "public"."notifications" TO "authenticated";
GRANT ALL ON TABLE "public"."notifications" TO "service_role";



GRANT ALL ON TABLE "public"."profiles" TO "anon";
GRANT ALL ON TABLE "public"."profiles" TO "authenticated";
GRANT ALL ON TABLE "public"."profiles" TO "service_role";



GRANT ALL ON TABLE "public"."savings" TO "anon";
GRANT ALL ON TABLE "public"."savings" TO "authenticated";
GRANT ALL ON TABLE "public"."savings" TO "service_role";



GRANT ALL ON TABLE "public"."subscriptions" TO "anon";
GRANT ALL ON TABLE "public"."subscriptions" TO "authenticated";
GRANT ALL ON TABLE "public"."subscriptions" TO "service_role";









ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "service_role";































