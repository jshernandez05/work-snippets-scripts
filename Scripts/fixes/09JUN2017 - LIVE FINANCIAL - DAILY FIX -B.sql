select * from zq_owner
go

zqo_key	usid	uic	org_nm	baseline_db	do_crc_chk
1	M	57082	MARINE AVN LOGS SQD 13	0	1

select last_bor_dt from variable_parameters
go

last_bor_dt
May 31 2017 12:00AM


/* BATCH PROCESS TABLES - ACTION:  RESET "next_ser" */
select btch_prc_id, next_ser, *
from batch_process
where btch_prc_id like 'JSF404'
go

-- update batch_process set
next_ser = 493
where btch_prc_id like 'JSF404'
go


select btch_prc_id, btch_prc_name, next_ser
from batch_process
where btch_prc_id like 'JSF404'
go


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* STEP 1A:  FINANCIAL TABLES - DELETE "trnsmtl_no" for AOM  */

/* CURRNT FISCAL YEAR */
select fy, optar_ty, trnsmtl_no, bor_dt
from fin_trnsmtl
where fy like '2017'
and optar_ty like 'AOM'
and trnsmtl_no in (29, 30, 31, 32)
go

fy	optar_ty	trnsmtl_no	bor_dt
2017	AOM            	29	May 31 2017 12:00AM
2017	AOM            	30	May 31 2017 12:00AM
2017	AOM            	31	May 31 2017 12:00AM
2017	AOM            	32	May 31 2017 12:00AM


select fy, optar_ty, trnsmtl_no, bor_dt
from fin_trnsmtl
where fy like '2016'
and optar_ty like 'AOM'
and trnsmtl_no in (77, 78, 79)
go

fy	optar_ty	trnsmtl_no	bor_dt
2016	AOM            	77	May 31 2017 12:00AM
2016	AOM            	78	May 31 2017 12:00AM
2016	AOM            	79	May 31 2017 12:00AM


/* FY 2016 - SUMMARY "bor_mo_rpt_tec */

select fscl_yr, svc_dsg, org_cd, appn_ind, trnsmtl_no, trnsmtl_dt, fc, tec, jon, jon_uic,
       bor_rpt_ind, oblgn_fytd, cmltv_difnc, cmltv_gao, optar_ty
from bor_mo_rpt_tec
where fscl_yr like '2017'
and trnsmtl_no in (29, 30, 31, 32)

select fscl_yr, svc_dsg, org_cd, appn_ind, trnsmtl_no, trnsmtl_dt, fc, tec, jon, jon_uic,
       bor_rpt_ind, oblgn_fytd, cmltv_difnc, cmltv_gao, optar_ty
from bor_mo_rpt_tec
where fscl_yr like '2017'
and trnsmtl_no in (33)



select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) dsn,
    trnsmtl_no, trnsmtl_dt, trnsmtl_fy, optar_ty, fc, cog, doc_id, proj_cd, rqn_emv, sup_niin,
    ui, upr
from active_rqn_tbl
where trnsmtl_fy like '2017'
and optar_ty like 'AOM'
and convert(varchar(2), trnsmtl_no) like '3%'
order by trnsmtl_no asc,
      (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) asc


select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) dsn,
    trnsmtl_no, trnsmtl_dt, trnsmtl_fy, optar_ty, fc, cog, doc_id, proj_cd, rqn_emv, sup_niin,
    ui, upr
from active_rqn_tbl
where trnsmtl_fy like '2017'
and optar_ty like 'AOM'
and trnsmtl_no is null


select fscl_yr, svc_dsg, org_cd, appn_ind, trnsmtl_no, trnsmtl_dt, fc, tec, jon, jon_uic,
       bor_rpt_ind, oblgn_fytd, cmltv_difnc, cmltv_gao, optar_ty
from bor_mo_rpt_tec
where fscl_yr like '2017'
and trnsmtl_no in (29, 30, 31, 32, 33)


select (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy, mr_document_date)),4)+ mr_document_nr_serial) ddsn,
       fund_code_original, advice_code, request_emv, project_code, doc_id, trnsmtl_fy, trnsmtl_dt, trnsmtl_no, optar_ty, trnsmtl_amt,
       jon_uic
from material_request_tbl
where optar_ty like 'AOM'
and trnsmtl_fy like '2017'
and convert(varchar(2), trnsmtl_no) like '3%'
go


select (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy, mr_document_date)),4)+ mr_document_nr_serial) ddsn,
       fund_code_original, advice_code, request_emv, project_code, doc_id, trnsmtl_fy, trnsmtl_dt, trnsmtl_no, optar_ty, trnsmtl_amt,
       jon_uic
from material_request_tbl
where optar_ty like 'AOM'
and trnsmtl_fy like '2017'
and trnsmtl_no is null
and doc_id in ('A0A', 'MRI')
go


select "'" + (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy, mr_document_date)),4)+ mr_document_nr_serial) + "'," ddsn
from material_request_tbl
where optar_ty like 'AOM'
and trnsmtl_fy like '2017'
and trnsmtl_no is null
and doc_id in ('A0A')
go

