--
-- PostgreSQL database dump
--

\restrict 7JQsZYTUJLmLEOUAtmkpthkzPHgAHFnHPfMNgCa05NddDxLR6Np1YLumdFThGLk

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

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

--
-- Name: enum_Bills_paymentStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_Bills_paymentStatus" AS ENUM (
    'Unpaid',
    'Partial',
    'Paid'
);


ALTER TYPE public."enum_Bills_paymentStatus" OWNER TO postgres;

--
-- Name: enum_batches_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_batches_status AS ENUM (
    'Active',
    'Inactive',
    'Expired'
);


ALTER TYPE public.enum_batches_status OWNER TO postgres;

--
-- Name: enum_companies_prohibited; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_companies_prohibited AS ENUM (
    'Yes',
    'No'
);


ALTER TYPE public.enum_companies_prohibited OWNER TO postgres;

--
-- Name: enum_companies_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_companies_status AS ENUM (
    'Continue',
    'Discontinue'
);


ALTER TYPE public.enum_companies_status OWNER TO postgres;

--
-- Name: enum_doctors_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_doctors_status AS ENUM (
    'Active',
    'Inactive'
);


ALTER TYPE public.enum_doctors_status OWNER TO postgres;

--
-- Name: enum_group_permissions_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_group_permissions_status AS ENUM (
    'Active',
    'Inactive',
    'Suspended'
);


ALTER TYPE public.enum_group_permissions_status OWNER TO postgres;

--
-- Name: enum_groups_group_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_groups_group_type AS ENUM (
    'Asset',
    'Liability',
    'Income',
    'Expense',
    'Capital'
);


ALTER TYPE public.enum_groups_group_type OWNER TO postgres;

--
-- Name: enum_groups_prohibit; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_groups_prohibit AS ENUM (
    'Yes',
    'No'
);


ALTER TYPE public.enum_groups_prohibit OWNER TO postgres;

--
-- Name: enum_groups_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_groups_status AS ENUM (
    'Active',
    'Inactive'
);


ALTER TYPE public.enum_groups_status OWNER TO postgres;

--
-- Name: enum_items_goods; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_items_goods AS ENUM (
    'Goods',
    'Service'
);


ALTER TYPE public.enum_items_goods OWNER TO postgres;

--
-- Name: enum_ledgers_balanceType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_ledgers_balanceType" AS ENUM (
    'Debit',
    'Credit'
);


ALTER TYPE public."enum_ledgers_balanceType" OWNER TO postgres;

--
-- Name: enum_ledgers_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_ledgers_status AS ENUM (
    'Active',
    'Inactive'
);


ALTER TYPE public.enum_ledgers_status OWNER TO postgres;

--
-- Name: enum_patients_gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_patients_gender AS ENUM (
    'Male',
    'Female',
    'Other'
);


ALTER TYPE public.enum_patients_gender OWNER TO postgres;

--
-- Name: enum_patients_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_patients_status AS ENUM (
    'Active',
    'Inactive'
);


ALTER TYPE public.enum_patients_status OWNER TO postgres;

--
-- Name: enum_purchase_bills_paymentStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_purchase_bills_paymentStatus" AS ENUM (
    'Unpaid',
    'Partial',
    'Paid'
);


ALTER TYPE public."enum_purchase_bills_paymentStatus" OWNER TO postgres;

--
-- Name: enum_purchase_bills_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_purchase_bills_status AS ENUM (
    'Draft',
    'Received',
    'Invoiced',
    'Cancelled'
);


ALTER TYPE public.enum_purchase_bills_status OWNER TO postgres;

--
-- Name: enum_purchase_masters_natureOfTransaction; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_purchase_masters_natureOfTransaction" AS ENUM (
    'Sales',
    'Purchase'
);


ALTER TYPE public."enum_purchase_masters_natureOfTransaction" OWNER TO postgres;

--
-- Name: enum_purchase_masters_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_purchase_masters_status AS ENUM (
    'Active',
    'Inactive'
);


ALTER TYPE public.enum_purchase_masters_status OWNER TO postgres;

--
-- Name: enum_purchase_masters_taxability; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_purchase_masters_taxability AS ENUM (
    'Taxable',
    'Exempted',
    'Nil Rated',
    'Zero Rated'
);


ALTER TYPE public.enum_purchase_masters_taxability OWNER TO postgres;

--
-- Name: enum_sale_masters_natureOfTransaction; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_sale_masters_natureOfTransaction" AS ENUM (
    'Sales',
    'Purchase'
);


ALTER TYPE public."enum_sale_masters_natureOfTransaction" OWNER TO postgres;

--
-- Name: enum_sale_masters_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_sale_masters_status AS ENUM (
    'Active',
    'Inactive'
);


ALTER TYPE public.enum_sale_masters_status OWNER TO postgres;

--
-- Name: enum_sale_masters_taxability; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_sale_masters_taxability AS ENUM (
    'Taxable',
    'Exempted',
    'Nil Rated',
    'Zero Rated'
);


ALTER TYPE public.enum_sale_masters_taxability OWNER TO postgres;

--
-- Name: enum_transactions_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_transactions_status AS ENUM (
    'Draft',
    'Posted',
    'Cancelled'
);


ALTER TYPE public.enum_transactions_status OWNER TO postgres;

--
-- Name: enum_transactions_voucherType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_transactions_voucherType" AS ENUM (
    'Receipt',
    'Payment',
    'Journal',
    'Contra',
    'DebitNote',
    'CreditNote'
);


ALTER TYPE public."enum_transactions_voucherType" OWNER TO postgres;

--
-- Name: enum_user_companies_businessType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_user_companies_businessType" AS ENUM (
    'Billing [General]',
    'Chemist [Pharmacy]',
    'Pharma Distribution [Batch]',
    'Automobile',
    'Garment',
    'Mobile Trade',
    'Supermarket/Grocery',
    'Computer Hardware'
);


ALTER TYPE public."enum_user_companies_businessType" OWNER TO postgres;

--
-- Name: enum_user_companies_calendarType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_user_companies_calendarType" AS ENUM (
    'English',
    'Hindi',
    'Gujarati'
);


ALTER TYPE public."enum_user_companies_calendarType" OWNER TO postgres;

--
-- Name: enum_user_companies_prohibited; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_user_companies_prohibited AS ENUM (
    'Yes',
    'No'
);


ALTER TYPE public.enum_user_companies_prohibited OWNER TO postgres;

--
-- Name: enum_user_companies_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_user_companies_status AS ENUM (
    'active',
    'inactive',
    'suspended'
);


ALTER TYPE public.enum_user_companies_status OWNER TO postgres;

--
-- Name: enum_users_isactive; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_users_isactive AS ENUM (
    'active',
    'inactive',
    'pending_verification'
);


ALTER TYPE public.enum_users_isactive OWNER TO postgres;

--
-- Name: enum_users_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_users_role AS ENUM (
    'admin',
    'manager',
    'user'
);


ALTER TYPE public.enum_users_role OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: BillItems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BillItems" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "billId" uuid NOT NULL,
    "itemId" uuid,
    product character varying(255),
    packing character varying(255),
    batch character varying(255),
    "expDate" date,
    unit1 character varying(255),
    unit2 character varying(255),
    rate numeric(10,2),
    discount numeric(5,2),
    amount numeric(10,2),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    mrp numeric(10,2),
    quantity numeric(10,2) DEFAULT 1,
    "discountPercent" numeric(5,2) DEFAULT 0,
    "discountAmount" numeric(10,2) DEFAULT 0,
    "cgstPercent" numeric(5,2) DEFAULT 0,
    "cgstAmount" numeric(10,2) DEFAULT 0,
    "sgstPercent" numeric(5,2) DEFAULT 0,
    "sgstAmount" numeric(10,2) DEFAULT 0,
    "igstPercent" numeric(5,2) DEFAULT 0,
    "igstAmount" numeric(10,2) DEFAULT 0,
    "cessPercent" numeric(5,2) DEFAULT 0,
    "cessAmount" numeric(10,2) DEFAULT 0
);


ALTER TABLE public."BillItems" OWNER TO postgres;

--
-- Name: Bills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Bills" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "userCompanyId" uuid NOT NULL,
    "billNo" character varying(255) NOT NULL,
    date date NOT NULL,
    "partyName" character varying(255),
    "patientId" character varying(255),
    "patientName" character varying(255),
    "doctorId" character varying(255),
    "doctorName" character varying(255),
    address character varying(255),
    status character varying(255),
    amount numeric(10,2),
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "paymentStatus" public."enum_Bills_paymentStatus" DEFAULT 'Unpaid'::public."enum_Bills_paymentStatus",
    subtotal numeric(12,2) DEFAULT 0,
    "itemDiscount" numeric(10,2) DEFAULT 0,
    "billDiscountPercent" numeric(5,2) DEFAULT 0,
    "billDiscountAmount" numeric(10,2) DEFAULT 0,
    "cgstPercent" numeric(5,2) DEFAULT 0,
    "cgstAmount" numeric(10,2) DEFAULT 0,
    "sgstPercent" numeric(5,2) DEFAULT 0,
    "sgstAmount" numeric(10,2) DEFAULT 0,
    "totalAmount" numeric(12,2) DEFAULT 0,
    "paidAmount" numeric(12,2) DEFAULT 0,
    "dueAmount" numeric(12,2) DEFAULT 0,
    notes text,
    "createdBy" uuid,
    "updatedBy" uuid,
    "igstPercent" numeric(5,2) DEFAULT 0,
    "igstAmount" numeric(10,2) DEFAULT 0,
    "cessPercent" numeric(5,2) DEFAULT 0,
    "cessAmount" numeric(10,2) DEFAULT 0,
    "totalTaxAmount" numeric(12,2) DEFAULT 0
);


ALTER TABLE public."Bills" OWNER TO postgres;

--
-- Name: Otps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Otps" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    phone character varying(255) NOT NULL,
    otp character varying(255) NOT NULL,
    expiry timestamp with time zone NOT NULL
);


ALTER TABLE public."Otps" OWNER TO postgres;

--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- Name: batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.batches (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "userCompanyId" uuid NOT NULL,
    "itemId" uuid NOT NULL,
    "batchNumber" character varying(255) NOT NULL,
    quantity numeric(10,2) DEFAULT 0 NOT NULL,
    "expiryDate" date,
    mrp numeric(10,2),
    "purchaseRate" numeric(10,2),
    status public.enum_batches_status DEFAULT 'Active'::public.enum_batches_status,
    notes text,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    unit1st character varying(255),
    "billingMrp" numeric(10,2),
    "mfgDate" date,
    "closingQty" numeric(10,2) DEFAULT 0
);


ALTER TABLE public.batches OWNER TO postgres;

--
-- Name: COLUMN batches.unit1st; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.batches.unit1st IS 'Primary unit for the batch';


--
-- Name: COLUMN batches."billingMrp"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.batches."billingMrp" IS 'Billing MRP for the batch';


--
-- Name: COLUMN batches."mfgDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.batches."mfgDate" IS 'Manufacturing date of the batch';


--
-- Name: COLUMN batches."closingQty"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.batches."closingQty" IS 'Closing quantity (calculated field)';


--
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "userCompanyId" uuid NOT NULL,
    companyname character varying(255) NOT NULL,
    printremark character varying(255),
    status public.enum_companies_status DEFAULT 'Continue'::public.enum_companies_status,
    prohibited public.enum_companies_prohibited DEFAULT 'No'::public.enum_companies_prohibited,
    invoiceprintindex integer DEFAULT 1,
    recorderformula double precision DEFAULT '0'::double precision,
    recorderprefrence integer DEFAULT 1,
    expiredays integer DEFAULT 90,
    dumpdays integer DEFAULT 60,
    minimummargin double precision DEFAULT '0'::double precision,
    storeroom integer DEFAULT 1,
    "isMoreOptions" boolean DEFAULT false NOT NULL
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- Name: doctors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctors (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "userCompanyId" uuid NOT NULL,
    "mobileNo" character varying(255) NOT NULL,
    "registrationNo" character varying(255),
    name character varying(255) NOT NULL,
    "hospitalName" character varying(255),
    specialization character varying(255),
    commission double precision DEFAULT '0'::double precision,
    "locationCode" character varying(255),
    address character varying(255),
    "pinNo" character varying(255),
    "phoneNo" character varying(255),
    email character varying(255),
    "whatsappNo" character varying(255),
    status public.enum_doctors_status DEFAULT 'Active'::public.enum_doctors_status NOT NULL
);


ALTER TABLE public.doctors OWNER TO postgres;

--
-- Name: group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_permissions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "groupId" uuid NOT NULL,
    "userId" uuid NOT NULL,
    "canCreateLedger" boolean DEFAULT false,
    "canEditLedger" boolean DEFAULT false,
    "canDeleteLedger" boolean DEFAULT false,
    "canViewLedger" boolean DEFAULT true,
    "canCreateTransaction" boolean DEFAULT false,
    "canEditTransaction" boolean DEFAULT false,
    "canDeleteTransaction" boolean DEFAULT false,
    "canViewTransaction" boolean DEFAULT true,
    "canViewReport" boolean DEFAULT true,
    "canExportReport" boolean DEFAULT false,
    "canViewBalance" boolean DEFAULT true,
    "canModifyBalance" boolean DEFAULT false,
    "canSetOpeningBalance" boolean DEFAULT false,
    "canCreateSubGroup" boolean DEFAULT false,
    "canEditGroup" boolean DEFAULT false,
    "canDeleteGroup" boolean DEFAULT false,
    "isRestricted" boolean DEFAULT false,
    "restrictionReason" text,
    "effectiveFrom" timestamp with time zone,
    "effectiveTo" timestamp with time zone,
    status public.enum_group_permissions_status DEFAULT 'Active'::public.enum_group_permissions_status,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.group_permissions OWNER TO postgres;

--
-- Name: COLUMN group_permissions."canCreateLedger"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."canCreateLedger" IS 'Can create ledgers under this group';


--
-- Name: COLUMN group_permissions."canEditLedger"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."canEditLedger" IS 'Can edit ledgers under this group';


--
-- Name: COLUMN group_permissions."canDeleteLedger"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."canDeleteLedger" IS 'Can delete ledgers under this group';


--
-- Name: COLUMN group_permissions."canViewLedger"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."canViewLedger" IS 'Can view ledgers under this group';


--
-- Name: COLUMN group_permissions."canCreateTransaction"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."canCreateTransaction" IS 'Can create transactions for ledgers in this group';


--
-- Name: COLUMN group_permissions."canEditTransaction"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."canEditTransaction" IS 'Can edit transactions for ledgers in this group';


--
-- Name: COLUMN group_permissions."canDeleteTransaction"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."canDeleteTransaction" IS 'Can delete transactions for ledgers in this group';


--
-- Name: COLUMN group_permissions."canViewTransaction"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."canViewTransaction" IS 'Can view transactions for ledgers in this group';


--
-- Name: COLUMN group_permissions."canViewReport"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."canViewReport" IS 'Can view reports for this group';


--
-- Name: COLUMN group_permissions."canExportReport"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."canExportReport" IS 'Can export reports for this group';


--
-- Name: COLUMN group_permissions."canViewBalance"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."canViewBalance" IS 'Can view balance for ledgers in this group';


--
-- Name: COLUMN group_permissions."canModifyBalance"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."canModifyBalance" IS 'Can modify opening balance for ledgers in this group';


--
-- Name: COLUMN group_permissions."canSetOpeningBalance"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."canSetOpeningBalance" IS 'Can set opening balance for ledgers in this group';


--
-- Name: COLUMN group_permissions."canCreateSubGroup"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."canCreateSubGroup" IS 'Can create sub-groups under this group';


--
-- Name: COLUMN group_permissions."canEditGroup"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."canEditGroup" IS 'Can edit this group';


--
-- Name: COLUMN group_permissions."canDeleteGroup"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."canDeleteGroup" IS 'Can delete this group';


--
-- Name: COLUMN group_permissions."isRestricted"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."isRestricted" IS 'Whether this group has restricted access';


--
-- Name: COLUMN group_permissions."restrictionReason"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."restrictionReason" IS 'Reason for restriction if any';


--
-- Name: COLUMN group_permissions."effectiveFrom"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."effectiveFrom" IS 'When these permissions become effective';


--
-- Name: COLUMN group_permissions."effectiveTo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_permissions."effectiveTo" IS 'When these permissions expire';


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    group_name character varying(255) NOT NULL,
    company_id uuid NOT NULL,
    under_group character varying(255) NOT NULL,
    parent_group_id uuid,
    group_type public.enum_groups_group_type NOT NULL,
    is_default boolean DEFAULT false,
    is_editable boolean DEFAULT true,
    is_deletable boolean DEFAULT true,
    prohibit public.enum_groups_prohibit DEFAULT 'No'::public.enum_groups_prohibit,
    description text,
    sort_order integer DEFAULT 0,
    status public.enum_groups_status DEFAULT 'Active'::public.enum_groups_status,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "formConfig" json DEFAULT '{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}'::json
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: COLUMN groups.under_group; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.groups.under_group IS 'Parent group name for hierarchy';


--
-- Name: COLUMN groups.group_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.groups.group_type IS 'Type of account group';


--
-- Name: COLUMN groups.is_default; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.groups.is_default IS 'Whether this is a default system group';


--
-- Name: COLUMN groups.is_editable; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.groups.is_editable IS 'Whether this group can be edited';


--
-- Name: COLUMN groups.is_deletable; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.groups.is_deletable IS 'Whether this group can be deleted';


--
-- Name: COLUMN groups.prohibit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.groups.prohibit IS 'Whether this group is prohibited from certain operations';


--
-- Name: COLUMN groups.sort_order; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.groups.sort_order IS 'Order for display purposes';


--
-- Name: COLUMN groups."formConfig"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.groups."formConfig" IS 'Form configuration for dynamic field rendering';


--
-- Name: hsnsac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hsnsac (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "hsnSacCode" character varying(255) NOT NULL,
    hsnsacname character varying(255),
    "userCompanyId" uuid NOT NULL
);


ALTER TABLE public.hsnsac OWNER TO postgres;

