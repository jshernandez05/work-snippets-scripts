PROBLEM: 8205G172 unable to process A01
The requisition posted in the R-Supply transaction ledger as an issue. 
The Marines reversed the issue and then attempted to process a referral. 
The referral then was suspended and cannot be reprocessed because the requisition 
was already previously used. The requisition was passed off station and already 
received but we need to process the requisition in R-Supply for financial accountability. 
Need assistance with processing the A01 into R-Supply to complete the transaction.


SOLUTION:

RSUPPLY
1.  DELETE 8205G172 from  material_request_line
2.  DELETE 8205G172 from  material_request_tbl
3.  DELETE 8205G172 from  aviation_maintenance

NALCOMIS OIMA
4.  REGENERATE 8205G172 as A0 DTO
5.  REPROCESS 8205G172 from Outgoing Interface Internal

RSUPPLY
6.  VERIFY RSUPPLY Log > Suspense > Requisition
7.  QUERY 8205G172
 

/* Step 1:  AVIATION MAINTENANCE - aviation_maintenance */

select (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy, mr_document_date)),4)+ mr_document_nr_serial), * 
from aviation_maintenance
where (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy, mr_document_date)),4)+ mr_document_nr_serial)
  like '8205G172'
go

mr_organization_code	mr_document_date	mr_document_nr_serial	niin	card_code	jcn_org_code	jcn_date	jcn_serial_nbr_aviation	jcn_suffix_code	supply_tec	work_unit_code	cage	aircraft_bureau_number	maint_tec	mcn
8205G172	09124	Nov 23 2015 12:00AM	3M00	006010486	0	GN1	120	019	 	GGDN	030000G	09384		GGDN	

--delete from aviation_maintenance
where (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy, mr_document_date)),4)+ mr_document_nr_serial)
  like '8205G172'
go


/* Step 2:  ORIGINAL REQUSITION - "original_rqn" */

select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) ddsn, 
   fc, doc_id, qty_ord, rels_dt, ri_to, rqn_emv, rqn_apprvl_dt, rqst_no, cncl_dt, dt_last_prcsd, ui 
from original_rqn
where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn)
  like '8205G172'
go

RESULTS: 0


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* Step 3: MATERIAL REQUEST TABLE - "material_request_tbl" */ 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

select optar_ty, doc_id, mr_organization_code,
  (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial) ddsn,   
   optar_ty, trnsmtl_fy, trnsmtl_dt, trnsmtl_no,  trnsmtl_amt, fund_code_original, request_emv, approved_date, matl_issue_date, 
   doc_id, dt_last_prcsd, supply_type_equip_code
from material_request_tbl
where (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial) 
  like '8205G172'
go

RESULTS:
optar_ty	doc_id	mr_organization_code	ddsn	optar_ty	trnsmtl_fy	trnsmtl_dt	trnsmtl_no	trnsmtl_amt	fund_code_original	request_emv	approved_date	matl_issue_date	doc_id	dt_last_prcsd	supply_type_equip_code
AOM	MRI	09124	8205G172	AOM	2016	Nov 25 2015  1:38PM	8	0.00	7L	2430.52	Nov 23 2015  3:51PM	Nov 23 2015 12:00AM	MRI	Nov 25 2015  1:39PM	GAAA

--alter table material_request_tbl disable trigger
go

ALTER TABLE supply.dbo.aviation_maintenance
 DROP CONSTRAINT fk_matlrqsttbl_avmaint 
go

ALTER TABLE supply.dbo.material_request_line
 DROP CONSTRAINT fk_mr_must_have 
go

--delete from material_request_tbl
where (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial) 
  like '8205G172'
go

--alter table material_request_tbl enable trigger
go

ALTER TABLE supply.dbo.aviation_maintenance
 ADD CONSTRAINT fk_matlrqsttbl_avmaint 
 FOREIGN KEY (mr_organization_code,mr_document_date,mr_document_nr_serial) 
 REFERENCES supply.dbo.material_request_tbl(mr_organization_code,mr_document_date,mr_document_nr_serial)
go

ALTER TABLE supply.dbo.material_request_line
 ADD CONSTRAINT fk_mr_must_have 
 FOREIGN KEY (mr_organization_code,mr_document_date,mr_document_nr_serial) 
 REFERENCES supply.dbo.material_request_tbl(mr_organization_code,mr_document_date,mr_document_nr_serial)
go


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* Step 4: MATERIAL REQUEST LINE - "material_request_tbl"  */ 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

select (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial) ddsn,
   niin, quantity_requested, quantity_issued, line_emv, cognizance_symbol, material_control_code, net_unit_price, unit_of_issue, 
   unit_price, qty_ordr, qty_subst, fsc, dt_last_prcsd, iss_dt, iss_rvrsl_dt   
