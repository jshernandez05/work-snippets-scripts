if object_id ('vw_impr_prior_mnth') is not null

begin
drop view vw_impr_prior_mnth
end
go

create view vw_impr_prior_mnth as

-- $Author:   hernandezjs  $
-- $Workfile:   vw_impr_prior_mnth.sql  $
-- $Revision:   1.0  $
-- Description: displays current month's IMPR data.
-- Used to feed Wing IMPR Dashboard.

select
	da01_organizatn.org_nm + ' / ' + da01_organizatn.uic as 'unit',
	'Rel.2' as 'Rel',
	convert(char(10), convert(varchar, dateadd(dd, -(day(dateadd(mm, -1, getdate())) - 1), dateadd(mm, -1, getdate())), 101)) as 'start_dt',
	convert(char(10), convert(varchar, dateadd(dd, -1, dateadd(dd, -(day(getdate()) - 1), getdate())), 101)) as 'end_dt',
	convert(varchar(19),getdate()) as 'run_dt',
	da03_site.exces_qty_ord as 'rec_count'
	from da01_organizatn
	join da03_site 	on da03_site.aimd_org = da01_organizatn.org_cd
union
select
	'HIPRI TOTAL DEMANDS' , ' ',' ',' ',' ',
	count (all dr09_requisition.ddsn)
from dr09_requisition
	join da01_organizatn on da01_organizatn.uic = dr09_requisition.rqn_id_cd
	join da03_site on da03_site.aimd_org = da01_organizatn.org_cd
where
	dr09_requisition.ord_dttm >= convert(varchar, dateadd(dd, -(day(dateadd(mm, -1, getdate())) - 1), dateadd(mm, -1, getdate())), 101)
	and dr09_requisition.ord_dttm <= convert(varchar, dateadd(dd, -1, dateadd(dd, -(day(getdate()) - 1), getdate())), 101)
	and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
	and dr09_requisition.cncl_qty < 1
	and (dr09_requisition.lsc <> 'RCANC' or dr09_requisition.lsc <> 'CANCL')
	and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'
union
select
	' ',
	dr09_requisition.tec, dv08_tec.tms,
	' ',' ',
	count (all dr09_requisition.ddsn)
from dr09_requisition
	left join dv08_tec on dr09_requisition.tec = dv08_tec.tec
	join da01_organizatn on da01_organizatn.uic = dr09_requisition.rqn_id_cd
	join da03_site on da03_site.aimd_org = da01_organizatn.org_cd
where
	dr09_requisition.ord_dttm >= convert(varchar, dateadd(dd, -(day(dateadd(mm, -1, getdate())) - 1), dateadd(mm, -1, getdate())), 101)
	and dr09_requisition.ord_dttm <= convert(varchar, dateadd(dd, -1, dateadd(dd, -(day(getdate()) - 1), getdate())), 101)
	and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
	and dr09_requisition.cncl_qty < 1
	and (dr09_requisition.lsc <> 'RCANC' or dr09_requisition.lsc <> 'CANCL')
	and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'
group by dr09_requisition.tec, dv08_tec.tms
union
select
	' ' , ' ',' ',
	dv08_tec.tms,
	case when dr09_requisition.mcc in ('D','E','G','H','Q','X') then 'REP'
		when dr09_requisition.mcc not in ('D','E','G','H','Q','X') then 'CON'
		else ' '
	end,
	count (all dr09_requisition.ddsn)
from dr09_requisition
	left join dv08_tec on dr09_requisition.tec = dv08_tec.tec
	join da01_organizatn on da01_organizatn.uic = dr09_requisition.rqn_id_cd
	join da03_site on da03_site.aimd_org = da01_organizatn.org_cd
where
	dr09_requisition.ord_dttm >= convert(varchar, dateadd(dd, -(day(dateadd(mm, -1, getdate())) - 1), dateadd(mm, -1, getdate())), 101)
	and dr09_requisition.ord_dttm <= convert(varchar, dateadd(dd, -1, dateadd(dd, -(day(getdate()) - 1), getdate())), 101)
	and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
	and dr09_requisition.cncl_qty < 1
	and (dr09_requisition.lsc <> 'RCANC' or dr09_requisition.lsc <> 'CANCL')
	and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'
group by
	dr09_requisition.tec, dv08_tec.tms,
	case when dr09_requisition.mcc in ('D','E','G','H','Q','X') then 'REP'
		when dr09_requisition.mcc not in ('D','E','G','H','Q','X') then 'CON'
		else ' '
	end
union
select
	'HIPRI TOTAL ISSUES',' ',' ',' ',' ',
	count (all dr09_requisition.ddsn)