--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    productname character varying(255) NOT NULL,
    goods public.enum_items_goods DEFAULT 'Goods'::public.enum_items_goods NOT NULL,
    packing character varying(255),
    unit1 uuid NOT NULL,
    unit2 uuid,
    taxcategory uuid NOT NULL,
    hsnsac uuid NOT NULL,
    company uuid NOT NULL,
    "userCompanyId" uuid NOT NULL,
    salt uuid,
    rack uuid,
    price double precision DEFAULT '0'::double precision,
    "purchasePrice" double precision DEFAULT '0'::double precision,
    cost double precision DEFAULT '0'::double precision,
    salerate double precision DEFAULT '0'::double precision,
    conversion integer DEFAULT 1,
    narcotic character varying(255) DEFAULT 'No'::character varying,
    "scheduleH" character varying(255) DEFAULT 'No'::character varying,
    "scheduleH1" character varying(255) DEFAULT 'No'::character varying,
    scheduledrug character varying(255) DEFAULT 'No'::character varying,
    prescription character varying(255) DEFAULT 'No'::character varying,
    storagetype character varying(255) DEFAULT 'Normal'::character varying,
    status character varying(255) DEFAULT 'Continue'::character varying,
    colortype character varying(255),
    discount character varying(255),
    itemdiscount double precision DEFAULT '0'::double precision,
    maxdiscount double precision DEFAULT '0'::double precision,
    minimumquantity integer DEFAULT 0,
    maximumquantity integer DEFAULT 0,
    recorderdays integer DEFAULT 0,
    recorderquantity integer DEFAULT 0,
    minimummargin double precision DEFAULT '0'::double precision,
    prohbited character varying(255) DEFAULT 'No'::character varying,
    visibility character varying(255) DEFAULT 'Show'::character varying,
    mfrname character varying(255)
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: ledgers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ledgers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "companyId" uuid NOT NULL,
    "ledgerName" character varying(255) NOT NULL,
    acgroup uuid NOT NULL,
    "openingBalance" numeric(15,2) DEFAULT 0,
    "balanceType" public."enum_ledgers_balanceType" DEFAULT 'Debit'::public."enum_ledgers_balanceType",
    description text,
    "isActive" boolean DEFAULT true,
    "sortOrder" integer DEFAULT 0,
    status public.enum_ledgers_status DEFAULT 'Active'::public.enum_ledgers_status,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    address text,
    station uuid,
    balance numeric(15,2) DEFAULT 0,
    "isDefault" boolean DEFAULT false NOT NULL,
    "isEditable" boolean DEFAULT true NOT NULL,
    "isDeletable" boolean DEFAULT true NOT NULL,
    "editableFields" json DEFAULT '["openingBalance","balanceType","description","address","isActive","status","station"]'::json,
    "formConfig" json DEFAULT '{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}'::json,
    "bankName" character varying(255),
    "accountNumber" character varying(255),
    "ifscCode" character varying(255),
    "creditDays" integer DEFAULT 0,
    "contactPerson" character varying(255),
    "mobileNumber" character varying(255)
);


ALTER TABLE public.ledgers OWNER TO postgres;

--
-- Name: COLUMN ledgers.acgroup; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers.acgroup IS 'Foreign key to groups table';


--
-- Name: COLUMN ledgers."openingBalance"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers."openingBalance" IS 'Opening balance of the ledger';


--
-- Name: COLUMN ledgers."balanceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers."balanceType" IS 'Type of balance (Debit or Credit)';


--
-- Name: COLUMN ledgers.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers.description IS 'Description of the ledger';


--
-- Name: COLUMN ledgers."isActive"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers."isActive" IS 'Whether the ledger is active';


--
-- Name: COLUMN ledgers."sortOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers."sortOrder" IS 'Order for display purposes';


--
-- Name: COLUMN ledgers.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers.address IS 'Address of the ledger (for parties)';


--
-- Name: COLUMN ledgers.balance; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers.balance IS 'Balance of the ledger';


--
-- Name: COLUMN ledgers."isDefault"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers."isDefault" IS 'Whether this is a default system ledger';


--
-- Name: COLUMN ledgers."isEditable"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers."isEditable" IS 'Whether this ledger can be edited';


--
-- Name: COLUMN ledgers."isDeletable"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers."isDeletable" IS 'Whether this ledger can be deleted';


--
-- Name: COLUMN ledgers."editableFields"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers."editableFields" IS 'Array of field names that can be edited for this ledger';


--
-- Name: COLUMN ledgers."formConfig"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers."formConfig" IS 'Form configuration for dynamic field rendering';


--
-- Name: COLUMN ledgers."bankName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers."bankName" IS 'Bank name for bank accounts';


--
-- Name: COLUMN ledgers."accountNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers."accountNumber" IS 'Account number for bank accounts';


--
-- Name: COLUMN ledgers."ifscCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers."ifscCode" IS 'IFSC code for bank accounts';


--
-- Name: COLUMN ledgers."creditDays"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers."creditDays" IS 'Credit days for debtors/creditors';


--
-- Name: COLUMN ledgers."contactPerson"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers."contactPerson" IS 'Contact person name';


--
-- Name: COLUMN ledgers."mobileNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.ledgers."mobileNumber" IS 'Mobile number for contact';


--
-- Name: manufacturers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manufacturers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    mfrname character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    state character varying(255),
    address character varying(255) NOT NULL,
    email character varying(255),
    phone character varying(255),
    status character varying(255) DEFAULT 'Continue'::character varying,
    prohabited character varying(255) DEFAULT 'No'::character varying,
    "userCompanyId" uuid NOT NULL
);


ALTER TABLE public.manufacturers OWNER TO postgres;

--
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "userCompanyId" uuid NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255),
    address character varying(255),
    phone character varying(255) NOT NULL,
    phone2 character varying(255),
    pin character varying(255),
    email character varying(255),
    whatsapp character varying(255),
    gender public.enum_patients_gender NOT NULL,
    age integer NOT NULL,
    dob date,
    "patientType" character varying(255),
    disease character varying(255),
    "govId" character varying(255),
    "billDiscount" double precision,
    ledger character varying(255),
    bloodgroup character varying(255),
    maritalstatus character varying(255),
    status public.enum_patients_status DEFAULT 'Active'::public.enum_patients_status NOT NULL
);


ALTER TABLE public.patients OWNER TO postgres;

--
-- Name: prescription_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prescription_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "prescriptionId" uuid NOT NULL,
    "itemId" uuid NOT NULL,
    "presDays" integer,
    dose character varying(255),
    quantity double precision,
    unit character varying(255),
    "isDays" character varying(255)
);


ALTER TABLE public.prescription_items OWNER TO postgres;

--
-- Name: prescriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prescriptions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "userCompanyId" uuid NOT NULL,
    "presNo" character varying(255) NOT NULL,
    "presDate" date NOT NULL,
    "patientId" uuid NOT NULL,
    "doctorId" uuid NOT NULL,
    days integer NOT NULL,
    "admissionDate" date,
    "dischargeDate" date,
    diagnosis character varying(255),
    "oldHistory" character varying(255)
);


ALTER TABLE public.prescriptions OWNER TO postgres;

--
-- Name: purchase_bill_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_bill_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "purchaseBillId" uuid NOT NULL,
    "itemId" uuid,
    product character varying(255) NOT NULL,
    packing character varying(255),
    batch character varying(255),
    "expDate" date,
    unit1 character varying(255),
    unit2 character varying(255),
    mrp numeric(10,2),
    rate numeric(10,2) NOT NULL,
    quantity numeric(10,2) DEFAULT 1,
    "discountPercent" numeric(5,2) DEFAULT 0,
    "discountAmount" numeric(10,2) DEFAULT 0,
    "igstPercent" numeric(5,2) DEFAULT 0,
    "igstAmount" numeric(10,2) DEFAULT 0,
    "cgstPercent" numeric(5,2) DEFAULT 0,
    "cgstAmount" numeric(10,2) DEFAULT 0,
    "sgstPercent" numeric(5,2) DEFAULT 0,
    "sgstAmount" numeric(10,2) DEFAULT 0,
    "cessPercent" numeric(5,2) DEFAULT 0,
    "cessAmount" numeric(10,2) DEFAULT 0,
    amount numeric(12,2) NOT NULL,
    "batchId" uuid
);


ALTER TABLE public.purchase_bill_items OWNER TO postgres;

--
-- Name: purchase_bills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_bills (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "userCompanyId" uuid NOT NULL,
    "billNo" character varying(255) NOT NULL,
    "billDate" date DEFAULT CURRENT_DATE NOT NULL,
    "supplierLedgerId" uuid NOT NULL,
    "supplierInvoiceNo" character varying(255),
    "supplierInvoiceDate" date,
    "purchaseMasterId" uuid NOT NULL,
    subtotal numeric(15,2) DEFAULT 0,
    "itemDiscount" numeric(12,2) DEFAULT 0,
    "billDiscountPercent" numeric(5,2) DEFAULT 0,
    "billDiscountAmount" numeric(12,2) DEFAULT 0,
    "igstPercent" numeric(5,2) DEFAULT 0,
    "igstAmount" numeric(12,2) DEFAULT 0,
    "cgstPercent" numeric(5,2) DEFAULT 0,
    "cgstAmount" numeric(12,2) DEFAULT 0,
    "sgstPercent" numeric(5,2) DEFAULT 0,
    "sgstAmount" numeric(12,2) DEFAULT 0,
    "cessPercent" numeric(5,2) DEFAULT 0,
    "cessAmount" numeric(12,2) DEFAULT 0,
    "totalTaxAmount" numeric(12,2) DEFAULT 0,
    "totalAmount" numeric(15,2) DEFAULT 0,
    "paidAmount" numeric(15,2) DEFAULT 0,
    "dueAmount" numeric(15,2) DEFAULT 0,
    status public.enum_purchase_bills_status DEFAULT 'Draft'::public.enum_purchase_bills_status,
    "paymentStatus" public."enum_purchase_bills_paymentStatus" DEFAULT 'Unpaid'::public."enum_purchase_bills_paymentStatus",
    notes text,
    "referenceNumber" character varying(255),
    "createdBy" uuid,
    "updatedBy" uuid,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.purchase_bills OWNER TO postgres;

--
-- Name: purchase_masters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_masters (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "companyId" uuid NOT NULL,
    "purchaseType" character varying(255) NOT NULL,
    "localPurchaseLedgerId" uuid NOT NULL,
    "centralPurchaseLedgerId" uuid NOT NULL,
    "igstPercentage" numeric(5,2) DEFAULT 0,
    "cgstPercentage" numeric(5,2) DEFAULT 0,
    "sgstPercentage" numeric(5,2) DEFAULT 0,
    "cessPercentage" numeric(5,2) DEFAULT 0,
    "natureOfTransaction" public."enum_purchase_masters_natureOfTransaction" DEFAULT 'Purchase'::public."enum_purchase_masters_natureOfTransaction",
    taxability public.enum_purchase_masters_taxability DEFAULT 'Taxable'::public.enum_purchase_masters_taxability,
    "igstLedgerId" uuid NOT NULL,
    "cgstLedgerId" uuid NOT NULL,
    "sgstLedgerId" uuid NOT NULL,
    "cessLedgerId" uuid NOT NULL,
    "isActive" boolean DEFAULT true,
    "sortOrder" integer DEFAULT 0,
    status public.enum_purchase_masters_status DEFAULT 'Active'::public.enum_purchase_masters_status,
    description text,
    "isDefault" boolean DEFAULT false,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.purchase_masters OWNER TO postgres;

--
-- Name: COLUMN purchase_masters."companyId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters."companyId" IS 'Foreign key to user_companies table';


--
-- Name: COLUMN purchase_masters."purchaseType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters."purchaseType" IS 'Type of purchase (e.g., GST Purchase - 12%, GST Purchase - 18%, etc.)';


--
-- Name: COLUMN purchase_masters."localPurchaseLedgerId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters."localPurchaseLedgerId" IS 'Foreign key to ledgers table for local purchase ledger';


--
-- Name: COLUMN purchase_masters."centralPurchaseLedgerId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters."centralPurchaseLedgerId" IS 'Foreign key to ledgers table for central purchase ledger';


--
-- Name: COLUMN purchase_masters."igstPercentage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters."igstPercentage" IS 'IGST percentage';


--
-- Name: COLUMN purchase_masters."cgstPercentage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters."cgstPercentage" IS 'CGST percentage';


--
-- Name: COLUMN purchase_masters."sgstPercentage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters."sgstPercentage" IS 'SGST percentage';


--
-- Name: COLUMN purchase_masters."cessPercentage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters."cessPercentage" IS 'CESS percentage';


--
-- Name: COLUMN purchase_masters."natureOfTransaction"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters."natureOfTransaction" IS 'Nature of transaction';


--
-- Name: COLUMN purchase_masters.taxability; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters.taxability IS 'Taxability status';


--
-- Name: COLUMN purchase_masters."igstLedgerId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters."igstLedgerId" IS 'Foreign key to ledgers table for IGST ledger';


--
-- Name: COLUMN purchase_masters."cgstLedgerId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters."cgstLedgerId" IS 'Foreign key to ledgers table for CGST ledger';


--
-- Name: COLUMN purchase_masters."sgstLedgerId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters."sgstLedgerId" IS 'Foreign key to ledgers table for SGST ledger';


--
-- Name: COLUMN purchase_masters."cessLedgerId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters."cessLedgerId" IS 'Foreign key to ledgers table for CESS ledger';


--
-- Name: COLUMN purchase_masters."isActive"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters."isActive" IS 'Whether the purchase master is active';


--
-- Name: COLUMN purchase_masters."sortOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters."sortOrder" IS 'Order for display purposes';


--
-- Name: COLUMN purchase_masters.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters.description IS 'Description of the purchase master';


--
-- Name: COLUMN purchase_masters."isDefault"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.purchase_masters."isDefault" IS 'Whether this is a default purchase master';


--
-- Name: racks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.racks (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    storeid uuid NOT NULL,
    rackname character varying(255) NOT NULL,
    "userCompanyId" uuid NOT NULL
);


ALTER TABLE public.racks OWNER TO postgres;

--
-- Name: sale_masters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale_masters (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "companyId" uuid NOT NULL,
    "salesType" character varying(255) NOT NULL,
    "localSalesLedgerId" uuid NOT NULL,
    "centralSalesLedgerId" uuid NOT NULL,
    "igstPercentage" numeric(5,2) DEFAULT 0,
    "cgstPercentage" numeric(5,2) DEFAULT 0,
    "sgstPercentage" numeric(5,2) DEFAULT 0,
    "cessPercentage" numeric(5,2) DEFAULT 0,
    "natureOfTransaction" public."enum_sale_masters_natureOfTransaction" DEFAULT 'Sales'::public."enum_sale_masters_natureOfTransaction",
    taxability public.enum_sale_masters_taxability DEFAULT 'Taxable'::public.enum_sale_masters_taxability,
    "igstLedgerId" uuid NOT NULL,
    "cgstLedgerId" uuid NOT NULL,
    "sgstLedgerId" uuid NOT NULL,
    "cessLedgerId" uuid NOT NULL,
    "isActive" boolean DEFAULT true,
    "sortOrder" integer DEFAULT 0,
    status public.enum_sale_masters_status DEFAULT 'Active'::public.enum_sale_masters_status,
    description text,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "isDefault" boolean DEFAULT false NOT NULL
);


ALTER TABLE public.sale_masters OWNER TO postgres;

--
-- Name: COLUMN sale_masters."companyId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters."companyId" IS 'Foreign key to companies table';


--
-- Name: COLUMN sale_masters."salesType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters."salesType" IS 'Type of sale (e.g., GST Sale - 12%, GST Sale - 18%, etc.)';


--
-- Name: COLUMN sale_masters."localSalesLedgerId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters."localSalesLedgerId" IS 'Foreign key to ledgers table for local sales ledger';


--
-- Name: COLUMN sale_masters."centralSalesLedgerId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters."centralSalesLedgerId" IS 'Foreign key to ledgers table for central sales ledger';


--
-- Name: COLUMN sale_masters."igstPercentage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters."igstPercentage" IS 'IGST percentage';


--
-- Name: COLUMN sale_masters."cgstPercentage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters."cgstPercentage" IS 'CGST percentage';


--
-- Name: COLUMN sale_masters."sgstPercentage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters."sgstPercentage" IS 'SGST percentage';


--
-- Name: COLUMN sale_masters."cessPercentage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters."cessPercentage" IS 'CESS percentage';


--
-- Name: COLUMN sale_masters."natureOfTransaction"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters."natureOfTransaction" IS 'Nature of transaction';


--
-- Name: COLUMN sale_masters.taxability; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters.taxability IS 'Taxability status';


--
-- Name: COLUMN sale_masters."igstLedgerId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters."igstLedgerId" IS 'Foreign key to ledgers table for IGST ledger';


--
-- Name: COLUMN sale_masters."cgstLedgerId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters."cgstLedgerId" IS 'Foreign key to ledgers table for CGST ledger';


--
-- Name: COLUMN sale_masters."sgstLedgerId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters."sgstLedgerId" IS 'Foreign key to ledgers table for SGST ledger';


--
-- Name: COLUMN sale_masters."cessLedgerId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters."cessLedgerId" IS 'Foreign key to ledgers table for CESS ledger';


--
-- Name: COLUMN sale_masters."isActive"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters."isActive" IS 'Whether the sale master is active';


--
-- Name: COLUMN sale_masters."sortOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters."sortOrder" IS 'Order for display purposes';


--
-- Name: COLUMN sale_masters.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters.description IS 'Description of the sale master';


--
-- Name: COLUMN sale_masters."isDefault"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.sale_masters."isDefault" IS 'Whether this is a default sale master that cannot be deleted or edited';


--
-- Name: salts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    saltname character varying(255) NOT NULL,
    saltcode character varying(255),
    salttype character varying(255),
    saltgroup character varying(255),
    saltsubgrp character varying(255),
    tbitem character varying(255) DEFAULT 'Normal'::character varying,
    status character varying(255) DEFAULT 'Continue'::character varying,
    prohabit character varying(255) DEFAULT 'No'::character varying,
    narcotic character varying(255) DEFAULT 'No'::character varying,
    scheduleh2 character varying(255) DEFAULT 'No'::character varying,
    scheduleh3 character varying(255) DEFAULT 'No'::character varying,
    "userCompanyId" uuid NOT NULL
);


ALTER TABLE public.salts OWNER TO postgres;

--
-- Name: saltvariations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.saltvariations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    str character varying(255),
    dosage character varying(255),
    brandname character varying(255),
    packsize character varying(255),
    mrp double precision,
    dpco character varying(255) DEFAULT 'No'::character varying,
    dpcomrp double precision,
    salt_id uuid
);


ALTER TABLE public.saltvariations OWNER TO postgres;