select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) dsn,
    trnsmtl_no, trnsmtl_dt, trnsmtl_fy, optar_ty, fc, cog, doc_id, proj_cd, rqn_emv, sup_niin,
    ui, upr
from active_rqn_tbl
where trnsmtl_fy like '2017'
and optar_ty like 'AOM'
and trnsmtl_no is null


select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) dsn,
    trnsmtl_no, trnsmtl_dt, trnsmtl_fy, optar_ty, fc, cog, doc_id, proj_cd, rqn_emv, sup_niin,
    ui, upr
from active_rqn_tbl
where trnsmtl_fy like '2017'
and optar_ty like 'AOM'
and trnsmtl_no is null
and (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) in
(
'71512N07',
'71517F02',
'7151G668',
'71517C00',
'7151G670',
'7151G666',
'7151G160',
'71517F04',
'71517F03',
'71517C04',
'7151GB01',
'71517F00',
'71513277',
'71517C02',
'71512M03',
'7152G173',
'7152G178',
'7152G177',
'7152G100',
'7152G102',
'7152G672',
'7152G176',
'71518E00',
'71518E01',
'7152G107',
'7152G172',
'7152G171',
'7152G106',
'7151GB02',
'7152G174',
'7152G674',
'7152G675',
'7151G663',
'7131G667',
'71527R02',
'7152G190',
'7152G677',
'7153G130',
'7153G121',
'7153G125',
'7153G123',
'7153G127',
'71517R00',
'7153G128',
'7153G129',
'7153G190',
'7153G191',
'7153G192',
'7153G135',
'7153G134',
'7153G678',
'7153G679',
'7153G682',
'71563285',
'71563286',
'71563289',
'71562N09',
'71563287',
'71563288',
'71563296',
'71562N10',
'71563295',
'7146G105',
'71563292',
'7156G685',
'71563293',
'71562N17',
'7156G686',
'71517Y00',
'71525G06',
'71525G07',
'7156G699',
'7156G604',
'7156G612',
'7157G144',
'7156G684',
'7153G111',
'71536R00',
'71576R01',
'7157G152',
'71532224',
'71573200',
'71573201',
'71573H02',
'7157GC05',
'7157G164',
'71577C00',
'71577C07',
'71577C10',
'7157G627',
'7157G628',
'71576P00',
'71576P01',
'71583202',
'71563H02',
'71582104',
'7158G630',
'7158G108',
'7158G110',
'7158GC07',
'71593H19',
'7159G631',
'71597C02',
'71597F01',
'7159GB02',
'7159GB01',
'71597F00',
'7159GB04',
'7158G105',
'7159G125',
'7159G635',
'7159G641',
'7159G642',
'7159G643',
'7159G644',
'7159G645',
'7159G649',
'71596J01',
'7159GB05',
'7159GB00',
'7159G634',
'7159G637'
)
go




/* * * * * * * * * * * * * * * * * */
/* DROP TRIGGER "chk_mr_update1"   */
/* * * * * * * * * * * * * * * * * */

--alter table material_request_tbl enable trigger
go


update ..........


--alter table material_request_tbl disable trigger
go



/* * * * * * * * * * * * * * * * * * * * * */
/* STEP 5A: ACTIVE REQUSITION TABLE - AOM  */
/* * * * * * * * * * * * * * * * * * * * * */

/* CURRENT FISCAL YEAR */

select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) dsn,
    trnsmtl_no, trnsmtl_dt, trnsmtl_fy, optar_ty, fc, cog, doc_id, proj_cd, rqn_emv, sup_niin,
    ui, upr, *
from active_rqn_tbl
where trnsmtl_fy like '2017'
and optar_ty like 'AOM'
and trnsmtl_no = 32


select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) dsn,
    trnsmtl_no, trnsmtl_dt, trnsmtl_fy, optar_ty, fc, cog, doc_id, proj_cd, rqn_emv, sup_niin,
    ui, upr
from active_rqn_tbl
where trnsmtl_fy like '2017'
and optar_ty like 'AOM'
and trnsmtl_no in (13, 14, 15, 16, 17)


select
+ char(16) + char(10) + "update active_rqn_tbl set trnsmtl_no = null, trnsmtl_dt = null ",
+ char(16) + char(10) + "where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) like ",
+ char(16) + char(10) + "'" + (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) + "'",
+ char(16) + char(10) + "and doc_suf_cd like ", "'" + doc_suf_cd + "'"
+ char(16) + char(10) + "go"
from active_rqn_tbl
where trnsmtl_fy like '2017'
and optar_ty like 'AOM'
and trnsmtl_no = 16
go



/* PRIOR FISCAL YEAR */
select trnsmtl_fy, optar_ty, trnsmtl_no, trnsmtl_dt, *
from active_rqn_tbl
where trnsmtl_fy like '2015'
and optar_ty like 'AOM'
and trnsmtl_no = 75
go

select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) dsn,
    trnsmtl_no, trnsmtl_dt, trnsmtl_fy, optar_ty
    from active_rqn_tbl
where trnsmtl_fy like '2015'
and optar_ty like 'AOM'
and trnsmtl_no = 75
go

