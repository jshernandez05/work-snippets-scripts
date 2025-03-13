select 
case when  rt_id_asd  = 'Q41' then 'MALS-11 / 09111'  
 when  rt_id_asd  = 'Q42' then 'MALS-12 / 09112'  
 when  rt_id_asd  = 'Q43' then 'MALS-13 / 57082' 
 when  rt_id_asd  = 'Q44' then 'MALS-14 / 09114' 
 when  rt_id_asd  = 'Q46' then 'MALS-16 / 09116' 
 when  rt_id_asd  = 'Q47' then 'MALS-24 / 09124' 
 when  rt_id_asd  = 'Q48' then 'MALS-26 / 09167' 
 when  rt_id_asd  = 'Q39' then 'MALS-29 / 52841' 
 when  rt_id_asd  = 'Q49' then 'MALS-31 / 09131' 
 when  rt_id_asd  = 'Q53' then 'MALS-36 / 09136' 
 when  rt_id_asd  = 'R65' then 'MALS-39 / 09808'  else ' '
end,
'Rel.2' as 'Rel',                                           /* Release #     */
convert(char(10),'03/01/2020'),                             /* Starting Date */
convert(char(10),'03/31/2020'),                             /* Ending   Date */
CONVERT(VARCHAR(19),GETDATE()),
exces_qty_ord as ' ' 
from da03_site
union
select
'HIPRI TOTAL DEMANDS' , ' ',' ',' ',' ',
count (all dr09_requisition.ddsn)
from dr09_requisition
where dr09_requisition.ord_dttm >= '03/01/2020'            /* Starting Date */
and dr09_requisition.ord_dttm   <= '03/31/2020'            /* Ending   Date */
and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
and dr09_requisition.rqn_id_cd in ('09111', '57082', '09116', '09808') 
and dr09_requisition.cncl_qty < 1
and (dr09_requisition.lsc <> 'RCANC' or dr09_requisition.lsc <> 'CANCL')
and dr09_requisition.tec like 'A__[!ABDEFGHJPX]' 
UNION
select
' ',
dr09_requisition.tec,
case when dr09_requisition.tec = 'AMA9' then 'FA-18'
 when dr09_requisition.tec = 'AMAA' then 'FA-18A'
 when dr09_requisition.tec = 'AMAE' then 'FA-18B'
 when dr09_requisition.tec = 'AMAF' then 'FA-18C'
 when dr09_requisition.tec = 'AMAG' then 'FA-18D'
 when dr09_requisition.tec = 'ACMJ' then 'KC-130J'
 when dr09_requisition.tec = 'ACM9' then 'C-130' 
 when dr09_requisition.tec = 'AHAZ' then 'HH-1N'
 when dr09_requisition.tec = 'AYLF' then 'AV-8B'
 when dr09_requisition.tec = 'AYLG' then 'TAV-8B'
 when dr09_requisition.tec = 'AAED' then 'EA-6B' 
 when dr09_requisition.tec = 'AHRH' then 'CH-46E'
 when dr09_requisition.tec = 'AHX9' then 'H-53'
 when dr09_requisition.tec = 'AHXD' then 'CH-53E'
 when dr09_requisition.tec = 'AYNE' then 'MV-22B'
 when dr09_requisition.tec = 'AHAA' then 'UH-1Y'
 when dr09_requisition.tec = 'AHAB' then 'AH-1Z'
 when dr09_requisition.tec = 'AHAX' then 'AH-1W'
 when dr09_requisition.tec = 'AHZ9' then 'H-60'
 when dr09_requisition.tec = 'APBD' then 'P-3C'
 when dr09_requisition.tec = 'AHXC' then 'CH-53D'
 when dr09_requisition.tec = 'AHZA' then 'SH-60B'
 when dr09_requisition.tec = 'AHAP' then 'UH-1N'   else ' '
end,' ',' ',
count (all dr09_requisition.ddsn)
from dr09_requisition
where dr09_requisition.ord_dttm >= '03/01/2020'            /* Starting Date */
and dr09_requisition.ord_dttm   <= '03/31/2020'            /* Ending   Date */
and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
and dr09_requisition.rqn_id_cd in ('09111', '57082', '09116', '09808') 
and dr09_requisition.cncl_qty < 1
and (dr09_requisition.lsc <> 'RCANC' or dr09_requisition.lsc <> 'CANCL')
and dr09_requisition.tec like 'A__[!ABDEFGHJPX]' 
group by dr09_requisition.tec 
union


