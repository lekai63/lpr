--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3 (Debian 12.3-1.pgdg100+1)
-- Dumped by pg_dump version 12.2

-- Started on 2020-07-22 04:45:32 UTC

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
-- TOC entry 6 (class 2615 OID 17109)
-- Name: fzzl; Type: SCHEMA; Schema: -; Owner: fzzl
--

CREATE SCHEMA fzzl;


ALTER SCHEMA fzzl OWNER TO fzzl;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 17112)
-- Name: bank_loan_contract; Type: TABLE; Schema: fzzl; Owner: fzzl
--

CREATE TABLE fzzl.bank_loan_contract (
    id integer NOT NULL,
    lease_contract_id integer,
    bank_contract_no character varying(255),
    bank_contract_name character varying(255),
    bank_account character varying(255),
    interest_calc_method character varying(255),
    bank_name character varying(255) NOT NULL,
    bank_branch character varying(255),
    loan_principal bigint NOT NULL,
    loan_method character varying(255),
    contract_start_date date,
    contract_end_date date,
    actual_start_date date,
    is_lpr boolean,
    current_reprice_day date,
    current_lpr integer,
    lpr_plus integer,
    current_rate integer NOT NULL,
    next_reprice_day date,
    all_repaid_principal bigint,
    all_repaid_interest bigint,
    is_finished boolean,
    contact_person character varying(255),
    contact_tel character varying(50),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE fzzl.bank_loan_contract OWNER TO fzzl;

--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE bank_loan_contract; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON TABLE fzzl.bank_loan_contract IS '银行借款合同基本信息';


--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.id; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.id IS '自增主键';


--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.lease_contract_id; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.lease_contract_id IS '对应项目，应用层关联LeaseContract主键id';


--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.bank_contract_no; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.bank_contract_no IS '银行借款合同号';


--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.bank_contract_name; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.bank_contract_name IS '借款合同名称';


--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.bank_account; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.bank_account IS '银行还款账户（保理户）';


--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.interest_calc_method; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.interest_calc_method IS '计息方式';


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.bank_name; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.bank_name IS '债权人，总部名称（eg工商银行），不同银行利息计算方式不同';


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.bank_branch; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.bank_branch IS '债权人，分支名称';


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.loan_principal; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.loan_principal IS '融资金额（本金），单位【0.01分】';


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.loan_method; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.loan_method IS '融资方式：保理、流贷...';


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.contract_start_date; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.contract_start_date IS '合同起始日';


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.contract_end_date; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.contract_end_date IS '合同到期日';


--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.actual_start_date; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.actual_start_date IS '借据放款日';


--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.is_lpr; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.is_lpr IS 'base基准为0，baseLPR为1';


--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.current_reprice_day; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.current_reprice_day IS '当前执行利率的重定价日（即从哪一天开始执行当前利率）';


--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.current_lpr; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.current_lpr IS '当前执行利率base的LPR';


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.lpr_plus; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.lpr_plus IS 'LPR加点值，单位【0.0001%】';


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.current_rate; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.current_rate IS '当前执行利率，=LPR+点，单位【0.0001%】';


--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.next_reprice_day; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.next_reprice_day IS '下一个重定价日';


--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.all_repaid_principal; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.all_repaid_principal IS '已还本金，单位【0.01分】';


--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.all_repaid_interest; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.all_repaid_interest IS '已还利息，单位【0.01分】';


--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.is_finished; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.is_finished IS '合同未结束0，合同已执行完毕1';


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.contact_person; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.contact_person IS '银行联系人';


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN bank_loan_contract.contact_tel; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_loan_contract.contact_tel IS '银行联系人电话';


--
-- TOC entry 221 (class 1259 OID 17110)
-- Name: bank_loan_contract_bl_cid_seq; Type: SEQUENCE; Schema: fzzl; Owner: fzzl
--

ALTER TABLE fzzl.bank_loan_contract ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME fzzl.bank_loan_contract_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 17120)
-- Name: bank_repay_plan; Type: TABLE; Schema: fzzl; Owner: fzzl
--

CREATE TABLE fzzl.bank_repay_plan (
    id integer NOT NULL,
    bank_loan_contract_id integer NOT NULL,
    plan_date date NOT NULL,
    plan_amount bigint,
    plan_principal bigint NOT NULL,
    plan_interest bigint,
    actual_date date,
    actual_amount bigint,
    actual_principal bigint,
    actual_interest bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE fzzl.bank_repay_plan OWNER TO fzzl;

--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE bank_repay_plan; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON TABLE fzzl.bank_repay_plan IS '租金还款计划表';


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN bank_repay_plan.id; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_repay_plan.id IS '自增主键';


--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN bank_repay_plan.bank_loan_contract_id; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_repay_plan.bank_loan_contract_id IS '应用层关联BankLoanContract主键id';


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN bank_repay_plan.plan_date; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_repay_plan.plan_date IS '计划还款日';


--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN bank_repay_plan.plan_amount; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_repay_plan.plan_amount IS '计划还款金额（本息和），单位【0.01分】';


--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN bank_repay_plan.plan_principal; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_repay_plan.plan_principal IS '计划还款本金，单位【0.01分】';


--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN bank_repay_plan.plan_interest; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_repay_plan.plan_interest IS '计划还款利息，单位【0.01分】';


--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN bank_repay_plan.actual_date; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_repay_plan.actual_date IS '实际还款日';


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN bank_repay_plan.actual_amount; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_repay_plan.actual_amount IS '实际归还的本息和，单位【0.01分】';


--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN bank_repay_plan.actual_principal; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_repay_plan.actual_principal IS '实际归还的本金，单位【0.01分】';


--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN bank_repay_plan.actual_interest; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.bank_repay_plan.actual_interest IS '实际归还的利息，单位【0.01分】';


--
-- TOC entry 223 (class 1259 OID 17118)
-- Name: bank_repay_plan_pid_seq; Type: SEQUENCE; Schema: fzzl; Owner: fzzl
--

ALTER TABLE fzzl.bank_repay_plan ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME fzzl.bank_repay_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 17125)
-- Name: lease_contract; Type: TABLE; Schema: fzzl; Owner: fzzl
--

CREATE TABLE fzzl.lease_contract (
    id integer NOT NULL,
    contract_no character varying(255) NOT NULL,
    lessee character varying(255) NOT NULL,
    abbreviation character varying(255),
    start_date date NOT NULL,
    end_date date NOT NULL,
    fee bigint NOT NULL,
    margin bigint NOT NULL,
    contract_principal bigint NOT NULL,
    actual_principal bigint NOT NULL,
    term_month smallint NOT NULL,
    subject_matter character varying(255),
    irr integer,
    is_lpr boolean NOT NULL,
    current_reprice_day date,
    "current_LPR" integer,
    lpr_plus integer,
    current_rate integer,
    next_reprice_day date,
    received_principal bigint,
    received_interest bigint,
    is_finished boolean NOT NULL,
    lessee_info_id integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE fzzl.lease_contract OWNER TO fzzl;

--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE lease_contract; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON TABLE fzzl.lease_contract IS '租赁合同基本信息，存放租赁合同中变化较小的要素';


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.id; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.id IS '自增主键';


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.contract_no; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.contract_no IS '租赁合同编号';


--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.lessee; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.lessee IS '承租人全称，应用层关联CustomerInfo同名字段';


--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.abbreviation; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.abbreviation IS '项目简称';


--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.start_date; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.start_date IS '投放日';


--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.end_date; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.end_date IS '到期日';


--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.fee; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.fee IS '手续费，单位【0.01分】';


--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.margin; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.margin IS '保证金，单位【0.01分】';


--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.contract_principal; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.contract_principal IS '合同金额、本金总额，单位【0.01分】';


--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.actual_principal; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.actual_principal IS '实际投放金额，单位【0.01分】';


--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.term_month; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.term_month IS '期限，单位【月】';


--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.subject_matter; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.subject_matter IS '标的物';


--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.irr; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.irr IS 'IRR，单位【0.0001%】';


--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.is_lpr; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.is_lpr IS 'base基准为0，baseLPR为1';


--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.current_reprice_day; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.current_reprice_day IS '当前执行利率的重定价日（即从哪一天开始执行当前利率）';


--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract."current_LPR"; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract."current_LPR" IS '当前执行利率base的LPR，单位【0.0001%】';


--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.lpr_plus; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.lpr_plus IS 'LPR加点值，单位【0.0001%】';


--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.current_rate; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.current_rate IS '当前执行的租息率，单位【0.0001%】';


--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.next_reprice_day; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.next_reprice_day IS '下一个重定价日';


--
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.received_principal; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.received_principal IS '已收本金，单位【0.01分】';


--
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.received_interest; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.received_interest IS '已收本金，单位【0.01分】';


--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.is_finished; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.is_finished IS '合同未结束0，合同执行完毕1';


--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN lease_contract.lessee_info_id; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_contract.lessee_info_id IS '应用层关联LesseeInfo主键id';


--
-- TOC entry 225 (class 1259 OID 17123)
-- Name: lease_contract_cid_seq; Type: SEQUENCE; Schema: fzzl; Owner: fzzl
--

ALTER TABLE fzzl.lease_contract ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME fzzl.lease_contract_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 17133)
-- Name: lease_repay_plan; Type: TABLE; Schema: fzzl; Owner: fzzl
--

CREATE TABLE fzzl.lease_repay_plan (
    id integer NOT NULL,
    lease_contract_id integer NOT NULL,
    period smallint,
    plan_date date NOT NULL,
    plan_amount bigint NOT NULL,
    plan_principal bigint NOT NULL,
    plan_interest bigint NOT NULL,
    actual_date date,
    actual_amount bigint,
    actual_principal bigint,
    actual_interest bigint,
    create_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE fzzl.lease_repay_plan OWNER TO fzzl;

--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE lease_repay_plan; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON TABLE fzzl.lease_repay_plan IS '租金还款计划表';


--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN lease_repay_plan.id; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_repay_plan.id IS '自增主键';


--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN lease_repay_plan.lease_contract_id; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_repay_plan.lease_contract_id IS '应用层关联Lease Contract主键id';


--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN lease_repay_plan.period; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_repay_plan.period IS '期次，第x期';


--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN lease_repay_plan.plan_date; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_repay_plan.plan_date IS '本期租金还款日';


--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN lease_repay_plan.plan_amount; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_repay_plan.plan_amount IS '本期租金，本期租金（本息和），单位【0.01分】';


--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN lease_repay_plan.plan_principal; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_repay_plan.plan_principal IS '本期租金本金，单位【0.01分】';


--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN lease_repay_plan.plan_interest; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_repay_plan.plan_interest IS '本期租金利息，单位【0.01分】';


--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN lease_repay_plan.actual_date; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_repay_plan.actual_date IS '实际还款日';


--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN lease_repay_plan.actual_amount; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_repay_plan.actual_amount IS '实际归还的本息和，单位【0.01分】';


--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN lease_repay_plan.actual_principal; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_repay_plan.actual_principal IS '实际归还的本金，单位【0.01分】';


--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN lease_repay_plan.actual_interest; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lease_repay_plan.actual_interest IS '实际归还的利息，单位【0.01分】';


--
-- TOC entry 227 (class 1259 OID 17131)
-- Name: lease_repay_plan_pid_seq; Type: SEQUENCE; Schema: fzzl; Owner: fzzl
--

ALTER TABLE fzzl.lease_repay_plan ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME fzzl.lease_repay_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 17138)
-- Name: lessee_info; Type: TABLE; Schema: fzzl; Owner: fzzl
--

CREATE TABLE fzzl.lessee_info (
    id integer NOT NULL,
    business_license character varying(18),
    lessee character varying(255) NOT NULL,
    short_name character varying(255),
    email character varying(50),
    contact_person character varying(255),
    contact_tel character varying(50),
    customer_manager character varying(10),
    risk_manager character varying(10),
    create_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE fzzl.lessee_info OWNER TO fzzl;

--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE lessee_info; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON TABLE fzzl.lessee_info IS '承租人基本信息';


--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN lessee_info.id; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lessee_info.id IS '自增主键';


--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN lessee_info.business_license; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lessee_info.business_license IS '营业执照编号';


--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN lessee_info.lessee; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lessee_info.lessee IS '承租人名称';


--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN lessee_info.short_name; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lessee_info.short_name IS '承租人简称';


--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN lessee_info.email; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lessee_info.email IS '邮箱-用于接收电子发票';


--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN lessee_info.contact_person; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lessee_info.contact_person IS '联系人';


--
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN lessee_info.contact_tel; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lessee_info.contact_tel IS '联系电话';


--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN lessee_info.customer_manager; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lessee_info.customer_manager IS '客户经理';


--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN lessee_info.risk_manager; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.lessee_info.risk_manager IS '风审经理';


--
-- TOC entry 229 (class 1259 OID 17136)
-- Name: lessee_info_customer_id_seq; Type: SEQUENCE; Schema: fzzl; Owner: fzzl
--

ALTER TABLE fzzl.lessee_info ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME fzzl.lessee_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 17146)
-- Name: shareholder_loan_contract; Type: TABLE; Schema: fzzl; Owner: fzzl
--