--
-- Name: stations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stations (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "userCompanyId" uuid NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.stations OWNER TO postgres;

--
-- Name: stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stores (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    storecode character varying(255) NOT NULL,
    storename character varying(255) NOT NULL,
    address1 character varying(255) NOT NULL,
    "userCompanyId" uuid NOT NULL
);


ALTER TABLE public.stores OWNER TO postgres;

--
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "voucherNumber" character varying(255) NOT NULL,
    "voucherDate" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "voucherType" public."enum_transactions_voucherType" NOT NULL,
    description text,
    amount numeric(15,2) NOT NULL,
    "debitLedgerId" uuid NOT NULL,
    "creditLedgerId" uuid NOT NULL,
    "referenceNumber" character varying(255),
    "isPosted" boolean DEFAULT false,
    "postedDate" timestamp with time zone,
    "createdBy" uuid NOT NULL,
    "updatedBy" uuid,
    status public.enum_transactions_status DEFAULT 'Draft'::public.enum_transactions_status,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.units (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "unitName" character varying(255) NOT NULL,
    uqc character varying(255),
    "userCompanyId" uuid NOT NULL
);


ALTER TABLE public.units OWNER TO postgres;

--
-- Name: user_companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_companies (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "userId" uuid NOT NULL,
    "companyName" character varying(255) NOT NULL,
    address text NOT NULL,
    country character varying(255) DEFAULT 'India'::character varying NOT NULL,
    state character varying(255) NOT NULL,
    "pinCode" character varying(255) NOT NULL,
    "branchCode" character varying(255) NOT NULL,
    "businessType" public."enum_user_companies_businessType" NOT NULL,
    "calendarType" public."enum_user_companies_calendarType" DEFAULT 'English'::public."enum_user_companies_calendarType" NOT NULL,
    "financialYearFrom" date NOT NULL,
    "financialYearTo" date NOT NULL,
    "taxType" character varying(255) DEFAULT 'GST'::character varying NOT NULL,
    phone character varying(255),
    website character varying(255),
    email character varying(255),
    "companyRegType" character varying(255),
    "panNumber" character varying(255),
    "logoUrl" character varying(255),
    status public.enum_user_companies_status DEFAULT 'active'::public.enum_user_companies_status,
    printremark character varying(255),
    prohibited public.enum_user_companies_prohibited DEFAULT 'No'::public.enum_user_companies_prohibited,
    invoiceprintindex integer DEFAULT 1,
    recorderformula double precision DEFAULT '0'::double precision,
    recorderprefrence integer DEFAULT 1,
    expiredays integer DEFAULT 90,
    dumpdays integer DEFAULT 60,
    minimummargin double precision DEFAULT '0'::double precision,
    storeroom integer DEFAULT 1,
    "isActive" boolean DEFAULT true,
    "isPrimary" boolean DEFAULT false,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.user_companies OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    uname character varying(255) NOT NULL,
    pwd character varying(255) NOT NULL,
    role public.enum_users_role NOT NULL,
    module character varying(255)[] NOT NULL,
    fname character varying(255) NOT NULL,
    lname character varying(255) NOT NULL,
    isactive public.enum_users_isactive DEFAULT 'active'::public.enum_users_isactive NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    pin character varying(255) NOT NULL,
    "phoneVerified" boolean DEFAULT false NOT NULL,
    "emailVerified" boolean DEFAULT false NOT NULL,
    "phoneVerificationCode" character varying(255),
    "phoneVerificationExpiry" timestamp with time zone,
    "emailVerificationCode" character varying(255),
    "emailVerificationExpiry" timestamp with time zone,
    "activeCompanyId" uuid,
    "lastLoginAt" timestamp with time zone,
    "createdAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: BillItems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BillItems" (id, "billId", "itemId", product, packing, batch, "expDate", unit1, unit2, rate, discount, amount, "createdAt", "updatedAt", mrp, quantity, "discountPercent", "discountAmount", "cgstPercent", "cgstAmount", "sgstPercent", "sgstAmount", "igstPercent", "igstAmount", "cessPercent", "cessAmount") FROM stdin;
\.


--
-- Data for Name: Bills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Bills" (id, "userCompanyId", "billNo", date, "partyName", "patientId", "patientName", "doctorId", "doctorName", address, status, amount, "createdAt", "updatedAt", "paymentStatus", subtotal, "itemDiscount", "billDiscountPercent", "billDiscountAmount", "cgstPercent", "cgstAmount", "sgstPercent", "sgstAmount", "totalAmount", "paidAmount", "dueAmount", notes, "createdBy", "updatedBy", "igstPercent", "igstAmount", "cessPercent", "cessAmount", "totalTaxAmount") FROM stdin;
\.


--
-- Data for Name: Otps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Otps" (id, phone, otp, expiry) FROM stdin;
d461cc2b-7c2e-4c05-af1c-570b6f395c8c	9302998876	439738	2026-01-19 23:08:22.956+05:30
d7deb7ba-7fec-40d8-9b22-61cf603b0fe4	9302998876	788001	2026-01-19 23:08:49.517+05:30
\.


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequelizeMeta" (name) FROM stdin;
20250724204536-create-otp.js
20250724204536-create-users.js
20250724204549-create-user-company.js
20250725061551-create-company.js
20250725064007-create-hsnSac.js
20250725074300-create-store.js
20250725074407-create-manufacturer.js
20250725074412-create-salt.js
20250725074415-create-rack.js
20250725074432-create-salt_variation.js
20250725074451-create-unit.js
20250725074507-create-doctor.js
20250725074510-update-users-table.js
20250725074519-create-patient.js
20250725074520-create-user-companies.js
20250725212511-create-groups.js
20250725212530-create-group-permissions.js
20250725214548-create-station.js
20250725214549-create-ledgers.js
20250725220000-create-transactions.js
20250801183951-add-default-ledger-fields.js
20250803150143-create-sale-master.js
20250803155020-add-is-default-to-sale-masters.js
20250805000000-create-purchase-master.js
20250805000001-create-item.js
20250805000002-create-prescription.js
20250805000003-create-prescription_item.js
20250805000004-create-bill.js
20250805000005-create-billItem.js
20250805000010-update-bills-schema.js
20250808065222-update-item-taxcategory.js
20250808065224-update-all-master-inventory-add-UserCompanyId.js
20250808065224-update-all-other-models-add-UserCompanyId.js
20250808065224-update-hsn-add-companyId.js
20250823085126-update-groups-unique-index.js
20250823090154-update-ledgers-unique-index.js
20250823090555-update-inventory-masters-unique-index.js
20250823090555-update-sale-and-purchase-masters-unique-index.js
20250823090555-update-userCompany-unique-index.js
20251130000001-add-isMoreOptions-to-companies.js
20251202000001-add-missing-tax-fields-to-bills.js
20251214000000-create-purchase-bill.js
20251214000001-create-purchase-bill-items.js
20251214000002-fix-batch-migration.js
20251214000003-create-batch.js
20251214000004-add-batchId-to-purchase-bill-items.js
add-ledger-enhancements.js
20260106000001-add-batch-columns.js
\.


--
-- Data for Name: batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.batches (id, "userCompanyId", "itemId", "batchNumber", quantity, "expiryDate", mrp, "purchaseRate", status, notes, "createdAt", "updatedAt", unit1st, "billingMrp", "mfgDate", "closingQty") FROM stdin;
f6188562-02e7-4edc-b12a-f74ca5188d40	f3f958b2-b8e9-4a09-9749-831c5b5b861a	2897250c-0580-4893-8ba0-23f83bcd70d3	b1	10.00	\N	\N	\N	Active	\N	2026-01-05 23:25:18.197+05:30	2026-01-05 23:34:40.303+05:30	\N	\N	\N	0.00
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (id, "userCompanyId", companyname, printremark, status, prohibited, invoiceprintindex, recorderformula, recorderprefrence, expiredays, dumpdays, minimummargin, storeroom, "isMoreOptions") FROM stdin;
27fac317-63c3-4857-8fc2-549010c6d1f2	f3f958b2-b8e9-4a09-9749-831c5b5b861a	test company	Sample remark for printing	Continue	No	1	0	1	90	60	0	1	f
8c0156a4-1bef-4a0c-8fb4-2e0879dfd04b	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Test company	Sample remark for printing	Continue	No	1	0	1	90	60	0	1	f
\.


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctors (id, "userCompanyId", "mobileNo", "registrationNo", name, "hospitalName", specialization, commission, "locationCode", address, "pinNo", "phoneNo", email, "whatsappNo", status) FROM stdin;
\.


--
-- Data for Name: group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_permissions (id, "groupId", "userId", "canCreateLedger", "canEditLedger", "canDeleteLedger", "canViewLedger", "canCreateTransaction", "canEditTransaction", "canDeleteTransaction", "canViewTransaction", "canViewReport", "canExportReport", "canViewBalance", "canModifyBalance", "canSetOpeningBalance", "canCreateSubGroup", "canEditGroup", "canDeleteGroup", "isRestricted", "restrictionReason", "effectiveFrom", "effectiveTo", status, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, group_name, company_id, under_group, parent_group_id, group_type, is_default, is_editable, is_deletable, prohibit, description, sort_order, status, created_at, updated_at, "formConfig") FROM stdin;
53f1a711-cbe2-404d-858f-4674531138ec	Branch / Divisions	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Primary	\N	Income	t	f	f	No	Default group: Branch / Divisions	1	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
610ce499-a408-40cd-8066-cfc3592cbdb0	Capital Account	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Primary	\N	Income	t	f	f	No	Default group: Capital Account	2	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
4b88e1e5-5c70-4f8a-82a4-1e275983dde0	Reserves & Surplus	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Capital Account	610ce499-a408-40cd-8066-cfc3592cbdb0	Capital	t	t	f	No	Default group: Reserves & Surplus	1	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
1cc2c487-e954-4ac2-b9e5-c92dd16c00b8	Current Assets	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Primary	\N	Asset	t	f	f	No	Default group: Current Assets	3	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
6d5606af-a968-4c2f-8c9e-c622ed3d4f5f	Bank Accounts	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Current Assets	1cc2c487-e954-4ac2-b9e5-c92dd16c00b8	Asset	t	t	f	No	Default group: Bank Accounts	1	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
bdfb5198-eebc-4179-bbe7-0020b7f1bb5e	Cash-in-Hand	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Current Assets	1cc2c487-e954-4ac2-b9e5-c92dd16c00b8	Asset	t	t	f	No	Default group: Cash-in-Hand	2	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
3d73a4f6-a439-436e-bf99-77b08573ec57	Operator Cash	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Cash-in-Hand	bdfb5198-eebc-4179-bbe7-0020b7f1bb5e	Income	t	t	f	No	Default group: Operator Cash	1	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
82a5cc1c-0d53-4a3e-bb01-636e015ba834	Deposits (Asset)	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Current Assets	1cc2c487-e954-4ac2-b9e5-c92dd16c00b8	Asset	t	t	f	No	Default group: Deposits (Asset)	3	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
22c779e2-5249-4d21-ba71-88d0ad78d780	Loans & Advances (Asset)	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Current Assets	1cc2c487-e954-4ac2-b9e5-c92dd16c00b8	Asset	t	t	f	No	Default group: Loans & Advances (Asset)	4	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
a7187013-520f-4c24-9eab-85ab0ebff5d9	Stock-in-Hand	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Current Assets	1cc2c487-e954-4ac2-b9e5-c92dd16c00b8	Asset	t	t	f	No	Default group: Stock-in-Hand	5	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
4d52e35a-1111-47ea-b288-8c406f67e4a3	Sundry Debtors	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Current Assets	1cc2c487-e954-4ac2-b9e5-c92dd16c00b8	Asset	t	t	f	No	Default group: Sundry Debtors	6	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
03d9af03-ac27-41b8-a71a-80c54a77d3a9	Credit card/Wallet	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Sundry Debtors	4d52e35a-1111-47ea-b288-8c406f67e4a3	Asset	t	t	f	No	Default group: Credit card/Wallet	1	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
0c9cfd0f-0f4a-43cd-a2dc-2a3581258d52	Debtor Branch	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Sundry Debtors	4d52e35a-1111-47ea-b288-8c406f67e4a3	Asset	t	t	f	No	Default group: Debtor Branch	2	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
fd22c17e-0268-4504-83be-2d7e35c5024b	Debtors (Ecommerce)	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Sundry Debtors	4d52e35a-1111-47ea-b288-8c406f67e4a3	Asset	t	t	f	No	Default group: Debtors (Ecommerce)	3	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
4e848985-608f-4508-a775-136637c8733f	Debtors (Field Staff)	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Sundry Debtors	4d52e35a-1111-47ea-b288-8c406f67e4a3	Asset	t	t	f	No	Default group: Debtors (Field Staff)	4	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
6bba2fff-a0f4-4b23-95e0-83344f2f8b4c	Current Liabilities	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Primary	\N	Liability	t	f	f	No	Default group: Current Liabilities	4	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
a80052a7-0c0e-4a21-9c99-04d86df81b06	Duties & Taxes	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Current Liabilities	6bba2fff-a0f4-4b23-95e0-83344f2f8b4c	Liability	t	t	f	No	Default group: Duties & Taxes	1	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
32844fb0-fa71-4911-abd3-d07d3c826204	GST (Goods & Service Tax)	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Duties & Taxes	a80052a7-0c0e-4a21-9c99-04d86df81b06	Liability	t	t	f	No	Default group: GST (Goods & Service Tax)	1	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
e7f274c7-4dde-448a-b9c9-60a858137448	TDS (Tax Deducted At Source)	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Duties & Taxes	a80052a7-0c0e-4a21-9c99-04d86df81b06	Liability	t	t	f	No	Default group: TDS (Tax Deducted At Source)	2	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
edc55461-c3f8-4b1c-b3ff-3db00a2faa29	VAT (Value Added Tax)	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Duties & Taxes	a80052a7-0c0e-4a21-9c99-04d86df81b06	Liability	t	t	f	No	Default group: VAT (Value Added Tax)	3	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
a78290ed-27f6-40f1-9d6d-66199f035247	Provision	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Current Liabilities	6bba2fff-a0f4-4b23-95e0-83344f2f8b4c	Liability	t	t	f	No	Default group: Provision	2	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
35fa7a47-5366-46d5-ae2f-32dc93c1c959	Sundry Creditors	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Current Liabilities	6bba2fff-a0f4-4b23-95e0-83344f2f8b4c	Liability	t	t	f	No	Default group: Sundry Creditors	3	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
27f79924-7308-4e07-9333-56ffe8957d0a	Creditor Branch	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Sundry Creditors	35fa7a47-5366-46d5-ae2f-32dc93c1c959	Liability	t	t	f	No	Default group: Creditor Branch	1	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
d7994ed4-a9b4-4107-b86b-7a459e0b05d1	Creditors (Ecommerce)	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Sundry Creditors	35fa7a47-5366-46d5-ae2f-32dc93c1c959	Liability	t	t	f	No	Default group: Creditors (Ecommerce)	2	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
8b2eb36e-4e62-481c-ab52-cca7effebfe5	Creditors (Field Staff)	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Sundry Creditors	35fa7a47-5366-46d5-ae2f-32dc93c1c959	Liability	t	t	f	No	Default group: Creditors (Field Staff)	3	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
fedd7ed7-b97c-41b2-90a5-031cfc8dc6a4	Fixed Assets	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Primary	\N	Asset	t	f	f	No	Default group: Fixed Assets	5	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
bc335da1-54ea-4c62-bd99-9315947d99a1	Investments	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Primary	\N	Asset	t	f	f	No	Default group: Investments	6	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
613887ec-31c1-471f-95c7-933d7086c9e9	Loans (Liability)	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Primary	\N	Liability	t	f	f	No	Default group: Loans (Liability)	7	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
5585806a-8660-41e3-b493-e244f46f796f	Bank OD A/c	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Loans (Liability)	613887ec-31c1-471f-95c7-933d7086c9e9	Liability	t	t	f	No	Default group: Bank OD A/c	1	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
e20fa17a-40df-498d-bced-064f094764af	Secured Loans	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Loans (Liability)	613887ec-31c1-471f-95c7-933d7086c9e9	Liability	t	t	f	No	Default group: Secured Loans	2	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
c65ef4ea-787d-4ced-bb21-a31cbd43d46d	Unsecured Loans	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Loans (Liability)	613887ec-31c1-471f-95c7-933d7086c9e9	Liability	t	t	f	No	Default group: Unsecured Loans	3	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
d2f8bb1b-aa59-46fa-97bb-52e0998231da	Misc.Expenses(ASSET)	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Primary	\N	Asset	t	f	f	No	Default group: Misc.Expenses(ASSET)	8	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
54c1090d-f8ca-4c06-a51d-bda03cba4755	Profit & Loss	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Primary	\N	Income	t	f	f	No	Default group: Profit & Loss	9	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
84649180-6131-4f39-81b6-6e628cc40367	Revenue Account	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Primary	\N	Income	t	f	f	No	Default group: Revenue Account	10	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
7fda629d-5107-457b-8775-67d342a91b99	Direct Income	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Revenue Account	84649180-6131-4f39-81b6-6e628cc40367	Income	t	t	f	No	Default group: Direct Income	1	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
9f288007-310f-4363-9625-a1f93c0dbadf	Indirect Income	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Revenue Account	84649180-6131-4f39-81b6-6e628cc40367	Income	t	t	f	No	Default group: Indirect Income	2	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
091be585-a2d7-4dcc-8b09-eabe02c5b8f0	Purchase Accounts	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Revenue Account	84649180-6131-4f39-81b6-6e628cc40367	Expense	t	f	f	No	Default group: Purchase Accounts	11	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
a4aac9f0-ca17-412e-bfd0-50c66fe3e2aa	Sales Accounts	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Revenue Accounts	84649180-6131-4f39-81b6-6e628cc40367	Income	t	f	f	No	Default group: Sales Accounts	2	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
24347742-ceab-4d0f-a8ff-c2066a681313	Expenditure Account	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Revenue Account	84649180-6131-4f39-81b6-6e628cc40367	Liability	t	f	f	No	Default group: Expenditure Account	11	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
c6ec5fc8-2aaf-484f-b1bf-d3ca503e938d	Direct Expenses	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Expenditure Account	24347742-ceab-4d0f-a8ff-c2066a681313	Liability	t	t	f	No	Default group: Direct Expenses	1	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
f8170cd7-174e-4e68-a823-32cecd947b9c	Indirect Expense	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Expenditure Account	24347742-ceab-4d0f-a8ff-c2066a681313	Liability	t	t	f	No	Default group: Indirect Expense	2	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
98a5a4c9-3dcd-48f9-8fe9-fd9737ab810e	Suspense Accounts	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Primary	\N	Asset	t	f	f	No	Default group: Suspense Accounts	12	Active	2025-12-29 10:28:48.799+05:30	2025-12-29 10:28:48.799+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
3fc394a2-0aa2-4388-90cc-ab72a403d770	Branch / Divisions	90bf6caf-a345-4003-8ca7-b7268969afd7	Primary	\N	Income	t	f	f	No	Default group: Branch / Divisions	1	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
afd32598-4b02-4c62-bafd-558427880f27	Capital Account	90bf6caf-a345-4003-8ca7-b7268969afd7	Primary	\N	Income	t	f	f	No	Default group: Capital Account	2	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
f566031f-1cff-4b66-ba37-589a56e4f9fd	Reserves & Surplus	90bf6caf-a345-4003-8ca7-b7268969afd7	Capital Account	afd32598-4b02-4c62-bafd-558427880f27	Capital	t	t	f	No	Default group: Reserves & Surplus	1	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
27851105-4c0f-4f79-a5fd-082cff26ba44	Current Assets	90bf6caf-a345-4003-8ca7-b7268969afd7	Primary	\N	Asset	t	f	f	No	Default group: Current Assets	3	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
33171da8-cb56-48b4-afc5-83f9c31e3393	Bank Accounts	90bf6caf-a345-4003-8ca7-b7268969afd7	Current Assets	27851105-4c0f-4f79-a5fd-082cff26ba44	Asset	t	t	f	No	Default group: Bank Accounts	1	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
bcde0f42-b815-425e-8c5e-bce989bda6ca	Cash-in-Hand	90bf6caf-a345-4003-8ca7-b7268969afd7	Current Assets	27851105-4c0f-4f79-a5fd-082cff26ba44	Asset	t	t	f	No	Default group: Cash-in-Hand	2	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
5ec03f3a-da37-4e53-8018-617768c4cc86	Operator Cash	90bf6caf-a345-4003-8ca7-b7268969afd7	Cash-in-Hand	bcde0f42-b815-425e-8c5e-bce989bda6ca	Income	t	t	f	No	Default group: Operator Cash	1	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
6901420a-eefc-4c99-956e-c22be9f75aa7	Deposits (Asset)	90bf6caf-a345-4003-8ca7-b7268969afd7	Current Assets	27851105-4c0f-4f79-a5fd-082cff26ba44	Asset	t	t	f	No	Default group: Deposits (Asset)	3	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
6b661b8a-e0d9-46ae-8e83-21faef6dd8df	Loans & Advances (Asset)	90bf6caf-a345-4003-8ca7-b7268969afd7	Current Assets	27851105-4c0f-4f79-a5fd-082cff26ba44	Asset	t	t	f	No	Default group: Loans & Advances (Asset)	4	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
14d114da-fd91-46b0-938d-97391a041464	Stock-in-Hand	90bf6caf-a345-4003-8ca7-b7268969afd7	Current Assets	27851105-4c0f-4f79-a5fd-082cff26ba44	Asset	t	t	f	No	Default group: Stock-in-Hand	5	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
4f7b43e4-18d5-4553-8283-bf4d578742d7	Sundry Debtors	90bf6caf-a345-4003-8ca7-b7268969afd7	Current Assets	27851105-4c0f-4f79-a5fd-082cff26ba44	Asset	t	t	f	No	Default group: Sundry Debtors	6	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
fe71baed-d4d4-47b5-9510-880c08816114	Credit card/Wallet	90bf6caf-a345-4003-8ca7-b7268969afd7	Sundry Debtors	4f7b43e4-18d5-4553-8283-bf4d578742d7	Asset	t	t	f	No	Default group: Credit card/Wallet	1	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
2570a9d0-9e1f-4966-b099-287eab11bea0	Debtor Branch	90bf6caf-a345-4003-8ca7-b7268969afd7	Sundry Debtors	4f7b43e4-18d5-4553-8283-bf4d578742d7	Asset	t	t	f	No	Default group: Debtor Branch	2	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
14882beb-539c-43e3-bc8a-b71577898b15	Debtors (Ecommerce)	90bf6caf-a345-4003-8ca7-b7268969afd7	Sundry Debtors	4f7b43e4-18d5-4553-8283-bf4d578742d7	Asset	t	t	f	No	Default group: Debtors (Ecommerce)	3	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
15f6dba1-2d14-414a-af42-c6a887967fee	Debtors (Field Staff)	90bf6caf-a345-4003-8ca7-b7268969afd7	Sundry Debtors	4f7b43e4-18d5-4553-8283-bf4d578742d7	Asset	t	t	f	No	Default group: Debtors (Field Staff)	4	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
ee658b20-e944-4c39-bea1-f5e7aec9d34d	Current Liabilities	90bf6caf-a345-4003-8ca7-b7268969afd7	Primary	\N	Liability	t	f	f	No	Default group: Current Liabilities	4	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
1878d0a5-8e00-4bfd-b6dc-ffd146a71866	Duties & Taxes	90bf6caf-a345-4003-8ca7-b7268969afd7	Current Liabilities	ee658b20-e944-4c39-bea1-f5e7aec9d34d	Liability	t	t	f	No	Default group: Duties & Taxes	1	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
ce0ae801-d2db-4303-88a9-f6b045741f23	GST (Goods & Service Tax)	90bf6caf-a345-4003-8ca7-b7268969afd7	Duties & Taxes	1878d0a5-8e00-4bfd-b6dc-ffd146a71866	Liability	t	t	f	No	Default group: GST (Goods & Service Tax)	1	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
d6c8d95d-a91e-466f-9dcb-3ebb5d9a4482	TDS (Tax Deducted At Source)	90bf6caf-a345-4003-8ca7-b7268969afd7	Duties & Taxes	1878d0a5-8e00-4bfd-b6dc-ffd146a71866	Liability	t	t	f	No	Default group: TDS (Tax Deducted At Source)	2	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
d3f7ad06-6961-4b33-9e56-ad820b3bb345	VAT (Value Added Tax)	90bf6caf-a345-4003-8ca7-b7268969afd7	Duties & Taxes	1878d0a5-8e00-4bfd-b6dc-ffd146a71866	Liability	t	t	f	No	Default group: VAT (Value Added Tax)	3	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
e8a20c82-8285-4dd5-99e6-0f92f2658ad5	Provision	90bf6caf-a345-4003-8ca7-b7268969afd7	Current Liabilities	ee658b20-e944-4c39-bea1-f5e7aec9d34d	Liability	t	t	f	No	Default group: Provision	2	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
158c58df-f106-4be4-9260-14833c92d994	Sundry Creditors	90bf6caf-a345-4003-8ca7-b7268969afd7	Current Liabilities	ee658b20-e944-4c39-bea1-f5e7aec9d34d	Liability	t	t	f	No	Default group: Sundry Creditors	3	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
0892b600-3bea-4a23-ade8-b5947a666ab5	Creditor Branch	90bf6caf-a345-4003-8ca7-b7268969afd7	Sundry Creditors	158c58df-f106-4be4-9260-14833c92d994	Liability	t	t	f	No	Default group: Creditor Branch	1	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
1c08855d-6442-4211-804e-cdee7518d920	Creditors (Ecommerce)	90bf6caf-a345-4003-8ca7-b7268969afd7	Sundry Creditors	158c58df-f106-4be4-9260-14833c92d994	Liability	t	t	f	No	Default group: Creditors (Ecommerce)	2	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
34e74e95-c5ee-4247-bd44-a81fce252a6e	Creditors (Field Staff)	90bf6caf-a345-4003-8ca7-b7268969afd7	Sundry Creditors	158c58df-f106-4be4-9260-14833c92d994	Liability	t	t	f	No	Default group: Creditors (Field Staff)	3	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
a39179e3-5e37-45f7-bbe8-67216ff1ef30	Fixed Assets	90bf6caf-a345-4003-8ca7-b7268969afd7	Primary	\N	Asset	t	f	f	No	Default group: Fixed Assets	5	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
f6f8acaa-9214-4a69-be85-285faf4e4b1e	Investments	90bf6caf-a345-4003-8ca7-b7268969afd7	Primary	\N	Asset	t	f	f	No	Default group: Investments	6	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
e78108d1-a6e1-48b9-9f78-0120773f8bea	Loans (Liability)	90bf6caf-a345-4003-8ca7-b7268969afd7	Primary	\N	Liability	t	f	f	No	Default group: Loans (Liability)	7	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
030e445a-e51c-4bf5-ad57-1b053b0ebfd0	Bank OD A/c	90bf6caf-a345-4003-8ca7-b7268969afd7	Loans (Liability)	e78108d1-a6e1-48b9-9f78-0120773f8bea	Liability	t	t	f	No	Default group: Bank OD A/c	1	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
d5b492ba-307d-4f42-baf1-4e641847d43e	Secured Loans	90bf6caf-a345-4003-8ca7-b7268969afd7	Loans (Liability)	e78108d1-a6e1-48b9-9f78-0120773f8bea	Liability	t	t	f	No	Default group: Secured Loans	2	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
f498bb31-3158-4bdf-81e9-987ddd7f2b86	Unsecured Loans	90bf6caf-a345-4003-8ca7-b7268969afd7	Loans (Liability)	e78108d1-a6e1-48b9-9f78-0120773f8bea	Liability	t	t	f	No	Default group: Unsecured Loans	3	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
cf03a724-3f1b-4fa7-b3d1-4090733567f6	Misc.Expenses(ASSET)	90bf6caf-a345-4003-8ca7-b7268969afd7	Primary	\N	Asset	t	f	f	No	Default group: Misc.Expenses(ASSET)	8	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
52456df3-96d3-4bc4-ad06-ec6547a30aa2	Profit & Loss	90bf6caf-a345-4003-8ca7-b7268969afd7	Primary	\N	Income	t	f	f	No	Default group: Profit & Loss	9	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
b6e465b5-8435-469b-93ad-f0424f32168a	Revenue Account	90bf6caf-a345-4003-8ca7-b7268969afd7	Primary	\N	Income	t	f	f	No	Default group: Revenue Account	10	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
ffce1fcb-ac84-4801-b184-55b513df3a35	Direct Income	90bf6caf-a345-4003-8ca7-b7268969afd7	Revenue Account	b6e465b5-8435-469b-93ad-f0424f32168a	Income	t	t	f	No	Default group: Direct Income	1	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
7fd41b3b-8e79-42d4-8da8-a75eb4a0f2f4	Indirect Income	90bf6caf-a345-4003-8ca7-b7268969afd7	Revenue Account	b6e465b5-8435-469b-93ad-f0424f32168a	Income	t	t	f	No	Default group: Indirect Income	2	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
08846ebb-d992-4ea9-bb75-a849aaf0d816	Purchase Accounts	90bf6caf-a345-4003-8ca7-b7268969afd7	Revenue Account	b6e465b5-8435-469b-93ad-f0424f32168a	Expense	t	f	f	No	Default group: Purchase Accounts	11	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
cbb63690-9adb-4b6b-be65-5854a3ab8d6a	Sales Accounts	90bf6caf-a345-4003-8ca7-b7268969afd7	Revenue Accounts	b6e465b5-8435-469b-93ad-f0424f32168a	Income	t	f	f	No	Default group: Sales Accounts	2	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
0f70eb5e-866e-4e8d-84d8-c51031b0cbe6	Expenditure Account	90bf6caf-a345-4003-8ca7-b7268969afd7	Revenue Account	b6e465b5-8435-469b-93ad-f0424f32168a	Liability	t	f	f	No	Default group: Expenditure Account	11	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
47a7306b-96b4-4b41-b3fb-f9bcf1d27552	Direct Expenses	90bf6caf-a345-4003-8ca7-b7268969afd7	Expenditure Account	0f70eb5e-866e-4e8d-84d8-c51031b0cbe6	Liability	t	t	f	No	Default group: Direct Expenses	1	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
de1c3382-0e34-4ee6-a1c2-34c2bc926356	Indirect Expense	90bf6caf-a345-4003-8ca7-b7268969afd7	Expenditure Account	0f70eb5e-866e-4e8d-84d8-c51031b0cbe6	Liability	t	t	f	No	Default group: Indirect Expense	2	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
597fc74d-ff06-4cc5-b556-75cdaecd8931	Suspense Accounts	90bf6caf-a345-4003-8ca7-b7268969afd7	Primary	\N	Asset	t	f	f	No	Default group: Suspense Accounts	12	Active	2026-01-19 22:56:36.806+05:30	2026-01-19 22:56:36.806+05:30	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}
\.


--
-- Data for Name: hsnsac; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hsnsac (id, "hsnSacCode", hsnsacname, "userCompanyId") FROM stdin;
da81e86f-18c6-4553-86e1-d81def9db4aa	TESTSAC	test hns	f3f958b2-b8e9-4a09-9749-831c5b5b861a
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, productname, goods, packing, unit1, unit2, taxcategory, hsnsac, company, "userCompanyId", salt, rack, price, "purchasePrice", cost, salerate, conversion, narcotic, "scheduleH", "scheduleH1", scheduledrug, prescription, storagetype, status, colortype, discount, itemdiscount, maxdiscount, minimumquantity, maximumquantity, recorderdays, recorderquantity, minimummargin, prohbited, visibility, mfrname) FROM stdin;
2897250c-0580-4893-8ba0-23f83bcd70d3	test product 	Goods	pcs	471a3bec-0406-4b8f-a581-4b2d0f270549	\N	fb873cf1-be37-4bb0-8c45-9294fdb36162	da81e86f-18c6-4553-86e1-d81def9db4aa	27fac317-63c3-4857-8fc2-549010c6d1f2	f3f958b2-b8e9-4a09-9749-831c5b5b861a	94a34a5d-8bd1-4537-b233-ca1483a1226f	8f02ad7a-9011-4b9e-963e-b1aed5dcdd23	2000	1500	1500	1799.99	\N	No	No	No	No	No	Normal	Continue		\N	\N	\N	\N	\N	\N	\N	\N	No	Show	\N
ed91f364-079d-4d70-94e7-0acce00d7cb6	sur mask	Goods	dsadasd	471a3bec-0406-4b8f-a581-4b2d0f270549	\N	444103d3-0103-459d-af14-787e827d88c9	da81e86f-18c6-4553-86e1-d81def9db4aa	27fac317-63c3-4857-8fc2-549010c6d1f2	f3f958b2-b8e9-4a09-9749-831c5b5b861a	94a34a5d-8bd1-4537-b233-ca1483a1226f	8f02ad7a-9011-4b9e-963e-b1aed5dcdd23	25	15	12	20	\N	No	No	No	No	No	Normal	Continue		\N	\N	\N	\N	\N	\N	\N	\N	No	Show	\N
\.


