/* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* step 1:  AVIATION MAINTENANCE - aviation_maintenance  */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * */

select (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy, mr_document_date)),4)+ mr_document_nr_serial), * 
from aviation_maintenance
where  (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy, mr_document_date)),4)+ mr_document_nr_serial)
	like '00370988'
go


/* * * * * * * * * * * * * * * * * * * * * * * * */
/* step 2:  ORIGINAL REQUSITION - "original_rqn" */
/* * * * * * * * * * * * * * * * * * * * * * * * */

select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) ddsn, 
   fc, doc_id, qty_ord, rels_dt, ri_to, rqn_emv, rqn_apprvl_dt, rqst_no, cncl_dt, dt_last_prcsd, ui 
from original_rqn
where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn)
  in ('00370988')
go

ddsn		fc	doc_id	qty_ord	rels_dt				ri_to	rqn_emv		rqn_apprvl_dt		rqst_no		cncl_dt		dt_last_prcsd		ui
00370988	QU	A01		3		Feb  6 2020  4:49PM	NRP		11503.32	Feb  6 2020  3:42PM	JSL3190037298			Feb  6 2020  4:49PM	EA


/* * * * * * * * * * * * * * * * * * * * */
/* step 3: MATERIAL REQUEST TABLE - AOM */
/* * * * * * * * * * * * * * * * * * * * */

select mr_organization_code, organization_code, div_cd, sqdrn_unit, org_cd_fin, jon_uic,
(right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial) ddsn,   
   optar_ty, trnsmtl_fy, trnsmtl_dt, trnsmtl_no,  trnsmtl_amt, fund_code_original, request_emv, approved_date, matl_issue_date, 
   doc_id, dt_last_prcsd, supply_type_equip_code
from material_request_tbl
where  (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial)
  in ('00370988')
go

mr_organization_code	organization_code	div_cd	sqdrn_unit	org_cd_fin	jon_uic	ddsn	optar_ty	trnsmtl_fy	trnsmtl_dt	trnsmtl_no	trnsmtl_amt	fund_code_original	request_emv	approved_date	matl_issue_date	doc_id	dt_last_prcsd	supply_type_equip_code
09112					3    				3	09112	00370988	Non-Chargeable	2020			0.00	QU	11503.32	Feb  6 2020  3:42PM	Feb  6 2020  3:42PM	A0A	Feb  6 2020  3:42PM	

/* * * * * * * * * * * * * * * * * * * * */
/* STEP 4A: MATERIAL REQUEST LINE - AOM */
/* * * * * * * * * * * * * * * * * * * * */


select (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial) ddsn,
   niin, quantity_requested, quantity_issued, line_emv, cognizance_symbol, material_control_code, net_unit_price, unit_of_issue, 
   unit_price, qty_ordr, qty_subst, fsc, dt_last_prcsd, iss_dt, iss_rvrsl_dt, * 
from material_request_line 
where  (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial)
  in ('00370988')
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
  in ('00370988')
go



select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) ddsn, doc_suf_cd, 
  cmp_dt, qty_ord, qty_rcvd, qty_cncl, rqn_excpt_ty, suf_qty, adv_cd, fc, fc_svc_dsg, cog, dist_cd, 
  doc_id, est_shpg_dt,   pri, milstrip_rdd, media_sts_cd, proj_cd, rqn_emv, rqn_ty, ri_to, sgnl_cd, sup_niin, 
  sup_fsc, ui, upr, rqn_excpt_ty, trnsmtl_amt, trnsmtl_fy, dt_last_prcsd, optar_ty
from active_rqn_tbl
where   (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn)
  in ('00370988')
  and doc_suf_cd like 'A'
go





-- update active_rqn_tbl set
qty_ord	= 1,
qty_cncl = 0,
cmp_dt = null 
where   (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn)
  in ('00370988')
  and doc_suf_cd like 'A'
go


-- update active_rqn_tbl set
suf_qty = 0
where   (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn)
  in ('00370988')
  and doc_suf_cd in ('E', 'F')
go


select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn), * 
from rqn_status_in
where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn)
  in ('00370988')
go




NALC

select ddsn, ddsn_suf, lsc, lsc_dttm, ord_qty, cncl_qty, pod_qty
from dr09_requisition
where ddsn like '00370988'
go



select ddsn, ddsn_suf, lsc, lsc_dttm, ord_qty, cncl_qty, pod_qty
from dr09_requisition
where ddsn like '00370988'
and ddsn_suf like ' '
go

-- update dr09_requisition set
ord_qty = 1,
cncl_qty = 0,
lsc = 'REFER',
sup_sts_cd = 'BA',
sts_trans_dttm = "Feb 21 2020  3:13PM"
where ddsn like '00370988'
and ddsn_suf like 'A'
go


-- update dr09_requisition set
cncl_qty = 0
where ddsn like '00370988'
and ddsn_suf like ' '
go


select * from dr10_stathistory
where ddsn like '00370988'
and ddsn_suf like 'A'
and sup_sts_cd like 'CB'
go


-- delete from dr10_stathistory
where ddsn like '00370988'
and ddsn_suf like 'A'
and sup_sts_cd like 'CB'
go

-- update  dr10_stathistory set
sts_qty = 1
where ddsn like '00370988'
and ddsn_suf like 'A'
and sup_sts_cd like 'BA'
go