CREATE TABLE fzzl.shareholder_loan_contract (
    id integer NOT NULL,
    creditor character varying(255) NOT NULL,
    abbreviation character varying(255),
    loan_principal bigint NOT NULL,
    loan_rate integer NOT NULL,
    loan_contract_no character varying(255),
    loan_start_date date,
    loan_end_date date,
    all_repaid_principal bigint,
    all_repaid_interest bigint,
    is_finished boolean,
    create_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE fzzl.shareholder_loan_contract OWNER TO fzzl;

--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE shareholder_loan_contract; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON TABLE fzzl.shareholder_loan_contract IS '股东借款';


--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN shareholder_loan_contract.id; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.shareholder_loan_contract.id IS '自增主键';


--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN shareholder_loan_contract.creditor; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.shareholder_loan_contract.creditor IS '股东债权人';


--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN shareholder_loan_contract.abbreviation; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.shareholder_loan_contract.abbreviation IS '对应的租赁项目简称，应用层关联LeaseBasicContact同名字段';


--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN shareholder_loan_contract.loan_principal; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.shareholder_loan_contract.loan_principal IS '借款本金';


--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN shareholder_loan_contract.loan_rate; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.shareholder_loan_contract.loan_rate IS '借款利率，单位【0.0001%】';


--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN shareholder_loan_contract.loan_contract_no; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.shareholder_loan_contract.loan_contract_no IS '借款合同编号';


--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN shareholder_loan_contract.loan_start_date; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.shareholder_loan_contract.loan_start_date IS '借款起始日期';


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN shareholder_loan_contract.loan_end_date; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.shareholder_loan_contract.loan_end_date IS '借款到期日期';


--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN shareholder_loan_contract.all_repaid_principal; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.shareholder_loan_contract.all_repaid_principal IS '已还本金，单位【0.01分】';


--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN shareholder_loan_contract.all_repaid_interest; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.shareholder_loan_contract.all_repaid_interest IS '已还利息，单位【0.01分】';


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN shareholder_loan_contract.is_finished; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.shareholder_loan_contract.is_finished IS '合同未结束0，合同已执行完毕1';


--
-- TOC entry 231 (class 1259 OID 17144)
-- Name: shareholder_loan_contract_sl_cid_seq; Type: SEQUENCE; Schema: fzzl; Owner: fzzl
--

ALTER TABLE fzzl.shareholder_loan_contract ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME fzzl.shareholder_loan_contract_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 17154)
-- Name: shareholder_loan_repaid_record; Type: TABLE; Schema: fzzl; Owner: fzzl
--

CREATE TABLE fzzl.shareholder_loan_repaid_record (
    id integer NOT NULL,
    repaid_date date,
    repaid_amount bigint,
    repaid_principal bigint,
    repaid_interest bigint,
    shareholder_loan_contract_id integer,
    create_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE fzzl.shareholder_loan_repaid_record OWNER TO fzzl;

--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE shareholder_loan_repaid_record; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON TABLE fzzl.shareholder_loan_repaid_record IS '股东借款还款计划，每季度20日结息';


--
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN shareholder_loan_repaid_record.id; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.shareholder_loan_repaid_record.id IS '自增主键';


--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN shareholder_loan_repaid_record.repaid_date; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.shareholder_loan_repaid_record.repaid_date IS '实际还款日期';


--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN shareholder_loan_repaid_record.repaid_amount; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.shareholder_loan_repaid_record.repaid_amount IS '实际还款金额（本息和），单位【0.01分】';


--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN shareholder_loan_repaid_record.repaid_principal; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.shareholder_loan_repaid_record.repaid_principal IS '实际还款本金，单位【0.01分】';


--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN shareholder_loan_repaid_record.repaid_interest; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.shareholder_loan_repaid_record.repaid_interest IS '实际还款利息，单位【0.01分】';


--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN shareholder_loan_repaid_record.shareholder_loan_contract_id; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON COLUMN fzzl.shareholder_loan_repaid_record.shareholder_loan_contract_id IS '应用层关联ShareholderLoanContract主键id';


--
-- TOC entry 233 (class 1259 OID 17152)
-- Name: shareholder_loan_repaid_record_rid_seq; Type: SEQUENCE; Schema: fzzl; Owner: fzzl
--

ALTER TABLE fzzl.shareholder_loan_repaid_record ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME fzzl.shareholder_loan_repaid_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3025 (class 0 OID 17112)
-- Dependencies: 222
-- Data for Name: bank_loan_contract; Type: TABLE DATA; Schema: fzzl; Owner: fzzl
--

COPY fzzl.bank_loan_contract (id, lease_contract_id, bank_contract_no, bank_contract_name, bank_account, interest_calc_method, bank_name, bank_branch, loan_principal, loan_method, contract_start_date, contract_end_date, actual_start_date, is_lpr, current_reprice_day, current_lpr, lpr_plus, current_rate, next_reprice_day, all_repaid_principal, all_repaid_interest, is_finished, contact_person, contact_tel, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 17120)
-- Dependencies: 224
-- Data for Name: bank_repay_plan; Type: TABLE DATA; Schema: fzzl; Owner: fzzl
--

COPY fzzl.bank_repay_plan (id, bank_loan_contract_id, plan_date, plan_amount, plan_principal, plan_interest, actual_date, actual_amount, actual_principal, actual_interest, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 17125)
-- Dependencies: 226
-- Data for Name: lease_contract; Type: TABLE DATA; Schema: fzzl; Owner: fzzl
--

COPY fzzl.lease_contract (id, contract_no, lessee, abbreviation, start_date, end_date, fee, margin, contract_principal, actual_principal, term_month, subject_matter, irr, is_lpr, current_reprice_day, "current_LPR", lpr_plus, current_rate, next_reprice_day, received_principal, received_interest, is_finished, lessee_info_id, created_at, updated_at) FROM stdin;
1	ZTL151201	丽水南城建设有限公司、丽水南城新区投资发展有限公司	丽水南城1	2015-12-30	2020-12-29	130000000000	160000000000	2000000000000	1710000000000	60	管网	86800	f	\N	\N	\N	52250	\N	1500000000000	315169097200	f	1	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
2	ZTL160101	丽水南城建设有限公司、丽水南城新区投资发展有限公司	丽水南城2	2016-02-01	2021-01-31	130000000000	160000000000	2000000000000	1710000000000	60	管网	86800	f	\N	\N	\N	52250	\N	1500000000000	323405729100	f	1	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
3	FZL170701	浙江临杭物流发展有限公司	临杭物流1	2017-07-10	2022-07-09	49500000000	0	1000000000000	950500000000	60	管网	67000	f	\N	\N	\N	38380	\N	702309451500	66475216200	f	2	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
4	FZL170702	浙江临杭物流发展有限公司	临杭物流2	2017-08-01	2022-07-09	49500000000	0	1000000000000	950500000000	60	管网	67900	f	\N	\N	\N	38380	\N	702309451500	64129771700	f	2	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
5	FZL170801	湖州西塞山开发建设有限公司	湖州西塞山1	2017-09-19	2022-09-18	52333330000	95000000000	1900000000000	1752667000000	60	管网	73000	f	\N	\N	\N	49900	\N	1083924037000	172199445900	f	3	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
6	FZL170802	湖州西塞山开发建设有限公司	湖州西塞山2	2017-09-19	2022-09-18	26166670000	47500000000	950000000000	876333000000	60	管网	73000	f	\N	\N	\N	49900	\N	541962018500	86099723100	f	3	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
7	FZL171201	浙江省德清县交通投资集团有限公司	德清交投	2017-12-29	2020-12-28	27900000000	22950000000	900000000000	849150000000	36	管网	77100	f	\N	\N	\N	52250	\N	680000000000	69636913200	f	4	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
8	FZL180301	湖州吴兴南太湖建设投资有限公司	吴兴南太湖1	2018-03-21	2023-03-20	63000000000	105000000000	1500000000000	1332000000000	60	管网	83800	f	\N	\N	\N	56050	\N	516666666600	145978678800	f	5	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
9	FZL180302	湖州吴兴南太湖建设投资有限公司	吴兴南太湖2	2018-03-21	2023-03-20	50400000000	84000000000	1200000000000	1065600000000	60	管网	83800	f	\N	\N	\N	56050	\N	413333333400	116782942900	f	5	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
10	FZL180701	杭州艾维医疗投资管理有限公司	艾维医疗1	2018-08-06	2020-08-05	64000000	160000000	16000000000	15776000000	24	牙床设备等	53300	f	\N	\N	\N	47500	\N	12000000000	933638700	f	6	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
13	FZL181101	杭州艾维医疗投资管理有限公司	艾维医疗2	2018-11-19	2020-11-18	550000000	1550000000	25000000000	22900000000	24	牙床设备等	84800	f	\N	\N	\N	57000	\N	18750000000	1615000100	f	6	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
14	FZL181102	浙江安吉长运汽车运输有限公司、安吉县公共交通服务有限公司	安吉交运	2018-11-16	2021-11-15	30000000000	70000000000	1000000000000	900000000000	36	公交车辆等	93600	f	\N	\N	\N	57950	\N	499999999800	69835115700	f	8	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
15	FZL181202-1	象山县第一自来水有限公司	象山水务1	2018-12-17	2023-12-15	56250000000	45000000000	1500000000000	1398750000000	60	自来水管网等	78500	f	\N	\N	\N	59375	\N	265958444800	85172422600	f	9	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
16	FZL181202-2	象山县第一自来水有限公司	象山水务2	2018-12-17	2023-12-15	60000000000	48000000000	1600000000000	1492000000000	60	自来水管网等	78500	f	\N	\N	\N	59375	\N	283689007800	90850584200	f	9	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
17	FZL181202-3	象山县第一自来水有限公司	象山水务3	2018-12-17	2023-12-15	71250000000	57000000000	1900000000000	1771750000000	60	自来水管网等	78500	f	\N	\N	\N	59375	\N	336880696700	107885068700	f	9	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
18	FZL181201-1	安吉清泉污水处理有限公司	安吉清泉1	2018-12-21	2023-12-20	68750000000	75000000000	1250000000000	1106250000000	60	污水处理设施设备	95000	f	\N	\N	\N	60800	\N	250000000000	88371111100	f	10	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
19	FZL181201-2	安吉清泉污水处理有限公司	安吉清泉2	2018-12-21	2023-12-20	68750000000	75000000000	1250000000000	1106250000000	60	污水处理设施设备	95000	f	\N	\N	\N	60800	\N	250000000000	88371111100	f	10	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
20	FZL181203-1	浙江省粮食集团有限公司	粮食集团	2018-12-24	2021-12-23	50880000000	0	1590000000000	1539120000000	36	粮库设施设备	73500	f	\N	\N	\N	56050	\N	254400000000	105656118400	f	11	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
21	FZL181203-3	浙江省镇海港中转粮库有限公司	镇海粮库	2018-12-24	2021-12-23	1408000000	0	44000000000	42592000000	36	粮库设施设备	73500	f	\N	\N	\N	56050	\N	7040000000	2923817100	f	12	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
22	FZL181203-4	宁波绿农米业有限公司	绿农米业	2018-12-24	2021-12-23	2784000000	0	87000000000	84216000000	36	粮库设施设备	73500	f	\N	\N	\N	56050	\N	13920000000	5781184000	f	13	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
23	FZL190301	浙江东南新材科技有限公司	东南新材	2019-03-28	2021-03-26	4500000000	12000000000	300000000000	283500000000	24	平整机组、三菱轧机、2号镀锌线	75200	f	\N	\N	\N	57000	\N	150000000000	15128750000	f	14	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
24	FZL190401-1	宁波市奉化区惠江基础设施建设有限公司	奉化惠江1	2019-04-18	2024-04-17	60000000000	90000000000	1500000000000	1350000000000	60	管网	85100	f	\N	\N	\N	62957	\N	89560270600	94089408600	f	15	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
25	FZL190401-2	宁波市奉化区惠江基础设施建设有限公司	奉化惠江2	2019-04-18	2024-04-17	60000000000	90000000000	1500000000000	1350000000000	60	管网	85100	f	\N	\N	\N	62957	\N	89560270600	94089408600	f	15	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
26	FZL190601-1	安吉县城西北开发有限公司	安吉城西北1	2019-06-10	2024-06-07	75000000000	75000000000	1500000000000	1350000000000	60	管廊及附属设备	89800	f	\N	\N	\N	59375	\N	150000000000	67761718800	f	16	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
27	FZL190601-2	安吉县城西北开发有限公司	安吉城西北2	2019-06-10	2024-06-07	75000000000	75000000000	1500000000000	1350000000000	60	管廊及附属设备	89800	f	\N	\N	\N	59375	\N	150000000000	67761718800	f	16	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
28	FZL190602-1	桐庐水务有限公司	桐庐水务1	2019-06-25	2024-06-24	45000000000	75000000000	1500000000000	1380000000000	60	污水管网	77000	f	\N	\N	\N	57000	\N	198459023800	62246211500	f	17	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
29	FZL190602-2	桐庐水务有限公司	桐庐水务2	2019-06-25	2024-06-24	45000000000	75000000000	1500000000000	1380000000000	60	污水管网	77000	f	\N	\N	\N	57000	\N	198459023800	62246211500	f	17	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
30	FZL190701-1	德清联创科技新城建设有限公司	德清联创1	2019-07-19	2024-07-18	52500000000	50000000000	1000000000000	897500000000	60	监控设施设备等	88900	f	\N	\N	\N	58900	\N	100000000000	43340583300	f	18	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
31	FZL190701-2	德清联创科技新城建设有限公司	德清联创2	2019-07-19	2024-07-18	52500000000	50000000000	1000000000000	897500000000	60	监控设施设备等	88900	f	\N	\N	\N	58900	\N	100000000000	43340583300	f	18	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
32	FZL191101-1	宁海科创集团有限公司	宁海科创1	2019-11-11	2024-11-08	48750000000	75000000000	1500000000000	1376250000000	60	污水管网	81800	f	\N	\N	\N	58900	\N	150000000000	43561458300	f	19	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
33	FZL191101-2	宁海科创集团有限公司	宁海科创2	2019-11-11	2024-11-08	48750000000	75000000000	1500000000000	1376250000000	60	污水管网	81800	f	\N	\N	\N	58900	\N	150000000000	43561458300	f	19	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
34	FZL191201	乐清市运输集团有限公司、乐清公交客运有限公司	乐清公交	2019-12-05	2024-12-04	15626000000	30050000000	601000000000	555324000000	60	公交车辆等	70500	f	\N	\N	\N	52250	\N	30050000000	7850562500	f	20	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
35	FZL191202-1	新昌县城市建设投资发展有限公司	新昌城发1	2019-12-20	2024-12-19	45000000000	45000000000	1500000000000	1410000000000	60	污水管网	77100	f	\N	\N	\N	59850	\N	0	22443750000	f	21	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
36	FZL191203（HGL192001)	长兴鑫能建设开发有限公司	长兴鑫能	2019-12-23	2024-12-20	25500000000	25000000000	500000000000	449500000000	60	供水管网、污水管网	85500	f	\N	\N	\N	59500	\N	0	7519949300	f	22	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
12	FZL180902	台州市水处理发展有限公司	台州水处理2	2018-09-17	2023-09-15	20700000000	50000000000	1000000000000	929300000000	60	污水处理设施设备	85600	f	\N	\N	\N	64000	\N	415000000000	95222222200	f	7	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
37	FZL191202-2	新昌县城市建设投资发展有限公司	新昌城发2	2020-01-10	2025-01-09	45000000000	45000000000	1500000000000	1410000000000	60	污水管网	77200	f	\N	\N	\N	59850	\N	0	22693125000	f	21	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
38	FZL200301	浙江省浦江县汽车运输有限公司、浦江县龙顺运输有限公司	浦江公交	2020-04-01	2023-03-24	30000000000	80000000000	1000000000000	920000000000	36	公交车辆等	80000	f	\N	\N	\N	61750	\N	0	0	f	23	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
11	FZL180901	台州市水处理发展有限公司	台州水处理1	2018-09-17	2023-09-15	20700000000	50000000000	1000000000000	929300000000	60	污水处理设施设备	85600	f	\N	\N	\N	64000	\N	415000000000	95222222200	f	7	2020-06-04 14:39:24.19	2020-06-04 14:39:24.19
\.


