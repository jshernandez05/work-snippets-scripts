select
"insert active_rqn_tbl", 
+ char(13) + char(10) + "(",
+ char(13) + char(10) + "org_cd, doc_dt, dsn, doc_suf_cd, adv_cd, fc,  fc_svc_dsg,",
+ char(13) + char(10) + "cog, cmp_dt, delv_cd, delv_dt, dist_cd, doc_id, eftvns_rpt_dt, est_shpg_dt, intnl_mov_dt,",
+ char(13) + char(10) + "intnl_mov_cd, pri, milstrip_rdd, media_sts_cd, proj_cd, qty_ord, qty_cncl, qty_rcvd,",
+ char(13) + char(10) + "rqn_emv, rqn_ty, ri_to, ship_dt, sgnl_cd, seas_rpt_dt, supadd, sup_niin, sup_fsc, ui, upr,",
+ char(13) + char(10) + "rqn_excpt_ty, mr_org_cd, mr_doc_dt, mr_dsn, excpt_cd, suf_qty, rfi_qty_ti, trnsmtl_dt,",
+ char(13) + char(10) + "trnsmtl_no,	trnsmtl_amt, trnsmtl_fy, dt_last_prcsd,	optar_ty, ibs_rip_dt,",
+ char(13) + char(10) + "bearer_pu_ind,	piin_ind,	faux_doc_id",
+ char(13) + char(10) + ")"
+ char(13) + char(10) + "values",
+ char(13) + char(10) + "(",
+ char(13) + char(10) + "'" + orig.org_cd + "',", "'", orig.doc_dt, "',",  "'" + orig.dsn + "',", "' ',", "'" + mrt.advice_code + "',", 
                           "'" + orig.fc + "',",
+ char(13) + char(10) + "'" + orig.fc_svc_dsg + "',", "'" + mrl.cognizance_symbol + "',", "NULL,", "' ',", "' ',", 
+ char(13) + char(10) + "'" + mrt.fc_service_designator_code + "',", "'" + orig.doc_id + "',", "' ',", "' ',", "' ',", "' ',",
+ char(13) + char(10) + "'" + mrt.issue_priority_designatr + "',", "' ',", "'" + orig.media_sts_cd + "',", 
+ char(13) + char(10) + "'" + mrt.project_code + "',", orig.qty_ord, ",",  "0,",   "0,",  orig.rqn_emv, ",",  "'" + orig.rqn_ty + "',",
+ char(13) + char(10) + "'" + orig.ri_to + "',",   "' ',", "'" + orig.sgnl_cd + "',", "' ',", "'" + mrt.supplementary_address + "',",
+ char(13) + char(10) + "'" + mrl.niin + "',", "'" + mrl.fsc + "',", "'" + orig.ui + "',", mrl.unit_price, ",", "' " + rqn_excpt_ty + "',", 
+ char(13) + char(10) + "'" + orig.mr_org_cd + "',",   "'", orig.mr_doc_dt,  "',",   "'" + orig.mr_dsn + "',", "' ',", "0,", "0,", "' ',", 
+ char(13) + char(10) + "NULL,", "0.00,", "'2016',", "' ',", "'AOM',", "' ',", "0,", "0,", "' '",
+ char(13) + char(10) + ")",
+ char(13) + char(10) + "go"
from original_rqn orig, 
     material_request_line mrl,
     material_request_tbl mrt
where (right(convert(varchar,datepart(yy,orig.doc_dt)*1000+datepart(dy,orig.doc_dt )),4)+ orig.dsn)
       = (right(convert(varchar,datepart(yy,mrl.mr_document_date)*1000+datepart(dy,mrl.mr_document_date)),4)
          + mrl.mr_document_nr_serial)
and (right(convert(varchar,datepart(yy,orig.doc_dt)*1000+datepart(dy,orig.doc_dt )),4)+ orig.dsn)
       = (right(convert(varchar,datepart(yy,mrt.mr_document_date)*1000+datepart(dy,mrt.mr_document_date)),4)
         + mrt.mr_document_nr_serial)
and (right(convert(varchar,datepart(yy,orig.doc_dt)*1000+datepart(dy,orig.doc_dt )),4)+ orig.dsn)
  like '60902T02'
go



/* CORRECT FORMAT */

ALTER TABLE supply.dbo.active_rqn_tbl
  DROP CONSTRAINT fk_adv_cd_lstd_on_actrqn 
go
ALTER TABLE supply.dbo.active_rqn_tbl
  DROP CONSTRAINT fk_orqn_must_have_arqn