from dr09_requisition
	left join dv08_tec on dr09_requisition.tec = dv08_tec.tec
	join da01_organizatn on da01_organizatn.uic = dr09_requisition.rqn_id_cd
	join da03_site on da03_site.aimd_org = da01_organizatn.org_cd
where
	dr09_requisition.ord_dttm >= convert(varchar, dateadd(dd, -(day(dateadd(mm, -1, getdate())) - 1), dateadd(mm, -1, getdate())), 101)
	and dr09_requisition.ord_dttm <= convert(varchar, dateadd(dd, -1, dateadd(dd, -(day(getdate()) - 1), getdate())), 101)
	and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
	and dr09_requisition.pod_qty > 0
	and dr09_requisition.cncl_qty < 1
	and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'
union
select
	' ',
	dr09_requisition.tec, dv08_tec.tms,
	' ',' ',
	count (all dr09_requisition.ddsn)
from dr09_requisition
	left join dv08_tec on dr09_requisition.tec = dv08_tec.tec
	join da01_organizatn on da01_organizatn.uic = dr09_requisition.rqn_id_cd
	join da03_site on da03_site.aimd_org = da01_organizatn.org_cd
where
	dr09_requisition.ord_dttm >= convert(varchar, dateadd(dd, -(day(dateadd(mm, -1, getdate())) - 1), dateadd(mm, -1, getdate())), 101)
	and dr09_requisition.ord_dttm <= convert(varchar, dateadd(dd, -1, dateadd(dd, -(day(getdate()) - 1), getdate())), 101)
	and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
	and dr09_requisition.pod_qty > 0
	and dr09_requisition.cncl_qty < 1
	and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'
group by dr09_requisition.tec, dv08_tec.tms
union
select
	' ' , ' ',
	dv08_tec.tms,
	case when dr09_requisition.mcc in ('D','E','G','H','Q','X') then 'REP'
		when dr09_requisition.mcc not in ('D','E','G','H','Q','X') then 'CON'
		else ' '
	end,
	' ',
	count (all dr09_requisition.ddsn)
from dr09_requisition
	left join dv08_tec on dr09_requisition.tec = dv08_tec.tec
	join da01_organizatn on da01_organizatn.uic = dr09_requisition.rqn_id_cd
	join da03_site on da03_site.aimd_org = da01_organizatn.org_cd
where
	dr09_requisition.ord_dttm >= convert(varchar, dateadd(dd, -(day(dateadd(mm, -1, getdate())) - 1), dateadd(mm, -1, getdate())), 101)
	and dr09_requisition.ord_dttm <= convert(varchar, dateadd(dd, -1, dateadd(dd, -(day(getdate()) - 1), getdate())), 101)
	and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
	and  dr09_requisition.pod_qty > 0
	and dr09_requisition.cncl_qty < 1
	and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'
group by
	dr09_requisition.tec, dv08_tec.tms,
	case when dr09_requisition.mcc in ('D','E','G','H','Q','X') then 'REP'
		when dr09_requisition.mcc not in ('D','E','G','H','Q','X') then 'CON'
		else ' '
	end
union
select
	'HIPRI TOTAL UNFILLED' , ' ',' ',' ',' ',
	count (all dr09_requisition.ddsn)
from dr09_requisition
	left join dv08_tec on dr09_requisition.tec = dv08_tec.tec
	join da01_organizatn on da01_organizatn.uic = dr09_requisition.rqn_id_cd
	join da03_site on da03_site.aimd_org = da01_organizatn.org_cd
where
	dr09_requisition.ord_dttm >= convert(varchar, dateadd(dd, -(day(dateadd(mm, -1, getdate())) - 1), dateadd(mm, -1, getdate())), 101)
	and dr09_requisition.ord_dttm <= convert(varchar, dateadd(dd, -1, dateadd(dd, -(day(getdate()) - 1), getdate())), 101)
	and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
	and dr09_requisition.pod_qty = 0
	and dr09_requisition.cncl_qty = 0
	and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'
union
select
	' ' , ' ',' ',
	dv08_tec.tms,
	case when ds05_niin.allow_ty_cd < '5' then 'NIS'  else 'N/C' end,
	count (all dr09_requisition.ddsn)
from dr09_requisition
	join ds05_niin on dr09_requisition.cur_niin = ds05_niin.niin
	left join dv08_tec on dr09_requisition.tec = dv08_tec.tec
	join da01_organizatn on da01_organizatn.uic = dr09_requisition.rqn_id_cd
	join da03_site on da03_site.aimd_org = da01_organizatn.org_cd