--
-- TOC entry 3031 (class 0 OID 17133)
-- Dependencies: 228
-- Data for Name: lease_repay_plan; Type: TABLE DATA; Schema: fzzl; Owner: fzzl
--

COPY fzzl.lease_repay_plan (id, lease_contract_id, period, plan_date, plan_amount, plan_principal, plan_interest, actual_date, actual_amount, actual_principal, actual_interest, create_at, updated_at) FROM stdin;
167	11	7	2020-06-17	80712888900	70000000000	10712888900	2020-06-12	80712888900	70000000000	10712888900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
187	12	7	2020-06-17	80712888900	70000000000	10712888900	2020-06-12	80712888900	70000000000	10712888900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
1	1	1	2016-03-19	23512500000	0	23512500000	2016-03-18	23512500000	0	23512500000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
2	1	2	2016-06-19	151705555600	125000000000	26705555600	2016-06-17	151705555600	125000000000	26705555600	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
3	1	3	2016-09-19	25036458300	0	25036458300	2016-09-19	25036458300	0	25036458300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
4	1	4	2016-12-19	149764322900	125000000000	24764322900	2016-12-19	149764322900	125000000000	24764322900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
5	1	5	2017-03-19	22859375000	0	22859375000	2017-03-17	22859375000	0	22859375000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
6	1	6	2017-06-19	148367361100	125000000000	23367361100	2017-06-16	148367361100	125000000000	23367361100	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
7	1	7	2017-09-19	21698263900	0	21698263900	2017-09-19	21698263900	0	21698263900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
8	1	8	2017-12-19	146462413200	125000000000	21462413200	2017-12-19	146462413200	125000000000	21462413200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
9	1	9	2018-03-19	19593750000	0	19593750000	2018-03-19	19593750000	0	19593750000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
10	1	10	2018-06-19	270029166700	250000000000	20029166700	2018-06-19	270029166700	250000000000	20029166700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
11	1	11	2018-09-19	16690972200	0	16690972200	2018-09-19	16690972200	0	16690972200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
12	1	12	2018-12-19	266509548600	250000000000	16509548600	2018-12-19	266509548600	250000000000	16509548600	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
13	1	13	2019-03-19	13062500000	0	13062500000	2019-03-19	13062500000	0	13062500000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
14	1	14	2019-06-19	263352777800	250000000000	13352777800	2019-06-18	263352777800	250000000000	13352777800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
15	1	15	2019-09-19	10014583300	0	10014583300	2019-09-19	10014583300	0	10014583300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
16	1	16	2019-12-19	259905729200	250000000000	9905729200	2019-12-19	259905729200	250000000000	9905729200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
17	1	17	2020-03-19	6603819400	0	6603819400	2020-03-19	6603819400	0	6603819400	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
21	2	1	2016-05-19	31640277800	0	31640277800	2016-05-19	31640277800	0	31640277800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
22	2	2	2016-08-19	151705555600	125000000000	26705555600	2016-08-19	151705555600	125000000000	26705555600	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
23	2	3	2016-11-19	25036458300	0	25036458300	2016-11-18	25036458300	0	25036458300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
24	2	4	2017-02-19	150036458300	125000000000	25036458300	2017-02-17	150036458300	125000000000	25036458300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
25	2	5	2017-05-19	22605381900	0	22605381900	2017-05-19	22605381900	0	22605381900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
26	2	6	2017-08-19	148367361100	125000000000	23367361100	2017-08-17	148367361100	125000000000	23367361100	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
27	2	7	2017-11-19	21698263900	0	21698263900	2017-11-19	21698263900	0	21698263900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
28	2	8	2018-02-19	146698263900	125000000000	21698263900	2018-02-19	146698263900	125000000000	21698263900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
29	2	9	2018-05-19	19376041700	0	19376041700	2018-05-19	19376041700	0	19376041700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
30	2	10	2018-08-19	270029166700	250000000000	20029166700	2018-08-17	270029166700	250000000000	20029166700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
31	2	11	2018-11-19	16690972200	0	16690972200	2018-11-19	16690972200	0	16690972200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
32	2	12	2019-02-19	266690972200	250000000000	16690972200	2019-02-19	266690972200	250000000000	16690972200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
33	2	13	2019-05-19	12917361100	0	12917361100	2019-05-17	12917361100	0	12917361100	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
34	2	14	2019-08-19	263352777800	250000000000	13352777800	2019-08-19	263352777800	250000000000	13352777800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
35	2	15	2019-11-19	10014583300	0	10014583300	2019-11-18	10014583300	0	10014583300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
36	2	16	2020-02-19	260014583300	250000000000	10014583300	2020-02-17	260014583300	250000000000	10014583300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
37	2	17	2020-05-19	6531250000	0	6531250000	2020-05-18	6531250000	0	6531250000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
41	3	1	2017-09-08	24394240300	17997573600	6396666700	2017-09-08	24394240300	17997573600	6396666700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
42	3	2	2017-11-10	171592932900	164997313600	6595619300	2017-11-10	171592932900	164997313600	6595619300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
43	3	3	2018-03-09	22358085900	11992969000	10365116900	2018-03-09	22358085900	11992969000	10365116900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
44	3	4	2018-09-06	264529098700	248995092400	15534006300	2018-09-06	264529098700	248995092400	15534006300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
45	3	5	2019-03-11	21022990100	9997357300	11025632800	2019-03-11	21022990100	9997357300	11025632800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
46	3	6	2019-09-10	253982985300	243330232100	10652753200	2019-09-04	253982985300	243330232100	10652753200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
47	3	7	2020-03-11	10904334500	4998913500	5905421000	2020-03-11	10904334500	4998913500	5905421000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
51	4	1	2017-09-08	22048795800	17997573600	4051222200	2017-09-08	22048795800	17997573600	4051222200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
52	4	2	2017-11-10	171592932900	164997313600	6595619300	2017-11-10	171592932900	164997313600	6595619300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
53	4	3	2018-03-09	22358085900	11992969000	10365116900	2018-03-09	22358085900	11992969000	10365116900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
54	4	4	2018-09-06	264529098700	248995092400	15534006300	2018-09-06	264529098700	248995092400	15534006300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
55	4	5	2019-03-11	21022990100	9997357300	11025632800	2019-03-11	21022990100	9997357300	11025632800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
56	4	6	2019-09-10	253982985300	243330232100	10652753200	2019-09-04	253982985300	243330232100	10652753200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
57	4	7	2020-03-11	10904334500	4998913500	5905421000	2020-03-11	10904334500	4998913500	5905421000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
61	5	1	2017-12-18	173802419400	149836558300	23965861100	2017-12-18	173802419400	149836558300	23965861100	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
62	5	2	2018-03-16	159753422600	138405317900	21348104700	2018-03-16	159753422600	138405317900	21348104700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
63	5	3	2018-06-18	147198486800	126198173900	21000312900	2018-06-18	147198486800	126198173900	21000312900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
64	5	4	2018-09-18	123916306400	104972115800	18944190600	2018-09-18	123916306400	104972115800	18944190600	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
65	5	5	2018-12-18	110712191300	93297993300	17414198000	2018-12-18	110712191300	93297993300	17414198000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
66	5	6	2019-03-18	108918264300	92859323500	16058940800	2019-03-18	108918264300	92859323500	16058940800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
67	5	7	2019-06-18	109249107100	94017463700	15231643400	2019-06-18	109249107100	94017463700	15231643400	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
68	5	8	2019-09-18	107639426800	93606715000	14032711800	2019-09-18	107639426800	93606715000	14032711800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
19	1	19	2020-09-19	3338194400	0	3338194400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
20	1	20	2020-12-29	253664756900	250000000000	3664756900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
38	2	18	2020-08-19	256676388900	250000000000	6676388900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
39	2	19	2020-11-19	3338194400	0	3338194400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
40	2	20	2021-01-31	252648784700	250000000000	2648784700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
48	3	8	2020-09-11	199171152100	193331522000	5839630100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
49	3	9	2021-03-10	3001914400	999264700	2002649700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
50	3	10	2022-07-09	108726160400	103359761800	5366398600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
58	4	8	2020-09-11	199171152100	193331522000	5839630100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
59	4	9	2021-03-10	3001914400	999264700	2002649700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
60	4	10	2022-07-09	108726160500	103359761800	5366398700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
69	5	9	2019-12-18	107473640300	94774176700	12699463600	2019-12-18	107473640300	94774176700	12699463600	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
70	5	10	2020-03-18	107460217900	95956198900	11504019000	2020-03-18	107460217900	95956198900	11504019000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
81	6	1	2017-12-18	86901209700	74918279100	11982930600	2017-12-18	86901209700	74918279100	11982930600	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
82	6	2	2018-03-16	79876711300	69202658900	10674052400	2018-03-16	79876711300	69202658900	10674052400	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
83	6	3	2018-06-18	73599243400	63099086900	10500156500	2018-06-18	73599243400	63099086900	10500156500	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
84	6	4	2018-09-18	61958153200	52486057900	9472095300	2018-09-18	61958153200	52486057900	9472095300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
85	6	5	2018-12-18	55356095700	46648996700	8707099000	2018-12-18	55356095700	46648996700	8707099000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
86	6	6	2019-03-18	54459132100	46429661700	8029470400	2019-03-18	54459132100	46429661700	8029470400	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
87	6	7	2019-06-18	54624553600	47008731900	7615821700	2019-06-18	54624553600	47008731900	7615821700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
88	6	8	2019-09-18	53819713400	46803357500	7016355900	2019-09-18	53819713400	46803357500	7016355900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
89	6	9	2019-12-18	53736820200	47387088400	6349731800	2019-12-18	53736820200	47387088400	6349731800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
90	6	10	2020-03-18	53730109000	47978099500	5752009500	2020-03-18	53730109000	47978099500	5752009500	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
101	7	1	2018-03-19	90450000000	80000000000	10450000000	2018-03-19	90450000000	80000000000	10450000000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
102	7	2	2018-06-19	85949277800	75000000000	10949277800	2018-06-19	85949277800	75000000000	10949277800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
103	7	3	2018-09-19	84947819400	75000000000	9947819400	2018-09-19	84947819400	75000000000	9947819400	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
104	7	4	2018-12-19	83849118100	75000000000	8849118100	2018-12-18	83849118100	75000000000	8849118100	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
105	7	5	2019-03-19	82772187500	75000000000	7772187500	2019-03-19	82772187500	75000000000	7772187500	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
106	7	6	2019-06-19	81943444400	75000000000	6943444400	2019-06-19	81943444400	75000000000	6943444400	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
107	7	7	2019-09-19	80941986100	75000000000	5941986100	2019-09-19	80941986100	75000000000	5941986100	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
108	7	8	2019-12-19	79886826400	75000000000	4886826400	2019-12-19	79886826400	75000000000	4886826400	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
109	7	9	2020-03-19	78896253500	75000000000	3896253500	2020-03-19	78896253500	75000000000	3896253500	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
113	8	1	2018-06-19	82363402800	61111111100	21252291700	2018-06-19	82363402800	61111111100	21252291700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
114	8	2	2018-09-19	81721595700	61111111100	20610484600	2018-09-18	81721595700	61111111100	20610484600	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
115	8	3	2018-12-19	80631734600	61111111100	19520623500	2018-12-18	80631734600	61111111100	19520623500	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
116	8	4	2019-03-19	79560902800	61111111100	18449791700	2019-03-18	79560902800	61111111100	18449791700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
117	8	5	2019-06-19	79095549400	61111111100	17984438300	2019-06-18	79095549400	61111111100	17984438300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
118	8	6	2019-09-19	78220200600	61111111100	17109089500	2019-09-19	78220200600	61111111100	17109089500	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
119	8	7	2019-12-19	91057287000	75000000000	16057287000	2019-12-19	91057287000	75000000000	16057287000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
120	8	8	2020-03-19	89994672500	75000000000	14994672500	2020-03-19	89994672500	75000000000	14994672500	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
133	9	1	2018-06-19	65890722200	48888888900	17001833300	2018-06-19	65890722200	48888888900	17001833300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
134	9	2	2018-09-19	65377276600	48888888900	16488387700	2018-09-18	65377276600	48888888900	16488387700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
135	9	3	2018-12-19	64505387700	48888888900	15616498800	2018-12-18	64505387700	48888888900	15616498800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
136	9	4	2019-03-19	63648722200	48888888900	14759833300	2019-03-18	63648722200	48888888900	14759833300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
137	9	5	2019-06-19	63276439500	48888888900	14387550600	2019-06-18	63276439500	48888888900	14387550600	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
138	9	6	2019-09-19	62576160500	48888888900	13687271600	2019-09-19	62576160500	48888888900	13687271600	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
72	5	12	2020-09-18	100883495900	91671209800	9212286100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
73	5	13	2020-12-18	100770379600	92814532000	7955847600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
74	5	14	2021-03-18	97516006300	90805446900	6710559400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
75	5	15	2021-06-18	94175297500	88473585800	5701711700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
76	5	16	2021-09-17	87767459000	83243693900	4523765100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
77	5	17	2021-12-17	81295669700	77821908100	3473761600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
78	5	18	2022-03-18	74444648200	71952501900	2492146300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
79	5	19	2022-06-17	67626124700	66041559300	1584565400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
80	5	20	2022-09-18	60349955500	59581895200	768060300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
91	6	11	2020-06-18	52038206000	46834815000	5203391000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
92	6	12	2020-09-18	50441747900	45835604900	4606143000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
93	6	13	2020-12-18	50385189800	46407266000	3977923800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
94	6	14	2021-03-18	48758003100	45402723400	3355279700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
95	6	15	2021-06-18	47087648700	44236792900	2850855800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
96	6	16	2021-09-17	43883729500	41621846900	2261882600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
97	6	17	2021-12-17	40647834800	38910954100	1736880700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
98	6	18	2022-03-18	37222324100	35976251000	1246073100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
99	6	19	2022-06-17	33813062300	33020779600	792282700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
100	6	20	2022-09-18	30174977800	29790947700	384030100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
110	7	10	2020-06-19	77937611100	75000000000	2937611100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
111	7	11	2020-09-18	76915107600	75000000000	1915107600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
112	7	12	2020-12-28	71026132000	70000000000	1026132000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
121	8	9	2020-06-19	89085157400	75000000000	14085157400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
122	8	10	2020-09-18	87869443300	75000000000	12869443300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
123	8	11	2020-12-18	86806828700	75000000000	11806828700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
124	8	12	2021-03-19	85744214100	75000000000	10744214100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
125	8	13	2021-06-18	84681599500	75000000000	9681599500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
126	8	14	2021-09-20	83903127300	75000000000	8903127300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
127	8	15	2021-12-20	82556370400	75000000000	7556370400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
128	8	16	2022-03-18	81279675900	75000000000	6279675900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
129	8	17	2022-06-20	80610189800	75000000000	5610189800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
130	8	18	2022-09-19	79368526600	75000000000	4368526600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
131	8	19	2022-12-19	81083689800	77777777800	3305912000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
132	8	20	2023-03-20	157759497000	155555555600	2203941400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
139	9	7	2019-12-19	72845829600	60000000000	12845829600	2019-12-19	72845829600	60000000000	12845829600	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
140	9	8	2020-03-19	71995738000	60000000000	11995738000	2020-03-19	71995738000	60000000000	11995738000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
153	10	1	2018-11-06	198444400	0	198444400	2018-11-06	198444400	0	198444400	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
154	10	2	2019-02-01	4198444400	4000000000	198444400	2019-01-28	4198444400	4000000000	198444400	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
155	10	3	2019-05-06	144083300	0	144083300	2019-04-26	144083300	0	144083300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
156	10	4	2019-08-06	4148833300	4000000000	148833300	2019-08-06	4148833300	4000000000	148833300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
157	10	5	2019-11-06	99222200	0	99222200	2019-11-05	99222200	0	99222200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
158	10	6	2020-02-06	4097111100	4000000000	97111100	2020-02-05	4097111100	4000000000	97111100	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
159	10	7	2020-05-06	47500000	0	47500000	2020-04-21	47500000	0	47500000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
161	11	1	2018-12-17	66177777800	50000000000	16177777800	2018-12-13	66177777800	50000000000	16177777800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
162	11	2	2019-03-15	65200000000	50000000000	15200000000	2019-03-14	65200000000	50000000000	15200000000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
163	11	3	2019-06-17	64720000000	50000000000	14720000000	2019-06-17	64720000000	50000000000	14720000000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
164	11	4	2019-09-17	73902222200	60000000000	13902222200	2019-09-17	73902222200	60000000000	13902222200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
165	11	5	2019-12-17	77780444400	65000000000	12780444400	2019-12-13	77780444400	65000000000	12780444400	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
166	11	6	2020-03-17	81728888900	70000000000	11728888900	2020-03-17	81728888900	70000000000	11728888900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
181	12	1	2018-12-17	66177777800	50000000000	16177777800	2018-12-13	66177777800	50000000000	16177777800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
182	12	2	2019-03-15	65200000000	50000000000	15200000000	2019-03-14	65200000000	50000000000	15200000000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
183	12	3	2019-06-17	64720000000	50000000000	14720000000	2019-06-17	64720000000	50000000000	14720000000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
184	12	4	2019-09-17	73902222200	60000000000	13902222200	2019-09-17	73902222200	60000000000	13902222200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
185	12	5	2019-12-17	77780444400	65000000000	12780444400	2019-12-13	77780444400	65000000000	12780444400	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
186	12	6	2020-03-17	81728888900	70000000000	11728888900	2020-03-17	81728888900	70000000000	11728888900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
201	14	1	2019-02-15	98303750000	83333333300	14970416700	2019-02-14	98303750000	83333333300	14970416700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
202	14	2	2019-05-16	96318425900	83333333300	12985092600	2019-05-15	96318425900	83333333300	12985092600	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
203	14	3	2019-08-16	95674537000	83333333300	12341203700	2019-08-16	95674537000	83333333300	12341203700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
204	14	4	2019-11-15	94561145800	83333333300	11227812500	2019-11-14	94561145800	83333333300	11227812500	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
205	14	5	2020-02-14	93098981400	83333333300	9765648100	2020-02-14	93098981400	83333333300	9765648100	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
206	14	6	2020-05-15	91878275400	83333333300	8544942100	2020-05-14	91878275400	83333333300	8544942100	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
142	9	10	2020-09-18	70295554600	60000000000	10295554600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
143	9	11	2020-12-18	69445463000	60000000000	9445463000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
144	9	12	2021-03-19	68595371300	60000000000	8595371300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
145	9	13	2021-06-18	67745279600	60000000000	7745279600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
146	9	14	2021-09-20	67122501900	60000000000	7122501900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
147	9	15	2021-12-20	66045096300	60000000000	6045096300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
148	9	16	2022-03-18	65023740700	60000000000	5023740700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
149	9	17	2022-06-20	64488151900	60000000000	4488151900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
150	9	18	2022-09-19	63494821300	60000000000	3494821300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
151	9	19	2022-12-19	64866951800	62222222200	2644729600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
152	9	20	2023-03-20	126207597500	124444444400	1763153100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
160	10	8	2020-08-05	4048027800	4000000000	48027800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
168	11	8	2020-09-17	69568000000	60000000000	9568000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
169	11	9	2020-12-17	68493333300	60000000000	8493333300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
170	11	10	2021-03-17	67440000000	60000000000	7440000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
171	11	11	2021-06-17	56624000000	50000000000	6624000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
172	11	12	2021-09-17	55806222200	50000000000	5806222200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
173	11	13	2021-12-17	54934222200	50000000000	4934222200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
174	11	14	2022-03-17	54080000000	50000000000	4080000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
175	11	15	2022-06-17	43352888900	40000000000	3352888900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
176	11	16	2022-09-16	42698666700	40000000000	2698666700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
177	11	17	2022-12-16	37022222200	35000000000	2022222200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
178	11	18	2023-03-17	31440000000	30000000000	1440000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
179	11	19	2023-06-16	30981333300	30000000000	981333300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
180	11	20	2023-09-15	30490666700	30000000000	490666700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
188	12	8	2020-09-17	69568000000	60000000000	9568000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
189	12	9	2020-12-17	68493333300	60000000000	8493333300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
190	12	10	2021-03-17	67440000000	60000000000	7440000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
191	12	11	2021-06-17	56624000000	50000000000	6624000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
192	12	12	2021-09-17	55806222200	50000000000	5806222200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
193	12	13	2021-12-17	54934222200	50000000000	4934222200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
194	12	14	2022-03-17	54080000000	50000000000	4080000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
195	12	15	2022-06-17	43352888900	40000000000	3352888900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
196	12	16	2022-09-16	42698666700	40000000000	2698666700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
197	12	17	2022-12-16	37022222200	35000000000	2022222200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
198	12	18	2023-03-17	31440000000	30000000000	1440000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
199	12	19	2023-06-16	30981333300	30000000000	981333300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
200	12	20	2023-09-15	30490666700	30000000000	490666700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
207	14	7	2020-08-14	90657569400	83333333300	7324236100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
208	14	8	2020-11-16	89503935200	83333333300	6170601900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
209	14	9	2021-02-10	88323472200	83333333300	4990138900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
210	14	10	2021-05-14	86874722200	83333333300	3541388900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
213	13	1	2019-02-18	368125000	0	368125000	2019-02-18	368125000	0	368125000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
214	13	2	2019-05-17	6598333300	6250000000	348333300	2019-05-14	6598333300	6250000000	348333300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
215	13	3	2019-08-16	270156300	0	270156300	2019-08-16	270156300	0	270156300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
216	13	4	2019-11-15	6520156300	6250000000	270156300	2019-11-15	6520156300	6250000000	270156300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
217	13	5	2020-02-14	180104200	0	180104200	2020-02-10	180104200	0	180104200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
218	13	6	2020-05-14	6428125000	6250000000	178125000	2020-05-12	6428125000	6250000000	178125000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
221	15	1	2019-06-17	175565433700	131034183700	44531250000	2019-06-14	175565433700	131034183700	44531250000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
222	15	2	2019-12-17	175565433700	134924261100	40641172600	2019-12-17	175565433700	134924261100	40641172600	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
231	16	1	2019-06-17	187269796000	139769796000	47500000000	2019-06-14	187269796000	139769796000	47500000000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
232	16	2	2019-12-17	187269796000	143919211800	43350584200	2019-12-17	187269796000	143919211800	43350584200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
241	17	1	2019-06-17	222382882700	165976632700	56406250000	2019-06-14	222382882700	165976632700	56406250000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
242	17	2	2019-12-17	222382882700	170904064000	51478818700	2019-12-17	222382882700	170904064000	51478818700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
251	18	1	2019-03-21	19000000000	0	19000000000	2019-03-21	19000000000	0	19000000000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
252	18	2	2019-06-21	144422222200	125000000000	19422222200	2019-06-21	144422222200	125000000000	19422222200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
253	18	3	2019-09-20	17290000000	0	17290000000	2019-09-20	17290000000	0	17290000000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
254	18	4	2019-12-20	142290000000	125000000000	17290000000	2019-12-20	142290000000	125000000000	17290000000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
255	18	5	2020-03-20	15368888900	0	15368888900	2020-03-20	15368888900	0	15368888900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
271	19	1	2019-03-21	19000000000	0	19000000000	2019-03-21	19000000000	0	19000000000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
272	19	2	2019-06-21	144422222200	125000000000	19422222200	2019-06-21	144422222200	125000000000	19422222200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
273	19	3	2019-09-20	17290000000	0	17290000000	2019-09-20	17290000000	0	17290000000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
274	19	4	2019-12-20	142290000000	125000000000	17290000000	2019-12-20	142290000000	125000000000	17290000000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
275	19	5	2020-03-20	15368888900	0	15368888900	2020-03-20	15368888900	0	15368888900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
212	14	12	2021-11-15	84554039700	83333333700	1220706000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
219	13	7	2020-08-14	91041700	0	91041700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
220	13	8	2020-11-18	6345000000	6250000000	95000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
223	15	3	2020-06-17	175565433700	138929825100	36635608600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
224	15	4	2020-12-17	175565433700	143054304300	32511129400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
225	15	5	2021-06-17	175565433700	147301228900	28264204800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
226	15	6	2021-12-17	175565433700	151674234100	23891199600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
227	15	7	2022-06-17	175565433700	156177063000	19388370700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
228	15	8	2022-12-16	175565433700	160813569500	14751864200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
229	15	9	2023-06-16	175565433700	165587722400	9977711300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
230	15	10	2023-12-15	175565433700	170503607900	5061825800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
233	16	3	2020-06-17	187269796000	148191813400	39077982600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
234	16	4	2020-12-17	187269796000	152591257900	34678538100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
235	16	5	2021-06-17	187269796000	157121310800	30148485200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
236	16	6	2021-12-17	187269796000	161785849800	25483946200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
237	16	7	2022-06-17	187269796000	166588867200	20680928800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
238	16	8	2022-12-16	187269796000	171534474200	15735321800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
239	16	9	2023-06-16	187269796000	176626903900	10642892100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
240	16	10	2023-12-15	187269796000	181870515000	5399281000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
243	17	3	2020-06-17	222382882700	175977778400	46405104300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
244	17	4	2020-12-17	222382882700	181202118700	41180764000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
245	17	5	2021-06-17	222382882700	186581556600	35801326100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
246	17	6	2021-12-17	222382882700	192120696600	30262186100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
247	17	7	2022-06-17	222382882700	197824279800	24558602900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
248	17	8	2022-12-16	222382882700	203697188100	18685694600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
249	17	9	2023-06-16	222382882700	209744448400	12638434300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
250	17	10	2023-12-15	222382882700	215971236700	6411646000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
256	18	6	2020-06-19	140368888900	125000000000	15368888900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
257	18	7	2020-09-21	13891111100	0	13891111100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
258	18	8	2020-12-21	138447777800	125000000000	13447777800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
259	18	9	2021-03-19	11146666700	0	11146666700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
260	18	10	2021-06-21	136906666700	125000000000	11906666700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
261	18	11	2021-09-21	9711111100	0	9711111100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
262	18	12	2021-12-21	134605555600	125000000000	9605555600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
263	18	13	2022-03-21	7600000000	0	7600000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
264	18	14	2022-06-21	132768888900	125000000000	7768888900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
265	18	15	2022-09-21	5826666700	0	5826666700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
266	18	16	2022-12-21	130763333300	125000000000	5763333300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
267	18	17	2023-03-21	3800000000	0	3800000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
268	18	18	2023-06-21	128884444400	125000000000	3884444400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
269	18	19	2023-09-21	1942222200	0	1942222200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
270	18	20	2023-12-20	126900000000	125000000000	1900000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
276	19	6	2020-06-19	140368888900	125000000000	15368888900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
277	19	7	2020-09-21	13891111100	0	13891111100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
278	19	8	2020-12-21	138447777800	125000000000	13447777800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
279	19	9	2021-03-19	11146666700	0	11146666700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
280	19	10	2021-06-21	136906666700	125000000000	11906666700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
291	22	1	2019-03-22	1191996700	0	1191996700	2019-03-22	1191996700	0	1191996700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
292	22	2	2019-06-24	8233269200	6960000000	1273269200	2019-06-24	8233269200	6960000000	1273269200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
293	22	3	2019-09-24	1146484100	0	1146484100	2019-09-24	1146484100	0	1146484100	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
294	22	4	2019-12-24	8094022300	6960000000	1134022300	2019-12-24	8094022300	6960000000	1134022300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
295	22	5	2020-03-24	1035411700	0	1035411700	2020-03-24	1035411700	0	1035411700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
303	20	1	2019-03-22	21784766700	0	21784766700	2019-03-22	21784766700	0	21784766700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
304	20	2	2019-06-24	150470091700	127200000000	23270091700	2019-06-24	150470091700	127200000000	23270091700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
305	20	3	2019-09-24	20952984700	0	20952984700	2019-09-24	20952984700	0	20952984700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
306	20	4	2019-12-24	147925234800	127200000000	20725234800	2019-12-24	147925234800	127200000000	20725234800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
307	20	5	2020-03-24	18923040500	0	18923040500	2020-03-24	18923040500	0	18923040500	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
315	21	1	2019-03-22	602848900	0	602848900	2019-03-22	602848900	0	602848900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
316	21	2	2019-06-24	4163952200	3520000000	643952200	2019-06-24	4163952200	3520000000	643952200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
317	21	3	2019-09-24	579831000	0	579831000	2019-09-24	579831000	0	579831000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
318	21	4	2019-12-24	4093528500	3520000000	573528500	2019-12-24	4093528500	3520000000	573528500	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
319	21	5	2020-03-24	523656500	0	523656500	2020-03-24	523656500	0	523656500	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
327	23	1	2019-06-26	4275000000	0	4275000000	2019-06-26	4275000000	0	4275000000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
328	23	2	2019-09-26	79370000000	75000000000	4370000000	2019-09-26	79370000000	75000000000	4370000000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
329	23	3	2019-12-26	3241875000	0	3241875000	2019-12-26	3241875000	0	3241875000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
330	23	4	2020-03-26	78241875000	75000000000	3241875000	2020-03-26	78241875000	75000000000	3241875000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
335	24	1	2019-07-18	37237679200	13366483400	23871195800	2019-07-18	37237679200	13366483400	23871195800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
336	24	2	2019-10-18	43152000000	19233536800	23918463200	2019-10-18	43152000000	19233536800	23918463200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
337	24	3	2020-01-17	48804000000	25451605100	23352394900	2020-01-17	48804000000	25451605100	23352394900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
338	24	4	2020-04-17	54456000000	31508645300	22947354700	2020-04-15	54456000000	31508645300	22947354700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
282	19	12	2021-12-21	134605555600	125000000000	9605555600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
283	19	13	2022-03-21	7600000000	0	7600000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
284	19	14	2022-06-21	132768888900	125000000000	7768888900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
285	19	15	2022-09-21	5826666700	0	5826666700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
286	19	16	2022-12-21	130763333300	125000000000	5763333300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
287	19	17	2023-03-21	3800000000	0	3800000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
288	19	18	2023-06-21	128884444400	125000000000	3884444400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
289	19	19	2023-09-21	1942222200	0	1942222200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
290	19	20	2023-12-20	126900000000	125000000000	1900000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
296	22	6	2020-06-24	14966789800	13920000000	1046789800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
297	22	7	2020-09-24	847401300	0	847401300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
298	22	8	2020-12-24	14758190400	13920000000	838190400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
299	22	9	2021-03-24	633925500	0	633925500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
300	22	10	2021-06-24	23268012700	22620000000	648012700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
301	22	11	2021-09-24	324006400	0	324006400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
302	22	12	2021-12-23	22936962800	22620000000	316962800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
308	20	6	2020-06-24	273530986000	254400000000	19130986000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
309	20	7	2020-09-24	15486988700	0	15486988700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
310	20	8	2020-12-24	269718651800	254400000000	15318651800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
311	20	9	2021-03-24	11585535000	0	11585535000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
312	20	10	2021-06-24	425242991300	413400000000	11842991300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
313	20	11	2021-09-24	5921495700	0	5921495700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
314	20	12	2021-12-23	419192767500	413400000000	5792767500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
320	21	6	2020-06-24	7569410900	7040000000	529410900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
321	21	7	2020-09-24	428570800	0	428570800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
322	21	8	2020-12-24	7463912400	7040000000	423912400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
323	21	9	2021-03-24	320606000	0	320606000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
324	21	10	2021-06-24	11767730600	11440000000	327730600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
325	21	11	2021-09-24	163865300	0	163865300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
326	21	12	2021-12-23	11600303000	11440000000	160303000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
331	23	5	2020-06-26	2185000000	0	2185000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
332	23	6	2020-09-25	77161250000	75000000000	2161250000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
333	23	7	2020-12-25	1080625000	0	1080625000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
334	23	8	2021-03-26	76080625000	75000000000	1080625000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
339	24	5	2020-07-17	59861341500	37415419500	22445922000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
340	24	6	2020-10-16	65519884700	43669396600	21850488100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
341	24	7	2021-01-18	72109435000	50256472400	21852962600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
342	24	8	2021-04-16	76616621000	56931949800	19684671200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
343	24	9	2021-07-16	82502266800	63052549700	19449717100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
344	24	10	2021-10-18	88773413000	69719002900	19054410100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
345	24	11	2022-01-18	94210514000	76683226700	17527287300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
346	24	12	2022-04-18	99672000000	83732677200	15939322800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
347	24	13	2022-07-18	105161539600	90377646000	14783893600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
348	24	14	2022-10-18	110976000100	97483733000	13492267100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
349	24	15	2023-01-18	116757607000	104833756800	11923850200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
350	24	16	2023-04-18	122280000000	112265368700	10014631300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
355	25	1	2019-07-18	37237679200	13366483400	23871195800	2019-07-18	37237679200	13366483400	23871195800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
356	25	2	2019-10-18	43152000000	19233536800	23918463200	2019-10-18	43152000000	19233536800	23918463200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
357	25	3	2020-01-17	48804000000	25451605100	23352394900	2020-01-17	48804000000	25451605100	23352394900	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
358	25	4	2020-04-17	54456000000	31508645300	22947354700	2020-04-15	54456000000	31508645300	22947354700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
375	26	1	2019-09-19	24986979200	0	24986979200	2019-09-19	24986979200	0	24986979200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
376	26	2	2019-12-19	172513020800	150000000000	22513020800	2019-12-16	172513020800	150000000000	22513020800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
377	26	3	2020-03-19	20261718800	0	20261718800	2020-03-19	20261718800	0	20261718800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
395	27	1	2019-09-19	24986979200	0	24986979200	2019-09-19	24986979200	0	24986979200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
396	27	2	2019-12-19	172513020800	150000000000	22513020800	2019-12-16	172513020800	150000000000	22513020800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
397	27	3	2020-03-19	20261718800	0	20261718800	2020-03-19	20261718800	0	20261718800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
415	28	1	2019-09-25	86901745100	65051745100	21850000000	2019-09-25	86901745100	65051745100	21850000000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
416	28	2	2019-12-25	86901745100	66226532400	20675212700	2019-12-25	86901745100	66226532400	20675212700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
417	28	3	2020-03-25	86901745100	67180746300	19720998800	2020-03-25	86901745100	67180746300	19720998800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
351	24	17	2023-07-18	127840359400	119501060100	8339299300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
352	24	18	2023-10-18	133584000000	127075713900	6508286100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
353	24	19	2024-01-18	139284519200	134820755700	4463763500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
354	24	20	2024-04-17	144865748000	142621000400	2244747600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
359	25	5	2020-07-17	59861341500	37415419500	22445922000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
360	25	6	2020-10-16	65519884700	43669396600	21850488100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
361	25	7	2021-01-18	72109435000	50256472400	21852962600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
362	25	8	2021-04-16	76616621000	56931949800	19684671200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
363	25	9	2021-07-16	82502266800	63052549700	19449717100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
364	25	10	2021-10-18	88773413000	69719002900	19054410100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
365	25	11	2022-01-18	94210514000	76683226700	17527287300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
366	25	12	2022-04-18	99672000000	83732677200	15939322800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
367	25	13	2022-07-18	105161539600	90377646000	14783893600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
368	25	14	2022-10-18	110976000100	97483733000	13492267100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
369	25	15	2023-01-18	116757607000	104833756800	11923850200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
370	25	16	2023-04-18	122280000000	112265368700	10014631300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
371	25	17	2023-07-18	127840359400	119501060100	8339299300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
372	25	18	2023-10-18	133584000000	127075713900	6508286100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
373	25	19	2024-01-18	139284519200	134820755700	4463763500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
374	25	20	2024-04-17	144865748000	142621000400	2244747600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
378	26	4	2020-06-19	170484375000	150000000000	20484375000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
379	26	5	2020-09-18	18010416700	0	18010416700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
380	26	6	2020-12-18	168010416700	150000000000	18010416700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
381	26	7	2021-03-19	15759114600	0	15759114600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
382	26	8	2021-06-18	165759114600	150000000000	15759114600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
383	26	9	2021-09-17	13507812500	0	13507812500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
384	26	10	2021-12-17	163507812500	150000000000	13507812500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
385	26	11	2022-03-18	11256510400	0	11256510400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
411	27	17	2023-09-19	4552083300	0	4552083300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
412	27	18	2023-12-19	154502604200	150000000000	4502604200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
413	27	19	2024-03-19	2251302100	0	2251302100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
414	27	20	2024-06-07	151979166700	150000000000	1979166700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
418	28	4	2020-06-25	86901745100	67942631600	18959113500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
419	28	5	2020-09-25	86901745100	68932329300	17969415800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
420	28	6	2020-12-25	86901745100	70120849000	16780896100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
386	26	12	2022-06-17	161256510400	150000000000	11256510400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
387	26	13	2022-09-19	9302083300	0	9302083300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
388	26	14	2022-12-19	159005208300	150000000000	9005208300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
389	26	15	2023-03-17	6531250000	0	6531250000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
390	26	16	2023-06-19	156976562500	150000000000	6976562500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
391	26	17	2023-09-19	4552083300	0	4552083300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
392	26	18	2023-12-19	154502604200	150000000000	4502604200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
393	26	19	2024-03-19	2251302100	0	2251302100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
394	26	20	2024-06-07	151979166700	150000000000	1979166700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
398	27	4	2020-06-19	170484375000	150000000000	20484375000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
399	27	5	2020-09-18	18010416700	0	18010416700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
400	27	6	2020-12-18	168010416700	150000000000	18010416700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
401	27	7	2021-03-19	15759114600	0	15759114600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
402	27	8	2021-06-18	165759114600	150000000000	15759114600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
403	27	9	2021-09-17	13507812500	0	13507812500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
404	27	10	2021-12-17	163507812500	150000000000	13507812500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
405	27	11	2022-03-18	11256510400	0	11256510400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
406	27	12	2022-06-17	161256510400	150000000000	11256510400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
407	27	13	2022-09-19	9302083300	0	9302083300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
408	27	14	2022-12-19	159005208300	150000000000	9005208300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
435	29	1	2019-09-25	86901745100	65051745100	21850000000	2019-09-25	86901745100	65051745100	21850000000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
436	29	2	2019-12-25	86901745100	66226532400	20675212700	2019-12-25	86901745100	66226532400	20675212700	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
437	29	3	2020-03-25	86901745100	67180746300	19720998800	2020-03-25	86901745100	67180746300	19720998800	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
455	30	1	2019-10-18	15052222200	0	15052222200	2019-10-18	15052222200	0	15052222200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
456	30	2	2020-01-17	114888611100	100000000000	14888611100	2020-01-17	114888611100	100000000000	14888611100	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
457	30	3	2020-04-17	13399750000	0	13399750000	2020-04-17	13399750000	0	13399750000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
475	31	1	2019-10-18	15052222200	0	15052222200	2019-10-18	15052222200	0	15052222200	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
476	31	2	2020-01-17	114888611100	100000000000	14888611100	2020-01-17	114888611100	100000000000	14888611100	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
477	31	3	2020-04-17	13399750000	0	13399750000	2020-04-17	13399750000	0	13399750000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
423	28	9	2021-09-24	86901745100	73195902300	13705842800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
424	28	10	2021-12-24	86901745100	74250533400	12651211700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
425	28	11	2022-03-25	86901745100	75320359700	11581385400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
426	28	12	2022-06-24	86901745100	76405600600	10496144500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
427	28	13	2022-09-23	86901745100	77506477900	9395267200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
428	28	14	2022-12-23	86901745100	78623217100	8278528000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
429	28	15	2023-03-24	86901745100	79756046600	7145698500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
430	28	16	2023-06-23	86901745100	80905198300	5996546800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
431	28	17	2023-09-25	86901745100	81911649000	4990096100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
432	28	18	2023-12-25	86901745100	83251117700	3650627400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
433	28	19	2024-03-25	86901745100	84450627600	2451117500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
434	28	20	2024-06-24	86901745100	85667420500	1234324600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
438	29	4	2020-06-25	86901745100	67942631600	18959113500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
439	29	5	2020-09-25	86901745100	68932329300	17969415800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
440	29	6	2020-12-25	86901745100	70120849000	16780896100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
441	29	7	2021-03-25	86901745100	71304476500	15597268600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
442	29	8	2021-06-25	86901745100	71996539100	14905206000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
443	29	9	2021-09-24	86901745100	73195902300	13705842800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
444	29	10	2021-12-24	86901745100	74250533400	12651211700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
445	29	11	2022-03-25	86901745100	75320359700	11581385400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
446	29	12	2022-06-24	86901745100	76405600600	10496144500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
447	29	13	2022-09-23	86901745100	77506477900	9395267200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
448	29	14	2022-12-23	86901745100	78623217100	8278528000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
449	29	15	2023-03-24	86901745100	79756046600	7145698500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
450	29	16	2023-06-23	86901745100	80905198300	5996546800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
451	29	17	2023-09-25	86901745100	81911649000	4990096100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
452	29	18	2023-12-25	86901745100	83251117700	3650627400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
453	29	19	2024-03-25	86901745100	84450627600	2451117500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
454	29	20	2024-06-24	86901745100	85667420500	1234324600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
458	30	4	2020-07-17	113399750000	100000000000	13399750000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
459	30	5	2020-10-19	12303555600	0	12303555600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
460	30	6	2021-01-19	112041777800	100000000000	12041777800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
461	30	7	2021-04-19	10307500000	0	10307500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
462	30	8	2021-07-19	110422027800	100000000000	10422027800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
463	30	9	2021-10-19	9031333300	0	9031333300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
464	30	10	2022-01-19	109031333300	100000000000	9031333300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
465	30	11	2022-04-19	7362500000	0	7362500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
466	30	12	2022-07-19	107444305600	100000000000	7444305600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
467	30	13	2022-10-19	6020888900	0	6020888900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
468	30	14	2023-01-19	106020888900	100000000000	6020888900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
469	30	15	2023-04-19	4417500000	0	4417500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
470	30	16	2023-07-19	104466583300	100000000000	4466583300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
471	30	17	2023-10-19	3010444400	0	3010444400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
472	30	18	2024-01-19	103010444400	100000000000	3010444400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
473	30	19	2024-04-19	1488861100	0	1488861100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
474	30	20	2024-07-18	101472500000	100000000000	1472500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
478	31	4	2020-07-17	113399750000	100000000000	13399750000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
479	31	5	2020-10-19	12303555600	0	12303555600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
480	31	6	2021-01-19	112041777800	100000000000	12041777800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
481	31	7	2021-04-19	10307500000	0	10307500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
482	31	8	2021-07-19	110422027800	100000000000	10422027800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
483	31	9	2021-10-19	9031333300	0	9031333300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
484	31	10	2022-01-19	109031333300	100000000000	9031333300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
485	31	11	2022-04-19	7362500000	0	7362500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
486	31	12	2022-07-19	107444305600	100000000000	7444305600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
487	31	13	2022-10-19	6020888900	0	6020888900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
488	31	14	2023-01-19	106020888900	100000000000	6020888900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
489	31	15	2023-04-19	4417500000	0	4417500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
490	31	16	2023-07-19	104466583300	100000000000	4466583300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
495	32	1	2020-02-11	97578333300	75000000000	22578333300	2020-02-10	97578333300	75000000000	22578333300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
496	32	2	2020-05-11	95983125000	75000000000	20983125000	2020-05-11	95983125000	75000000000	20983125000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
515	33	1	2020-02-11	97578333300	75000000000	22578333300	2020-02-10	97578333300	75000000000	22578333300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
516	33	2	2020-05-11	95983125000	75000000000	20983125000	2020-05-11	95983125000	75000000000	20983125000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
535	34	1	2020-03-04	37900562500	30050000000	7850562500	2020-03-04	37900562500	30050000000	7850562500	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
536	34	2	2020-06-04	37673768500	30050000000	7623768500	2020-06-02	37673768500	30050000000	7623768500	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
555	35	1	2020-03-19	22443750000	0	22443750000	2020-03-18	22443750000	0	22443750000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
492	31	18	2024-01-19	103010444400	100000000000	3010444400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
493	31	19	2024-04-19	1488861100	0	1488861100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
494	31	20	2024-07-18	101472500000	100000000000	1472500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
497	32	3	2020-08-11	95320500000	75000000000	20320500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
498	32	4	2020-11-11	94191583300	75000000000	19191583300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
499	32	5	2021-02-08	92473666700	75000000000	17473666700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
500	32	6	2021-05-11	91933750000	75000000000	16933750000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
501	32	7	2021-08-11	90804833300	75000000000	15804833300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
502	32	8	2021-11-11	89675916700	75000000000	14675916700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
503	32	9	2022-02-11	88547000000	75000000000	13547000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
504	32	10	2022-05-11	87013145800	75000000000	12013145800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
505	32	11	2022-08-11	86289166700	75000000000	11289166700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
506	32	12	2022-11-11	85160250000	75000000000	10160250000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
507	32	13	2023-02-10	83933166700	75000000000	8933166700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
508	32	14	2023-05-11	82730625000	75000000000	7730625000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
509	32	15	2023-08-11	81773500000	75000000000	6773500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
510	32	16	2023-11-10	80583229200	75000000000	5583229200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
511	32	17	2024-02-06	79319333300	75000000000	4319333300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
512	32	18	2024-05-10	78460375000	75000000000	3460375000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
513	32	19	2024-08-09	77233291700	75000000000	2233291700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
514	32	20	2024-11-08	76116645800	75000000000	1116645800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
517	33	3	2020-08-11	95320500000	75000000000	20320500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
518	33	4	2020-11-11	94191583300	75000000000	19191583300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
519	33	5	2021-02-08	92473666700	75000000000	17473666700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
520	33	6	2021-05-11	91933750000	75000000000	16933750000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
521	33	7	2021-08-11	90804833300	75000000000	15804833300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
522	33	8	2021-11-11	89675916700	75000000000	14675916700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
523	33	9	2022-02-11	88547000000	75000000000	13547000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
524	33	10	2022-05-11	87013145800	75000000000	12013145800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
525	33	11	2022-08-11	86289166700	75000000000	11289166700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
526	33	12	2022-11-11	85160250000	75000000000	10160250000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
527	33	13	2023-02-10	83933166700	75000000000	8933166700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
528	33	14	2023-05-11	82730625000	75000000000	7730625000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
529	33	15	2023-08-11	81773500000	75000000000	6773500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
530	33	16	2023-11-10	80583229200	75000000000	5583229200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
531	33	17	2024-02-06	79319333300	75000000000	4319333300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
532	33	18	2024-05-10	78460375000	75000000000	3460375000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
533	33	19	2024-08-09	77233291700	75000000000	2233291700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
534	33	20	2024-11-08	76116645800	75000000000	1116645800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
537	34	3	2020-09-04	37272517500	30050000000	7222517500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
538	34	4	2020-12-04	36797122300	30050000000	6747122300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
539	34	5	2021-03-04	36330450000	30050000000	6280450000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
540	34	6	2021-06-04	36068764600	30050000000	6018764600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
541	34	7	2021-09-03	35606453700	30050000000	5556453700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
542	34	8	2021-12-03	35209564100	30050000000	5159564100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
543	34	9	2022-03-04	34812674600	30050000000	4762674600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
544	34	10	2022-06-03	34415785000	30050000000	4365785000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
545	34	11	2022-09-02	34018895500	30050000000	3968895500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
546	34	12	2022-12-02	33622005900	30050000000	3572005900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
547	34	13	2023-03-03	33225116400	30050000000	3175116400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
548	34	14	2023-06-02	32828226800	30050000000	2778226800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
549	34	15	2023-09-04	32509842900	30050000000	2459842900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
550	34	16	2023-12-04	32034447700	30050000000	1984447700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
551	34	17	2024-03-04	31637558200	30050000000	1587558200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
552	34	18	2024-06-04	31253752900	30050000000	1203752900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
553	34	19	2024-09-04	30852501900	30050000000	802501900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
554	34	20	2024-12-04	30446889500	30050000000	396889500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
556	35	2	2020-06-19	172942500000	150000000000	22942500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
557	35	3	2020-09-18	20423812500	0	20423812500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
558	35	4	2020-12-18	170423812500	150000000000	20423812500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
559	35	5	2021-03-19	18154500000	0	18154500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
560	35	6	2021-06-18	168154500000	150000000000	18154500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
575	36	1	2020-03-23	7519949300	0	7519949300	2020-03-20	7519949300	0	7519949300	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
595	37	1	2020-04-10	22693125000	0	22693125000	2020-04-10	22693125000	0	22693125000	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
491	31	17	2023-10-19	3010444400	0	3010444400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
561	35	7	2021-09-17	15885187500	0	15885187500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
562	35	8	2021-12-17	165885187500	150000000000	15885187500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
563	35	9	2022-03-18	13615875000	0	13615875000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
409	27	15	2023-03-17	6531250000	0	6531250000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
421	28	7	2021-03-25	86901745100	71304476500	15597268600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
564	35	10	2022-06-17	163615875000	150000000000	13615875000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
565	35	11	2022-09-19	11720625000	0	11720625000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
566	35	12	2022-12-19	161346562500	150000000000	11346562500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
567	35	13	2023-03-17	8778000000	0	8778000000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
568	35	14	2023-06-19	159376500000	150000000000	9376500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
569	35	15	2023-09-19	6882750000	0	6882750000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
570	35	16	2023-12-19	156807937500	150000000000	6807937500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
571	35	17	2024-03-19	4538625000	0	4538625000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
572	35	18	2024-06-19	154588500000	150000000000	4588500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
573	35	19	2024-09-19	2294250000	0	2294250000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
574	35	20	2024-12-19	152269312500	150000000000	2269312500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
576	36	2	2020-06-23	32602586100	25000000000	7602586100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
577	36	3	2020-09-23	7222456800	0	7222456800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
578	36	4	2020-12-23	37143951800	30000000000	7143951800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
579	36	5	2021-03-23	6619208100	0	6619208100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
580	36	6	2021-06-23	44266301600	37500000000	6766301600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
581	36	7	2021-09-23	6196107700	0	6196107700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
582	36	8	2021-12-23	48628758700	42500000000	6128758700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
583	36	9	2022-03-23	5429238100	0	5429238100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
584	36	10	2022-06-23	53049887900	47500000000	5549887900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
585	36	11	2022-09-23	4827642200	0	4827642200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
586	36	12	2022-12-23	57275167800	52500000000	4775167800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
587	36	13	2023-03-23	3941775600	0	3941775600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
588	36	14	2023-06-23	61529370600	57500000000	4029370600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
589	36	15	2023-09-22	3120779000	0	3120779000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
590	36	16	2023-12-22	65620779000	62500000000	3120779000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
591	36	17	2024-03-22	2180785300	0	2180785300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
592	36	18	2024-06-21	69680785300	67500000000	2180785300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
593	36	19	2024-09-23	1204018300	0	1204018300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
594	36	20	2024-12-20	78627166000	77500000000	1127166000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
596	37	2	2020-07-10	172693125000	150000000000	22693125000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
597	37	3	2020-10-12	21097125000	0	21097125000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
598	37	4	2021-01-11	170423812500	150000000000	20423812500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
599	37	5	2021-04-12	18154500000	0	18154500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
600	37	6	2021-07-12	168154500000	150000000000	18154500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
601	37	7	2021-10-11	15885187500	0	15885187500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
602	37	8	2022-01-10	165885187500	150000000000	15885187500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
603	37	9	2022-04-11	13615875000	0	13615875000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
604	37	10	2022-07-11	163615875000	150000000000	13615875000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
605	37	11	2022-10-10	11346562500	0	11346562500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
606	37	12	2023-01-10	161471250000	150000000000	11471250000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
607	37	13	2023-04-10	8977500000	0	8977500000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
608	37	14	2023-07-10	159077250000	150000000000	9077250000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
609	37	15	2023-10-10	6882750000	0	6882750000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
610	37	16	2024-01-10	156882750000	150000000000	6882750000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
611	37	17	2024-04-10	4538625000	0	4538625000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
612	37	18	2024-07-10	154538625000	150000000000	4538625000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
613	37	19	2024-10-10	2294250000	0	2294250000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
614	37	20	2025-01-09	152269312500	150000000000	2269312500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
615	38	1	2020-07-02	15609027800	0	15609027800	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
616	38	2	2020-09-25	39579861100	25000000000	14579861100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
617	38	3	2020-12-25	15218802100	0	15218802100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
618	38	4	2021-04-02	41389479200	25000000000	16389479200	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
619	38	5	2021-07-02	14828576400	0	14828576400	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
620	38	6	2021-09-24	63687916700	50000000000	13687916700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
621	38	7	2021-12-24	14048125000	0	14048125000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
622	38	8	2022-04-01	65128750000	50000000000	15128750000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
623	38	9	2022-07-01	13267673600	0	13267673600	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
624	38	10	2022-09-23	262247083300	250000000000	12247083300	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
625	38	11	2022-12-23	9365416700	0	9365416700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
18	1	18	2020-06-19	256676388900	250000000000	6676388900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
71	5	11	2020-06-18	104076412100	93669630100	10406782000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
141	9	9	2020-06-19	71268125900	60000000000	11268125900	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
211	14	11	2021-08-16	85801574000	83333333300	2468240700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
281	19	11	2021-09-21	9711111100	0	9711111100	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
626	38	12	2023-03-24	609365416700	600000000000	9365416700	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
422	28	8	2021-06-25	86901745100	71996539100	14905206000	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
410	27	16	2023-06-19	156976562500	150000000000	6976562500	\N	\N	\N	\N	2020-06-04 14:38:26.01	2020-06-04 14:38:26.01
\.