select "update active_rqn_tbl set trnsmtl_no = null, trnsmtl_dt = null ",
       "where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) like ",
       "'" + (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) + "'",
       "and doc_suf_cd like ", "'" + doc_suf_cd + "'"
from active_rqn_tbl
where trnsmtl_fy like '2015'
and optar_ty like 'AOM'
and trnsmtl_no = 75
go


/* * * * * * * * * * * * * * * * * * * * * */
/* REVIEW "trnsmtl_no" that was removed    */
/* * * * * * * * * * * * * * * * * * * * * */

/* CURRENT FISCAL YEAR */
select "financial_adjustment", adjmt_fy, trnsmtl_no, trnsmtl_dt, *
from financial_adjustment
where adjmt_fy like '2016'
and trnsmtl_mo = 79



select "update financial_adjustment set trnsmtl_no = null, trnsmtl_dt = null ",
+ char(13) + char(10) + "where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) like ",
       "'" + (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) + "'",
+ char(13) + char(10) + "and doc_suf_cd like ", "'" + doc_suf_cd + "'"
+ char(13) + char(10) + "and adjmt_fy like '2016'",
+ char(13) + char(10) + "and trnsmtl_no = 29",
+ char(13) + char(10) + "and trnsmtl_dt >= 'May  9 2016  9:51AM'"
+ char(13) + char(10) + "go"
from financial_adjustment
where adjmt_fy like '2016'
and trnsmtl_no = 29
and trnsmtl_dt >= 'May  9 2016  9:51AM'
go


/* PRIOR FISCAL YEAR */
select "financial_adjustment", adjmt_fy, trnsmtl_no, trnsmtl_dt, *
from financial_adjustment
where adjmt_fy like '2015'
and trnsmtl_no = 75
and trnsmtl_dt >= 'May  9 2016  9:51AM'
go

select "financial_adjustment", adjmt_fy, trnsmtl_no, trnsmtl_dt, adjmt_oblgn_val, auol_dscrptn, tec, optar_ty
from financial_adjustment
where adjmt_fy like '2015'
and trnsmtl_no = 75
and trnsmtl_dt >= 'May  9 2016  9:51AM'
go

	adjmt_fy	trnsmtl_no	trnsmtl_dt	adjmt_oblgn_val	auol_dscrptn	tec	optar_ty
financial_adjustment	2015	75	May  9 2016  9:51AM	-1434.00	BQ	SAAA	AOM
financial_adjustment	2015	75	May  9 2016  9:51AM	-1434.00	BQ	SAAA	AOM
financial_adjustment	2015	75	May  9 2016  9:51AM	-1434.00	BQ	SAAA	AOM
$ 4,302
financial_adjustment	2015	75	May  9 2016  9:51AM	-83287.00	BQ	AMAF	AOM
$ 83,287.00


select "update financial_adjustment set trnsmtl_no = null, trnsmtl_dt = null ",
+ char(13) + char(10) + "where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) like ",
       "'" + (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) + "'",
+ char(13) + char(10) + "and doc_suf_cd like ", "'" + doc_suf_cd + "'"
+ char(13) + char(10) + "and adjmt_fy like '2015'",
+ char(13) + char(10) + "and trnsmtl_no = 75",
+ char(13) + char(10) + "and trnsmtl_dt >= 'May  9 2016  9:51AM'"
+ char(13) + char(10) + "go"
from financial_adjustment
where adjmt_fy like '2015'
and trnsmtl_no = 75
and trnsmtl_dt >= 'May  9 2016  9:51AM'
go

--alter table financial_adjustment disable trigger
go

update financial_adjustment set trnsmtl_no = null, trnsmtl_dt = null
where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) like 	'51475P03'
and doc_suf_cd like 	' '
and adjmt_fy like '2015'
and trnsmtl_no = 75
and trnsmtl_dt >= 'May  9 2016  9:51AM'
go

update financial_adjustment set trnsmtl_no = null, trnsmtl_dt = null
where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) like 	'51475P05'
and doc_suf_cd like 	' '
and adjmt_fy like '2015'
and trnsmtl_no = 75
and trnsmtl_dt >= 'May  9 2016  9:51AM'
go

update financial_adjustment set trnsmtl_no = null, trnsmtl_dt = null
where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) like 	'52115P00'
and doc_suf_cd like 	' '
and adjmt_fy like '2015'
and trnsmtl_no = 75
and trnsmtl_dt >= 'May  9 2016  9:51AM'
go

update financial_adjustment set trnsmtl_no = null, trnsmtl_dt = null
where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) like 	'51673080'
and doc_suf_cd like 	' '
and adjmt_fy like '2015'
and trnsmtl_no = 75
and trnsmtl_dt >= 'May  9 2016  9:51AM'
go

--alter table financial_adjustment enable trigger
go

/* VERIFY DDSNs in FINANCIAL_ADJUSTMENT TABLE */
select "financial_adjustment", adjmt_fy, trnsmtl_no, trnsmtl_dt, *
from financial_adjustment
where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)+ dsn) in
(
'51475P03',
'51475P05',
'52115P00',
'51673080'
)
go