select 
' ' , ' ',' ',
case when dr09_requisition.tec = 'AMA9' then 'FA-18'
 when dr09_requisition.tec = 'AMAA' then 'FA-18A'
 when dr09_requisition.tec = 'AMAE' then 'FA-18B'
 when dr09_requisition.tec = 'AMAF' then 'FA-18C' 
 when dr09_requisition.tec = 'AMAG' then 'FA-18D'
 when dr09_requisition.tec = 'ACMJ' then 'KC-130J'
 when dr09_requisition.tec = 'ACM9' then 'C-130' 
 when dr09_requisition.tec = 'AHAZ' then 'HH-1N'
 when dr09_requisition.tec = 'AYLF' then 'AV-8B'
 when dr09_requisition.tec = 'AYLG' then 'TAV-8B'
 when dr09_requisition.tec = 'AAED' then 'EA-6B'
 when dr09_requisition.tec = 'AHRH' then 'CH-46E'
 when dr09_requisition.tec = 'AHX9' then 'H-53'
 when dr09_requisition.tec = 'AHXD' then 'CH-53E'
 when dr09_requisition.tec = 'AYNE' then 'MV-22B'
 when dr09_requisition.tec = 'AHAA' then 'UH-1Y'
 when dr09_requisition.tec = 'AHAB' then 'AH-1Z'
 when dr09_requisition.tec = 'AHAX' then 'AH-1W'
 when dr09_requisition.tec = 'AHZ9' then 'H-60'
 when dr09_requisition.tec = 'APBD' then 'P-3C'
 when dr09_requisition.tec = 'AHXC' then 'CH-53D'
 when dr09_requisition.tec = 'AHZA' then 'SH-60B'
 when dr09_requisition.tec = 'AHAP' then 'UH-1N'   else ' '
end,
case when dr09_requisition.mcc in ('D','E','G','H','Q','X') then 'REP'
 when dr09_requisition.mcc not in ('D','E','G','H','Q','X') then 'CON' else ' '
end,
count (all dr09_requisition.ddsn)
from dr09_requisition
where dr09_requisition.ord_dttm >= '03/01/2020'            /* Starting Date */
and dr09_requisition.ord_dttm   <= '03/31/2020'            /* Ending   Date */
and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
and dr09_requisition.rqn_id_cd in ('09111', '57082', '09116', '09808') 
and dr09_requisition.cncl_qty < 1
and (dr09_requisition.lsc <> 'RCANC' or dr09_requisition.lsc <> 'CANCL')
and dr09_requisition.tec like 'A__[!ABDEFGHJPX]' 
group by dr09_requisition.tec,case when dr09_requisition.mcc in ('D','E','G','H','Q','X') then 'REP'
when dr09_requisition.mcc not in ('D','E','G','H','Q','X') then 'CON' else ' '
end

UNION


select
'HIPRI TOTAL ISSUES',' ',' ',' ',' ',
count (all dr09_requisition.ddsn)
from dr09_requisition
where dr09_requisition.ord_dttm >= '03/01/2020'            /* Starting Date */
and dr09_requisition.ord_dttm   <= '03/31/2020'            /* Ending   Date */
and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
and dr09_requisition.rqn_id_cd in ('09111', '57082', '09116', '09808') 
and  dr09_requisition.pod_qty > 0
and dr09_requisition.cncl_qty < 1
and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'  
UNION
select
' ',
dr09_requisition.tec,
case when dr09_requisition.tec = 'AMA9' then 'FA-18'
 when dr09_requisition.tec = 'AMAA' then 'FA-18A'
 when dr09_requisition.tec = 'AMAE' then 'FA-18B'
 when dr09_requisition.tec = 'AMAF' then 'FA-18C'
 when dr09_requisition.tec = 'AMAG' then 'FA-18D'
 when dr09_requisition.tec = 'ACMJ' then 'KC-130J'
 when dr09_requisition.tec = 'ACM9' then 'C-130'
 when dr09_requisition.tec = 'AHAZ' then 'HH-1N'
 when dr09_requisition.tec = 'AYLF' then 'AV-8B'
 when dr09_requisition.tec = 'AYLG' then 'TAV-8B'
 when dr09_requisition.tec = 'AAED' then 'EA-6B' 
 when dr09_requisition.tec = 'AHRH' then 'CH-46E'
 when dr09_requisition.tec = 'AHX9' then 'H-53'
 when dr09_requisition.tec = 'AHXD' then 'CH-53E'
 when dr09_requisition.tec = 'AYNE' then 'MV-22B'
 when dr09_requisition.tec = 'AHAA' then 'UH-1Y'
 when dr09_requisition.tec = 'AHAB' then 'AH-1Z'
 when dr09_requisition.tec = 'AHAX' then 'AH-1W'
 when dr09_requisition.tec = 'AHZ9' then 'H-60'
 when dr09_requisition.tec = 'APBD' then 'P-3C'
 when dr09_requisition.tec = 'AHXC' then 'CH-53D'
 when dr09_requisition.tec = 'AHZA' then 'SH-60B'
 when dr09_requisition.tec = 'AHAP' then 'UH-1N'   else ' '
