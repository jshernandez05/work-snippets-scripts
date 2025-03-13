select dr09.ddsn, dr09.ddsn_suf, cage, part_no, proj_cd, cur_niin,
       orig_niin, dr09.lsc 'actv.lsc', dr09.lsc_dttm 'actv.lsc_dttm', ord_qty, pod_qty, 
       cncl_qty, org_cd, substring(jcn, 1, 3) 'jcn_org', issuing_peb_org_cd, 
       issuing_peb_wc_cd, dr07.lsc, dr07.lsc_dttm 'hist.lsc', lsc_hist_dttm 'hist.lsc_dttm' 
from dr09_requisition dr09
	join dr07_lschistory dr07 on dr09.ddsn = dr07.ddsn
		 and dr09.ddsn_suf = dr07.ddsn_suf
where dr09.lsc like '%%%PEB'
and   dr07.lsc like 'OFFTR'
union
select dr14.ddsn, dr14.ddsn_suf, cage, part_no, proj_cd, cur_niin,
       orig_niin, dr14.lsc 'actv.lsc', dr14.lsc_dttm 'actv.lsc_dttm', ord_qty, pod_qty, 
       cncl_qty, org_cd, issuing_peb_org_cd, substring(jcn, 1, 3) 'jcn_org',
       issuing_peb_wc_cd, dr13.lsc, dr13.lsc_dttm 'hist.lsc', lsc_hist_dttm 'hist.lsc_dttm' 
from dr14_rqn_hist dr14
	join dr13_lschist_hist dr13 on dr14.ddsn = dr13.ddsn
		 and dr14.ddsn_suf = dr13.ddsn_suf
where dr14.lsc like '%%%PEB'
and   dr13.lsc like 'OFFTR'




select dr09.ddsn, dr09.ddsn_suf, cage, part_no, proj_cd, cur_niin,
       orig_niin, dr09.lsc 'actv.lsc', dr09.lsc_dttm 'actv.lsc_dttm', ord_qty, pod_qty, 
       cncl_qty, org_cd, substring(jcn, 1, 3) 'jcn_org', issuing_peb_org_cd, 
       issuing_peb_wc_cd, dr07.lsc, dr07.lsc_dttm 'hist.lsc', lsc_hist_dttm 'hist.lsc_dttm' 
from dr09_requisition dr09
	join dr07_lschistory dr07 on dr09.ddsn = dr07.ddsn
		 and dr09.ddsn_suf = dr07.ddsn_suf
where dr09.lsc like '%%%PEB'
and   dr07.lsc like 'OFVAL'
union
select dr14.ddsn, dr14.ddsn_suf, cage, part_no, proj_cd, cur_niin,
       orig_niin, dr14.lsc 'actv.lsc', dr14.lsc_dttm 'actv.lsc_dttm', ord_qty, pod_qty, 
       cncl_qty, org_cd, issuing_peb_org_cd, substring(jcn, 1, 3) 'jcn_org',
       issuing_peb_wc_cd, dr13.lsc, dr13.lsc_dttm 'hist.lsc', lsc_hist_dttm 'hist.lsc_dttm' 
from dr14_rqn_hist dr14
	join dr13_lschist_hist dr13 on dr14.ddsn = dr13.ddsn
		 and dr14.ddsn_suf = dr13.ddsn_suf
where dr14.lsc like '%%%PEB'
and   dr13.lsc like 'OFVAL'








select dr09.ddsn, dr09.ddsn_suf, cage, part_no, proj_cd, pre_x_fg, cur_niin,
       orig_niin, dr09.lsc 'actv.lsc', dr09.lsc_dttm 'actv.lsc_dttm', ord_qty, pod_qty, 
       cncl_qty, org_cd, substring(jcn, 1, 3) 'jcn_org', issuing_peb_org_cd, 
       issuing_peb_wc_cd, dr07.lsc, dr07.lsc_dttm 'hist.lsc', lsc_hist_dttm 'hist.lsc_dttm' 
