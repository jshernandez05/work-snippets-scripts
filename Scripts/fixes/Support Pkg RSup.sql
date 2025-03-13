/* 1 */
select * from suprt_pkg_ty
go
 
/* 2 */
select "suprt_pkg", * from suprt_pkg
where suprt_pkg_serno like 'F18C36'
go
 
/* 3 */
select "suprt_pkg_allow", * from suprt_pkg_allow
where suprt_pkg_serno like 'F18C36'
go
 
/* 4 */
select "suprt_pkg_itm", * from suprt_pkg_itm
where suprt_pkg_serno like 'F18C36'
go
 
/* 5 */
select "suprt_pkg_loctn", * from suprt_pkg_loctn
where suprt_pkg_serno like 'F18C36'
go
 
/* 6 */
select "suprt_pkg_out", * from suprt_pkg_out
where suprt_pkg_serno like 'F18C36'
go
 
/* 7 */
select "suprt_alt_item", * from suprt_alt_item
where suprt_pkg_serno like 'F18C36'
go
 
 
/* DELETE SUPPORT PACKAGE SERIAL */
-- delete from suprt_pkg
where suprt_pkg_serno like 'F18C36'
go
 
select distinct suprt_pkg_serno
from material_request_tbl
go
 
 
select * from material_request_tbl
where suprt_pkg_serno like 'F18C36'
go
 
/* QUERY SUPPORT PACKAGE SERIAL */
select suprt_pkg_serno, mr_organization_code,
  (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4)+ mr_document_nr_serial)
from material_request_tbl
where suprt_pkg_serno like 'F18C36'
  and mr_organization_code like '09111' 
  and (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4)+ mr_document_nr_serial) in
(
'4007P408'
)
go
 
 
/* DELETE SUPPORT PACKAGE SERIAL */
-- delete from material_request_tbl
where suprt_pkg_serno like 'F18C36'
  and mr_organization_code like '09111' 
  and (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4)+ mr_document_nr_serial) in
(
'4007P408'
)
go
 
-- update material_request_tbl set
suprt_pkg_serno = "L12122"
where suprt_pkg_serno like 'F18C36'
  and mr_organization_code like '09111' 
  and (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4)+ mr_document_nr_serial) in
(
'4007P408'
)
go






select suprt_pkg_serno, optar_ty, doc_id, mr_organization_code,
 (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial) ddsn,   
   optar_ty, trnsmtl_fy, trnsmtl_dt, trnsmtl_no,  trnsmtl_amt, fund_code_original, request_emv, approved_date, matl_issue_date, 
   doc_id, dt_last_prcsd, supply_type_equip_code
from material_request_tbl
where suprt_pkg_serno in ('LTWV21', 'L53DFT', 'LWTI21')
go


alter table material_request_tbl disable trigger
go

ALTER TABLE supply.dbo.material_request_tbl
 DROP CONSTRAINT fk_suprt_pkg_matlrqsttbl
GO

update material_request_tbl set
suprt_pkg_serno = ' '
where suprt_pkg_serno in ('LTWV21', 'L53DFT', 'LWTI21')
go


ALTER TABLE supply.dbo.material_request_tbl
 ADD CONSTRAINT fk_suprt_pkg_matlrqsttbl 
 FOREIGN KEY (suprt_pkg_serno, ownr_cd)
 REFERENCES supply.dbo.suprt_pkg(suprt_pkg_serno, ownr_cd)
go


alter table material_request_tbl enable trigger
go