end,' ',' ',
count (all dr09_requisition.ddsn)
from dr09_requisition
where dr09_requisition.ord_dttm >= '03/01/2020'            /* Starting Date */
and dr09_requisition.ord_dttm   <= '03/31/2020'            /* Ending   Date */
and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
and dr09_requisition.rqn_id_cd in ('09111', '57082', '09116', '09808') 
and  dr09_requisition.pod_qty > 0
and dr09_requisition.cncl_qty < 1
and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'  
group by dr09_requisition.tec
UNION
select 
' ' , ' ',' ',
case when dr09_requisition.tec = 'AMA9' then 'FA-18'
 when dr09_requisition.tec = 'AMAA' then 'FA-18A'
 when dr09_requisition.tec = 'AMAE' then 'FA-18B'
 when dr09_requisition.tec = 'AMAF' then 'FA-18C'
 when dr09_requisition.tec = 'AMAG' then 'FA-18D'
 when dr09_requisition.tec = 'ACMJ' then 'KC-130J'
 when dr09_requisition.tec = 'ACM9' then 'C-130'
 when dr09_requisition.tec = 'AHAZ' then 'HH-1N'
 when dr09_requisition.tec = 'AYLF' then 'AV-8B'
 when dr09_requisition.tec = 'AYLG' then 'TAV-8B'
 when dr09_requisition.tec = 'AAED' then 'EA-6B' 
 when dr09_requisition.tec = 'AHRH' then 'CH-46E'
 when dr09_requisition.tec = 'AHX9' then 'H-53'
 when dr09_requisition.tec = 'AHXD' then 'CH-53E'
 when dr09_requisition.tec = 'AYNE' then 'MV-22B'
 when dr09_requisition.tec = 'AHAA' then 'UH-1Y'
 when dr09_requisition.tec = 'AHAB' then 'AH-1Z'
 when dr09_requisition.tec = 'AHAX' then 'AH-1W'
 when dr09_requisition.tec = 'AHZ9' then 'H-60'
 when dr09_requisition.tec = 'APBD' then 'P-3C'
 when dr09_requisition.tec = 'AHXC' then 'CH-53D'
 when dr09_requisition.tec = 'AHZA' then 'SH-60B'
 when dr09_requisition.tec = 'AHAP' then 'UH-1N'   else ' '
end,
case when dr09_requisition.mcc in ('D','E','G','H','Q','X') then 'REP'
 when dr09_requisition.mcc not in ('D','E','G','H','Q','X') then 'CON' else ' '
end,
count (all dr09_requisition.ddsn)
from dr09_requisition
where dr09_requisition.ord_dttm >= '03/01/2020'            /* Starting Date */
and dr09_requisition.ord_dttm   <= '03/31/2020'            /* Ending   Date */
and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
and dr09_requisition.rqn_id_cd in ('09111', '57082', '09116', '09808') 
and  dr09_requisition.pod_qty > 0
and dr09_requisition.cncl_qty < 1
and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'  
group by dr09_requisition.tec,case when dr09_requisition.mcc in ('D','E','G','H','Q','X') then 'REP'
 when dr09_requisition.mcc not in ('D','E','G','H','Q','X') then 'CON' else ' '