--
-- TOC entry 3033 (class 0 OID 17138)
-- Dependencies: 230
-- Data for Name: lessee_info; Type: TABLE DATA; Schema: fzzl; Owner: fzzl
--

COPY fzzl.lessee_info (id, business_license, lessee, short_name, email, contact_person, contact_tel, customer_manager, risk_manager, create_at, updated_at) FROM stdin;
1	91331100558624445G	丽水南城建设有限公司、丽水南城新区投资发展有限公司	丽水南城	71920883@qq.com	王建民	15805880823	干贤强	朱芝萱	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
2	91330521686685410E	浙江临杭物流发展有限公司	临杭物流		沈祖定	13905827552	叶璐烨		2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
3	913305006938849600	湖州西塞山开发建设有限公司	湖州西塞山		周丽梅	13735151975	张维滨		2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
4	9133052114710404XP	浙江省德清县交通投资集团有限公司	德清交投	459392842@qq.com	范振超	13587944228	干贤强	唐施潜	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
5	91330500749815009R	湖州吴兴南太湖建设投资有限公司	吴兴南太湖	360769874@qq.com	习小明	13735102155	张维滨	朱芝萱	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
6	913301026680213707	杭州艾维医疗投资管理有限公司	艾维医疗		周彩霞	18806526911	沈洋		2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
8	91330523MA2B3MAW2Y	浙江安吉长运汽车运输有限公司、安吉县公共交通服务有限公司	安吉交运	1012930321@qq.com	黄志荣	18257219935	叶璐烨	唐施潜	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
9	91330225725140836W	象山县第一自来水有限公司	象山水务		严登	13806669288	叶璐烨		2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
10	91330523337023814U	安吉清泉污水处理有限公司	安吉清泉	369947935@qq.com	陈丽玥	13645720576	干贤强	唐施潜	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
11	913300001429155721	浙江省粮食集团有限公司	粮食集团	85287387@qq.com	韩秋萍	13758266016	叶璐烨	朱芝萱	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
12	913302111443586770	浙江省镇海港中转粮库有限公司	镇海粮库	896594907@qq.com	周惠平	13586835868	叶璐烨	朱芝萱	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
13	91330211340507203T	宁波绿农米业有限公司	绿农米业		周惠平	13586835868	叶璐烨		2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
14	9133010075721481XG	浙江东南新材科技有限公司	东南新材	2312696948@qq.com	董佳飞	15268829328	干贤强	唐施潜	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
15	91330283554535939U	宁波市奉化区惠江基础设施建设有限公司	奉化惠江	1973720588@qq.com	傅宁	15958879971	叶璐烨	朱芝萱	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
16	913305235835791213	安吉县城西北开发有限公司	安吉城西北	369947935@qq.com	陈丽玥	13645720576	干贤强	唐施潜	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
17	91330122143642588M	桐庐水务有限公司	桐庐水务	182223484@qq.com	毕诗韵	15757187176	沈洋	朱芝萱	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
18	91330521560970726A	德清联创科技新城建设有限公司	德清联创	568302652@qq.com	潘军杰	13867259226	张维滨	唐施潜	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
20	91330382580363990X	乐清市运输集团有限公司、乐清公交客运有限公司	乐清公交	363431530@qq.com	徐晓琴	13867787876	张维滨	唐施潜	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
21	91330624720002485C	新昌县城市建设投资发展有限公司	新昌城发	747683996@qq.com	何彬	19805851118	干贤强	朱芝萱	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
22	91330522076203146L	长兴鑫能建设开发有限公司	长兴鑫能	136658203@qq.com	钱超	18857200423	叶璐烨	朱芝萱	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
23	9133072684770058XW	浙江省浦江县汽车运输有限公司、浦江县龙顺运输有限公司	浦江公交	3061229049@qq.com	楼安琪	13735715108	叶璐烨	唐施潜	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
7	91331002720043180K	台州市水处理发展有限公司	台州水处理		陈宗耀	13757603578	张维滨	唐施潜	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
19	91330226066634217B	宁海科创集团有限公司	宁海科创		孔莉萍	13858279068	沈洋	唐施潜	2020-06-02 15:34:17.73	2020-06-02 15:34:17.73
\.