where
	dr09_requisition.ord_dttm >= convert(varchar, dateadd(dd, -(day(dateadd(mm, -1, getdate())) - 1), dateadd(mm, -1, getdate())), 101)
	and dr09_requisition.ord_dttm <= convert(varchar, dateadd(dd, -1, dateadd(dd, -(day(getdate()) - 1), getdate())), 101)
	and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
	and dr09_requisition.pod_qty = 0
	and dr09_requisition.cncl_qty = 0
	and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'
group by
	dr09_requisition.tec, dv08_tec.tms,
	case when ds05_niin.allow_ty_cd < '5' then 'NIS'  else 'N/C' end
union
select
	' ' ,
	dv08_tec.tms,
	case when dr09_requisition.mcc in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd < '5' then 'REP NIS'
		when dr09_requisition.mcc in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd > '4' then 'REP N/C'
		when dr09_requisition.mcc not in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd < '5' then 'CON NIS'
		when dr09_requisition.mcc not in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd > '4' then 'CON N/C'
		else ' '
	end,
	' ', ' ',
	count (all dr09_requisition.ddsn)
from dr09_requisition
	join ds05_niin on dr09_requisition.cur_niin = ds05_niin.niin
	left join dv08_tec on dr09_requisition.tec = dv08_tec.tec
	join da01_organizatn on da01_organizatn.uic = dr09_requisition.rqn_id_cd
	join da03_site on da03_site.aimd_org = da01_organizatn.org_cd
where
	dr09_requisition.ord_dttm >= convert(varchar, dateadd(dd, -(day(dateadd(mm, -1, getdate())) - 1), dateadd(mm, -1, getdate())), 101)
	and dr09_requisition.ord_dttm <= convert(varchar, dateadd(dd, -1, dateadd(dd, -(day(getdate()) - 1), getdate())), 101)
	and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
	and dr09_requisition.pod_qty = 0
	and dr09_requisition.cncl_qty = 0
	and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'
group by
	dr09_requisition.tec,
	dv08_tec.tms,
	case when dr09_requisition.mcc in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd < '5' then 'REP NIS'
		when dr09_requisition.mcc in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd > '4' then 'REP N/C'
		when dr09_requisition.mcc not in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd < '5' then 'CON NIS'
		when dr09_requisition.mcc not in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd > '4' then 'CON N/C'
		else ' '
	end
union
select
	'HIPRI TOTAL OFF-STATION',' ',' ',' ',' ',
	count (all dr09_requisition.ddsn)
from dr09_requisition
	left join dv08_tec on dr09_requisition.tec = dv08_tec.tec
	join da01_organizatn on da01_organizatn.uic = dr09_requisition.rqn_id_cd
	join da03_site on da03_site.aimd_org = da01_organizatn.org_cd
where
	dr09_requisition.ord_dttm >= convert(varchar, dateadd(dd, -(day(dateadd(mm, -1, getdate())) - 1), dateadd(mm, -1, getdate())), 101)
	and dr09_requisition.ord_dttm <= convert(varchar, dateadd(dd, -1, dateadd(dd, -(day(getdate()) - 1), getdate())), 101)
	and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
	and dr09_requisition.pod_qty > 0
	and dr09_requisition.rt_id_last_acty > ' '
	and dr09_requisition.cncl_qty < dr09_requisition.ord_qty
	and dr09_requisition.contg_cd not in ('AG','BM','BX')
	and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'
union
select
	' ' , ' ',' ',
	dv08_tec.tms,
	case when ds05_niin.allow_ty_cd < '5' then 'NIS'  else 'N/C' end,
	count (all dr09_requisition.ddsn)
from dr09_requisition
	join ds05_niin on dr09_requisition.cur_niin = ds05_niin.niin
	left join dv08_tec on dr09_requisition.tec = dv08_tec.tec
	join da01_organizatn on da01_organizatn.uic = dr09_requisition.rqn_id_cd
	join da03_site on da03_site.aimd_org = da01_organizatn.org_cd
where
	dr09_requisition.ord_dttm >= convert(varchar, dateadd(dd, -(day(dateadd(mm, -1, getdate())) - 1), dateadd(mm, -1, getdate())), 101)
	and dr09_requisition.ord_dttm <= convert(varchar, dateadd(dd, -1, dateadd(dd, -(day(getdate()) - 1), getdate())), 101)
	and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
	and dr09_requisition.pod_qty > 0
	and dr09_requisition.rt_id_last_acty > ' '
	and dr09_requisition.cncl_qty < dr09_requisition.ord_qty
	and dr09_requisition.contg_cd not in ('AG','BM','BX')
	and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'
