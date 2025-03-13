/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* INFORMATION REQUIRED                                            */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

niin    014208988
ddsn    73551994

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* Step 1:  SUBCUTODY Item Records WITHOUT SUBCUSTODY ONHAND       */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
select
  niin, 
  org_cd,
  (right(convert(varchar,datepart(yy, doc_dt)*1000
        +datepart(dy,doc_dt )),4)+ dsn) ddsn,
  nalc_org_cd, 
  nalc_wc
from sub_custody
where niin in
     (select niin from stock_item
      where cstdy_qty <= 0)
go


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* Step 2:  INVALID SUBCUSTODY NIIN RECORD                         */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* DDSN Only */
select
  niin, 
  org_cd,
  (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) ddsn,
  nalc_org_cd, 
  nalc_wc
from sub_custody
where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) in
(
'73551994',
'81191950'
)
go


/* NIIN Only */
select
  niin, 
  org_cd,
  (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) ddsn,
  nalc_org_cd, 
  nalc_wc
from sub_custody
where niin like '014208988'
go


/* DDSN & NIIN */
select
  niin, 
  org_cd,
  (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) ddsn,
  nalc_org_cd, 
  nalc_wc
from sub_custody
where niin like '014208988'
and (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) in
(
'73551994',
'81191950'
)
go


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* Step 3:  DELETE Invalid Sub_custody NIIN Record                 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

-- delete from sub_custody
where niin like '014208988'
and (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) in
(
'73551994',
'81191950'
)
go