from dr09_requisition dr09
	join dr07_lschistory dr07 on dr09.ddsn = dr07.ddsn
		 and dr09.ddsn_suf = dr07.ddsn_suf
	join ds05_niin ds05 on dr09.cur_niin = ds05.niin
where dr07.lsc like 'OFVAL'
and   ds05.pre_x_fg like 'Y'
union
select dr14.ddsn, dr14.ddsn_suf, cage, part_no, proj_cd, cur_niin,
       orig_niin, dr14.lsc 'actv.lsc', dr14.lsc_dttm 'actv.lsc_dttm', ord_qty, pod_qty, 
       cncl_qty, org_cd, issuing_peb_org_cd, substring(jcn, 1, 3) 'jcn_org',
       issuing_peb_wc_cd, dr13.lsc, dr13.lsc_dttm 'hist.lsc', lsc_hist_dttm 'hist.lsc_dttm' 
from dr14_rqn_hist dr14
	join dr13_lschist_hist dr13 on dr14.ddsn = dr13.ddsn
		 and dr14.ddsn_suf = dr13.ddsn_suf
where dr07.lsc like 'OFVAL'
and   ds05.pre_x_fg like 'Y'





select dr09.ddsn, dr09.ddsn_suf, cage, part_no, proj_cd, cur_niin,
       orig_niin, dr09.lsc 'actv.lsc', dr09.lsc_dttm 'actv.lsc_dttm', ord_qty, pod_qty, 
       cncl_qty, org_cd, substring(jcn, 1, 3) 'jcn_org', issuing_peb_org_cd, 
       issuing_peb_wc_cd, dr07.lsc 'hist.lsc', dr07.lsc_dttm 'hist.lsc_dttm', lsc_hist_dttm 'hist.lschist_dttm' 
from dr09_requisition dr09
	join dr07_lschistory dr07 on dr09.ddsn = dr07.ddsn
		 and dr09.ddsn_suf = dr07.ddsn_suf
where dr09.lsc like '%%%PEB'
and   dr07.lsc not in ('OFFTR', 'OFVAL')
union
select dr14.ddsn, dr14.ddsn_suf, cage, part_no, proj_cd, cur_niin,
       orig_niin, dr14.lsc 'actv.lsc', dr14.lsc_dttm 'actv.lsc_dttm', ord_qty, pod_qty, 
       cncl_qty, org_cd, issuing_peb_org_cd, substring(jcn, 1, 3) 'jcn_org',
       issuing_peb_wc_cd, dr13.lsc 'hist.lsc', dr13.lsc_dttm 'hist.lsc_dttm', lsc_hist_dttm 'hist.lschist_dttm' 
from dr14_rqn_hist dr14
	join dr13_lschist_hist dr13 on dr14.ddsn = dr13.ddsn
		 and dr14.ddsn_suf = dr13.ddsn_suf
where dr14.lsc like '%%%PEB'
and   dr13.lsc not in ('OFFTR', 'OFVAL')





select * from dr13_lschist_hist 
where (lsc like ' ' or lsc is null)

select * from dr07_lschistory 
where (lsc like ' ' or lsc is null)

delete from dr07_lschistory 
where (lsc like ' ' or lsc is null)

delete from dr13_lschist_hist 
where (lsc like ' ' or lsc is null)

select dr09.ddsn, dr09.ddsn_suf, cage, part_no, proj_cd, cur_niin,
       orig_niin, dr09.lsc 'actv.lsc', dr09.lsc_dttm 'actv.lsc_dttm', ord_qty, pod_qty, 
       cncl_qty, org_cd, substring(jcn, 1, 3) 'jcn_org', issuing_peb_org_cd, 
       issuing_peb_wc_cd, dr07.lsc 'hist.lsc', dr07.lsc_dttm 'hist.lsc_dttm', lsc_hist_dttm 'hist.lschist_dttm' 
from dr09_requisition dr09
	join dr07_lschistory dr07 on dr09.ddsn = dr07.ddsn
		 and dr09.ddsn_suf = dr07.ddsn_suf
where (dr07.lsc like ' ' or dr07.lsc is null)