group by
	dr09_requisition.tec, dv08_tec.tms,
	case when ds05_niin.allow_ty_cd < '5' then 'NIS'  else 'N/C' end
union
select
	' ' ,
	dv08_tec.tms,
	case when dr09_requisition.mcc in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd < '5' then 'REP NIS'
		when dr09_requisition.mcc in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd > '4' then 'REP N/C'
		when dr09_requisition.mcc not in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd < '5' then 'CON NIS'
		when dr09_requisition.mcc not in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd > '4' then 'CON N/C'
		else ' '
	end,
	' ', ' ',
	count (all dr09_requisition.ddsn)
from dr09_requisition
	join ds05_niin on dr09_requisition.cur_niin = ds05_niin.niin
	left join dv08_tec on dr09_requisition.tec = dv08_tec.tec
	join da01_organizatn on da01_organizatn.uic = dr09_requisition.rqn_id_cd
	join da03_site on da03_site.aimd_org = da01_organizatn.org_cd
where
	dr09_requisition.ord_dttm >= convert(varchar, dateadd(dd, -(day(dateadd(mm, -1, getdate())) - 1), dateadd(mm, -1, getdate())), 101)
	and dr09_requisition.ord_dttm <= convert(varchar, dateadd(dd, -1, dateadd(dd, -(day(getdate()) - 1), getdate())), 101)
	and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
	and dr09_requisition.pod_qty > 0
	and dr09_requisition.rt_id_last_acty > ' '
	and dr09_requisition.cncl_qty < dr09_requisition.ord_qty
	and dr09_requisition.contg_cd not in ('AG','BM','BX')
	and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'
group by
	dr09_requisition.tec, dv08_tec.tms,
	case when dr09_requisition.mcc in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd < '5' then 'REP NIS'
		when dr09_requisition.mcc in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd > '4' then 'REP N/C'
		when dr09_requisition.mcc not in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd < '5' then 'CON NIS'
		when dr09_requisition.mcc not in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd > '4' then 'CON N/C'
		else ' '
	end
union
select
	'HIPRI LRT            ', ' ',
	dr09_requisition.tec, dv08_tec.tms,
	case when ((datediff(day, ord_dttm,actl_rcpt_dttm)) in (0,1) or (datediff(day, ord_dttm, lsc_dttm)) in (0,1)) then '00-24-HRS'
		when ((datediff(day, ord_dttm,actl_rcpt_dttm)) in (2) or (datediff(day, ord_dttm, lsc_dttm)) in (2)) then '24-48-HRS'
		when ((datediff(day, ord_dttm,actl_rcpt_dttm)) in (3) or (datediff(day, ord_dttm, lsc_dttm)) in (3)) then '48-72-HRS'
		when ((datediff(day, ord_dttm,actl_rcpt_dttm)) > 3 or (datediff(day, ord_dttm, lsc_dttm)) > 3) then '72+++-HRS'
		else ' '
	end,
	count (all dr09_requisition.ddsn)
from dr09_requisition
	left join dv08_tec on dr09_requisition.tec = dv08_tec.tec
	join da01_organizatn on da01_organizatn.uic = dr09_requisition.rqn_id_cd
	join da03_site on da03_site.aimd_org = da01_organizatn.org_cd
where
	dr09_requisition.ord_dttm >= convert(varchar, dateadd(dd, -(day(dateadd(mm, -1, getdate())) - 1), dateadd(mm, -1, getdate())), 101)
	and dr09_requisition.ord_dttm <= convert(varchar, dateadd(dd, -1, dateadd(dd, -(day(getdate()) - 1), getdate())), 101)
	and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
	and  dr09_requisition.pod_qty > 0
	and dr09_requisition.cncl_qty < 1
	and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'
group by
	dr09_requisition.tec, dv08_tec.tms,
	case when ((datediff(day, ord_dttm,actl_rcpt_dttm)) in (0,1) or (datediff(day, ord_dttm, lsc_dttm)) in (0,1)) then '00-24-HRS'
		when ((datediff(day, ord_dttm,actl_rcpt_dttm)) in (2) or (datediff(day, ord_dttm, lsc_dttm)) in (2)) then '24-48-HRS'
		when ((datediff(day, ord_dttm,actl_rcpt_dttm)) in (3) or (datediff(day, ord_dttm, lsc_dttm)) in (3)) then '48-72-HRS'
		when ((datediff(day, ord_dttm,actl_rcpt_dttm)) > 3 or (datediff(day, ord_dttm, lsc_dttm)) > 3) then '72+++-HRS'
	else ' '
	end
