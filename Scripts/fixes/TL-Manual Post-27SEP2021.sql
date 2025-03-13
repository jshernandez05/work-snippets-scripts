alter table material_request_tbl disable trigger
go

update material_request_tbl set
optar_ty = "AOM",
trnsmtl_fy = "2021",
tech_edit_date = "Sep 24 2021  4:05PM" ,
approved_date = "Sep 24 2021  4:05PM" ,
expend_type = "E",
trnsmtl_amt = 0.00,
org_cd_fin = serial.organization_code,
jon_uic = "09136"
from material_request_tbl
 join serial on material_request_tbl.div_cd = left(serial.begin_nbr, 2)
     and serial.organization_code not in (
    '09202',
	'4338A',
	'53936',
	'53998',
	'55160',
	'69367',
	'83447',
	'00862',
	'01169',
	'01173',
	'08998',
	'09010',
	'09079',
	'09116',
	'09124',
	'09136',
	'09159',
	'09202',
	'09349',
	'09404',
	'09442')
where (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial)
  in ('0335FF01',
'0335FF02',
'0345G209',
'0345G295',
'0345G296',
'0351G222',
'0352G218',
'0352G268',
'1083G627',
'0351GV50')
go

alter table material_request_tbl enable trigger
go
