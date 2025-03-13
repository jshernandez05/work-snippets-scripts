# ============{create back up of  active and history dr tables > 36 months}==============================
SELECT * FROM dr01_acthistory
WHERE ddsn in (SELECT ddsn FROM dr09_requisition
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                               'EXREP',
                               'INPRO',
                               'ISSIP',
                               'OFFMP',
                               'OFFTR',
                               'OSSUF',
                               'PHKIT',
                               'RCANC',
                               'REFER',
                               'ROBN',
                               'ROBS'
                              )
               AND ddsn not in (SELECT ddsn from dr06_iou)               
             )

SELECT * FROM dr02_action
WHERE ddsn in (SELECT ddsn FROM dr09_requisition
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                               'EXREP',
                               'INPRO',
                               'ISSIP',
                               'OFFMP',
                               'OFFTR',
                               'OSSUF',
                               'PHKIT',
                               'RCANC',
                               'REFER',
                               'ROBN',
                               'ROBS'
                              )
               AND ddsn not in (SELECT ddsn from dr06_iou)                                        
              )

SELECT * FROM dr04_contract
WHERE ddsn in (SELECT ddsn FROM dr09_requisition
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                               'EXREP',
                               'INPRO',
                               'ISSIP',
                               'OFFMP',
                               'OFFTR',
                               'OSSUF',
                               'PHKIT',
                               'RCANC',
                               'REFER',
                               'ROBN',
                               'ROBS'
                              )
               AND ddsn not in (SELECT ddsn from dr06_iou)                                        
              )

SELECT * FROM dr05_external
WHERE ddsn in (SELECT ddsn FROM dr09_requisition
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                               'EXREP',
                               'INPRO',
                               'ISSIP',
                               'OFFMP',
                               'OFFTR',
                               'OSSUF',
                               'PHKIT',
                               'RCANC',
                               'REFER',
                               'ROBN',
                               'ROBS'
                              )
               AND ddsn not in (SELECT ddsn from dr06_iou)                                        
              )

SELECT * FROM dr07_lschistory
WHERE ddsn in (SELECT ddsn FROM dr09_requisition
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                               'EXREP',
                               'INPRO',
                               'ISSIP',
                               'OFFMP',
                               'OFFTR',
                               'OSSUF',
                               'PHKIT',
                               'RCANC',
                               'REFER',
                               'ROBN',
                               'ROBS'
                              )
               AND ddsn not in (SELECT ddsn from dr06_iou)                                        
              )

SELECT * FROM dr10_stathistory
WHERE ddsn in (SELECT ddsn FROM dr09_requisition 
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                               'EXREP',
                               'INPRO',
                               'ISSIP',
                               'OFFMP',
                               'OFFTR',
                               'OSSUF',
                               'PHKIT',
                               'RCANC',
                               'REFER',
                               'ROBN',
                               'ROBS'
                              )
               AND ddsn not in (SELECT ddsn from dr06_iou)                                        
              )

SELECT * FROM dr09_requisition 
WHERE ord_dttm < dateadd(mm, -36, getdate())
AND lsc not in (
                'EXREP',
                'INPRO',
                'ISSIP',
                'OFFMP',
                'OFFTR',
                'OSSUF',
                'PHKIT',
                'RCANC',
                'REFER',
                'ROBN',
                'ROBS'
               )
AND ddsn not in (SELECT ddsn from dr06_iou)

SELECT * FROM dr11_acthist_hist
WHERE ddsn in (SELECT ddsn FROM dr14_rqn_hist 
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                              'EXREP',
                              'INPRO',
                              'ISSIP',
                              'OFFMP',
                              'OFFTR',
                              'OSSUF',
                              'PHKIT',
                              'RCANC',
                              'REFER',
                              'ROBN',
                              'ROBS'
                              )
              )

SELECT * FROM dr12_action_hist
WHERE ddsn in (SELECT ddsn FROM dr14_rqn_hist 
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                              'EXREP',
                              'INPRO',
                              'ISSIP',
                              'OFFMP',
                              'OFFTR',
                              'OSSUF',
                              'PHKIT',
                              'RCANC',
                              'REFER',
                              'ROBN',
                              'ROBS'
                              )
              )

SELECT * FROM dr13_lschist_hist
WHERE ddsn in (SELECT ddsn FROM dr14_rqn_hist 
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                              'EXREP',
                              'INPRO',
                              'ISSIP',
                              'OFFMP',
                              'OFFTR',
                              'OSSUF',
                              'PHKIT',
                              'RCANC',
                              'REFER',
                              'ROBN',
                              'ROBS'
                              )
              )