end
UNION
select 
'HIPRI TOTAL UNFILLED' , ' ',' ',' ',' ',
count (all dr09_requisition.ddsn)
from dr09_requisition
where dr09_requisition.ord_dttm >= '03/01/2020'            /* Starting Date */
and dr09_requisition.ord_dttm   <= '03/31/2020'            /* Ending   Date */
and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
and dr09_requisition.rqn_id_cd in ('09111', '57082', '09116', '09808') 
and dr09_requisition.pod_qty = 0
and dr09_requisition.cncl_qty = 0
and dr09_requisition.tec like 'A__[!ABDEFGHJPX]' 
UNION
select 
' ' , ' ',' ',
case when dr09_requisition.tec = 'AMA9' then 'FA-18'
 when dr09_requisition.tec = 'AMAA' then 'FA-18A'
 when dr09_requisition.tec = 'AMAE' then 'FA-18B'
 when dr09_requisition.tec = 'AMAF' then 'FA-18C'
 when dr09_requisition.tec = 'AMAG' then 'FA-18D'
 when dr09_requisition.tec = 'ACMJ' then 'KC-130J'
 when dr09_requisition.tec = 'ACM9' then 'C-130'
 when dr09_requisition.tec = 'AHAZ' then 'HH-1N'
 when dr09_requisition.tec = 'AYLF' then 'AV-8B'
 when dr09_requisition.tec = 'AYLG' then 'TAV-8B'
 when dr09_requisition.tec = 'AAED' then 'EA-6B' 
 when dr09_requisition.tec = 'AHRH' then 'CH-46E'
 when dr09_requisition.tec = 'AHX9' then 'H-53'
 when dr09_requisition.tec = 'AHXD' then 'CH-53E'
 when dr09_requisition.tec = 'AYNE' then 'MV-22B'
 when dr09_requisition.tec = 'AHAA' then 'UH-1Y'
 when dr09_requisition.tec = 'AHAB' then 'AH-1Z'
 when dr09_requisition.tec = 'AHAX' then 'AH-1W'
 when dr09_requisition.tec = 'AHZ9' then 'H-60'
 when dr09_requisition.tec = 'APBD' then 'P-3C'
 when dr09_requisition.tec = 'AHXC' then 'CH-53D'
 when dr09_requisition.tec = 'AHZA' then 'SH-60B'
 when dr09_requisition.tec = 'AHAP' then 'UH-1N'   else ' '
end,
case when ds05_niin.allow_ty_cd < '5' then 'NIS'  else 'N/C'
end,
count (all dr09_requisition.ddsn)
from dr09_requisition,
ds05_niin
where dr09_requisition.ord_dttm >= '03/01/2020'            /* Starting Date */
and dr09_requisition.ord_dttm   <= '03/31/2020'            /* Ending   Date */
and ds05_niin.niin = dr09_requisition.cur_niin
and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
and dr09_requisition.rqn_id_cd in ('09111', '57082', '09116', '09808') 
and dr09_requisition.pod_qty = 0
and dr09_requisition.cncl_qty = 0
and dr09_requisition.tec like 'A__[!ABDEFGHJPX]' 
group by dr09_requisition.tec,case when ds05_niin.allow_ty_cd < '5' then 'NIS'  else 'N/C'
end
union
select 
' ' , 
case when dr09_requisition.tec = 'AMA9' then 'FA-18'
 when dr09_requisition.tec = 'AMAA' then 'FA-18A'
 when dr09_requisition.tec = 'AMAE' then 'FA-18B'
 when dr09_requisition.tec = 'AMAF' then 'FA-18C'
 when dr09_requisition.tec = 'AMAG' then 'FA-18D'
 when dr09_requisition.tec = 'ACMJ' then 'KC-130J'
 when dr09_requisition.tec = 'ACM9' then 'C-130'
 when dr09_requisition.tec = 'AHAZ' then 'HH-1N'
 when dr09_requisition.tec = 'AYLF' then 'AV-8B'
 when dr09_requisition.tec = 'AYLG' then 'TAV-8B'
 when dr09_requisition.tec = 'AAED' then 'EA-6B' 
 when dr09_requisition.tec = 'AHRH' then 'CH-46E'
 when dr09_requisition.tec = 'AHX9' then 'H-53'
 when dr09_requisition.tec = 'AHXD' then 'CH-53E'
 when dr09_requisition.tec = 'AYNE' then 'MV-22B'
 when dr09_requisition.tec = 'AHAA' then 'UH-1Y'
 when dr09_requisition.tec = 'AHAB' then 'AH-1Z'
 when dr09_requisition.tec = 'AHAX' then 'AH-1W'
 when dr09_requisition.tec = 'AHZ9' then 'H-60'
 when dr09_requisition.tec = 'APBD' then 'P-3C'
 when dr09_requisition.tec = 'AHXC' then 'CH-53D'
 when dr09_requisition.tec = 'AHZA' then 'SH-60B'
 when dr09_requisition.tec = 'AHAP' then 'UH-1N'   else ' '
end,
case when dr09_requisition.mcc in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd < '5' then 'REP NIS'
 when dr09_requisition.mcc in ('D','E','G','H','Q','X')     and ds05_niin.allow_ty_cd > '4' then 'REP N/C'
 when dr09_requisition.mcc not in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd < '5' then 'CON NIS'
 when dr09_requisition.mcc not in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd > '4' then 'CON N/C' else ' '