union
select
	'HIPRI TOTAL CANCELATIONS',' ',' ',' ',' ',
	count (all dr09_requisition.ddsn)
from dr09_requisition
	left join dv08_tec on dr09_requisition.tec = dv08_tec.tec
	join da01_organizatn on da01_organizatn.uic = dr09_requisition.rqn_id_cd
	join da03_site on da03_site.aimd_org = da01_organizatn.org_cd
where
	dr09_requisition.ord_dttm >= convert(varchar, dateadd(dd, -(day(dateadd(mm, -1, getdate())) - 1), dateadd(mm, -1, getdate())), 101)
	and dr09_requisition.ord_dttm <= convert(varchar, dateadd(dd, -1, dateadd(dd, -(day(getdate()) - 1), getdate())), 101)
	and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
	and dr09_requisition.cncl_qty > 0
	and dr09_requisition.lsc in ('RCANC','CANCL')
	and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'
union
select
	'..',
	dv08_tec.tms,
	case when dr09_requisition.mcc in ('D','E','G','H','Q','X') then 'REP'
		when dr09_requisition.mcc not in ('D','E','G','H','Q','X') then 'CON'
		else ' '
	end,
	' ', ' ',
	count (all dr09_requisition.ddsn)
from dr09_requisition
	left join dv08_tec on dr09_requisition.tec = dv08_tec.tec
	join da01_organizatn on da01_organizatn.uic = dr09_requisition.rqn_id_cd
	join da03_site on da03_site.aimd_org = da01_organizatn.org_cd
where
	dr09_requisition.ord_dttm >= convert(varchar, dateadd(dd, -(day(dateadd(mm, -1, getdate())) - 1), dateadd(mm, -1, getdate())), 101)
	and dr09_requisition.ord_dttm <= convert(varchar, dateadd(dd, -1, dateadd(dd, -(day(getdate()) - 1), getdate())), 101)
	and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
	and dr09_requisition.cncl_qty > 0
	and dr09_requisition.lsc in ('RCANC','CANCL')
	and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'
group by
	dr09_requisition.tec, dv08_tec.tms,
	case when dr09_requisition.mcc in ('D','E','G','H','Q','X') then 'REP'
		when dr09_requisition.mcc not in ('D','E','G','H','Q','X') then 'CON'
		else ' '
	end
union
select
	'HIPRI CANCEL TIME            ', ' ', dr09_requisition.tec,	dv08_tec.tms,
	case when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) in (0,1) or (datediff(day, ord_dttm, lsc_dttm)) in (0,1)) then '00-24-HRS'
		when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) in (2) or (datediff(day, ord_dttm, lsc_dttm)) in (2)) then '24-48-HRS'
		when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) in (3) or (datediff(day, ord_dttm, lsc_dttm)) in (3)) then '48-72-HRS'
		when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) > 3 or (datediff(day, ord_dttm, lsc_dttm)) > 3) then '72+++-HRS'
		else ' '
	end,
	count (all dr09_requisition.ddsn)
from dr09_requisition
	left join dv08_tec on dr09_requisition.tec = dv08_tec.tec
	join da01_organizatn on da01_organizatn.uic = dr09_requisition.rqn_id_cd
	join da03_site on da03_site.aimd_org = da01_organizatn.org_cd
where
	dr09_requisition.ord_dttm >= convert(varchar, dateadd(dd, -(day(dateadd(mm, -1, getdate())) - 1), dateadd(mm, -1, getdate())), 101)
	and dr09_requisition.ord_dttm <= convert(varchar, dateadd(dd, -1, dateadd(dd, -(day(getdate()) - 1), getdate())), 101)
	and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
	and dr09_requisition.cncl_qty > 0
	and dr09_requisition.lsc in ('RCANC','CANCL')
	and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'
group by
	dr09_requisition.tec, dv08_tec.tms,
	case when ((datediff(day, ord_dttm,actl_rcpt_dttm)) in (0,1) or (datediff(day, ord_dttm, lsc_dttm)) in (0,1)) then '00-24-HRS'
		when ((datediff(day, ord_dttm,actl_rcpt_dttm)) in (2) or (datediff(day, ord_dttm, lsc_dttm)) in (2)) then '24-48-HRS'
		when ((datediff(day, ord_dttm,actl_rcpt_dttm)) in (3) or (datediff(day, ord_dttm, lsc_dttm)) in (3)) then '48-72-HRS'
		when ((datediff(day, ord_dttm,actl_rcpt_dttm)) > 3 or (datediff(day, ord_dttm, lsc_dttm)) > 3) then '72+++-HRS'
		else ' '
	end
go

grant select on vw_impr_prior_mnth to public
go

