--==============={ step 1: Verify if the MAILBOX exists */

declare @maf varchar(7)
select @maf = 'GG1RW6L'

select	'dg19_amsu_apr_req' as 'Current Mailbox', mcn from dg19_amsu_apr_req where mcn like @maf
	union
select	'dg20_pc_apr_req',mcn from dg20_pc_apr_req where mcn like @maf
	union
select	'dg07_coll_duty_ins',mcn from dg07_coll_duty_ins where mcn like @maf
	union
select	'dg04_supr_rev',mcn from dg04_supr_rev where mcn like @maf
	union
select	'dg05_prd_ctl_rev',mcn from dg05_prd_ctl_rev where mcn like @maf
	union
select	'dg06_log_rec_req',mcn from dg06_log_rec_req where mcn like @maf
	union
select	'dg03_qa_rev_not',mcn from dg03_qa_rev_not where mcn like @maf
	union
select	'dg14_data_anal_rev',mcn from dg14_data_anal_rev where mcn like @maf
	union
select	'dg16_data_anal_rej',mcn from dg16_data_anal_rej where mcn like @maf
	union
select	'dg15_mat_rej',mcn from dg15_mat_rej where mcn like @maf
	union
select	'dg17_serno_disc',mcn from dg17_serno_disc where mcn like @maf
go


/* step 2: DELETE ALL MAILBOX Record */
-- delete from 	dg19_amsu_apr_req where mcn in ('GN1GPLZ')
-- delete from 	dg20_pc_apr_req where mcn in ('GN1GPLZ')
-- delete from 	dg07_coll_duty_ins where mcn in ('GN1GPLZ')
-- delete from 	dg04_supr_rev where mcn in ('GN1GPLZ')
-- delete from 	dg05_prd_ctl_rev where mcn in ('GN1GPLZ')
-- delete from 	dg06_log_rec_req where mcn in ('GN1GPLZ')
-- delete from 	dg03_qa_rev_not where mcn in ('GN1GPLZ')
-- delete from 	dg14_data_anal_rev where mcn in ('GN1GPLZ')
-- delete from 	dg16_data_anal_rej where mcn in ('GN1GPLZ')
-- delete from 	dg15_mat_rej where mcn in ('GN1GPLZ')
-- delete from 	dg17_serno_disc where mcn in ('GN1GPLZ')

select mcn, wkr_sig, qa_cdi_sig, supr_sig, pc_sig, logs_rec_sig, data_sig
from dm06_maf_correct
where mcn in ('GN1GPLZ')
go

select mcn, sys_rsn
from dm04_maf
where mcn in ('GN1GPLZ')
go

select mcn, e_serno
from dm09_removed
where mcn in ('GN1GPLZ')
go


/* VERIFY SPECIAL CHARACTERS */

select 
"update dm06_maf_correct set  "
+ char(13) + char(10) + "corr_act = " + "'" + corr_act + "'",
+ char(13) + char(10) + "where mcn like " + "'" + mcn + "'"
+ char(13) + char(10) + "go"
+ char(13) + char(10)
from dm06_maf_correct
where mcn in ('GN1GPLZ')
go 


update dm06_maf_correct set  
corr_act = 'TD HAS BEEN IMPLEMENTED IAW ACCESSORY CHANGE AYC 1549, TD CODE 61, REVISION A ON SN PNCLE-007.'	
where mcn like 'GC1ECJ5'
go

select
"update dm07_maf_discrep set  "
+ char(13) + char(10) + "dscrp = " + "'" + dscrp + "'",
+ char(13) + char(10) + "where mcn like " + "'" + mcn + "'"
+ char(13) + char(10) + "go"
+ char(13) + char(10)
from dm07_maf_discrep
where mcn in ('GN1GPLZ')
go 

update dm07_maf_discrep set  
dscrp = 'Perform 90 Day Inspection on MOBILE FACILITY. Comply with NA 19-600-152-6-2, MRC(s) CARDS 3-8.1.   Next Inspection Due on 02/26/2017 17057'	
where mcn like 'GC1EYHQ'
go


--update dm06_maf_correct set
supr_sig = qa_cdi_sig,
supr_signo_dttm = getdate ()
where mcn in ('GN1GPLZ')
go


/* step 2:  Create a MAF Approval MAILBOX RECORD */
select	* from 	dg20_pc_apr_req where mcn in ('GN1GPLZ')

select
"insert dg20_pc_apr_req(mcn, org_cd, wc_cd, jcn, sys_rsn, apprvl_nsrt_dttm)values(",
"'" + mcn + "',", "'" + org_cd + "',", "'" + wc_cd + "',", "'" + rtrim(jcn) + "',", "'" + sys_rsn + "',", 
"getdate ()" + ")" 
from dm04_maf
where mcn in ('GN1GPLZ')
go 

						

/* step 3:  Create a CDI MAILBOX RECORD */
select 
+ char(13) + char(10) + "insert dg07_coll_duty_ins(mcn, wrk_pri_cd, cdi_nsrt_dttm, tec, sys_rsn, org_cd, wc_cd)values",
+ char(13) + char(10) + "('" + mcn + "',", "'" + wrk_pri_cd + "',", "getdate ()" + ",", "'" + tec + "',", "'" + sys_rsn + "',", 
"'" + org_cd + "',", "'" + wc_cd + "')"
+ char(13) + char(10) + "go"
from dm04_maf
where mcn in ('GN1GPLZ')
go 


/* step 4:  Create a SUPERVISOR MAILBOX RECORD */
select	
"insert dg04_supr_rev(mcn, wrk_pri_cd, supr_nsrt_dttm, tec, sys_rsn, org_cd, wc_cd, signo_dttm)values(",
"'" + mcn + "',", "'" + wrk_pri_cd + "',", "getdate ()" + ",", "'" + tec + "',", "'" + sys_rsn + "',", 
"'" + org_cd + "',", "'" + wc_cd + "',", "getdate ()" + ")" 
from dm04_maf
where mcn in ('GN1GPLZ')
go 


/* step 5:  Create a PC MAILBOX RECORD */
select	
+ char(13) + char(10) + "insert dg05_prd_ctl_rev(mcn, wrk_pri_cd, pc_nsrt_dttm, tec, sys_rsn, org_cd, wc_cd, signo_dttm)values",
+ char(13) + char(10) + "('" + mcn + "',", "'" + wrk_pri_cd + "',", "getdate ()" + ",", "'" + tec + "',", "'" + sys_rsn + "',", 
"'" + org_cd + "',", "'" + wc_cd + "',", "getdate ()" + ")" 
+ char(13) + char(10) + "go"
from dm04_maf
where mcn in ('GN1GPLZ')
go
			

insert dg05_prd_ctl_rev(mcn, wrk_pri_cd, pc_nsrt_dttm, tec, sys_rsn, org_cd, wc_cd, signo_dttm)values	
('GC1F7V5',	'3',	getdate (),	'SVHA',	'364 Day  NLT 17/Feb/2017',	'GE1',	'411',	getdate ())
go

/* step 6:  Create a LOGS & RECORDS MAILBOX RECORD */
select	
"insert dg06_log_rec_req(mcn, wrk_pri_cd, logs_rec_nsrt_dttm, org_cd, wc_cd, logs_reqd_fg)values(",
"'" + mcn + "',", "'" + wrk_pri_cd + "',", "getdate ()" + ",", "'" + org_cd + "',", "'" + wc_cd + "',", "'N')"
from dm04_maf
where mcn in ('GN1GPLZ')
go

/* step 7:  Create a ANALYST REVIEW MAILBOX RECORD */

select	
"insert dg14_data_anal_rev(mcn, wrk_pri_cd, revw_nsrt_dttm, tec, sys_rsn, wc_cd, org_cd)values"
+ char(13) + char(10) + 
"('" + mcn + "',", "'" + wrk_pri_cd + "',", "getdate ()" + ",", "'" + tec + "',", "'" + sys_rsn + "',", 
"'" + wc_cd + "',", "'" + org_cd + "')" 
+ char(13) + char(10) + "go"
from dm04_maf
where mcn in ('GN1GPLZ')
go
							
							
						
insert dg14_data_anal_rev(mcn, wrk_pri_cd, revw_nsrt_dttm, tec, sys_rsn, wc_cd, org_cd)values
('GN1GPLZ',	'1',	getdate (),	'YPAA',	'RADIO (CS11475)',	'61A',	'GN1')
go