go
alter table active_rqn_tbl disable trigger
go	
insert active_rqn_tbl	
(	
org_cd, doc_dt, dsn, doc_suf_cd, adv_cd, fc,  fc_svc_dsg,	
cog, cmp_dt, delv_cd, delv_dt, dist_cd, doc_id, eftvns_rpt_dt, est_shpg_dt, intnl_mov_dt,	
intnl_mov_cd, pri, milstrip_rdd, media_sts_cd, proj_cd, qty_ord, qty_cncl, qty_rcvd,	
rqn_emv, rqn_ty, ri_to, ship_dt, sgnl_cd, seas_rpt_dt, supadd, sup_niin, sup_fsc, ui, upr,	
rqn_excpt_ty, mr_org_cd, mr_doc_dt, mr_dsn, excpt_cd, suf_qty, rfi_qty_ti, trnsmtl_dt,	
trnsmtl_no,	trnsmtl_amt, trnsmtl_fy, dt_last_prcsd,	optar_ty, ibs_rip_dt,	
bearer_pu_ind,	piin_ind,	faux_doc_id	
)
values	
(	
'09124',	'Feb  1 2021 12:00AM',	'6J53',	' ',	'2B',	'7L',	
'R',	'9B',	NULL,	' ',	' ',	
'R',	'A01',	' ',	' ',	' ',	' ',	
'05',	' ',	'S',	
'ZQ2',	1	,	0,	0,	12.49	,	'A',	
'NRP',	' ',	'A',	' ',	'YWC71B',	
'009895002',	'5305',	'HD',	12.49	,	' ',	
'09124',	'Feb  1 2021 12:00AM',	'6J53',	' ',	0,	0,	' ',	
NULL,	0.00,	'2016',	' ',	'AOM',	' ',	0,	0,	' '	
)	
go
insert active_rqn_tbl	
(	
org_cd, doc_dt, dsn, doc_suf_cd, adv_cd, fc,  fc_svc_dsg,	
cog, cmp_dt, delv_cd, delv_dt, dist_cd, doc_id, eftvns_rpt_dt, est_shpg_dt, intnl_mov_dt,	
intnl_mov_cd, pri, milstrip_rdd, media_sts_cd, proj_cd, qty_ord, qty_cncl, qty_rcvd,	
rqn_emv, rqn_ty, ri_to, ship_dt, sgnl_cd, seas_rpt_dt, supadd, sup_niin, sup_fsc, ui, upr,	
rqn_excpt_ty, mr_org_cd, mr_doc_dt, mr_dsn, excpt_cd, suf_qty, rfi_qty_ti, trnsmtl_dt,	
trnsmtl_no,	trnsmtl_amt, trnsmtl_fy, dt_last_prcsd,	optar_ty, ibs_rip_dt,	
bearer_pu_ind,	piin_ind,	faux_doc_id	
)
values	
(	
'09124',	'Feb  1 2021 12:00AM',	'G618',	' ',	'',	'7L',	
'R',	'9B',	NULL,	' ',	' ',	
'R',	'A01',	' ',	' ',	' ',	' ',	
'02',	' ',	'S',	
'730',	1	,	0,	0,	1548.84	,	'A',	
'NRP',	' ',	'A',	' ',	'',	
'011854866',	'4730',	'EA',	1548.84	,	' ',	
'09124',	'Feb  1 2021 12:00AM',	'G618',	' ',	0,	0,	' ',	
NULL,	0.00,	'2016',	' ',	'AOM',	' ',	0,	0,	' '	
)	
go

ALTER TABLE supply.dbo.active_rqn_tbl
  ADD CONSTRAINT fk_adv_cd_lstd_on_actrqn 
  FOREIGN KEY (adv_cd) 
  REFERENCES supply.dbo.advice_code(advice_code)
go
ALTER TABLE supply.dbo.active_rqn_tbl
  ADD CONSTRAINT fk_orqn_must_have_arqn 
  FOREIGN KEY (org_cd,doc_dt,dsn) 
  REFERENCES supply.dbo.original_rqn(org_cd,doc_dt,dsn)
go

ALTER table active_rqn_tbl enable trigger
go






select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) ddsn, doc_suf_cd, 
  cmp_dt, qty_ord, qty_rcvd, qty_cncl, rqn_excpt_ty, suf_qty, adv_cd, fc, fc_svc_dsg, cog, dist_cd, 
  doc_id, est_shpg_dt,   pri, milstrip_rdd, media_sts_cd, proj_cd, rqn_emv, rqn_ty, ri_to, sgnl_cd, sup_niin, 
  sup_fsc, ui, upr, rqn_excpt_ty, trnsmtl_amt, trnsmtl_fy, dt_last_prcsd, optar_ty
from active_rqn_tbl
where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) 
in ('1032G618',
'10326J53')