end,
' ', ' ',
count (all dr09_requisition.ddsn)
from dr09_requisition,
ds05_niin
where dr09_requisition.ord_dttm >= '03/01/2020'            /* Starting Date */
and dr09_requisition.ord_dttm   <= '03/31/2020'            /* Ending   Date */
and ds05_niin.niin = dr09_requisition.cur_niin
and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
and dr09_requisition.rqn_id_cd in ('09111', '57082', '09116', '09808') 
and dr09_requisition.pod_qty = 0
and dr09_requisition.cncl_qty = 0
and dr09_requisition.tec like 'A__[!ABDEFGHJPX]' 
group by dr09_requisition.tec,case when dr09_requisition.mcc in ('D','E','G','H','Q','X')     and ds05_niin.allow_ty_cd < '5' then 'REP NIS' 
 when dr09_requisition.mcc in ('D','E','G','H','Q','X')     and ds05_niin.allow_ty_cd > '4' then 'REP N/C' 
 when dr09_requisition.mcc not in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd < '5' then 'CON NIS' 
 when dr09_requisition.mcc not in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd > '4' then 'CON N/C' else ' '
end
union
select 
'HIPRI TOTAL OFF-STATION',' ',' ',' ',' ',
count (all dr09_requisition.ddsn)
from dr09_requisition
where dr09_requisition.ord_dttm >= '03/01/2020'            /* Starting Date */
and dr09_requisition.ord_dttm   <= '03/31/2020'            /* Ending   Date */
and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
and dr09_requisition.rqn_id_cd in ('09111', '57082', '09116', '09808') 
and dr09_requisition.pod_qty > 0
and dr09_requisition.rt_id_last_acty > ' '
and dr09_requisition.cncl_qty < dr09_requisition.ord_qty 
and dr09_requisition.contg_cd not in ('AG','BM','BX')
and dr09_requisition.tec like 'A__[!ABDEFGHJPX]' 
UNION
select 
' ' , ' ',' ',
case when dr09_requisition.tec = 'AMA9' then 'FA-18'
 when dr09_requisition.tec = 'AMAA' then 'FA-18A'
 when dr09_requisition.tec = 'AMAE' then 'FA-18B'
 when dr09_requisition.tec = 'AMAF' then 'FA-18C'
 when dr09_requisition.tec = 'AMAG' then 'FA-18D'
 when dr09_requisition.tec = 'ACMJ' then 'KC-130J'
 when dr09_requisition.tec = 'ACM9' then 'C-130'
 when dr09_requisition.tec = 'AHAZ' then 'HH-1N'
 when dr09_requisition.tec = 'AYLF' then 'AV-8B'
 when dr09_requisition.tec = 'AYLG' then 'TAV-8B'
 when dr09_requisition.tec = 'AAED' then 'EA-6B' 
 when dr09_requisition.tec = 'AHRH' then 'CH-46E'
 when dr09_requisition.tec = 'AHX9' then 'H-53'
 when dr09_requisition.tec = 'AHXD' then 'CH-53E'
 when dr09_requisition.tec = 'AYNE' then 'MV-22B'
 when dr09_requisition.tec = 'AHAA' then 'UH-1Y'
 when dr09_requisition.tec = 'AHAB' then 'AH-1Z'
 when dr09_requisition.tec = 'AHAX' then 'AH-1W'
 when dr09_requisition.tec = 'AHZ9' then 'H-60'
 when dr09_requisition.tec = 'APBD' then 'P-3C'
 when dr09_requisition.tec = 'AHXC' then 'CH-53D'
 when dr09_requisition.tec = 'AHZA' then 'SH-60B'
 when dr09_requisition.tec = 'AHAP' then 'UH-1N'   else ' '
