/* STEP 1: update variable_paramters */
select last_bor_dt from variable_parameters
go

-- update variable_parameters set
last_bor_dt = "Oct 30 2009 12:00:00:000AM"
go



/* step 2:  Update bor_mo_rpt_tec - Aviation ONLY */
select * from bor_mo_rpt_tec
where trnsmtl_dt like 'Nov 10 2009%'
go

-- update bor_mo_rpt_tec set
trnsmtl_dt = " ", 
bor_rpt_ind = 0
where trnsmtl_dt like 'Nov 10 2009%'
go


select * from bor_mo_rpt_tec
where trnsmtl_dt like "%2009%"
go


/* step 3: update fin_trnsmtl */
select fy, optar_ty, trnsmtl_no int , bor_dt 
from fin_trnsmtl 
where bor_dt like 'Nov 30 2009%'
go


-- update fin_trnsmtl set
bor_dt = NULL  
where bor_dt like 'Nov 30 2009%'
go


select fy, optar_ty, trnsmtl_no int , bor_dt 
from fin_trnsmtl 
where bor_dt = NULL
go