SELECT * FROM dr15_stshist_hist
WHERE ddsn in (SELECT ddsn FROM dr14_rqn_hist 
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                              'EXREP',
                              'INPRO',
                              'ISSIP',
                              'OFFMP',
                              'OFFTR',
                              'OSSUF',
                              'PHKIT',
                              'RCANC',
                              'REFER',
                              'ROBN',
                              'ROBS'
                              )
              )

SELECT * FROM dr14_rqn_hist 
WHERE ord_dttm < dateadd(mm, -36, getdate())
AND lsc not in (
               'EXREP',
               'INPRO',
               'ISSIP',
               'OFFMP',
               'OFFTR',
               'OSSUF',
               'PHKIT',
               'RCANC',
               'REFER',
               'ROBN',
               'ROBS'
               )

 ============{Purge records on active and history dr tables > 36 months}==============================


DELETE FROM dr01_acthistory
WHERE ddsn in (SELECT ddsn FROM dr09_requisition
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                               'EXREP',
                               'INPRO',
                               'ISSIP',
                               'OFFMP',
                               'OFFTR',
                               'OSSUF',
                               'PHKIT',
                               'RCANC',
                               'REFER',
                               'ROBN',
                               'ROBS'
                              )
               AND ddsn not in (SELECT ddsn from dr06_iou)                                        
             )

DELETE FROM dr02_action
WHERE ddsn in (SELECT ddsn FROM dr09_requisition
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                               'EXREP',
                               'INPRO',
                               'ISSIP',
                               'OFFMP',
                               'OFFTR',
                               'OSSUF',
                               'PHKIT',
                               'RCANC',
                               'REFER',
                               'ROBN',
                               'ROBS'
                              )
               AND ddsn not in (SELECT ddsn from dr06_iou)                                        
              )

DELETE FROM dr04_contract
WHERE ddsn in (SELECT ddsn FROM dr09_requisition
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                               'EXREP',
                               'INPRO',
                               'ISSIP',
                               'OFFMP',
                               'OFFTR',
                               'OSSUF',
                               'PHKIT',
                               'RCANC',
                               'REFER',
                               'ROBN',
                               'ROBS'
                              )
               AND ddsn not in (SELECT ddsn from dr06_iou)                                        
              )

DELETE FROM dr05_external
WHERE ddsn in (SELECT ddsn FROM dr09_requisition
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                               'EXREP',
                               'INPRO',
                               'ISSIP',
                               'OFFMP',
                               'OFFTR',
                               'OSSUF',
                               'PHKIT',
                               'RCANC',
                               'REFER',
                               'ROBN',
                               'ROBS'
                              )
               AND ddsn not in (SELECT ddsn from dr06_iou)                                        
              )

DELETE FROM dr07_lschistory
WHERE ddsn in (SELECT ddsn FROM dr09_requisition
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                               'EXREP',
                               'INPRO',
                               'ISSIP',
                               'OFFMP',
                               'OFFTR',
                               'OSSUF',
                               'PHKIT',
                               'RCANC',
                               'REFER',
                               'ROBN',
                               'ROBS'
                              )
               AND ddsn not in (SELECT ddsn from dr06_iou)                                        
              )

DELETE FROM dr10_stathistory
WHERE ddsn in (SELECT ddsn FROM dr09_requisition 
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                               'EXREP',
                               'INPRO',
                               'ISSIP',
                               'OFFMP',
                               'OFFTR',
                               'OSSUF',
                               'PHKIT',
                               'RCANC',
                               'REFER',
                               'ROBN',
                               'ROBS'
                              )
               AND ddsn not in (SELECT ddsn from dr06_iou)                                        
              )

DELETE FROM dr09_requisition 
WHERE ord_dttm < dateadd(mm, -36, getdate())
AND lsc not in (
                'EXREP',
                'INPRO',
                'ISSIP',
                'OFFMP',
                'OFFTR',
                'OSSUF',
                'PHKIT',
                'RCANC',
                'REFER',
                'ROBN',
                'ROBS'
               )
AND ddsn not in (SELECT ddsn from dr06_iou)

DELETE FROM dr11_acthist_hist
WHERE ddsn in (SELECT ddsn FROM dr14_rqn_hist 
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                              'EXREP',
                              'INPRO',
                              'ISSIP',
                              'OFFMP',
                              'OFFTR',
                              'OSSUF',
                              'PHKIT',
                              'RCANC',
                              'REFER',
                              'ROBN',
                              'ROBS'
                              )
              )