from material_request_line
where (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial)
  like '8205G172'
go

RESULTS:
ddsn	niin	quantity_requested	quantity_issued	line_emv	cognizance_symbol	material_control_code	net_unit_price	unit_of_issue	unit_price	qty_ordr	qty_subst	fsc	dt_last_prcsd	iss_dt	iss_rvrsl_dt
8205G172	006010486	2	2	2430.52	9B	W	0.00	EA	1215.26	0	0	6695	Nov 25 2015  9:21AM	Nov 23 2015 12:00AM	Nov 25 2015  9:20AM

--alter table material_request_line disable trigger
go

--delete from material_request_line
where (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial)
  like '8205G172'
go

--alter table material_request_line enable trigger
go


/* Step 5:  ACTIVE REQUSITION TABLE - "active_rqn_tbl" */

select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) ddsn, doc_suf_cd, 
  cmp_dt, qty_ord, suf_qty, qty_rcvd, qty_cncl, rqn_excpt_ty, suf_qty, adv_cd, fc, fc_svc_dsg, cog, dist_cd, 
  doc_id, est_shpg_dt,   pri, milstrip_rdd, media_sts_cd, proj_cd, rqn_emv, rqn_ty, ri_to, sgnl_cd, sup_niin, 
  sup_fsc, ui, upr, rqn_excpt_ty, trnsmtl_amt, trnsmtl_fy, dt_last_prcsd, optar_ty
from active_rqn_tbl
where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn)
  like '0267GJ25'
go

results: 0


alter table active_rqn_tbl disable trigger
go

UPDATE active_rqn_tbl set
cmp_dt = "Sep 27 2021  1:54PM"
where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn)
  like '0267GJ25'
and doc_suf_cd like ' '
go

alter table active_rqn_tbl enable trigger
go


select * from optar
where fiscal_year like '2018'
go






select "rqn_sts_in", doc_id, niin,
(right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)
    + dsn) ddsn, *
from rqn_status_in
where ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '83460342' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81981662' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81921334' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81920322' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81831547' and  doc_suf_cd like 'E')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81360281' and  doc_suf_cd like 'E')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '80170714' and  doc_suf_cd like 'E')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '72900087' and  doc_suf_cd like 'E')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '72631577' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '71930642' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12361524' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12290285' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12290285' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12290285' and  doc_suf_cd like 'H')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12100390' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12100390' and  doc_suf_cd like 'H')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12100390' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '11941413' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '11941413' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '11680630' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '11680367' and  doc_suf_cd like 'E')
go





alter table rqn_status_in disable trigger

delete from rqn_status_in 
where ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '83460342' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81981662' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81921334' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81920322' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81831547' and  doc_suf_cd like 'E')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81360281' and  doc_suf_cd like 'E')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '80170714' and  doc_suf_cd like 'E')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '72900087' and  doc_suf_cd like 'E')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '72631577' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '71930642' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12361524' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12290285' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12290285' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12290285' and  doc_suf_cd like 'H')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12100390' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12100390' and  doc_suf_cd like 'H')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12100390' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '11941413' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '11941413' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '11680630' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '11680367' and  doc_suf_cd like 'E')
go

alter table rqn_status_in enable trigger

select "rqn_sts_out", doc_id, niin,
(right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy, doc_dt)),4)
    + dsn) ddsn, *
from rqn_status_out
where ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '83460342' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81981662' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81921334' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81920322' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81831547' and  doc_suf_cd like 'E')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81360281' and  doc_suf_cd like 'E')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '80170714' and  doc_suf_cd like 'E')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '72900087' and  doc_suf_cd like 'E')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '72631577' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '71930642' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12361524' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12290285' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12290285' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12290285' and  doc_suf_cd like 'H')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12100390' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12100390' and  doc_suf_cd like 'H')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12100390' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '11941413' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '11941413' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '11680630' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '11680367' and  doc_suf_cd like 'E')
go


alter table rqn_status_out disable trigger

delete from rqn_status_out
where ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '83460342' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81981662' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81921334' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81920322' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81831547' and  doc_suf_cd like 'E')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '81360281' and  doc_suf_cd like 'E')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '80170714' and  doc_suf_cd like 'E')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '72900087' and  doc_suf_cd like 'E')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '72631577' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '71930642' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12361524' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12290285' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12290285' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12290285' and  doc_suf_cd like 'H')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12100390' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12100390' and  doc_suf_cd like 'H')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '12100390' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '11941413' and  doc_suf_cd like 'F')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '11941413' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '11680630' and  doc_suf_cd like 'G')
	or ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '11680367' and  doc_suf_cd like 'E')
go

alter table rqn_status_out enable trigger