--
-- TOC entry 3035 (class 0 OID 17146)
-- Dependencies: 232
-- Data for Name: shareholder_loan_contract; Type: TABLE DATA; Schema: fzzl; Owner: fzzl
--

COPY fzzl.shareholder_loan_contract (id, creditor, abbreviation, loan_principal, loan_rate, loan_contract_no, loan_start_date, loan_end_date, all_repaid_principal, all_repaid_interest, is_finished, create_at, updated_at) FROM stdin;
1	浙江省国有资本运营有限公司	象山水务	2300000000000	53500	2018年第011号	2018-12-17	2021-12-17	1300000000000	\N	f	2020-06-04 15:31:57.05	2020-06-04 15:31:57.05
2	浙江省国有资本运营有限公司	奉化惠江	2700000000000	53500	2019年第006号	2019-04-18	2022-04-18	0	\N	f	2020-06-04 15:31:57.05	2020-06-04 15:31:57.05
3	浙江省国有资本运营有限公司	安吉城西北	2700000000000	53500	2019年第010号	2019-06-10	2022-06-10	0	\N	f	2020-06-04 15:31:57.05	2020-06-04 15:31:57.05
4	浙江省国有资本运营有限公司	德清联创	1795000000000	53500	2019年第014号	2019-07-19	2022-07-19	0	\N	f	2020-06-04 15:31:57.05	2020-06-04 15:31:57.05
5	浙江省国有资本运营有限公司	宁海科创	2750000000000	53500	2019年第019号	2019-11-11	2022-11-11	0	\N	f	2020-06-04 15:31:57.05	2020-06-04 15:31:57.05
6	浙江省国有资本运营有限公司	乐清公交	550000000000	53500	2019年第020号	2019-12-05	2022-12-05	0	\N	f	2020-06-04 15:31:57.05	2020-06-04 15:31:57.05
7	浙江省国有资本运营有限公司	新昌城发1	1400000000000	53500	2019年第022号	2019-12-20	2022-12-20	0	\N	f	2020-06-04 15:31:57.05	2020-06-04 15:31:57.05
8	浙江省国有资本运营有限公司	新昌城发2	1400000000000	53500	2020年第001号	2020-01-10	2023-01-10	0	\N	f	2020-06-04 15:31:57.05	2020-06-04 15:31:57.05
\.