DELETE FROM dr12_action_hist
WHERE ddsn in (SELECT ddsn FROM dr14_rqn_hist 
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                              'EXREP',
                              'INPRO',
                              'ISSIP',
                              'OFFMP',
                              'OFFTR',
                              'OSSUF',
                              'PHKIT',
                              'RCANC',
                              'REFER',
                              'ROBN',
                              'ROBS'
                              )
              )

DELETE FROM dr13_lschist_hist
WHERE ddsn in (SELECT ddsn FROM dr14_rqn_hist 
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                              'EXREP',
                              'INPRO',
                              'ISSIP',
                              'OFFMP',
                              'OFFTR',
                              'OSSUF',
                              'PHKIT',
                              'RCANC',
                              'REFER',
                              'ROBN',
                              'ROBS'
                              )
              )

DELETE FROM dr15_stshist_hist
WHERE ddsn in (SELECT ddsn FROM dr14_rqn_hist 
               WHERE ord_dttm < dateadd(mm, -36, getdate())
               AND lsc not in (
                              'EXREP',
                              'INPRO',
                              'ISSIP',
                              'OFFMP',
                              'OFFTR',
                              'OSSUF',
                              'PHKIT',
                              'RCANC',
                              'REFER',
                              'ROBN',
                              'ROBS'
                              )
              )

DELETE FROM dr14_rqn_hist 
WHERE ord_dttm < dateadd(mm, -36, getdate())
AND lsc not in (
               'EXREP',
               'INPRO',
               'ISSIP',
               'OFFMP',
               'OFFTR',
               'OSSUF',
               'PHKIT',
               'RCANC',
               'REFER',
               'ROBN',
               'ROBS'
               )


# ============{Move active records > 6 months to  history dr tables}==============================

INSERT INTO dr11_acthist_hist
(
ddsn,
ddsn_suf,
act_hist_dttm,
fol_up_rmks,
dist_cd,
media_sts_cd,
adv_cd,
proj_cd,
sgnl_cd,
fund_cd,
supadd,
reqd_delv_dttm,
sts_doc_id,
rt_id_to,
sts_trans_dttm,
iss_pri_dsg,
cncl_qty)

SELECT
ddsn,
ddsn_suf,
act_hist_dttm,
fol_up_rmks,
dist_cd,
media_sts_cd,
adv_cd,
proj_cd,
sgnl_cd,
fund_cd,
supadd,
reqd_delv_dttm,
sts_doc_id,
rt_id_to,
sts_trans_dttm,
iss_pri_dsg,
cncl_qty

FROM dr01_acthistory
WHERE dr01_acthistory.ddsn in (SELECT ddsn FROM dr09_requisition 
WHERE dr09_requisition.ord_dttm < dateadd(mm,-6, getdate()) 
AND lsc not in ('EXREP', 'INPRO','ISSIP', 'OFFMP',
'OFFTR', 'OSSUF', 'PHKIT', 'RCANC',
'REFER', 'ROBN', 'ROBS'
)
AND ddsn not in (SELECT ddsn from dr06_iou)
)

DELETE FROM dr01_acthistory
WHERE dr01_acthistory.ddsn in (SELECT ddsn FROM dr09_requisition 
WHERE dr09_requisition.ord_dttm < dateadd(mm,-6, getdate()) 
AND lsc not in ('EXREP', 'INPRO','ISSIP', 'OFFMP',
'OFFTR', 'OSSUF', 'PHKIT', 'RCANC',
'REFER', 'ROBN', 'ROBS'
)
AND ddsn not in (SELECT ddsn from dr06_iou)
)


INSERT INTO dr12_action_hist
( 
  ddsn
, act_cur_dttm
, fol_up_rmks
, sts_doc_id
, dist_cd
, reqd_delv_dttm
, media_sts_cd
, proj_cd, sgnl_cd
, fund_cd, supadd
, adv_cd, ddsn_suf
, cncl_qty
, iss_pri_dsg
)

SELECT 
  ddsn
, act_cur_dttm
, fol_up_rmks
, sts_doc_id
, dist_cd
, reqd_delv_dttm
, media_sts_cd
, proj_cd, sgnl_cd
, fund_cd, supadd
, adv_cd, ddsn_suf
, cncl_qty
, iss_pri_dsg

