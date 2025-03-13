/* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* step 1:  AVIATION MAINTENANCE - aviation_maintenance  */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * */

select (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy, mr_document_date)),4)+ mr_document_nr_serial), * 
from aviation_maintenance
where  (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy, mr_document_date)),4)+ mr_document_nr_serial) in 
(
'9247G905',
'9254G935',
'9220G922'
)
go

	mr_organization_code	mr_document_date	mr_document_nr_serial	niin	card_code	jcn_org_code	jcn_date	jcn_serial_nbr_aviation	jcn_suffix_code	supply_tec	work_unit_code	cage	aircraft_bureau_number	maint_tec	mcn
9220G922	09808	Aug  8 2019 12:00AM	G922	015554504	0	GKB	220	080		AHAA	15210	97499		AHAA	
9247G905	09808	Sep  4 2019 12:00AM	G905	015554504	0	GKB	247	458		AHAB	15210	97499		AHAB	
9254G935	09808	Sep 11 2019 12:00AM	G935	016076871	0	GKB	254	544		AHAA	26570	97499		AHAA	


/* * * * * * * * * * * * * * * * * * * * * * * * */
/* step 2:  ORIGINAL REQUSITION - "original_rqn" */
/* * * * * * * * * * * * * * * * * * * * * * * * */


select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) ddsn, 
   fc, doc_id, qty_ord, rels_dt, ri_to, rqn_emv, rqn_apprvl_dt, rqst_no, cncl_dt, dt_last_prcsd, ui 
from original_rqn
where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn)
  in (
'9247G905',
'9254G935',
'9220G922'
)
go


ddsn	fc	doc_id	qty_ord	rels_dt	ri_to	rqn_emv	rqn_apprvl_dt	rqst_no	cncl_dt	dt_last_prcsd	ui
9220G922	2N	A0A	1	Sep  5 2019 10:58AM	NRP	174297.00	Sep  5 2019 10:58AM			Sep  5 2019 10:58AM	EA
9247G905	2N	A0A	1	Sep  5 2019 10:59AM	NRP	174297.00	Sep  5 2019 10:59AM			Sep  5 2019 10:59AM	EA
9254G935	2N	A0A	1	Sep 12 2019  1:55PM	NRP	1507100.00	Sep 12 2019  1:55PM			Sep 12 2019  1:56PM	EA


-- update original_rqn set
fc = "9R"
where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn)
  in (
'9247G905',
'9254G935',
'9220G922'
)
go


/* * * * * * * * * * * * * * * * * * * * */
/* step 3: MATERIAL REQUEST TABLE - AOM */
/* * * * * * * * * * * * * * * * * * * * */

select mr_organization_code, organization_code, div_cd, sqdrn_unit, org_cd_fin, jon_uic,
(right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial) ddsn,   
   optar_ty, trnsmtl_fy, trnsmtl_dt, trnsmtl_no,  trnsmtl_amt, fund_code_original, request_emv, approved_date, matl_issue_date, 
   doc_id, dt_last_prcsd, supply_type_equip_code
from material_request_tbl
where  (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial)
in (
'9247G905',
'9254G935',
'9220G922'
)
go



FOREIGN KEY: 'material_request_tbl', constraint name = 'fk_mr_must_have'.

--ALTER TABLE supply.dbo.material_request_line
  DROP CONSTRAINT fk_mr_must_have 
go

--alter table material_request_tbl disable trigger
go

--update material_request_tbl set
fund_code_original = "9R"
where  (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial)
in (
'9247G905',
'9254G935',
'9220G922'
)
go

FOREIGN KEY: 'material_request_tbl', constraint name = 'fk_mr_must_have'.

--ALTER TABLE supply.dbo.material_request_line
    ADD CONSTRAINT fk_mr_must_have 
    FOREIGN KEY (mr_organization_code,mr_document_date,mr_document_nr_serial) 
    REFERENCES supply.dbo.material_request_tbl(mr_organization_code,mr_document_date,mr_document_nr_serial)
go

--alter table material_request_tbl enable trigger
go


/* * * * * * * * * * * * * * * * * * * * */
/* STEP 4A: MATERIAL REQUEST LINE - AOM */
/* * * * * * * * * * * * * * * * * * * * */


select (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial) ddsn,
   niin, quantity_requested, quantity_issued, line_emv, cognizance_symbol, material_control_code, net_unit_price, unit_of_issue, 
   unit_price, qty_ordr, qty_subst, fsc, dt_last_prcsd, iss_dt, iss_rvrsl_dt, * 
from material_request_line 
where  (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial)
in (
'9247G905',
'9254G935',
'9220G922'
)
go


/* * * * * * * * * * * * * * * * * * */
/* STEP 5B: ACTIVE REQUSITION TABLE  */
/* * * * * * * * * * * * * * * * * * */

select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) ddsn, doc_suf_cd, 
  cmp_dt, qty_ord, qty_rcvd, qty_cncl, rqn_excpt_ty, suf_qty, adv_cd, fc, fc_svc_dsg, cog, dist_cd, 
  doc_id, est_shpg_dt,   pri, milstrip_rdd, media_sts_cd, proj_cd, rqn_emv, rqn_ty, ri_to, sgnl_cd, sup_niin, 
  sup_fsc, ui, upr, rqn_excpt_ty, trnsmtl_amt, trnsmtl_fy, dt_last_prcsd, optar_ty
from active_rqn_tbl
where   (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn)
in (
'9247G905',
'9254G935',
'9220G922'
)
go

-- update active_rqn_tbl set
fc = "9R"
where   (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn)
like '9220G922'
go



select * from tl_fin_data
where fc in ('2N', '9R')
go



select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) ddsn, doc_suf_cd, 
  cmp_dt, qty_ord, qty_rcvd, qty_cncl, rqn_excpt_ty, suf_qty, adv_cd, fc, fc_svc_dsg, cog, dist_cd, 
  doc_id, est_shpg_dt,   pri, milstrip_rdd, media_sts_cd, proj_cd, rqn_emv, rqn_ty, ri_to, sgnl_cd, sup_niin, 
  sup_fsc, ui, upr, rqn_excpt_ty, trnsmtl_amt, trnsmtl_fy, dt_last_prcsd, optar_ty
from active_rqn_tbl
where fc like '9R'
-- and cog like '7R'
go