--
-- TOC entry 3037 (class 0 OID 17154)
-- Dependencies: 234
-- Data for Name: shareholder_loan_repaid_record; Type: TABLE DATA; Schema: fzzl; Owner: fzzl
--

COPY fzzl.shareholder_loan_repaid_record (id, repaid_date, repaid_amount, repaid_principal, repaid_interest, shareholder_loan_contract_id, create_at, updated_at) FROM stdin;
1	2019-09-27	1300000000000	1300000000000	\N	1	2020-05-25 17:57:42.35	2020-05-25 17:57:42.35
\.


--
-- TOC entry 3144 (class 0 OID 0)
-- Dependencies: 221
-- Name: bank_loan_contract_bl_cid_seq; Type: SEQUENCE SET; Schema: fzzl; Owner: fzzl
--

SELECT pg_catalog.setval('fzzl.bank_loan_contract_id_seq', 1, false);


--
-- TOC entry 3145 (class 0 OID 0)
-- Dependencies: 223
-- Name: bank_repay_plan_pid_seq; Type: SEQUENCE SET; Schema: fzzl; Owner: fzzl
--

SELECT pg_catalog.setval('fzzl.bank_repay_plan_id_seq', 1, false);


--
-- TOC entry 3146 (class 0 OID 0)
-- Dependencies: 225
-- Name: lease_contract_cid_seq; Type: SEQUENCE SET; Schema: fzzl; Owner: fzzl
--