FROM dr02_action 
WHERE dr02_action.ddsn in (SELECT ddsn FROM dr09_requisition 
WHERE dr09_requisition.ord_dttm < dateadd(mm,-6, getdate()) 
AND lsc not in ('EXREP', 'INPRO','ISSIP', 'OFFMP',
'OFFTR', 'OSSUF', 'PHKIT', 'RCANC',
'REFER', 'ROBN', 'ROBS'
)
AND ddsn not in (SELECT ddsn from dr06_iou)
)

DELETE FROM dr02_action 
WHERE dr02_action.ddsn in (SELECT ddsn FROM dr09_requisition 
WHERE dr09_requisition.ord_dttm < dateadd(mm,-6, getdate()) 
AND lsc not in ('EXREP', 'INPRO','ISSIP', 'OFFMP',
'OFFTR', 'OSSUF', 'PHKIT', 'RCANC',
'REFER', 'ROBN', 'ROBS'
)
AND ddsn not in (SELECT ddsn from dr06_iou)
)


INSERT INTO dr13_lschist_hist 
(
ddsn,
lsc,
lsc_dttm,
lsc_hist_dttm,
ddsn_suf
)

SELECT
ddsn,
lsc,
lsc_dttm,
lsc_hist_dttm,
ddsn_suf

FROM dr07_lschistory 
WHERE dr07_lschistory.ddsn in (SELECT ddsn FROM dr09_requisition 
WHERE dr09_requisition.ord_dttm < dateadd(mm,-6, getdate()) 
AND lsc not in ('EXREP', 'INPRO','ISSIP', 'OFFMP',
'OFFTR', 'OSSUF', 'PHKIT', 'RCANC',
'REFER', 'ROBN', 'ROBS'
)
AND ddsn not in (SELECT ddsn from dr06_iou)
)


DELETE FROM dr07_lschistory WHERE dr07_lschistory.ddsn in (SELECT ddsn FROM dr09_requisition 
WHERE dr09_requisition.ord_dttm < dateadd(mm,-6, getdate()) 
AND lsc not in ('EXREP', 'INPRO','ISSIP', 'OFFMP',
'OFFTR', 'OSSUF', 'PHKIT', 'RCANC',
'REFER', 'ROBN', 'ROBS'
)
AND ddsn not in (SELECT ddsn from dr06_iou)
)

INSERT INTO dr15_stshist_hist
(
ddsn,
ddsn_suf,
cntrc_no,
uic,
imprst_fund,
cur_niin,
sup_sts_cd,
fed_sup_schd,
rt_id_from,
cntrc_data,
mode_of_ship,
rt_id_last_acty,
sts_doc_id,
loctn,
sts_trans_dttm,
pod_qty,
cncl_qty,
min_ord_qty,
est_ship_dttm,
sts_qty,
unit_price,
sts_hist_dttm,
cntrc_cd,
ovg_cd,
subst_ovrd,
ui,
cog,
mcc,
fsc,
transp_cntl_doc,
hold_cd,
poe_cd
)

SELECT 
ddsn,
ddsn_suf,
cntrc_no,
uic,
imprst_fund,
cur_niin,
sup_sts_cd,
fed_sup_schd,
rt_id_from,
cntrc_data,
mode_of_ship,
rt_id_last_acty,
sts_doc_id,
loctn,
sts_trans_dttm,
pod_qty,
cncl_qty,
min_ord_qty,
est_ship_dttm,
sts_qty,
unit_price,
sts_hist_dttm,
cntrc_cd,
ovg_cd,
subst_ovrd,
ui,
cog,
mcc,
fsc,
transp_cntl_doc,
hold_cd,
poe_cd

FROM dr10_stathistory 
WHERE dr10_stathistory.ddsn in (SELECT ddsn FROM dr09_requisition 
WHERE dr09_requisition.ord_dttm < dateadd(mm,-6, getdate()) 
AND lsc not in ('EXREP', 'INPRO','ISSIP', 'OFFMP',
'OFFTR', 'OSSUF', 'PHKIT', 'RCANC',
'REFER', 'ROBN', 'ROBS'
)
AND ddsn not in (SELECT ddsn from dr06_iou)
)



DELETE FROM dr10_stathistory
WHERE dr10_stathistory.ddsn in (SELECT ddsn FROM dr09_requisition 
WHERE dr09_requisition.ord_dttm < dateadd(mm,-6, getdate()) 
AND lsc not in ('EXREP', 'INPRO','ISSIP', 'OFFMP',
'OFFTR', 'OSSUF', 'PHKIT', 'RCANC',
'REFER', 'ROBN', 'ROBS'
)
AND ddsn not in (SELECT ddsn from dr06_iou)
)

