select
   'DHASMS'+ dr09_requisition.media_sts_cd + ds05_niin.fsc + dt02_transdata.niin + ds05_niin.smic + ds05_niin.ui + 
    RIGHT('0000' + CAST(dr09_requisition.ord_qty AS varchar),5) + dr09_requisition.rqn_svc_dsg + dr09_requisition.rqn_id_cd + 
    dt02_transdata.ddsn + dr09_requisition.demand_cd + '      ' + dr09_requisition.sgnl_cd + dr09_requisition.fund_cd + ds05_niin.cog +
    ' ' + dr09_requisition.proj_cd + dr09_requisition.iss_pri_dsg + '     ' + dr09_requisition.rt_id_to + '   ' + 
    CONVERT(VARCHAR(10),DATEPART(DY,GETDATE()),103) as 'DHA_MILSTRIP'
from
   dt02_transdata,
   ds05_niin,
   dr09_requisition
where
   dt02_transdata.niin = ds05_niin.niin
   and dt02_transdata.ddsn = dr09_requisition.ddsn
   and ds05_niin.cog in ( '3B','9B' )
   and ds05_niin.mcc = 'D'
   and dt02_transdata.sup_trans_cd like '%RFI'
   and dt02_transdata.trans_data_dttm >= CONVERT (DATETIME, CONVERT (DATE, DATEADD (DAY, -1 * (DAY(GETDATE()) - 1), GETDATE())))
go