SELECT pg_catalog.setval('fzzl.lease_contract_id_seq', 39, false);


--
-- TOC entry 3147 (class 0 OID 0)
-- Dependencies: 227
-- Name: lease_repay_plan_pid_seq; Type: SEQUENCE SET; Schema: fzzl; Owner: fzzl
--

SELECT pg_catalog.setval('fzzl.lease_repay_plan_id_seq', 627, false);


--
-- TOC entry 3148 (class 0 OID 0)
-- Dependencies: 229
-- Name: lessee_info_customer_id_seq; Type: SEQUENCE SET; Schema: fzzl; Owner: fzzl
--

SELECT pg_catalog.setval('fzzl.lessee_info_id_seq', 24, true);


--
-- TOC entry 3149 (class 0 OID 0)
-- Dependencies: 231
-- Name: shareholder_loan_contract_sl_cid_seq; Type: SEQUENCE SET; Schema: fzzl; Owner: fzzl
--

SELECT pg_catalog.setval('fzzl.shareholder_loan_contract_id_seq', 9, false);


--
-- TOC entry 3150 (class 0 OID 0)
-- Dependencies: 233
-- Name: shareholder_loan_repaid_record_rid_seq; Type: SEQUENCE SET; Schema: fzzl; Owner: fzzl
--