--
-- Data for Name: ledgers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ledgers (id, "companyId", "ledgerName", acgroup, "openingBalance", "balanceType", description, "isActive", "sortOrder", status, "createdAt", "updatedAt", address, station, balance, "isDefault", "isEditable", "isDeletable", "editableFields", "formConfig", "bankName", "accountNumber", "ifscCode", "creditDays", "contactPerson", "mobileNumber") FROM stdin;
da83dd22-7373-4a38-b7a5-cc9882ac7da3	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Capital Account	610ce499-a408-40cd-8066-cfc3592cbdb0	0.00	Credit	\N	t	1	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
33b314ca-cdba-458c-8353-b8a225ebfa52	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Drawings	610ce499-a408-40cd-8066-cfc3592cbdb0	0.00	Debit	\N	t	2	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
7dceacdc-dd5f-4df5-9eaa-2d537e83c252	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Cash	bdfb5198-eebc-4179-bbe7-0020b7f1bb5e	0.00	Debit	\N	t	3	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
ba7c8de8-282d-4840-af21-bd041fbdec61	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Bank Account	6d5606af-a968-4c2f-8c9e-c622ed3d4f5f	0.00	Debit	\N	t	4	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description","address"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
7b2d906d-0c9b-421b-8cc4-b41869a87912	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Sales	a4aac9f0-ca17-412e-bfd0-50c66fe3e2aa	0.00	Credit	\N	t	5	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
96630736-07ad-49c5-84ab-a5705c22908d	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Purchase	091be585-a2d7-4dcc-8b09-eabe02c5b8f0	0.00	Debit	\N	t	6	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
d8b76411-997e-4a9c-9dd9-250d655f9dc9	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Salaries	f8170cd7-174e-4e68-a823-32cecd947b9c	0.00	Debit	\N	t	7	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
439c58e9-3499-4d8d-91fd-46a3f3ce7f25	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Rent Paid	f8170cd7-174e-4e68-a823-32cecd947b9c	0.00	Debit	\N	t	8	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
99109a45-76a1-4bee-872e-91b589e6752e	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Telephone Expenses	f8170cd7-174e-4e68-a823-32cecd947b9c	0.00	Debit	\N	t	9	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
127981d4-1b92-466d-987f-c28baf4f0cf3	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Electricity Charges	f8170cd7-174e-4e68-a823-32cecd947b9c	0.00	Debit	\N	t	10	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
91c9d6d6-3ba4-41ec-bdda-c1d8262075a7	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Commission Received	9f288007-310f-4363-9625-a1f93c0dbadf	0.00	Credit	\N	t	11	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
76460469-ee04-43c2-8677-6e377611e4de	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Discount Received	9f288007-310f-4363-9625-a1f93c0dbadf	0.00	Credit	\N	t	12	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
46a6d938-8385-4de7-93cc-0dadda3bfe89	f3f958b2-b8e9-4a09-9749-831c5b5b861a	CGST Input	a80052a7-0c0e-4a21-9c99-04d86df81b06	0.00	Debit	\N	t	13	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
6590ce3d-8af8-4822-8fcb-bbabf8d1bf3f	f3f958b2-b8e9-4a09-9749-831c5b5b861a	SGST Input	a80052a7-0c0e-4a21-9c99-04d86df81b06	0.00	Debit	\N	t	14	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
336d94c0-38ee-419c-8705-bd8a7cbf34cb	f3f958b2-b8e9-4a09-9749-831c5b5b861a	IGST Input	a80052a7-0c0e-4a21-9c99-04d86df81b06	0.00	Debit	\N	t	15	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
3f615263-917d-451f-ba23-37779a65cc20	f3f958b2-b8e9-4a09-9749-831c5b5b861a	CGST Input (RCM)	a80052a7-0c0e-4a21-9c99-04d86df81b06	0.00	Debit	\N	t	16	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
1b24c664-ff80-4ed8-b4f6-2f15f2181e89	f3f958b2-b8e9-4a09-9749-831c5b5b861a	SGST Input (RCM)	a80052a7-0c0e-4a21-9c99-04d86df81b06	0.00	Debit	\N	t	17	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
3925a391-ac24-4a1d-91f9-3e0efd78f269	f3f958b2-b8e9-4a09-9749-831c5b5b861a	IGST Input (RCM)	a80052a7-0c0e-4a21-9c99-04d86df81b06	0.00	Debit	\N	t	18	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
9f7a52f7-7f01-4504-9484-5378522eec25	f3f958b2-b8e9-4a09-9749-831c5b5b861a	CGST Output	a80052a7-0c0e-4a21-9c99-04d86df81b06	0.00	Credit	\N	t	19	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
5d4a54b8-b01f-4420-8144-60b29ca8d7f9	f3f958b2-b8e9-4a09-9749-831c5b5b861a	SGST Output	a80052a7-0c0e-4a21-9c99-04d86df81b06	0.00	Credit	\N	t	20	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
e3700e46-134c-4fac-ad06-ec4e3f566fa8	f3f958b2-b8e9-4a09-9749-831c5b5b861a	IGST Output	a80052a7-0c0e-4a21-9c99-04d86df81b06	0.00	Credit	\N	t	21	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
f709b87c-a3c4-4c0f-8c58-76b7913a3772	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Sundry Debtors	4d52e35a-1111-47ea-b288-8c406f67e4a3	0.00	Debit	\N	t	22	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description","address"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
943f4323-00fb-4aea-a8e2-be8b2c91a9d8	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Sundry Creditors	35fa7a47-5366-46d5-ae2f-32dc93c1c959	0.00	Credit	\N	t	23	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description","address"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
6c333d01-adc6-404d-9c62-49439b4737e4	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Sales Return	a4aac9f0-ca17-412e-bfd0-50c66fe3e2aa	0.00	Debit	\N	t	24	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
c509cfd3-2f3e-4374-9d58-54cbe1e0738e	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Purchase Return	091be585-a2d7-4dcc-8b09-eabe02c5b8f0	0.00	Credit	\N	t	25	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
c1eafb5e-995d-4aa8-90ae-a8bcdebf3ceb	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Loan from Bank	e20fa17a-40df-498d-bced-064f094764af	0.00	Credit	\N	t	26	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
3e3470a7-18fe-4a02-be03-05be91cd4421	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Loan from Friends	c65ef4ea-787d-4ced-bb21-a31cbd43d46d	0.00	Credit	\N	t	27	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
6a40b0a4-33f2-4f65-8c29-3e03941e7392	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Depreciation	f8170cd7-174e-4e68-a823-32cecd947b9c	0.00	Debit	\N	t	28	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
6aae661a-fdc1-4539-80f5-e2be3d088584	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Income Tax	a80052a7-0c0e-4a21-9c99-04d86df81b06	0.00	Credit	\N	t	29	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
eccaae9a-c5cf-4879-bd24-fafb3e145ae9	f3f958b2-b8e9-4a09-9749-831c5b5b861a	TDS Receivable	a80052a7-0c0e-4a21-9c99-04d86df81b06	0.00	Debit	\N	t	30	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
0a9963be-cc81-4b10-9f00-11bc723e5595	f3f958b2-b8e9-4a09-9749-831c5b5b861a	TDS Payable	a80052a7-0c0e-4a21-9c99-04d86df81b06	0.00	Credit	\N	t	31	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
f2045f3c-1a18-4643-b2f5-34c4b6c5878f	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Advance to Staff	22c779e2-5249-4d21-ba71-88d0ad78d780	0.00	Debit	\N	t	32	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description","address"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
8baae1ec-2d1a-4989-9b53-eb318f0688c9	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Interest Received	9f288007-310f-4363-9625-a1f93c0dbadf	0.00	Credit	\N	t	33	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
5e2d8b98-7a5d-4bb0-a6c6-b1a648d903e2	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Interest Paid	f8170cd7-174e-4e68-a823-32cecd947b9c	0.00	Debit	\N	t	34	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
352ca1e4-0463-4257-b075-4f21fa875b42	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Rounding Off	9f288007-310f-4363-9625-a1f93c0dbadf	0.00	Credit	\N	t	35	Active	2025-12-29 10:28:48.808+05:30	2025-12-29 10:28:48.808+05:30	\N	\N	0.00	t	t	f	["openingBalance","balanceType","description"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
13376857-28b6-4674-b7ba-83f1375d4973	f3f958b2-b8e9-4a09-9749-831c5b5b861a	test ledger debtors	4d52e35a-1111-47ea-b288-8c406f67e4a3	0.00	Debit		t	0	Active	2026-01-06 23:34:32.444+05:30	2026-01-06 23:34:32.444+05:30	\N	\N	0.00	f	t	t	["ledgerName","acgroup","openingBalance","balanceType","description","address","isActive","status","station"]	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
6c6a97c7-f59e-4141-96f9-2e14989695bb	90bf6caf-a345-4003-8ca7-b7268969afd7	Capital Account	afd32598-4b02-4c62-bafd-558427880f27	0.00	Credit	\N	t	1	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
3affc8b6-4b98-484e-ab8b-aab9bdcd54b7	90bf6caf-a345-4003-8ca7-b7268969afd7	Drawings	afd32598-4b02-4c62-bafd-558427880f27	0.00	Debit	\N	t	2	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
6c36aba9-ba25-40f6-b1b2-830d874d5817	90bf6caf-a345-4003-8ca7-b7268969afd7	Cash	bcde0f42-b815-425e-8c5e-bce989bda6ca	0.00	Debit	\N	t	3	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
d6c52af1-59ab-4ef9-a82c-3c386fa8bcea	90bf6caf-a345-4003-8ca7-b7268969afd7	Bank Account	33171da8-cb56-48b4-afc5-83f9c31e3393	0.00	Debit	\N	t	4	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\",\\"address\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	90bf6caf-a345-4003-8ca7-b7268969afd7	Sales	cbb63690-9adb-4b6b-be65-5854a3ab8d6a	0.00	Credit	\N	t	5	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
345d1353-56f1-40bd-a3b5-57cdbf42e00f	90bf6caf-a345-4003-8ca7-b7268969afd7	Purchase	08846ebb-d992-4ea9-bb75-a849aaf0d816	0.00	Debit	\N	t	6	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
3e73d7c2-b77b-42b8-bcda-aa1814244309	90bf6caf-a345-4003-8ca7-b7268969afd7	Salaries	de1c3382-0e34-4ee6-a1c2-34c2bc926356	0.00	Debit	\N	t	7	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
159b1403-f9e6-4c65-ba5c-aa2eaedb81e3	90bf6caf-a345-4003-8ca7-b7268969afd7	Rent Paid	de1c3382-0e34-4ee6-a1c2-34c2bc926356	0.00	Debit	\N	t	8	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
09369d8d-195a-49f4-bf85-401f391cb722	90bf6caf-a345-4003-8ca7-b7268969afd7	Telephone Expenses	de1c3382-0e34-4ee6-a1c2-34c2bc926356	0.00	Debit	\N	t	9	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
04cdea98-d3b1-42bb-9bf3-b020a374148f	90bf6caf-a345-4003-8ca7-b7268969afd7	Electricity Charges	de1c3382-0e34-4ee6-a1c2-34c2bc926356	0.00	Debit	\N	t	10	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
79148d51-cca4-4ac1-8750-32796dd8099c	90bf6caf-a345-4003-8ca7-b7268969afd7	Commission Received	7fd41b3b-8e79-42d4-8da8-a75eb4a0f2f4	0.00	Credit	\N	t	11	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
9022b9a8-b00a-4a06-9b57-3371e692fc42	90bf6caf-a345-4003-8ca7-b7268969afd7	Discount Received	7fd41b3b-8e79-42d4-8da8-a75eb4a0f2f4	0.00	Credit	\N	t	12	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
eb837f0a-d5b3-44e5-9440-2fdb4766ef3c	90bf6caf-a345-4003-8ca7-b7268969afd7	CGST Input	1878d0a5-8e00-4bfd-b6dc-ffd146a71866	0.00	Debit	\N	t	13	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
25ef4228-d5f4-4fcd-b1ea-4f0e789da978	90bf6caf-a345-4003-8ca7-b7268969afd7	SGST Input	1878d0a5-8e00-4bfd-b6dc-ffd146a71866	0.00	Debit	\N	t	14	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
fa13228c-1f38-47a8-9094-5b14e4f222d5	90bf6caf-a345-4003-8ca7-b7268969afd7	IGST Input	1878d0a5-8e00-4bfd-b6dc-ffd146a71866	0.00	Debit	\N	t	15	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
eb30835b-6417-435e-a0c1-2f218aa57348	90bf6caf-a345-4003-8ca7-b7268969afd7	CGST Input (RCM)	1878d0a5-8e00-4bfd-b6dc-ffd146a71866	0.00	Debit	\N	t	16	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
e6b95b22-1ea9-457c-9034-368b67c7c02c	90bf6caf-a345-4003-8ca7-b7268969afd7	SGST Input (RCM)	1878d0a5-8e00-4bfd-b6dc-ffd146a71866	0.00	Debit	\N	t	17	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
d7f08b25-95cc-4cae-80a7-3eb0aead3e29	90bf6caf-a345-4003-8ca7-b7268969afd7	IGST Input (RCM)	1878d0a5-8e00-4bfd-b6dc-ffd146a71866	0.00	Debit	\N	t	18	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
13c14bcd-eece-495d-a127-f99a0d101aaf	90bf6caf-a345-4003-8ca7-b7268969afd7	CGST Output	1878d0a5-8e00-4bfd-b6dc-ffd146a71866	0.00	Credit	\N	t	19	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
c03439d5-5104-4644-a52a-ca3ae0e63fb4	90bf6caf-a345-4003-8ca7-b7268969afd7	SGST Output	1878d0a5-8e00-4bfd-b6dc-ffd146a71866	0.00	Credit	\N	t	20	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
945f607a-edba-43bb-b3de-c83018fae98f	90bf6caf-a345-4003-8ca7-b7268969afd7	IGST Output	1878d0a5-8e00-4bfd-b6dc-ffd146a71866	0.00	Credit	\N	t	21	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
0445f7cb-86ed-4ee5-8029-1b8f3f3d89b7	90bf6caf-a345-4003-8ca7-b7268969afd7	Sundry Debtors	4f7b43e4-18d5-4553-8283-bf4d578742d7	0.00	Debit	\N	t	22	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\",\\"address\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
674cd0a7-2f36-49c4-9ec2-0c90113a945e	90bf6caf-a345-4003-8ca7-b7268969afd7	Sundry Creditors	158c58df-f106-4be4-9260-14833c92d994	0.00	Credit	\N	t	23	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\",\\"address\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
d1c21268-e03f-4497-b824-a2bf0c34878d	90bf6caf-a345-4003-8ca7-b7268969afd7	Sales Return	cbb63690-9adb-4b6b-be65-5854a3ab8d6a	0.00	Debit	\N	t	24	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
67eba90e-9a28-4993-8b2b-78b30958c6a2	90bf6caf-a345-4003-8ca7-b7268969afd7	Purchase Return	08846ebb-d992-4ea9-bb75-a849aaf0d816	0.00	Credit	\N	t	25	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
d9f5c695-e2d4-4c1a-bb87-07cb73bc7c4f	90bf6caf-a345-4003-8ca7-b7268969afd7	Loan from Bank	d5b492ba-307d-4f42-baf1-4e641847d43e	0.00	Credit	\N	t	26	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
c5ab5906-1de4-476c-b08a-ad891b02adcd	90bf6caf-a345-4003-8ca7-b7268969afd7	Loan from Friends	f498bb31-3158-4bdf-81e9-987ddd7f2b86	0.00	Credit	\N	t	27	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
884853f1-c838-4f45-a076-d0c6f8a181d4	90bf6caf-a345-4003-8ca7-b7268969afd7	Depreciation	de1c3382-0e34-4ee6-a1c2-34c2bc926356	0.00	Debit	\N	t	28	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
2fae54bb-87da-4a44-9ea1-36a7d7fed112	90bf6caf-a345-4003-8ca7-b7268969afd7	Income Tax	1878d0a5-8e00-4bfd-b6dc-ffd146a71866	0.00	Credit	\N	t	29	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
434ba44f-3f34-43a5-9e70-b9d6d23a4fb2	90bf6caf-a345-4003-8ca7-b7268969afd7	TDS Receivable	1878d0a5-8e00-4bfd-b6dc-ffd146a71866	0.00	Debit	\N	t	30	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
1bcb7cec-1e29-4b9d-9be3-32778dab6cfe	90bf6caf-a345-4003-8ca7-b7268969afd7	TDS Payable	1878d0a5-8e00-4bfd-b6dc-ffd146a71866	0.00	Credit	\N	t	31	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
5933bb2a-d8db-4cb2-b9b6-61270cd83777	90bf6caf-a345-4003-8ca7-b7268969afd7	Advance to Staff	6b661b8a-e0d9-46ae-8e83-21faef6dd8df	0.00	Debit	\N	t	32	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\",\\"address\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
0b881349-282c-4622-9ea6-b6819999fc17	90bf6caf-a345-4003-8ca7-b7268969afd7	Interest Received	7fd41b3b-8e79-42d4-8da8-a75eb4a0f2f4	0.00	Credit	\N	t	33	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
f7bcdcc0-dd4d-4221-adb7-c1180d919202	90bf6caf-a345-4003-8ca7-b7268969afd7	Interest Paid	de1c3382-0e34-4ee6-a1c2-34c2bc926356	0.00	Debit	\N	t	34	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
a03ac23e-de01-4cf8-88dd-c3ce68c43592	90bf6caf-a345-4003-8ca7-b7268969afd7	Rounding Off	7fd41b3b-8e79-42d4-8da8-a75eb4a0f2f4	0.00	Credit	\N	t	35	Active	2026-01-19 22:56:36.823+05:30	2026-01-19 22:56:36.823+05:30	\N	\N	0.00	t	t	f	"[\\"openingBalance\\",\\"balanceType\\",\\"description\\"]"	{"showOpeningBalance":true,"showAddress":false,"showFullDetail":false,"showBankInfo":false,"balancingMethod":0,"showContact":false,"showTaxType":false,"showCreditDays":false,"showGstInfo":false}	\N	\N	\N	0	\N	\N
\.


--
-- Data for Name: manufacturers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manufacturers (id, mfrname, country, state, address, email, phone, status, prohabited, "userCompanyId") FROM stdin;
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (id, "userCompanyId", name, code, address, phone, phone2, pin, email, whatsapp, gender, age, dob, "patientType", disease, "govId", "billDiscount", ledger, bloodgroup, maritalstatus, status) FROM stdin;
\.


--
-- Data for Name: prescription_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prescription_items (id, "prescriptionId", "itemId", "presDays", dose, quantity, unit, "isDays") FROM stdin;
\.


--
-- Data for Name: prescriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prescriptions (id, "userCompanyId", "presNo", "presDate", "patientId", "doctorId", days, "admissionDate", "dischargeDate", diagnosis, "oldHistory") FROM stdin;
\.


--
-- Data for Name: purchase_bill_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_bill_items (id, "purchaseBillId", "itemId", product, packing, batch, "expDate", unit1, unit2, mrp, rate, quantity, "discountPercent", "discountAmount", "igstPercent", "igstAmount", "cgstPercent", "cgstAmount", "sgstPercent", "sgstAmount", "cessPercent", "cessAmount", amount, "batchId") FROM stdin;
8791e623-9ade-4d00-b072-8532b2230395	868218f5-2df0-4541-8c00-68a3ff165083	2897250c-0580-4893-8ba0-23f83bcd70d3	test product 	pcs	b1	2027-01-05			2000.00	1500.00	10.00	0.00	0.00	18.00	2700.00	9.00	1350.00	9.00	1350.00	0.00	0.00	20400.00	f6188562-02e7-4edc-b12a-f74ca5188d40
\.


--
-- Data for Name: purchase_bills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_bills (id, "userCompanyId", "billNo", "billDate", "supplierLedgerId", "supplierInvoiceNo", "supplierInvoiceDate", "purchaseMasterId", subtotal, "itemDiscount", "billDiscountPercent", "billDiscountAmount", "igstPercent", "igstAmount", "cgstPercent", "cgstAmount", "sgstPercent", "sgstAmount", "cessPercent", "cessAmount", "totalTaxAmount", "totalAmount", "paidAmount", "dueAmount", status, "paymentStatus", notes, "referenceNumber", "createdBy", "updatedBy", "createdAt", "updatedAt") FROM stdin;
868218f5-2df0-4541-8c00-68a3ff165083	f3f958b2-b8e9-4a09-9749-831c5b5b861a	test1234	2026-01-05	96630736-07ad-49c5-84ab-a5705c22908d		2026-01-05	fb873cf1-be37-4bb0-8c45-9294fdb36162	20400.00	0.00	0.00	0.00	18.00	3672.00	9.00	1836.00	9.00	1836.00	0.00	0.00	7344.00	27744.00	0.00	27744.00	Draft	Unpaid			283e27dc-b549-405a-be18-1c4db0bbfed9	283e27dc-b549-405a-be18-1c4db0bbfed9	2026-01-05 23:34:40.289+05:30	2026-01-05 23:34:40.289+05:30
869fde72-0c5b-40ba-b3b7-56a84e9c8cbe	f3f958b2-b8e9-4a09-9749-831c5b5b861a	123456	2026-01-23	6c6a97c7-f59e-4141-96f9-2e14989695bb	123	2026-12-12	fb873cf1-be37-4bb0-8c45-9294fdb36162	36720.00	3000.00	0.00	0.00	18.00	6609.60	9.00	3304.80	9.00	3304.80	0.00	0.00	13219.20	49939.20	0.00	49939.20	Draft	Unpaid			283e27dc-b549-405a-be18-1c4db0bbfed9	283e27dc-b549-405a-be18-1c4db0bbfed9	2026-01-23 23:50:20.944+05:30	2026-01-23 23:50:20.944+05:30
\.


--
-- Data for Name: purchase_masters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_masters (id, "companyId", "purchaseType", "localPurchaseLedgerId", "centralPurchaseLedgerId", "igstPercentage", "cgstPercentage", "sgstPercentage", "cessPercentage", "natureOfTransaction", taxability, "igstLedgerId", "cgstLedgerId", "sgstLedgerId", "cessLedgerId", "isActive", "sortOrder", status, description, "isDefault", "createdAt", "updatedAt") FROM stdin;
715ab36b-4134-4ded-9be4-9be62b0a66f2	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Import Taxable	96630736-07ad-49c5-84ab-a5705c22908d	96630736-07ad-49c5-84ab-a5705c22908d	0.00	0.00	0.00	0.00	Purchase	Taxable	336d94c0-38ee-419c-8705-bd8a7cbf34cb	46a6d938-8385-4de7-93cc-0dadda3bfe89	6590ce3d-8af8-4822-8fcb-bbabf8d1bf3f	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	1	Active	GST Import Taxable	t	2025-12-29 10:28:48.825+05:30	2025-12-29 10:28:48.825+05:30
444103d3-0103-459d-af14-787e827d88c9	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Purchase - 12%	96630736-07ad-49c5-84ab-a5705c22908d	96630736-07ad-49c5-84ab-a5705c22908d	12.00	6.00	6.00	0.00	Purchase	Taxable	336d94c0-38ee-419c-8705-bd8a7cbf34cb	46a6d938-8385-4de7-93cc-0dadda3bfe89	6590ce3d-8af8-4822-8fcb-bbabf8d1bf3f	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	2	Active	GST Purchase with 12% tax rate	t	2025-12-29 10:28:48.825+05:30	2025-12-29 10:28:48.825+05:30
fb873cf1-be37-4bb0-8c45-9294fdb36162	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Purchase - 18%	96630736-07ad-49c5-84ab-a5705c22908d	96630736-07ad-49c5-84ab-a5705c22908d	18.00	9.00	9.00	0.00	Purchase	Taxable	336d94c0-38ee-419c-8705-bd8a7cbf34cb	46a6d938-8385-4de7-93cc-0dadda3bfe89	6590ce3d-8af8-4822-8fcb-bbabf8d1bf3f	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	3	Active	GST Purchase with 18% tax rate	t	2025-12-29 10:28:48.825+05:30	2025-12-29 10:28:48.825+05:30
4a60f767-d522-4569-b8da-0345f5437713	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Purchase - 28%	96630736-07ad-49c5-84ab-a5705c22908d	96630736-07ad-49c5-84ab-a5705c22908d	28.00	14.00	14.00	0.00	Purchase	Taxable	336d94c0-38ee-419c-8705-bd8a7cbf34cb	46a6d938-8385-4de7-93cc-0dadda3bfe89	6590ce3d-8af8-4822-8fcb-bbabf8d1bf3f	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	4	Active	GST Purchase with 28% tax rate	t	2025-12-29 10:28:48.825+05:30	2025-12-29 10:28:48.825+05:30
a7c35ee7-4b04-4df9-8507-6d8111873569	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Purchase - 5%	96630736-07ad-49c5-84ab-a5705c22908d	96630736-07ad-49c5-84ab-a5705c22908d	5.00	2.50	2.50	0.00	Purchase	Taxable	336d94c0-38ee-419c-8705-bd8a7cbf34cb	46a6d938-8385-4de7-93cc-0dadda3bfe89	6590ce3d-8af8-4822-8fcb-bbabf8d1bf3f	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	5	Active	GST Purchase with 5% tax rate	t	2025-12-29 10:28:48.825+05:30	2025-12-29 10:28:48.825+05:30
d8a99549-2d9e-4f7b-adb4-95fbe0e2d798	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Purchase - 6%	96630736-07ad-49c5-84ab-a5705c22908d	96630736-07ad-49c5-84ab-a5705c22908d	6.00	3.00	3.00	0.00	Purchase	Taxable	336d94c0-38ee-419c-8705-bd8a7cbf34cb	46a6d938-8385-4de7-93cc-0dadda3bfe89	6590ce3d-8af8-4822-8fcb-bbabf8d1bf3f	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	6	Active	GST Purchase with 6% tax rate	t	2025-12-29 10:28:48.825+05:30	2025-12-29 10:28:48.825+05:30
d043b095-7e20-4301-ba5b-7d759d548016	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Purchase Tax Free	96630736-07ad-49c5-84ab-a5705c22908d	96630736-07ad-49c5-84ab-a5705c22908d	0.00	0.00	0.00	0.00	Purchase	Exempted	336d94c0-38ee-419c-8705-bd8a7cbf34cb	46a6d938-8385-4de7-93cc-0dadda3bfe89	6590ce3d-8af8-4822-8fcb-bbabf8d1bf3f	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	7	Active	GST Purchase Tax Free	t	2025-12-29 10:28:48.825+05:30	2025-12-29 10:28:48.825+05:30
b028158b-e936-4d77-90c5-174c7b042e00	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Purchase-Exempt	96630736-07ad-49c5-84ab-a5705c22908d	96630736-07ad-49c5-84ab-a5705c22908d	0.00	0.00	0.00	0.00	Purchase	Exempted	336d94c0-38ee-419c-8705-bd8a7cbf34cb	46a6d938-8385-4de7-93cc-0dadda3bfe89	6590ce3d-8af8-4822-8fcb-bbabf8d1bf3f	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	8	Active	GST Purchase Exempt	t	2025-12-29 10:28:48.825+05:30	2025-12-29 10:28:48.825+05:30
c1dbe404-4bd3-4f29-8395-e3f9a9bf09be	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Purchase-Nil Rated	96630736-07ad-49c5-84ab-a5705c22908d	96630736-07ad-49c5-84ab-a5705c22908d	0.00	0.00	0.00	0.00	Purchase	Nil Rated	336d94c0-38ee-419c-8705-bd8a7cbf34cb	46a6d938-8385-4de7-93cc-0dadda3bfe89	6590ce3d-8af8-4822-8fcb-bbabf8d1bf3f	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	9	Active	GST Purchase Nil Rated	t	2025-12-29 10:28:48.825+05:30	2025-12-29 10:28:48.825+05:30
a62308b5-e2ee-418f-bafe-1c6c14c7fdc1	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST-Purchase SEZ	96630736-07ad-49c5-84ab-a5705c22908d	96630736-07ad-49c5-84ab-a5705c22908d	0.00	0.00	0.00	0.00	Purchase	Exempted	336d94c0-38ee-419c-8705-bd8a7cbf34cb	46a6d938-8385-4de7-93cc-0dadda3bfe89	6590ce3d-8af8-4822-8fcb-bbabf8d1bf3f	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	10	Active	GST Purchase SEZ	t	2025-12-29 10:28:48.825+05:30	2025-12-29 10:28:48.825+05:30
1ee2227d-6835-47d9-a459-0dabb9eebba1	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST-Purchase Ung.Dealer	96630736-07ad-49c5-84ab-a5705c22908d	96630736-07ad-49c5-84ab-a5705c22908d	0.00	0.00	0.00	0.00	Purchase	Taxable	336d94c0-38ee-419c-8705-bd8a7cbf34cb	46a6d938-8385-4de7-93cc-0dadda3bfe89	6590ce3d-8af8-4822-8fcb-bbabf8d1bf3f	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	11	Active	GST Purchase Unregistered Dealer	t	2025-12-29 10:28:48.825+05:30	2025-12-29 10:28:48.825+05:30
8181ca85-244b-4fa7-adc2-5cceefdccc3a	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST-StockTrf-In (Exempt)	96630736-07ad-49c5-84ab-a5705c22908d	96630736-07ad-49c5-84ab-a5705c22908d	0.00	0.00	0.00	0.00	Purchase	Exempted	336d94c0-38ee-419c-8705-bd8a7cbf34cb	46a6d938-8385-4de7-93cc-0dadda3bfe89	6590ce3d-8af8-4822-8fcb-bbabf8d1bf3f	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	12	Active	GST Stock Transfer In (Exempt)	t	2025-12-29 10:28:48.825+05:30	2025-12-29 10:28:48.825+05:30
b3dabac3-b74d-4a15-9b3c-8cbea887feec	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Item wise	96630736-07ad-49c5-84ab-a5705c22908d	96630736-07ad-49c5-84ab-a5705c22908d	0.00	0.00	0.00	0.00	Purchase	Taxable	336d94c0-38ee-419c-8705-bd8a7cbf34cb	46a6d938-8385-4de7-93cc-0dadda3bfe89	6590ce3d-8af8-4822-8fcb-bbabf8d1bf3f	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	13	Active	Item wise GST calculation	t	2025-12-29 10:28:48.825+05:30	2025-12-29 10:28:48.825+05:30
bc04f3ac-8ef5-47ab-ab4d-93d8c96019b8	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Import Taxable	345d1353-56f1-40bd-a3b5-57cdbf42e00f	345d1353-56f1-40bd-a3b5-57cdbf42e00f	0.00	0.00	0.00	0.00	Purchase	Taxable	fa13228c-1f38-47a8-9094-5b14e4f222d5	eb837f0a-d5b3-44e5-9440-2fdb4766ef3c	25ef4228-d5f4-4fcd-b1ea-4f0e789da978	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	1	Active	GST Import Taxable	t	2026-01-19 22:56:36.843+05:30	2026-01-19 22:56:36.843+05:30
bf55d267-d340-4d3f-9120-e84dda7670e1	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Purchase - 12%	345d1353-56f1-40bd-a3b5-57cdbf42e00f	345d1353-56f1-40bd-a3b5-57cdbf42e00f	12.00	6.00	6.00	0.00	Purchase	Taxable	fa13228c-1f38-47a8-9094-5b14e4f222d5	eb837f0a-d5b3-44e5-9440-2fdb4766ef3c	25ef4228-d5f4-4fcd-b1ea-4f0e789da978	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	2	Active	GST Purchase with 12% tax rate	t	2026-01-19 22:56:36.843+05:30	2026-01-19 22:56:36.843+05:30
9116dbed-2cab-41b3-bc61-64838ec0dc38	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Purchase - 18%	345d1353-56f1-40bd-a3b5-57cdbf42e00f	345d1353-56f1-40bd-a3b5-57cdbf42e00f	18.00	9.00	9.00	0.00	Purchase	Taxable	fa13228c-1f38-47a8-9094-5b14e4f222d5	eb837f0a-d5b3-44e5-9440-2fdb4766ef3c	25ef4228-d5f4-4fcd-b1ea-4f0e789da978	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	3	Active	GST Purchase with 18% tax rate	t	2026-01-19 22:56:36.843+05:30	2026-01-19 22:56:36.843+05:30
462b3d4a-65fe-440c-971d-97354e539fbb	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Purchase - 28%	345d1353-56f1-40bd-a3b5-57cdbf42e00f	345d1353-56f1-40bd-a3b5-57cdbf42e00f	28.00	14.00	14.00	0.00	Purchase	Taxable	fa13228c-1f38-47a8-9094-5b14e4f222d5	eb837f0a-d5b3-44e5-9440-2fdb4766ef3c	25ef4228-d5f4-4fcd-b1ea-4f0e789da978	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	4	Active	GST Purchase with 28% tax rate	t	2026-01-19 22:56:36.843+05:30	2026-01-19 22:56:36.843+05:30
331a20cb-55c1-472b-9c58-8422d9823d84	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Purchase - 5%	345d1353-56f1-40bd-a3b5-57cdbf42e00f	345d1353-56f1-40bd-a3b5-57cdbf42e00f	5.00	2.50	2.50	0.00	Purchase	Taxable	fa13228c-1f38-47a8-9094-5b14e4f222d5	eb837f0a-d5b3-44e5-9440-2fdb4766ef3c	25ef4228-d5f4-4fcd-b1ea-4f0e789da978	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	5	Active	GST Purchase with 5% tax rate	t	2026-01-19 22:56:36.843+05:30	2026-01-19 22:56:36.843+05:30
f496aa85-e46f-4599-ae7e-39922bbf3236	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Purchase - 6%	345d1353-56f1-40bd-a3b5-57cdbf42e00f	345d1353-56f1-40bd-a3b5-57cdbf42e00f	6.00	3.00	3.00	0.00	Purchase	Taxable	fa13228c-1f38-47a8-9094-5b14e4f222d5	eb837f0a-d5b3-44e5-9440-2fdb4766ef3c	25ef4228-d5f4-4fcd-b1ea-4f0e789da978	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	6	Active	GST Purchase with 6% tax rate	t	2026-01-19 22:56:36.843+05:30	2026-01-19 22:56:36.843+05:30
b85ececf-3e54-429d-ad42-6561fb0acda9	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Purchase Tax Free	345d1353-56f1-40bd-a3b5-57cdbf42e00f	345d1353-56f1-40bd-a3b5-57cdbf42e00f	0.00	0.00	0.00	0.00	Purchase	Exempted	fa13228c-1f38-47a8-9094-5b14e4f222d5	eb837f0a-d5b3-44e5-9440-2fdb4766ef3c	25ef4228-d5f4-4fcd-b1ea-4f0e789da978	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	7	Active	GST Purchase Tax Free	t	2026-01-19 22:56:36.843+05:30	2026-01-19 22:56:36.843+05:30
1004abf3-9b15-4499-8503-60b90b31ef3c	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Purchase-Exempt	345d1353-56f1-40bd-a3b5-57cdbf42e00f	345d1353-56f1-40bd-a3b5-57cdbf42e00f	0.00	0.00	0.00	0.00	Purchase	Exempted	fa13228c-1f38-47a8-9094-5b14e4f222d5	eb837f0a-d5b3-44e5-9440-2fdb4766ef3c	25ef4228-d5f4-4fcd-b1ea-4f0e789da978	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	8	Active	GST Purchase Exempt	t	2026-01-19 22:56:36.843+05:30	2026-01-19 22:56:36.843+05:30
e2960fe3-eea1-47af-8cf1-278fbc35625a	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Purchase-Nil Rated	345d1353-56f1-40bd-a3b5-57cdbf42e00f	345d1353-56f1-40bd-a3b5-57cdbf42e00f	0.00	0.00	0.00	0.00	Purchase	Nil Rated	fa13228c-1f38-47a8-9094-5b14e4f222d5	eb837f0a-d5b3-44e5-9440-2fdb4766ef3c	25ef4228-d5f4-4fcd-b1ea-4f0e789da978	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	9	Active	GST Purchase Nil Rated	t	2026-01-19 22:56:36.843+05:30	2026-01-19 22:56:36.843+05:30
3744d63b-1024-4013-bf8a-5f140acfd790	90bf6caf-a345-4003-8ca7-b7268969afd7	GST-Purchase SEZ	345d1353-56f1-40bd-a3b5-57cdbf42e00f	345d1353-56f1-40bd-a3b5-57cdbf42e00f	0.00	0.00	0.00	0.00	Purchase	Exempted	fa13228c-1f38-47a8-9094-5b14e4f222d5	eb837f0a-d5b3-44e5-9440-2fdb4766ef3c	25ef4228-d5f4-4fcd-b1ea-4f0e789da978	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	10	Active	GST Purchase SEZ	t	2026-01-19 22:56:36.843+05:30	2026-01-19 22:56:36.843+05:30
261c5f31-8970-4178-9e02-ad51e3aa7315	90bf6caf-a345-4003-8ca7-b7268969afd7	GST-Purchase Ung.Dealer	345d1353-56f1-40bd-a3b5-57cdbf42e00f	345d1353-56f1-40bd-a3b5-57cdbf42e00f	0.00	0.00	0.00	0.00	Purchase	Taxable	fa13228c-1f38-47a8-9094-5b14e4f222d5	eb837f0a-d5b3-44e5-9440-2fdb4766ef3c	25ef4228-d5f4-4fcd-b1ea-4f0e789da978	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	11	Active	GST Purchase Unregistered Dealer	t	2026-01-19 22:56:36.843+05:30	2026-01-19 22:56:36.843+05:30
4dc52b95-f5d9-40db-ad4f-df41233d59d7	90bf6caf-a345-4003-8ca7-b7268969afd7	GST-StockTrf-In (Exempt)	345d1353-56f1-40bd-a3b5-57cdbf42e00f	345d1353-56f1-40bd-a3b5-57cdbf42e00f	0.00	0.00	0.00	0.00	Purchase	Exempted	fa13228c-1f38-47a8-9094-5b14e4f222d5	eb837f0a-d5b3-44e5-9440-2fdb4766ef3c	25ef4228-d5f4-4fcd-b1ea-4f0e789da978	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	12	Active	GST Stock Transfer In (Exempt)	t	2026-01-19 22:56:36.843+05:30	2026-01-19 22:56:36.843+05:30
bc402362-5e3b-4318-a4fa-055570da70f9	90bf6caf-a345-4003-8ca7-b7268969afd7	Item wise	345d1353-56f1-40bd-a3b5-57cdbf42e00f	345d1353-56f1-40bd-a3b5-57cdbf42e00f	0.00	0.00	0.00	0.00	Purchase	Taxable	fa13228c-1f38-47a8-9094-5b14e4f222d5	eb837f0a-d5b3-44e5-9440-2fdb4766ef3c	25ef4228-d5f4-4fcd-b1ea-4f0e789da978	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	13	Active	Item wise GST calculation	t	2026-01-19 22:56:36.843+05:30	2026-01-19 22:56:36.843+05:30
\.


--
-- Data for Name: racks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.racks (id, storeid, rackname, "userCompanyId") FROM stdin;
8f02ad7a-9011-4b9e-963e-b1aed5dcdd23	60b06cd4-c83e-4b24-8c6d-4c7706124c0e	test rack	f3f958b2-b8e9-4a09-9749-831c5b5b861a
6a1fb220-13b7-432c-8298-6c1548e703b1	60b06cd4-c83e-4b24-8c6d-4c7706124c0e	sASAsA	f3f958b2-b8e9-4a09-9749-831c5b5b861a
c1e3e1a4-110d-42d8-9268-ff55319c0bf0	26af2d27-7704-44a0-82a6-1bf585026238	test	f3f958b2-b8e9-4a09-9749-831c5b5b861a
\.


--
-- Data for Name: sale_masters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sale_masters (id, "companyId", "salesType", "localSalesLedgerId", "centralSalesLedgerId", "igstPercentage", "cgstPercentage", "sgstPercentage", "cessPercentage", "natureOfTransaction", taxability, "igstLedgerId", "cgstLedgerId", "sgstLedgerId", "cessLedgerId", "isActive", "sortOrder", status, description, "createdAt", "updatedAt", "isDefault") FROM stdin;
d72c4946-6ced-40b9-8ae5-dc234a61998f	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Sale - 12%	7b2d906d-0c9b-421b-8cc4-b41869a87912	7b2d906d-0c9b-421b-8cc4-b41869a87912	12.00	6.00	6.00	0.00	Sales	Taxable	e3700e46-134c-4fac-ad06-ec4e3f566fa8	9f7a52f7-7f01-4504-9484-5378522eec25	5d4a54b8-b01f-4420-8144-60b29ca8d7f9	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	1	Active	GST Sale with 12% tax rate	2025-12-29 10:28:48.817+05:30	2025-12-29 10:28:48.817+05:30	t
3bffc771-c01f-418c-bc53-1a35e04e40a8	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Sale - 18%	7b2d906d-0c9b-421b-8cc4-b41869a87912	7b2d906d-0c9b-421b-8cc4-b41869a87912	18.00	9.00	9.00	0.00	Sales	Taxable	e3700e46-134c-4fac-ad06-ec4e3f566fa8	9f7a52f7-7f01-4504-9484-5378522eec25	5d4a54b8-b01f-4420-8144-60b29ca8d7f9	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	2	Active	GST Sale with 18% tax rate	2025-12-29 10:28:48.817+05:30	2025-12-29 10:28:48.817+05:30	t
9d4ad8d8-88ae-45da-ae2e-b76005d16943	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Sale - 28%	7b2d906d-0c9b-421b-8cc4-b41869a87912	7b2d906d-0c9b-421b-8cc4-b41869a87912	28.00	14.00	14.00	0.00	Sales	Taxable	e3700e46-134c-4fac-ad06-ec4e3f566fa8	9f7a52f7-7f01-4504-9484-5378522eec25	5d4a54b8-b01f-4420-8144-60b29ca8d7f9	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	3	Active	GST Sale with 28% tax rate	2025-12-29 10:28:48.817+05:30	2025-12-29 10:28:48.817+05:30	t
3f6a3ad2-97e4-4955-9166-a9848e1bc632	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Sale - 5%	7b2d906d-0c9b-421b-8cc4-b41869a87912	7b2d906d-0c9b-421b-8cc4-b41869a87912	5.00	2.50	2.50	0.00	Sales	Taxable	e3700e46-134c-4fac-ad06-ec4e3f566fa8	9f7a52f7-7f01-4504-9484-5378522eec25	5d4a54b8-b01f-4420-8144-60b29ca8d7f9	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	4	Active	GST Sale with 5% tax rate	2025-12-29 10:28:48.817+05:30	2025-12-29 10:28:48.817+05:30	t
4f3c849c-6c62-4177-9a47-628421695b46	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Sale - 6%	7b2d906d-0c9b-421b-8cc4-b41869a87912	7b2d906d-0c9b-421b-8cc4-b41869a87912	6.00	3.00	3.00	0.00	Sales	Taxable	e3700e46-134c-4fac-ad06-ec4e3f566fa8	9f7a52f7-7f01-4504-9484-5378522eec25	5d4a54b8-b01f-4420-8144-60b29ca8d7f9	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	5	Active	GST Sale with 6% tax rate	2025-12-29 10:28:48.817+05:30	2025-12-29 10:28:48.817+05:30	t
d001043f-af96-4f8d-b8fc-55921c8bf4a5	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Sale Tax Free	7b2d906d-0c9b-421b-8cc4-b41869a87912	7b2d906d-0c9b-421b-8cc4-b41869a87912	0.00	0.00	0.00	0.00	Sales	Exempted	e3700e46-134c-4fac-ad06-ec4e3f566fa8	9f7a52f7-7f01-4504-9484-5378522eec25	5d4a54b8-b01f-4420-8144-60b29ca8d7f9	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	6	Active	GST Sale Tax Free	2025-12-29 10:28:48.817+05:30	2025-12-29 10:28:48.817+05:30	t
93d7017c-e7ab-4250-9b96-2f04d8b2b6e4	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Sale Tax Paid	7b2d906d-0c9b-421b-8cc4-b41869a87912	7b2d906d-0c9b-421b-8cc4-b41869a87912	0.00	0.00	0.00	0.00	Sales	Taxable	e3700e46-134c-4fac-ad06-ec4e3f566fa8	9f7a52f7-7f01-4504-9484-5378522eec25	5d4a54b8-b01f-4420-8144-60b29ca8d7f9	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	7	Active	GST Sale Tax Paid	2025-12-29 10:28:48.817+05:30	2025-12-29 10:28:48.817+05:30	t
b8c9dd39-0fd9-44ad-9618-ff8989c73c5a	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Sale-Exempt	7b2d906d-0c9b-421b-8cc4-b41869a87912	7b2d906d-0c9b-421b-8cc4-b41869a87912	0.00	0.00	0.00	0.00	Sales	Exempted	e3700e46-134c-4fac-ad06-ec4e3f566fa8	9f7a52f7-7f01-4504-9484-5378522eec25	5d4a54b8-b01f-4420-8144-60b29ca8d7f9	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	8	Active	GST Sale Exempt	2025-12-29 10:28:48.817+05:30	2025-12-29 10:28:48.817+05:30	t
48c7320a-6817-4010-886f-8b8a85f5de8f	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST Sale-Nil Rated	7b2d906d-0c9b-421b-8cc4-b41869a87912	7b2d906d-0c9b-421b-8cc4-b41869a87912	0.00	0.00	0.00	0.00	Sales	Nil Rated	e3700e46-134c-4fac-ad06-ec4e3f566fa8	9f7a52f7-7f01-4504-9484-5378522eec25	5d4a54b8-b01f-4420-8144-60b29ca8d7f9	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	9	Active	GST Sale Nil Rated	2025-12-29 10:28:48.817+05:30	2025-12-29 10:28:48.817+05:30	t
4018758c-01ef-48fd-a53d-57f47d9d7d21	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST-Deemed Export (Exempted)	7b2d906d-0c9b-421b-8cc4-b41869a87912	7b2d906d-0c9b-421b-8cc4-b41869a87912	0.00	0.00	0.00	0.00	Sales	Exempted	e3700e46-134c-4fac-ad06-ec4e3f566fa8	9f7a52f7-7f01-4504-9484-5378522eec25	5d4a54b8-b01f-4420-8144-60b29ca8d7f9	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	10	Active	GST Deemed Export (Exempted)	2025-12-29 10:28:48.817+05:30	2025-12-29 10:28:48.817+05:30	t
22c7ce61-53be-446a-8b00-005660877aa4	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST-Export (Zero Rated)	7b2d906d-0c9b-421b-8cc4-b41869a87912	7b2d906d-0c9b-421b-8cc4-b41869a87912	0.00	0.00	0.00	0.00	Sales	Zero Rated	e3700e46-134c-4fac-ad06-ec4e3f566fa8	9f7a52f7-7f01-4504-9484-5378522eec25	5d4a54b8-b01f-4420-8144-60b29ca8d7f9	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	11	Active	GST Export (Zero Rated)	2025-12-29 10:28:48.817+05:30	2025-12-29 10:28:48.817+05:30	t
6b33551c-d93e-449c-8c19-5f44a8141a8d	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST-Sale SEZ (Exempted)	7b2d906d-0c9b-421b-8cc4-b41869a87912	7b2d906d-0c9b-421b-8cc4-b41869a87912	0.00	0.00	0.00	0.00	Sales	Exempted	e3700e46-134c-4fac-ad06-ec4e3f566fa8	9f7a52f7-7f01-4504-9484-5378522eec25	5d4a54b8-b01f-4420-8144-60b29ca8d7f9	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	12	Active	GST Sale SEZ (Exempted)	2025-12-29 10:28:48.817+05:30	2025-12-29 10:28:48.817+05:30	t
b7fda773-2b6e-4b66-91af-6eb6504ad4b3	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST-Sale Ung.Dealer	7b2d906d-0c9b-421b-8cc4-b41869a87912	7b2d906d-0c9b-421b-8cc4-b41869a87912	0.00	0.00	0.00	0.00	Sales	Taxable	e3700e46-134c-4fac-ad06-ec4e3f566fa8	9f7a52f7-7f01-4504-9484-5378522eec25	5d4a54b8-b01f-4420-8144-60b29ca8d7f9	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	13	Active	GST Sale Unregistered Dealer	2025-12-29 10:28:48.817+05:30	2025-12-29 10:28:48.817+05:30	t
6172ac32-5ecb-4de2-b596-6b0a6d91f8ba	f3f958b2-b8e9-4a09-9749-831c5b5b861a	GST-StockTrf -Out (Exempt)	7b2d906d-0c9b-421b-8cc4-b41869a87912	7b2d906d-0c9b-421b-8cc4-b41869a87912	0.00	0.00	0.00	0.00	Sales	Exempted	e3700e46-134c-4fac-ad06-ec4e3f566fa8	9f7a52f7-7f01-4504-9484-5378522eec25	5d4a54b8-b01f-4420-8144-60b29ca8d7f9	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	14	Active	GST Stock Transfer Out (Exempt)	2025-12-29 10:28:48.817+05:30	2025-12-29 10:28:48.817+05:30	t
1f50e1e4-07a2-44ef-96ae-a4987ea16972	f3f958b2-b8e9-4a09-9749-831c5b5b861a	Item wise	7b2d906d-0c9b-421b-8cc4-b41869a87912	7b2d906d-0c9b-421b-8cc4-b41869a87912	0.00	0.00	0.00	0.00	Sales	Taxable	e3700e46-134c-4fac-ad06-ec4e3f566fa8	9f7a52f7-7f01-4504-9484-5378522eec25	5d4a54b8-b01f-4420-8144-60b29ca8d7f9	da83dd22-7373-4a38-b7a5-cc9882ac7da3	t	15	Active	Item wise GST calculation	2025-12-29 10:28:48.817+05:30	2025-12-29 10:28:48.817+05:30	t
7a759621-a0ff-4c73-8ad8-f1cda9ff3820	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Sale - 12%	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	12.00	6.00	6.00	0.00	Sales	Taxable	945f607a-edba-43bb-b3de-c83018fae98f	13c14bcd-eece-495d-a127-f99a0d101aaf	c03439d5-5104-4644-a52a-ca3ae0e63fb4	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	1	Active	GST Sale with 12% tax rate	2026-01-19 22:56:36.833+05:30	2026-01-19 22:56:36.833+05:30	t
c447492c-4300-4415-adcc-83ca5b0611d2	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Sale - 18%	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	18.00	9.00	9.00	0.00	Sales	Taxable	945f607a-edba-43bb-b3de-c83018fae98f	13c14bcd-eece-495d-a127-f99a0d101aaf	c03439d5-5104-4644-a52a-ca3ae0e63fb4	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	2	Active	GST Sale with 18% tax rate	2026-01-19 22:56:36.833+05:30	2026-01-19 22:56:36.833+05:30	t
b3388b38-68f5-41e4-9bc9-deb07794cfda	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Sale - 28%	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	28.00	14.00	14.00	0.00	Sales	Taxable	945f607a-edba-43bb-b3de-c83018fae98f	13c14bcd-eece-495d-a127-f99a0d101aaf	c03439d5-5104-4644-a52a-ca3ae0e63fb4	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	3	Active	GST Sale with 28% tax rate	2026-01-19 22:56:36.833+05:30	2026-01-19 22:56:36.833+05:30	t
a48fc0fd-d899-45d7-80e6-fe4502cef81b	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Sale - 5%	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	5.00	2.50	2.50	0.00	Sales	Taxable	945f607a-edba-43bb-b3de-c83018fae98f	13c14bcd-eece-495d-a127-f99a0d101aaf	c03439d5-5104-4644-a52a-ca3ae0e63fb4	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	4	Active	GST Sale with 5% tax rate	2026-01-19 22:56:36.833+05:30	2026-01-19 22:56:36.833+05:30	t
14ea29ff-133d-46f3-b5f1-5d70bd887ea2	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Sale - 6%	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	6.00	3.00	3.00	0.00	Sales	Taxable	945f607a-edba-43bb-b3de-c83018fae98f	13c14bcd-eece-495d-a127-f99a0d101aaf	c03439d5-5104-4644-a52a-ca3ae0e63fb4	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	5	Active	GST Sale with 6% tax rate	2026-01-19 22:56:36.833+05:30	2026-01-19 22:56:36.833+05:30	t
8c10da0e-7fee-45ac-8b9d-e01a3dc65a46	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Sale Tax Free	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	0.00	0.00	0.00	0.00	Sales	Exempted	945f607a-edba-43bb-b3de-c83018fae98f	13c14bcd-eece-495d-a127-f99a0d101aaf	c03439d5-5104-4644-a52a-ca3ae0e63fb4	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	6	Active	GST Sale Tax Free	2026-01-19 22:56:36.833+05:30	2026-01-19 22:56:36.833+05:30	t
595bdff6-bdde-4e72-9cce-2f3448748093	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Sale Tax Paid	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	0.00	0.00	0.00	0.00	Sales	Taxable	945f607a-edba-43bb-b3de-c83018fae98f	13c14bcd-eece-495d-a127-f99a0d101aaf	c03439d5-5104-4644-a52a-ca3ae0e63fb4	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	7	Active	GST Sale Tax Paid	2026-01-19 22:56:36.833+05:30	2026-01-19 22:56:36.833+05:30	t
61c3eedc-ad45-4285-84bc-b228dca93edb	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Sale-Exempt	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	0.00	0.00	0.00	0.00	Sales	Exempted	945f607a-edba-43bb-b3de-c83018fae98f	13c14bcd-eece-495d-a127-f99a0d101aaf	c03439d5-5104-4644-a52a-ca3ae0e63fb4	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	8	Active	GST Sale Exempt	2026-01-19 22:56:36.833+05:30	2026-01-19 22:56:36.833+05:30	t
06d515fa-d102-44c5-a01d-400786a7c15b	90bf6caf-a345-4003-8ca7-b7268969afd7	GST Sale-Nil Rated	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	0.00	0.00	0.00	0.00	Sales	Nil Rated	945f607a-edba-43bb-b3de-c83018fae98f	13c14bcd-eece-495d-a127-f99a0d101aaf	c03439d5-5104-4644-a52a-ca3ae0e63fb4	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	9	Active	GST Sale Nil Rated	2026-01-19 22:56:36.833+05:30	2026-01-19 22:56:36.833+05:30	t
7bebab3a-b328-49cc-a449-696d26ac5457	90bf6caf-a345-4003-8ca7-b7268969afd7	GST-Deemed Export (Exempted)	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	0.00	0.00	0.00	0.00	Sales	Exempted	945f607a-edba-43bb-b3de-c83018fae98f	13c14bcd-eece-495d-a127-f99a0d101aaf	c03439d5-5104-4644-a52a-ca3ae0e63fb4	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	10	Active	GST Deemed Export (Exempted)	2026-01-19 22:56:36.833+05:30	2026-01-19 22:56:36.833+05:30	t
da6b27ff-9b30-4026-97d2-3a91e4e2c92b	90bf6caf-a345-4003-8ca7-b7268969afd7	GST-Export (Zero Rated)	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	0.00	0.00	0.00	0.00	Sales	Zero Rated	945f607a-edba-43bb-b3de-c83018fae98f	13c14bcd-eece-495d-a127-f99a0d101aaf	c03439d5-5104-4644-a52a-ca3ae0e63fb4	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	11	Active	GST Export (Zero Rated)	2026-01-19 22:56:36.833+05:30	2026-01-19 22:56:36.833+05:30	t
06373ebf-9276-49f6-85b2-7416c0954687	90bf6caf-a345-4003-8ca7-b7268969afd7	GST-Sale SEZ (Exempted)	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	0.00	0.00	0.00	0.00	Sales	Exempted	945f607a-edba-43bb-b3de-c83018fae98f	13c14bcd-eece-495d-a127-f99a0d101aaf	c03439d5-5104-4644-a52a-ca3ae0e63fb4	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	12	Active	GST Sale SEZ (Exempted)	2026-01-19 22:56:36.833+05:30	2026-01-19 22:56:36.833+05:30	t
4cc13781-87b6-43ff-86f3-fe94877da55d	90bf6caf-a345-4003-8ca7-b7268969afd7	GST-Sale Ung.Dealer	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	0.00	0.00	0.00	0.00	Sales	Taxable	945f607a-edba-43bb-b3de-c83018fae98f	13c14bcd-eece-495d-a127-f99a0d101aaf	c03439d5-5104-4644-a52a-ca3ae0e63fb4	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	13	Active	GST Sale Unregistered Dealer	2026-01-19 22:56:36.833+05:30	2026-01-19 22:56:36.833+05:30	t
61898cb5-ee77-4220-b0dc-a246062e62c5	90bf6caf-a345-4003-8ca7-b7268969afd7	GST-StockTrf -Out (Exempt)	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	0.00	0.00	0.00	0.00	Sales	Exempted	945f607a-edba-43bb-b3de-c83018fae98f	13c14bcd-eece-495d-a127-f99a0d101aaf	c03439d5-5104-4644-a52a-ca3ae0e63fb4	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	14	Active	GST Stock Transfer Out (Exempt)	2026-01-19 22:56:36.833+05:30	2026-01-19 22:56:36.833+05:30	t
a641184f-a5aa-43c2-ba00-23106fb715a6	90bf6caf-a345-4003-8ca7-b7268969afd7	Item wise	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	b2f26fe3-f291-48a2-b44b-b7dc3accf8f6	0.00	0.00	0.00	0.00	Sales	Taxable	945f607a-edba-43bb-b3de-c83018fae98f	13c14bcd-eece-495d-a127-f99a0d101aaf	c03439d5-5104-4644-a52a-ca3ae0e63fb4	6c6a97c7-f59e-4141-96f9-2e14989695bb	t	15	Active	Item wise GST calculation	2026-01-19 22:56:36.833+05:30	2026-01-19 22:56:36.833+05:30	t
\.


--
-- Data for Name: salts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salts (id, saltname, saltcode, salttype, saltgroup, saltsubgrp, tbitem, status, prohabit, narcotic, scheduleh2, scheduleh3, "userCompanyId") FROM stdin;
94a34a5d-8bd1-4537-b233-ca1483a1226f	test salt				\N	Normal	Continue	No	No	Yes	Yes	f3f958b2-b8e9-4a09-9749-831c5b5b861a
\.


--
-- Data for Name: saltvariations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.saltvariations (id, str, dosage, brandname, packsize, mrp, dpco, dpcomrp, salt_id) FROM stdin;
\.


--
-- Data for Name: stations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stations (id, "userCompanyId", name, "createdAt", "updatedAt") FROM stdin;
1d5bc87f-2934-4d1f-844c-78eb0948ea68	f3f958b2-b8e9-4a09-9749-831c5b5b861a	first station	2025-12-29 10:32:24.026+05:30	2025-12-29 10:32:24.026+05:30
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stores (id, storecode, storename, address1, "userCompanyId") FROM stdin;
60b06cd4-c83e-4b24-8c6d-4c7706124c0e	test	test	test	f3f958b2-b8e9-4a09-9749-831c5b5b861a
26af2d27-7704-44a0-82a6-1bf585026238	store 1	parivesh store	490 store	f3f958b2-b8e9-4a09-9749-831c5b5b861a
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (id, "voucherNumber", "voucherDate", "voucherType", description, amount, "debitLedgerId", "creditLedgerId", "referenceNumber", "isPosted", "postedDate", "createdBy", "updatedBy", status, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.units (id, "unitName", uqc, "userCompanyId") FROM stdin;
471a3bec-0406-4b8f-a581-4b2d0f270549	pices	pcs	f3f958b2-b8e9-4a09-9749-831c5b5b861a
\.


--
-- Data for Name: user_companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_companies (id, "userId", "companyName", address, country, state, "pinCode", "branchCode", "businessType", "calendarType", "financialYearFrom", "financialYearTo", "taxType", phone, website, email, "companyRegType", "panNumber", "logoUrl", status, printremark, prohibited, invoiceprintindex, recorderformula, recorderprefrence, expiredays, dumpdays, minimummargin, storeroom, "isActive", "isPrimary", "createdAt", "updatedAt") FROM stdin;
f3f958b2-b8e9-4a09-9749-831c5b5b861a	283e27dc-b549-405a-be18-1c4db0bbfed9	Default Company	123 Main Street, Pharmacy District	India	Gujarat	380001	MAIN	Chemist [Pharmacy]	English	2025-04-01	2026-03-31	GST	1234567890	https://defaultcompany.com	company@example.com	\N	ABCDE1234F	https://defaultcompany.com/logo.png	active	\N	No	1	0	1	90	60	0	1	t	t	2025-12-29 10:28:48.791+05:30	2025-12-29 10:28:48.791+05:30
90bf6caf-a345-4003-8ca7-b7268969afd7	6f4ac9f4-8368-48a4-b223-faf9c938e20c	test company	490 shyam nagar sukhliya	India	Madhya Pradesh	452010	TESTCOMPANY	Billing [General]	English	2025-09-09	2026-09-09	GST	9302998876		pariveshrimjha20494@acropolis.in	Unregistered		\N	active	\N	No	1	0	1	90	60	0	1	t	f	2026-01-19 22:56:36.798+05:30	2026-01-19 22:56:36.8+05:30
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, uname, pwd, role, module, fname, lname, isactive, email, phone, pin, "phoneVerified", "emailVerified", "phoneVerificationCode", "phoneVerificationExpiry", "emailVerificationCode", "emailVerificationExpiry", "activeCompanyId", "lastLoginAt", "createdAt", "updatedAt") FROM stdin;
6f4ac9f4-8368-48a4-b223-faf9c938e20c	pariveshrimjha20494_1768843472312	$2b$12$aIyf/VoJK6j2P80Pxjec0OJw6dv78XmKc1BCPeZOejqvyEN8kLmNC	user	{basic}	Parivesh	Rimjha	active	pariveshrimjha20494@acropolis.in	9302998876	452010	t	t	\N	\N	\N	\N	\N	2026-01-19 22:55:53.864+05:30	2026-01-19 22:54:32.312+05:30	2026-01-19 22:55:53.864+05:30
283e27dc-b549-405a-be18-1c4db0bbfed9	admin	$2b$12$NH9KAXQvtyVg0Bt7dJUhje6t5nW8VIFvwFwgb9iMtwwvbDyMbI6Qi	admin	{all}	Admin	User	active	admin@example.com	1111111111	123456	t	t	000000	2025-12-29 10:33:48.781+05:30	000000	2025-12-29 10:33:48.781+05:30	\N	2026-04-15 00:05:43.895+05:30	2025-12-29 10:28:48.781+05:30	2026-04-15 00:05:43.896+05:30
\.


--
-- Name: BillItems BillItems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BillItems"
    ADD CONSTRAINT "BillItems_pkey" PRIMARY KEY (id);


--
-- Name: Bills Bills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bills"
    ADD CONSTRAINT "Bills_pkey" PRIMARY KEY (id);


--
-- Name: Otps Otps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Otps"
    ADD CONSTRAINT "Otps_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: batches batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.batches
    ADD CONSTRAINT batches_pkey PRIMARY KEY (id);


--
-- Name: companies companies_companyname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_companyname_key UNIQUE (companyname);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: group_permissions group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_permissions
    ADD CONSTRAINT group_permissions_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: hsnsac hsnsac_hsnSacCode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hsnsac
    ADD CONSTRAINT "hsnsac_hsnSacCode_key" UNIQUE ("hsnSacCode");


--
-- Name: hsnsac hsnsac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hsnsac
    ADD CONSTRAINT hsnsac_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: ledgers ledgers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledgers
    ADD CONSTRAINT ledgers_pkey PRIMARY KEY (id);


--
-- Name: manufacturers manufacturers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (id);


--
-- Name: patients patients_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_phone_key UNIQUE (phone);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: prescription_items prescription_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescription_items
    ADD CONSTRAINT prescription_items_pkey PRIMARY KEY (id);


--
-- Name: prescriptions prescriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_pkey PRIMARY KEY (id);


--
-- Name: purchase_bill_items purchase_bill_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_bill_items
    ADD CONSTRAINT purchase_bill_items_pkey PRIMARY KEY (id);


--
-- Name: purchase_bills purchase_bills_billNo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_bills
    ADD CONSTRAINT "purchase_bills_billNo_key" UNIQUE ("billNo");


--
-- Name: purchase_bills purchase_bills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_bills
    ADD CONSTRAINT purchase_bills_pkey PRIMARY KEY (id);


--
-- Name: purchase_masters purchase_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_masters
    ADD CONSTRAINT purchase_masters_pkey PRIMARY KEY (id);


--
-- Name: racks racks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.racks
    ADD CONSTRAINT racks_pkey PRIMARY KEY (id);


--
-- Name: racks racks_rackname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.racks
    ADD CONSTRAINT racks_rackname_key UNIQUE (rackname);


--
-- Name: sale_masters sale_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_masters
    ADD CONSTRAINT sale_masters_pkey PRIMARY KEY (id);


--
-- Name: salts salts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salts
    ADD CONSTRAINT salts_pkey PRIMARY KEY (id);


--
-- Name: salts salts_saltname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salts
    ADD CONSTRAINT salts_saltname_key UNIQUE (saltname);


--
-- Name: saltvariations saltvariations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saltvariations
    ADD CONSTRAINT saltvariations_pkey PRIMARY KEY (id);


--
-- Name: stations stations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: stores stores_storename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_storename_key UNIQUE (storename);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_voucherNumber_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT "transactions_voucherNumber_key" UNIQUE ("voucherNumber");


--
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- Name: units units_unitName_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT "units_unitName_key" UNIQUE ("unitName");


--
-- Name: user_companies user_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_companies
    ADD CONSTRAINT user_companies_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_uname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_uname_key UNIQUE (uname);


--
-- Name: group_permissions_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX group_permissions_group_id ON public.group_permissions USING btree ("groupId");


--
-- Name: group_permissions_group_id_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX group_permissions_group_id_user_id ON public.group_permissions USING btree ("groupId", "userId");


--
-- Name: group_permissions_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX group_permissions_status ON public.group_permissions USING btree (status);


--
-- Name: group_permissions_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX group_permissions_user_id ON public.group_permissions USING btree ("userId");


--
-- Name: groups_group_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX groups_group_type ON public.groups USING btree (group_type);


--
-- Name: groups_is_default; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX groups_is_default ON public.groups USING btree (is_default);


--
-- Name: groups_parent_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX groups_parent_group_id ON public.groups USING btree (parent_group_id);


--
-- Name: groups_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX groups_status ON public.groups USING btree (status);


--
-- Name: idx_batches_batchNumber; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_batches_batchNumber" ON public.batches USING btree ("batchNumber");


--
-- Name: idx_batches_expiry_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_batches_expiry_date ON public.batches USING btree ("expiryDate");


--
-- Name: idx_batches_itemId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_batches_itemId" ON public.batches USING btree ("itemId");


--
-- Name: idx_batches_mfg_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_batches_mfg_date ON public.batches USING btree ("mfgDate");


--
-- Name: idx_batches_userCompanyId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_batches_userCompanyId" ON public.batches USING btree ("userCompanyId");


--
-- Name: idx_ledgers_balance_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ledgers_balance_type ON public.ledgers USING btree ("balanceType");


--
-- Name: idx_ledgers_company_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ledgers_company_active ON public.ledgers USING btree ("companyId", "isActive");


--
-- Name: idx_sale_masters_is_default; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sale_masters_is_default ON public.sale_masters USING btree ("isDefault");


--
-- Name: ledgers_acgroup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ledgers_acgroup ON public.ledgers USING btree (acgroup);


--
-- Name: ledgers_isDefault_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ledgers_isDefault_index" ON public.ledgers USING btree ("isDefault");


--
-- Name: ledgers_is_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ledgers_is_active ON public.ledgers USING btree ("isActive");


--
-- Name: ledgers_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ledgers_status ON public.ledgers USING btree (status);


--
-- Name: purchase_bill_items_batch_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_bill_items_batch_id ON public.purchase_bill_items USING btree ("batchId");


--
-- Name: purchase_bill_items_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_bill_items_item_id ON public.purchase_bill_items USING btree ("itemId");


--
-- Name: purchase_bill_items_purchase_bill_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_bill_items_purchase_bill_id ON public.purchase_bill_items USING btree ("purchaseBillId");


--
-- Name: purchase_bills_bill_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_bills_bill_date ON public.purchase_bills USING btree ("billDate");


--
-- Name: purchase_bills_bill_no; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX purchase_bills_bill_no ON public.purchase_bills USING btree ("billNo");


--
-- Name: purchase_bills_payment_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_bills_payment_status ON public.purchase_bills USING btree ("paymentStatus");


--
-- Name: purchase_bills_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_bills_status ON public.purchase_bills USING btree (status);


--
-- Name: purchase_bills_supplier_ledger_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_bills_supplier_ledger_id ON public.purchase_bills USING btree ("supplierLedgerId");


--
-- Name: purchase_bills_user_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_bills_user_company_id ON public.purchase_bills USING btree ("userCompanyId");


--
-- Name: purchase_masters_is_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_masters_is_active ON public.purchase_masters USING btree ("isActive");


--
-- Name: purchase_masters_is_default; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_masters_is_default ON public.purchase_masters USING btree ("isDefault");


--
-- Name: purchase_masters_nature_of_transaction; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_masters_nature_of_transaction ON public.purchase_masters USING btree ("natureOfTransaction");


--
-- Name: purchase_masters_taxability; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX purchase_masters_taxability ON public.purchase_masters USING btree (taxability);


--
-- Name: sale_masters_isActive_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "sale_masters_isActive_index" ON public.sale_masters USING btree ("isActive");


--
-- Name: sale_masters_natureOfTransaction_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "sale_masters_natureOfTransaction_index" ON public.sale_masters USING btree ("natureOfTransaction");


--
-- Name: sale_masters_status_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sale_masters_status_index ON public.sale_masters USING btree (status);


--
-- Name: sale_masters_taxability_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sale_masters_taxability_index ON public.sale_masters USING btree (taxability);


--
-- Name: transactions_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transactions_created_by ON public.transactions USING btree ("createdBy");


--
-- Name: transactions_credit_ledger_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transactions_credit_ledger_id ON public.transactions USING btree ("creditLedgerId");


--
-- Name: transactions_debit_ledger_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transactions_debit_ledger_id ON public.transactions USING btree ("debitLedgerId");


--
-- Name: transactions_is_posted; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transactions_is_posted ON public.transactions USING btree ("isPosted");


--
-- Name: transactions_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transactions_status ON public.transactions USING btree (status);


--
-- Name: transactions_voucher_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transactions_voucher_date ON public.transactions USING btree ("voucherDate");


--
-- Name: transactions_voucher_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX transactions_voucher_number ON public.transactions USING btree ("voucherNumber");


--
-- Name: transactions_voucher_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX transactions_voucher_type ON public.transactions USING btree ("voucherType");


--
-- Name: unique_batch_per_item; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_batch_per_item ON public.batches USING btree ("itemId", "batchNumber");


--
-- Name: unique_branch_code_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_branch_code_user ON public.user_companies USING btree ("branchCode", "userId");


--
-- Name: unique_company_name_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_company_name_user ON public.user_companies USING btree ("companyName", "userId");


--
-- Name: unique_company_per_user_company; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_company_per_user_company ON public.companies USING btree ("userCompanyId", companyname);


--
-- Name: unique_doctors_mobileNo_userCompanyId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "unique_doctors_mobileNo_userCompanyId" ON public.doctors USING btree ("mobileNo", "userCompanyId");


--
-- Name: unique_group_name_per_company; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_group_name_per_company ON public.groups USING btree (company_id, group_name);


--
-- Name: unique_hsnsac_per_user_company; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_hsnsac_per_user_company ON public.hsnsac USING btree ("userCompanyId", "hsnSacCode");


--
-- Name: unique_item_per_user_company; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_item_per_user_company ON public.items USING btree ("userCompanyId", productname);


--
-- Name: unique_ledger_name_per_company; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_ledger_name_per_company ON public.ledgers USING btree ("companyId", "ledgerName");


--
-- Name: unique_mfr_per_user_company; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_mfr_per_user_company ON public.manufacturers USING btree ("userCompanyId", mfrname);


--
-- Name: unique_purchase_type_per_company; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_purchase_type_per_company ON public.purchase_masters USING btree ("companyId", "purchaseType");


--
-- Name: unique_rack_per_store_per_user_company; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_rack_per_store_per_user_company ON public.racks USING btree ("userCompanyId", rackname, storeid);


--
-- Name: unique_sales_type_per_company; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_sales_type_per_company ON public.sale_masters USING btree ("companyId", "salesType");


--
-- Name: unique_salt_per_user_company; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_salt_per_user_company ON public.salts USING btree ("userCompanyId", saltname);


--
-- Name: unique_store_per_user_company; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_store_per_user_company ON public.stores USING btree ("userCompanyId", storename);


--
-- Name: unique_unit_per_user_company; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_unit_per_user_company ON public.units USING btree ("userCompanyId", "unitName");


--
-- Name: unique_userCompanyId_phone; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "unique_userCompanyId_phone" ON public.patients USING btree ("userCompanyId", phone);


--
-- Name: unique_userCompanyId_presNo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "unique_userCompanyId_presNo" ON public.prescriptions USING btree ("userCompanyId", "presNo");


--
-- Name: unique_userCompanyId_station_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "unique_userCompanyId_station_name" ON public.stations USING btree ("userCompanyId", name);


--
-- Name: users_active_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_active_company_id ON public.users USING btree ("activeCompanyId");


--
-- Name: users_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_email ON public.users USING btree (email);


--
-- Name: users_isactive; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_isactive ON public.users USING btree (isactive);


--
-- Name: users_phone; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_phone ON public.users USING btree (phone);


--
-- Name: BillItems BillItems_billId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BillItems"
    ADD CONSTRAINT "BillItems_billId_fkey" FOREIGN KEY ("billId") REFERENCES public."Bills"(id);


--
-- Name: BillItems BillItems_itemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BillItems"
    ADD CONSTRAINT "BillItems_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public.items(id);


--
-- Name: Bills Bills_userCompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bills"
    ADD CONSTRAINT "Bills_userCompanyId_fkey" FOREIGN KEY ("userCompanyId") REFERENCES public.user_companies(id) ON DELETE CASCADE;


--
-- Name: batches batches_itemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.batches
    ADD CONSTRAINT "batches_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public.items(id) ON DELETE CASCADE;


--
-- Name: batches batches_userCompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.batches
    ADD CONSTRAINT "batches_userCompanyId_fkey" FOREIGN KEY ("userCompanyId") REFERENCES public.user_companies(id) ON DELETE CASCADE;


--
-- Name: companies companies_userCompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT "companies_userCompanyId_fkey" FOREIGN KEY ("userCompanyId") REFERENCES public.user_companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: doctors doctors_userCompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT "doctors_userCompanyId_fkey" FOREIGN KEY ("userCompanyId") REFERENCES public.user_companies(id);


--
-- Name: group_permissions group_permissions_groupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_permissions
    ADD CONSTRAINT "group_permissions_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES public.groups(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: group_permissions group_permissions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_permissions
    ADD CONSTRAINT "group_permissions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: groups groups_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.user_companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: groups groups_parent_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_parent_group_id_fkey FOREIGN KEY (parent_group_id) REFERENCES public.groups(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: hsnsac hsnsac_userCompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hsnsac
    ADD CONSTRAINT "hsnsac_userCompanyId_fkey" FOREIGN KEY ("userCompanyId") REFERENCES public.user_companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: items items_company_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_company_fkey FOREIGN KEY (company) REFERENCES public.companies(id) ON DELETE CASCADE;


--
-- Name: items items_hsnsac_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_hsnsac_fkey FOREIGN KEY (hsnsac) REFERENCES public.hsnsac(id);


--
-- Name: items items_rack_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_rack_fkey FOREIGN KEY (rack) REFERENCES public.racks(id);


--
-- Name: items items_salt_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_salt_fkey FOREIGN KEY (salt) REFERENCES public.salts(id);


--
-- Name: items items_taxcategory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_taxcategory_fkey FOREIGN KEY (taxcategory) REFERENCES public.purchase_masters(id);


--
-- Name: items items_unit1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_unit1_fkey FOREIGN KEY (unit1) REFERENCES public.units(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: items items_unit2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_unit2_fkey FOREIGN KEY (unit2) REFERENCES public.units(id);


--
-- Name: items items_userCompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT "items_userCompanyId_fkey" FOREIGN KEY ("userCompanyId") REFERENCES public.user_companies(id) ON DELETE CASCADE;


--
-- Name: ledgers ledgers_acgroup_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledgers
    ADD CONSTRAINT ledgers_acgroup_fkey FOREIGN KEY (acgroup) REFERENCES public.groups(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ledgers ledgers_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledgers
    ADD CONSTRAINT "ledgers_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public.user_companies(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ledgers ledgers_station_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledgers
    ADD CONSTRAINT ledgers_station_fkey FOREIGN KEY (station) REFERENCES public.stations(id);


--
-- Name: manufacturers manufacturers_userCompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT "manufacturers_userCompanyId_fkey" FOREIGN KEY ("userCompanyId") REFERENCES public.user_companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: patients patients_userCompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT "patients_userCompanyId_fkey" FOREIGN KEY ("userCompanyId") REFERENCES public.user_companies(id);


--
-- Name: prescription_items prescription_items_itemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescription_items
    ADD CONSTRAINT "prescription_items_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public.items(id);


--
-- Name: prescription_items prescription_items_prescriptionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescription_items
    ADD CONSTRAINT "prescription_items_prescriptionId_fkey" FOREIGN KEY ("prescriptionId") REFERENCES public.prescriptions(id);


--
-- Name: prescriptions prescriptions_doctorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT "prescriptions_doctorId_fkey" FOREIGN KEY ("doctorId") REFERENCES public.doctors(id);


--
-- Name: prescriptions prescriptions_patientId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT "prescriptions_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES public.patients(id);


--
-- Name: prescriptions prescriptions_userCompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT "prescriptions_userCompanyId_fkey" FOREIGN KEY ("userCompanyId") REFERENCES public.user_companies(id);


--
-- Name: purchase_bill_items purchase_bill_items_batchId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_bill_items
    ADD CONSTRAINT "purchase_bill_items_batchId_fkey" FOREIGN KEY ("batchId") REFERENCES public.batches(id) ON DELETE SET NULL;


--
-- Name: purchase_bill_items purchase_bill_items_itemId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_bill_items
    ADD CONSTRAINT "purchase_bill_items_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public.items(id) ON DELETE SET NULL;


--
-- Name: purchase_bill_items purchase_bill_items_purchaseBillId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_bill_items
    ADD CONSTRAINT "purchase_bill_items_purchaseBillId_fkey" FOREIGN KEY ("purchaseBillId") REFERENCES public.purchase_bills(id) ON DELETE CASCADE;


--
-- Name: purchase_bills purchase_bills_purchaseMasterId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_bills
    ADD CONSTRAINT "purchase_bills_purchaseMasterId_fkey" FOREIGN KEY ("purchaseMasterId") REFERENCES public.purchase_masters(id) ON DELETE RESTRICT;


--
-- Name: purchase_bills purchase_bills_supplierLedgerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_bills
    ADD CONSTRAINT "purchase_bills_supplierLedgerId_fkey" FOREIGN KEY ("supplierLedgerId") REFERENCES public.ledgers(id) ON DELETE RESTRICT;


--
-- Name: purchase_bills purchase_bills_userCompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_bills
    ADD CONSTRAINT "purchase_bills_userCompanyId_fkey" FOREIGN KEY ("userCompanyId") REFERENCES public.user_companies(id) ON DELETE RESTRICT;


--
-- Name: purchase_masters purchase_masters_centralPurchaseLedgerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_masters
    ADD CONSTRAINT "purchase_masters_centralPurchaseLedgerId_fkey" FOREIGN KEY ("centralPurchaseLedgerId") REFERENCES public.ledgers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: purchase_masters purchase_masters_cessLedgerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_masters
    ADD CONSTRAINT "purchase_masters_cessLedgerId_fkey" FOREIGN KEY ("cessLedgerId") REFERENCES public.ledgers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: purchase_masters purchase_masters_cgstLedgerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_masters
    ADD CONSTRAINT "purchase_masters_cgstLedgerId_fkey" FOREIGN KEY ("cgstLedgerId") REFERENCES public.ledgers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: purchase_masters purchase_masters_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_masters
    ADD CONSTRAINT "purchase_masters_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public.user_companies(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: purchase_masters purchase_masters_igstLedgerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_masters
    ADD CONSTRAINT "purchase_masters_igstLedgerId_fkey" FOREIGN KEY ("igstLedgerId") REFERENCES public.ledgers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: purchase_masters purchase_masters_localPurchaseLedgerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_masters
    ADD CONSTRAINT "purchase_masters_localPurchaseLedgerId_fkey" FOREIGN KEY ("localPurchaseLedgerId") REFERENCES public.ledgers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: purchase_masters purchase_masters_sgstLedgerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_masters
    ADD CONSTRAINT "purchase_masters_sgstLedgerId_fkey" FOREIGN KEY ("sgstLedgerId") REFERENCES public.ledgers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: racks racks_storeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.racks
    ADD CONSTRAINT racks_storeid_fkey FOREIGN KEY (storeid) REFERENCES public.stores(id);


--
-- Name: racks racks_userCompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.racks
    ADD CONSTRAINT "racks_userCompanyId_fkey" FOREIGN KEY ("userCompanyId") REFERENCES public.user_companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sale_masters sale_masters_centralSalesLedgerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_masters
    ADD CONSTRAINT "sale_masters_centralSalesLedgerId_fkey" FOREIGN KEY ("centralSalesLedgerId") REFERENCES public.ledgers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: sale_masters sale_masters_cessLedgerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_masters
    ADD CONSTRAINT "sale_masters_cessLedgerId_fkey" FOREIGN KEY ("cessLedgerId") REFERENCES public.ledgers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: sale_masters sale_masters_cgstLedgerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_masters
    ADD CONSTRAINT "sale_masters_cgstLedgerId_fkey" FOREIGN KEY ("cgstLedgerId") REFERENCES public.ledgers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: sale_masters sale_masters_companyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_masters
    ADD CONSTRAINT "sale_masters_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES public.user_companies(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: sale_masters sale_masters_igstLedgerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_masters
    ADD CONSTRAINT "sale_masters_igstLedgerId_fkey" FOREIGN KEY ("igstLedgerId") REFERENCES public.ledgers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: sale_masters sale_masters_localSalesLedgerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_masters
    ADD CONSTRAINT "sale_masters_localSalesLedgerId_fkey" FOREIGN KEY ("localSalesLedgerId") REFERENCES public.ledgers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: sale_masters sale_masters_sgstLedgerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_masters
    ADD CONSTRAINT "sale_masters_sgstLedgerId_fkey" FOREIGN KEY ("sgstLedgerId") REFERENCES public.ledgers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: salts salts_userCompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salts
    ADD CONSTRAINT "salts_userCompanyId_fkey" FOREIGN KEY ("userCompanyId") REFERENCES public.user_companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: saltvariations saltvariations_salt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saltvariations
    ADD CONSTRAINT saltvariations_salt_id_fkey FOREIGN KEY (salt_id) REFERENCES public.salts(id);


--
-- Name: stations stations_userCompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT "stations_userCompanyId_fkey" FOREIGN KEY ("userCompanyId") REFERENCES public.user_companies(id);


--
-- Name: stores stores_userCompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT "stores_userCompanyId_fkey" FOREIGN KEY ("userCompanyId") REFERENCES public.user_companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: transactions transactions_createdBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT "transactions_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: transactions transactions_creditLedgerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT "transactions_creditLedgerId_fkey" FOREIGN KEY ("creditLedgerId") REFERENCES public.ledgers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: transactions transactions_debitLedgerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT "transactions_debitLedgerId_fkey" FOREIGN KEY ("debitLedgerId") REFERENCES public.ledgers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: transactions transactions_updatedBy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT "transactions_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: units units_userCompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT "units_userCompanyId_fkey" FOREIGN KEY ("userCompanyId") REFERENCES public.user_companies(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_companies user_companies_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_companies
    ADD CONSTRAINT "user_companies_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users users_activeCompanyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_activeCompanyId_fkey" FOREIGN KEY ("activeCompanyId") REFERENCES public.user_companies(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict 7JQsZYTUJLmLEOUAtmkpthkzPHgAHFnHPfMNgCa05NddDxLR6Np1YLumdFThGLk