end,
case when ds05_niin.allow_ty_cd < '5' then 'NIS'  else 'N/C'
end,
count (all dr09_requisition.ddsn)
from dr09_requisition,
ds05_niin
where dr09_requisition.ord_dttm >= '03/01/2020'            /* Starting Date */
and dr09_requisition.ord_dttm   <= '03/31/2020'            /* Ending   Date */
and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
and dr09_requisition.rqn_id_cd in ('09111', '57082', '09116', '09808') 
and dr09_requisition.pod_qty > 0
and dr09_requisition.rt_id_last_acty > ' '
and dr09_requisition.cncl_qty < dr09_requisition.ord_qty 
and ds05_niin.niin = dr09_requisition.cur_niin
and dr09_requisition.contg_cd not in ('AG','BM','BX')
and dr09_requisition.tec like 'A__[!ABDEFGHJPX]' 
group by dr09_requisition.tec,case when ds05_niin.allow_ty_cd < '5' then 'NIS'  else 'N/C'
end
union
select 
' ' , 
case when dr09_requisition.tec = 'AMA9' then 'FA-18'
 when dr09_requisition.tec = 'AMAA' then 'FA-18A'
 when dr09_requisition.tec = 'AMAE' then 'FA-18B'
 when dr09_requisition.tec = 'AMAF' then 'FA-18C'
 when dr09_requisition.tec = 'AMAG' then 'FA-18D'
 when dr09_requisition.tec = 'ACMJ' then 'KC-130J'
 when dr09_requisition.tec = 'ACM9' then 'C-130'
 when dr09_requisition.tec = 'AHAZ' then 'HH-1N'
 when dr09_requisition.tec = 'AYLF' then 'AV-8B'
 when dr09_requisition.tec = 'AYLG' then 'TAV-8B'
 when dr09_requisition.tec = 'AAED' then 'EA-6B' 
 when dr09_requisition.tec = 'AHRH' then 'CH-46E'
 when dr09_requisition.tec = 'AHX9' then 'H-53'
 when dr09_requisition.tec = 'AHXD' then 'CH-53E'
 when dr09_requisition.tec = 'AYNE' then 'MV-22B'
 when dr09_requisition.tec = 'AHAA' then 'UH-1Y'
 when dr09_requisition.tec = 'AHAB' then 'AH-1Z'
 when dr09_requisition.tec = 'AHAX' then 'AH-1W'
 when dr09_requisition.tec = 'AHZ9' then 'H-60'
 when dr09_requisition.tec = 'APBD' then 'P-3C'
 when dr09_requisition.tec = 'AHXC' then 'CH-53D'
 when dr09_requisition.tec = 'AHZA' then 'SH-60B'
 when dr09_requisition.tec = 'AHAP' then 'UH-1N'   else ' '
end,
case when dr09_requisition.mcc in ('D','E','G','H','Q','X')     and ds05_niin.allow_ty_cd < '5' then 'REP NIS'
 when dr09_requisition.mcc in ('D','E','G','H','Q','X')     and ds05_niin.allow_ty_cd > '4' then 'REP N/C'
 when dr09_requisition.mcc not in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd < '5' then 'CON NIS'
 when dr09_requisition.mcc not in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd > '4' then 'CON N/C' else ' '
end,
' ', ' ',
count (all dr09_requisition.ddsn)
from dr09_requisition,
ds05_niin
where dr09_requisition.ord_dttm >= '03/01/2020'            /* Starting Date */
and dr09_requisition.ord_dttm   <= '03/31/2020'            /* Ending   Date */
and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
and dr09_requisition.rqn_id_cd in ('09111', '57082', '09116', '09808') 
and dr09_requisition.pod_qty > 0
and dr09_requisition.rt_id_last_acty > ' '
and dr09_requisition.cncl_qty < dr09_requisition.ord_qty 
and ds05_niin.niin = dr09_requisition.cur_niin
and dr09_requisition.contg_cd not in ('AG','BM','BX')
and dr09_requisition.tec like 'A__[!ABDEFGHJPX]'
group by dr09_requisition.tec,case when dr09_requisition.mcc in ('D','E','G','H','Q','X')     and ds05_niin.allow_ty_cd < '5' then 'REP NIS'
 when dr09_requisition.mcc in ('D','E','G','H','Q','X')     and ds05_niin.allow_ty_cd > '4' then 'REP N/C'
 when dr09_requisition.mcc not in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd < '5' then 'CON NIS' 
 when dr09_requisition.mcc not in ('D','E','G','H','Q','X') and ds05_niin.allow_ty_cd > '4' then 'CON N/C' else ' '
end
union
select 
'HIPRI LRT            ', ' ',dr09_requisition.tec,
case when dr09_requisition.tec = 'AMA9' then 'FA-18'
 when dr09_requisition.tec = 'AMAA' then 'FA-18A'
 when dr09_requisition.tec = 'AMAE' then 'FA-18B'
 when dr09_requisition.tec = 'AMAF' then 'FA-18C'
 when dr09_requisition.tec = 'AMAG' then 'FA-18D'
 when dr09_requisition.tec = 'ACMJ' then 'KC-130J'
 when dr09_requisition.tec = 'ACM9' then 'C-130'
 when dr09_requisition.tec = 'AHAZ' then 'HH-1N'
 when dr09_requisition.tec = 'AYLF' then 'AV-8B'
 when dr09_requisition.tec = 'AYLG' then 'TAV-8B'
 when dr09_requisition.tec = 'AAED' then 'EA-6B' 
 when dr09_requisition.tec = 'AHRH' then 'CH-46E'
 when dr09_requisition.tec = 'AHX9' then 'H-53'
 when dr09_requisition.tec = 'AHXD' then 'CH-53E'
 when dr09_requisition.tec = 'AYNE' then 'MV-22B'
 when dr09_requisition.tec = 'AHAA' then 'UH-1Y'
 when dr09_requisition.tec = 'AHAB' then 'AH-1Z'
 when dr09_requisition.tec = 'AHAX' then 'AH-1W'
 when dr09_requisition.tec = 'AHZ9' then 'H-60'
 when dr09_requisition.tec = 'APBD' then 'P-3C'
 when dr09_requisition.tec = 'AHXC' then 'CH-53D'
 when dr09_requisition.tec = 'AHZA' then 'SH-60B'
 when dr09_requisition.tec = 'AHAP' then 'UH-1N'   else ' '