SELECT pg_catalog.setval('fzzl.shareholder_loan_repaid_record_id_seq', 2, false);


--
-- TOC entry 2873 (class 2606 OID 17158)
-- Name: bank_loan_contract BankLoanContract_pkey; Type: CONSTRAINT; Schema: fzzl; Owner: fzzl
--

ALTER TABLE ONLY fzzl.bank_loan_contract
    ADD CONSTRAINT "BankLoanContract_pkey" PRIMARY KEY (id);


--
-- TOC entry 2882 (class 2606 OID 17167)
-- Name: lease_contract _copy_1; Type: CONSTRAINT; Schema: fzzl; Owner: fzzl
--

ALTER TABLE ONLY fzzl.lease_contract
    ADD CONSTRAINT lease_contract_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 17171)
-- Name: lease_repay_plan _copy_2; Type: CONSTRAINT; Schema: fzzl; Owner: fzzl
--

ALTER TABLE ONLY fzzl.lease_repay_plan
    ADD CONSTRAINT _copy_2 PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 17175)
-- Name: lessee_info _copy_3; Type: CONSTRAINT; Schema: fzzl; Owner: fzzl
--

ALTER TABLE ONLY fzzl.lessee_info
    ADD CONSTRAINT _copy_3 PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 17178)
-- Name: shareholder_loan_contract _copy_4; Type: CONSTRAINT; Schema: fzzl; Owner: fzzl
--

ALTER TABLE ONLY fzzl.shareholder_loan_contract
    ADD CONSTRAINT _copy_4 PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 17180)
-- Name: shareholder_loan_repaid_record _copy_5; Type: CONSTRAINT; Schema: fzzl; Owner: fzzl
--

ALTER TABLE ONLY fzzl.shareholder_loan_repaid_record
    ADD CONSTRAINT _copy_5 PRIMARY KEY (id);


--
-- TOC entry 2878 (class 2606 OID 17163)
-- Name: bank_repay_plan _copy_6; Type: CONSTRAINT; Schema: fzzl; Owner: fzzl
--

ALTER TABLE ONLY fzzl.bank_repay_plan
    ADD CONSTRAINT _copy_6 PRIMARY KEY (id);


--
-- TOC entry 2883 (class 1259 OID 17168)
-- Name: idx_abbreviation; Type: INDEX; Schema: fzzl; Owner: fzzl
--

CREATE INDEX idx_abbreviation ON fzzl.lease_contract USING btree (abbreviation);


--
-- TOC entry 2879 (class 1259 OID 17164)
-- Name: idx_bank_loan_contract_id; Type: INDEX; Schema: fzzl; Owner: fzzl
--

CREATE INDEX idx_bank_loan_contract_id ON fzzl.bank_repay_plan USING btree (bank_loan_contract_id);


--
-- TOC entry 3151 (class 0 OID 0)
-- Dependencies: 2879
-- Name: INDEX idx_bank_loan_contract_id; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON INDEX fzzl.idx_bank_loan_contract_id IS '关联BankLoanContract主键id';


--
-- TOC entry 2874 (class 1259 OID 17159)
-- Name: idx_bank_name; Type: INDEX; Schema: fzzl; Owner: fzzl
--

CREATE INDEX idx_bank_name ON fzzl.bank_loan_contract USING btree (bank_name);


--
-- TOC entry 2887 (class 1259 OID 17172)
-- Name: idx_cid_copy_1; Type: INDEX; Schema: fzzl; Owner: fzzl
--

CREATE INDEX idx_cid_copy_1 ON fzzl.lease_repay_plan USING btree (lease_contract_id);


--
-- TOC entry 3152 (class 0 OID 0)
-- Dependencies: 2887
-- Name: INDEX idx_cid_copy_1; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON INDEX fzzl.idx_cid_copy_1 IS '关联LeaseContract主键id';


--
-- TOC entry 2875 (class 1259 OID 17160)
-- Name: idx_lease_contract_id; Type: INDEX; Schema: fzzl; Owner: fzzl
--

CREATE INDEX idx_lease_contract_id ON fzzl.bank_loan_contract USING btree (lease_contract_id);


--
-- TOC entry 3153 (class 0 OID 0)
-- Dependencies: 2875
-- Name: INDEX idx_lease_contract_id; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON INDEX fzzl.idx_lease_contract_id IS '关联LeaseContract主键id';


--
-- TOC entry 2888 (class 1259 OID 17173)
-- Name: idx_lease_repay_plan_date; Type: INDEX; Schema: fzzl; Owner: fzzl
--

CREATE INDEX idx_lease_repay_plan_date ON fzzl.lease_repay_plan USING btree (plan_date);


--
-- TOC entry 2891 (class 1259 OID 17176)
-- Name: idx_lessee; Type: INDEX; Schema: fzzl; Owner: fzzl
--

CREATE INDEX idx_lessee ON fzzl.lessee_info USING btree (lessee);


--
-- TOC entry 2884 (class 1259 OID 17169)
-- Name: idx_lessee_info_id; Type: INDEX; Schema: fzzl; Owner: fzzl
--

CREATE INDEX idx_lessee_info_id ON fzzl.lease_contract USING btree (lessee_info_id);


--
-- TOC entry 3154 (class 0 OID 0)
-- Dependencies: 2884
-- Name: INDEX idx_lessee_info_id; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON INDEX fzzl.idx_lessee_info_id IS '关联LesseeInfo主键id';


--
-- TOC entry 2880 (class 1259 OID 17165)
-- Name: idx_plan_date; Type: INDEX; Schema: fzzl; Owner: fzzl
--

CREATE INDEX idx_plan_date ON fzzl.bank_repay_plan USING btree (plan_date);


--
-- TOC entry 2896 (class 1259 OID 17181)
-- Name: idx_repaid_date; Type: INDEX; Schema: fzzl; Owner: fzzl
--

CREATE INDEX idx_repaid_date ON fzzl.shareholder_loan_repaid_record USING btree (repaid_date);


--
-- TOC entry 2897 (class 1259 OID 17182)
-- Name: idx_sl_cid; Type: INDEX; Schema: fzzl; Owner: fzzl
--

CREATE INDEX idx_sl_cid ON fzzl.shareholder_loan_repaid_record USING btree (shareholder_loan_contract_id);


--
-- TOC entry 3155 (class 0 OID 0)
-- Dependencies: 2897
-- Name: INDEX idx_sl_cid; Type: COMMENT; Schema: fzzl; Owner: fzzl
--

COMMENT ON INDEX fzzl.idx_sl_cid IS '关联ShareholderLoanContrac主键id';


--
-- TOC entry 2876 (class 1259 OID 17161)
-- Name: idx_start_date; Type: INDEX; Schema: fzzl; Owner: fzzl
--

CREATE INDEX idx_start_date ON fzzl.bank_loan_contract USING btree (actual_start_date);


-- Completed on 2020-07-22 04:45:33 UTC

--
-- PostgreSQL database dump complete
--