INSERT INTO dr14_rqn_hist 
(
ddsn,
jcn,
mcn,
wuc,
cage,
part_no,
mcc,
sgnl_cd,
reqd_delv_dttm,
proj_cd,
adv_cd,
scnd_adv_cd,
cur_niin,
sup_sts_cd,
rt_id_last_acty,
mode_of_ship,
match_set_ind,
rep_mcn,
orig_niin,
rt_id_to,
media_sts_cd,
org_cd,
wc_cd,
supadd,
ref_loc_use,
td_comp_fg,
rt_id_from,
tec,
fol_up_rmks,
dist_cd,
buno_serno,
demand_cd,
orig_purp_cd,
contg_cd,
rna_fg,
loctn,
lis_fg,
comp_serno,
lsc,
rqn_svc_dsg,
rqn_id_cd,
stk_fg,
fund_cd,
cur_mcn,
cur_ti_ddsn,
purp_cd,
awdue_ind,
ord_qty,
pod_qty,
cncl_qty,
iss_pri_dsg,
unit_price,
lsc_dttm,
est_ship_dttm,
rqn_act_dttm,
actl_rcpt_dttm,
issip_qty,
ord_dttm,
rob_qty,
last_fol_up_dttm,
sts_trans_dttm,
invc_qty,
awdue_dttm,
contg_ship_dttm,
contg_dop,
oafm_ddsn,
pkup_id,
peb_pkup_org,
prim_niin,
ty_rqn_ind,
excl_eff_ind,
dscrp_qty,
ddsn_suf,
del_ind,
spcl_dscrp_fg,
rqn_trans_dttm,
actl_rob_qty,
cog,
smic,
apl_ael,
tot_rob_qty,
rob_dmg_ind,
reord_ddsn
)

SELECT 
ddsn,
jcn,
mcn,
wuc,
cage,
part_no,
mcc,
sgnl_cd,
reqd_delv_dttm,
proj_cd,
adv_cd,
scnd_adv_cd,
cur_niin,
sup_sts_cd,
rt_id_last_acty,
mode_of_ship,
match_set_ind,
rep_mcn,
orig_niin,
rt_id_to,
media_sts_cd,
org_cd,
wc_cd,
supadd,
ref_loc_use,
td_comp_fg,
rt_id_from,
tec,
fol_up_rmks,
dist_cd,
buno_serno,
demand_cd,
orig_purp_cd,
contg_cd,
rna_fg,
loctn,
lis_fg,
comp_serno,
lsc,
rqn_svc_dsg,
rqn_id_cd,
stk_fg,
fund_cd,
cur_mcn,
cur_ti_ddsn,
purp_cd,
awdue_ind,
ord_qty,
pod_qty,
cncl_qty,
iss_pri_dsg,
unit_price,
lsc_dttm,
est_ship_dttm,
rqn_act_dttm,
actl_rcpt_dttm,
issip_qty,
ord_dttm,
rob_qty,
last_fol_up_dttm,
sts_trans_dttm,
invc_qty,
awdue_dttm,
contg_ship_dttm,
contg_dop,
oafm_ddsn,
pkup_id,
peb_pkup_org,
prim_niin,
ty_rqn_ind,
excl_eff_ind,
dscrp_qty,
ddsn_suf,
del_ind,
spcl_dscrp_fg,
rqn_trans_dttm,
actl_rob_qty,
cog,
smic,
apl_ael,
tot_rob_qty,
rob_dmg_ind,
reord_ddsn

FROM dr09_requisition
WHERE dr09_requisition.ord_dttm < dateadd(mm, -6, getdate())
AND lsc not in ('EXREP', 'INPRO','ISSIP', 'OFFMP',
'OFFTR', 'OSSUF', 'PHKIT', 'RCANC',
'REFER', 'ROBN', 'ROBS'
)
AND ddsn not in (SELECT ddsn from dr06_iou)



DELETE FROM dr09_requisition WHERE dr09_requisition.ord_dttm < dateadd(mm, -6, getdate())
AND lsc not in ('EXREP', 'INPRO','ISSIP', 'OFFMP',
'OFFTR', 'OSSUF', 'PHKIT', 'RCANC',
'REFER', 'ROBN', 'ROBS'
)
AND ddsn not in (SELECT ddsn from dr06_iou)