end,
case when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) in (0,1) or (datediff(day, ord_dttm, lsc_dttm )) in (0,1) ) then '00-24-HRS' 
 when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) in (2)   or (datediff(day, ord_dttm, lsc_dttm )) in (2) )   then '24-48-HRS' 
 when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) in (3)   or (datediff(day, ord_dttm, lsc_dttm )) in (3) )   then '48-72-HRS' 
 when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) > 3      or (datediff(day, ord_dttm, lsc_dttm )) > 3)       then '72+++-HRS' else ' '
end,
count (all dr09_requisition.ddsn)
from dr09_requisition
where dr09_requisition.ord_dttm >= '03/01/2020'            /* Starting Date */
and dr09_requisition.ord_dttm   <= '03/31/2020'            /* Ending   Date */
and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
and dr09_requisition.rqn_id_cd in ('09111', '57082', '09116', '09808') 
and  dr09_requisition.pod_qty > 0
and dr09_requisition.cncl_qty < 1
and dr09_requisition.tec like 'A__[!ABDEFGHJPX]' 
group by dr09_requisition.tec,
case when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) in (0,1) or (datediff(day, ord_dttm, lsc_dttm )) in (0,1) ) then '00-24-HRS' 
 when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) in (2)   or (datediff(day, ord_dttm, lsc_dttm )) in (2) )   then '24-48-HRS' 
 when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) in (3)   or (datediff(day, ord_dttm, lsc_dttm )) in (3) )   then '48-72-HRS' 
 when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) > 3      or (datediff(day, ord_dttm, lsc_dttm )) > 3)       then '72+++-HRS' else ' '
end
union

select 
'HIPRI TOTAL CANCELATIONS',' ',' ',' ',' ',
count (all dr09_requisition.ddsn)
from dr09_requisition
where dr09_requisition.ord_dttm >= '03/01/2020'            /* Starting Date */
and dr09_requisition.ord_dttm   <= '03/31/2020'            /* Ending   Date */
and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
and dr09_requisition.rqn_id_cd in ('09111', '57082', '09116', '09808') 
and dr09_requisition.cncl_qty > 0
and dr09_requisition.lsc in ('RCANC','CANCL')
and dr09_requisition.tec like 'A__[!ABDEFGHJPX]' 

UNION

select 
'..', 
case when dr09_requisition.tec = 'AMA9' then 'FA-18'
 when dr09_requisition.tec = 'AMAA' then 'FA-18A'
 when dr09_requisition.tec = 'AMAE' then 'FA-18B'
 when dr09_requisition.tec = 'AMAF' then 'FA-18C'
 when dr09_requisition.tec = 'AMAG' then 'FA-18D'
 when dr09_requisition.tec = 'ACMJ' then 'KC-130J'
 when dr09_requisition.tec = 'ACM9' then 'C-130'
 when dr09_requisition.tec = 'AHAZ' then 'HH-1N'
 when dr09_requisition.tec = 'AYLF' then 'AV-8B'
 when dr09_requisition.tec = 'AYLG' then 'TAV-8B'
 when dr09_requisition.tec = 'AAED' then 'EA-6B' 
 when dr09_requisition.tec = 'AHRH' then 'CH-46E'
 when dr09_requisition.tec = 'AHX9' then 'H-53'
 when dr09_requisition.tec = 'AHXD' then 'CH-53E'
 when dr09_requisition.tec = 'AYNE' then 'MV-22B'
 when dr09_requisition.tec = 'AHAA' then 'UH-1Y'
 when dr09_requisition.tec = 'AHAB' then 'AH-1Z'
 when dr09_requisition.tec = 'AHAX' then 'AH-1W'
 when dr09_requisition.tec = 'AHZ9' then 'H-60'
 when dr09_requisition.tec = 'APBD' then 'P-3C'
 when dr09_requisition.tec = 'AHXC' then 'CH-53D'
 when dr09_requisition.tec = 'AHZA' then 'SH-60B'
 when dr09_requisition.tec = 'AHAP' then 'UH-1N'   else ' '
