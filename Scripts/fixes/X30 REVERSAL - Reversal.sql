
/* X30 REVERSAL */

SELECT 
  doc_id,
  fsc,
  "'" + niin + "'",
  ui,
  qty,
  org_cd,
  (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) DDSN,
  dsp_transhipper,
  cog,
  mcc,
  rfi_rtn_qty,
  rvrsl_ind,
  trans_dt
from tran_shpmt
where niin in
(
'012238123'
)
and (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) in
(
'1256GY01'
)
and doc_id like 'X30'
and trans_dt like 'Jul 29 2021 10:36AM%'
go


--  update tran_shpmt set
rvrsl_ind = 1
where niin in
(
'012238123'
)
and (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) in
(
'1256GY01'
)
and doc_id like 'X30'
go


/* if applicable for duplicate X30 records */

-- delete from tran_shpmt 
where niin in
(
'014951208'
)
and (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) in
(
'1207G220'
)
and doc_id like 'X30'
and trans_dt like 'Jul 29 2021 10:36AM%'
go

/* X33 REVERSAL */

SELECT 
  doc_id,
  fsc,
  "'" + niin + "'",
  ui,
  qty,
  org_cd,
  (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) DDSN,
  dsp_transhipper,
  cog,
  mcc,
  rfi_rtn_qty,
  rvrsl_ind,
  trans_dt
from tran_shpmt
where niin in
(
'012900767'
)
and (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) in
(
'8143DM07'
)
and doc_id like 'X33'
go


-- update tran_shpmt set
rvrsl_ind = 0
where niin in
(
'012900767'
)
and (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) in
(
'8143DM07'
)
and doc_id like 'X33'
go


/* if applicable for duplicate X33 records */

-- delete from tran_shpmt 
where niin in
(
'012900767'
)
and (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) in
(
'8143DM07'
)
and doc_id like 'X33'
and trans_dt like 'May 22 2008%'
go