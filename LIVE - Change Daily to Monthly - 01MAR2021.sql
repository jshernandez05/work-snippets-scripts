/* STEP 1: update variable_paramters */
select last_bor_dt from variable_parameters
go

-- update variable_parameters set
last_bor_dt = "Feb 28 2021 12:00:00:000AM"
go



/* step 2:  Update bor_mo_rpt_tec - Aviation ONLY */
select * from bor_mo_rpt_tec
where trnsmtl_dt like null
go

-- update bor_mo_rpt_tec set
bor_rpt_ind = 1
where trnsmtl_dt like 'Feb %% 2021%'
go

select * from bor_mo_rpt_tec
where trnsmtl_dt like "%2021%"
go


/* step 3: update fin_trnsmtl */
select fy, optar_ty, trnsmtl_no int , bor_dt
from fin_trnsmtl
where bor_dt is NULL
go


-- update fin_trnsmtl set
bor_dt = "Feb 28 2021 12:00:00:000AM"
where bor_dt is NULL
go