end,
case when dr09_requisition.mcc in ('D','E','G','H','Q','X') then 'REP' 
 when dr09_requisition.mcc not in ('D','E','G','H','Q','X') then 'CON' else ' '
end,
' ', ' ',
count (all dr09_requisition.ddsn)
from dr09_requisition
where dr09_requisition.ord_dttm >= '03/01/2020'            /* Starting Date */
and dr09_requisition.ord_dttm   <= '03/31/2020'            /* Ending   Date */
and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
and dr09_requisition.rqn_id_cd in ('09111', '57082', '09116', '09808') 
and dr09_requisition.cncl_qty > 0
and dr09_requisition.lsc in ('RCANC','CANCL')
and dr09_requisition.tec like 'A__[!ABDEFGHJPX]' 
group by dr09_requisition.tec,case when dr09_requisition.mcc in ('D','E','G','H','Q','X') then 'REP' 
 when dr09_requisition.mcc not in ('D','E','G','H','Q','X') then 'CON' else ' '
end
union

select 
'HIPRI CANCEL TIME            ', ' ',dr09_requisition.tec,
case when dr09_requisition.tec = 'AMA9' then 'FA-18'
 when dr09_requisition.tec = 'AMAA' then 'FA-18A'
 when dr09_requisition.tec = 'AMAE' then 'FA-18B'
 when dr09_requisition.tec = 'AMAF' then 'FA-18C'
 when dr09_requisition.tec = 'AMAG' then 'FA-18D'
 when dr09_requisition.tec = 'ACMJ' then 'KC-130J'
 when dr09_requisition.tec = 'ACM9' then 'C-130'
 when dr09_requisition.tec = 'AHAZ' then 'HH-1N'
 when dr09_requisition.tec = 'AYLF' then 'AV-8B'
 when dr09_requisition.tec = 'AYLG' then 'TAV-8B'
 when dr09_requisition.tec = 'AAED' then 'EA-6B' 
 when dr09_requisition.tec = 'AHRH' then 'CH-46E'
 when dr09_requisition.tec = 'AHX9' then 'H-53'
 when dr09_requisition.tec = 'AHXD' then 'CH-53E'
 when dr09_requisition.tec = 'AYNE' then 'MV-22B'
 when dr09_requisition.tec = 'AHAA' then 'UH-1Y'
 when dr09_requisition.tec = 'AHAB' then 'AH-1Z'
 when dr09_requisition.tec = 'AHAX' then 'AH-1W'
 when dr09_requisition.tec = 'AHZ9' then 'H-60'
 when dr09_requisition.tec = 'APBD' then 'P-3C'
 when dr09_requisition.tec = 'AHXC' then 'CH-53D'
 when dr09_requisition.tec = 'AHZA' then 'SH-60B'
 when dr09_requisition.tec = 'AHAP' then 'UH-1N'   else ' '
end,
case when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) in (0,1) or (datediff(day, ord_dttm, lsc_dttm )) in (0,1) ) then '00-24-HRS' 
 when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) in (2)   or (datediff(day, ord_dttm, lsc_dttm )) in (2) )   then '24-48-HRS' 
 when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) in (3)   or (datediff(day, ord_dttm, lsc_dttm )) in (3) )   then '48-72-HRS' 
 when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) > 3      or (datediff(day, ord_dttm, lsc_dttm )) > 3)       then '72+++-HRS' else ' '
end,
count (all dr09_requisition.ddsn)
from dr09_requisition
where dr09_requisition.ord_dttm >= '03/01/2020'            /* Starting Date */
and dr09_requisition.ord_dttm   <= '03/31/2020'            /* Ending   Date */
and dr09_requisition.proj_cd in ('AK0','AK7','706','707')
and dr09_requisition.rqn_id_cd in ('09111', '57082', '09116', '09808') 
and dr09_requisition.cncl_qty > 0
and dr09_requisition.lsc in ('RCANC','CANCL')
and dr09_requisition.tec like 'A__[!ABDEFGHJPX]' 
group by dr09_requisition.tec,case when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) in (0,1) or (datediff(day, ord_dttm, lsc_dttm )) in (0,1) ) then '00-24-HRS'
 when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) in (2)   or (datediff(day, ord_dttm, lsc_dttm )) in (2) )   then '24-48-HRS' 
 when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) in (3)   or (datediff(day, ord_dttm, lsc_dttm )) in (3) )   then '48-72-HRS' 
 when ( (datediff(day, ord_dttm,actl_rcpt_dttm)) > 3      or (datediff(day, ord_dttm, lsc_dttm )) > 3)       then '72+++-HRS' else ' '
end










