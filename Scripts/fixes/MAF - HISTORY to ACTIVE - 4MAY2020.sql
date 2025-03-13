/*************************************************************/
/*   Bring back dm18_maf_hist to ACTIVE DM04_MAF             */
/*************************************************************/

insert into dm04_maf 
(
    dm04_maf.niin,
    dm04_maf.mcn,
    dm04_maf.jcn,
    dm04_maf.wrk_pri_cd,
    dm04_maf.act_take_cd,
    dm04_maf.mal_dscrptn_cd,
    dm04_maf.wh_disc_cd,
    dm04_maf.ty_maint,
    dm04_maf.pos_cd,
    dm04_maf.sys_rsn,
    dm04_maf.sft_engr_serno,
    dm04_maf.maint_act_sts,
    dm04_maf.ei_cd,
    dm04_maf.td_cd,
    dm04_maf.td_basic_no,
    dm04_maf.td_kit_no,
    dm04_maf.td_intrm_cd,
    dm04_maf.td_rev_ltr,
    dm04_maf.td_amend,
    dm04_maf.td_part_no,
    dm04_maf.chk_test_fg,
    dm04_maf.cur_ti_ddsn,
    dm04_maf.cntl_mcn,
    dm04_maf.eqp_sts_cd,
    dm04_maf.fid_cd,
    dm04_maf.inspt_jcn,
    dm04_maf.buno_serno,
    dm04_maf.icrl_ovrd_fg,
    dm04_maf.awp_loctn,
    dm04_maf.ty_maf_cd,
    dm04_maf.wuc,
    dm04_maf.wc_cd,
    dm04_maf.tec,
    dm04_maf.se_mtr,
    dm04_maf.org_cd,
    dm04_maf.apprvl_fg,
    dm04_maf.matl_delv_pt,
    dm04_maf.ti_ddsn,
    dm04_maf.cage_se_comp,
    dm04_maf.part_no,
    dm04_maf.onsite_ndi_fg,
    dm04_maf.clsout_fg,
    dm04_maf.trblsh_fg,
    dm04_maf.awp_clsout_fg,
    dm04_maf.comp_rep_fg,
    dm04_maf.inv_cd,
    dm04_maf.ovrd_td_fg,
    dm04_maf.ti_maf_fg,
    dm04_maf.maint_lv_cd,
    dm04_maf.itm_prc,
    dm04_maf.maint_act_dttm,
    dm04_maf.init_dttm,
    dm04_maf.maint_trans_cd,
    dm04_maf.bcm_hist,
    dm04_maf.cannib_dttm,
    dm04_maf.tot_awm_hrs,
    dm04_maf.tot_emt_hrs,
    dm04_maf.tot_man_hrs,
    dm04_maf.cannib_ddsn,
    dm04_maf.del_ind,
    dm04_maf.cage_eng_comp,
    dm04_maf.xref_ind
)
select
    dm18_maf_hist.niin,
    dm18_maf_hist.mcn,
    dm18_maf_hist.jcn,
    dm18_maf_hist.wrk_pri_cd,
    dm18_maf_hist.act_take_cd,
    dm18_maf_hist.mal_dscrptn_cd,
    dm18_maf_hist.wh_disc_cd,
    dm18_maf_hist.ty_maint,
    dm18_maf_hist.pos_cd,
    dm18_maf_hist.sys_rsn,
    dm18_maf_hist.sft_engr_serno,
    dm18_maf_hist.maint_act_sts,
    dm18_maf_hist.ei_cd,
    dm18_maf_hist.td_cd,
    dm18_maf_hist.td_basic_no,
    dm18_maf_hist.td_kit_no,
    dm18_maf_hist.td_intrm_cd,
    dm18_maf_hist.td_rev_ltr,
    dm18_maf_hist.td_amend,
    dm18_maf_hist.td_part_no,
    dm18_maf_hist.chk_test_fg,
    dm18_maf_hist.cur_ti_ddsn,
    dm18_maf_hist.cntl_mcn,
    dm18_maf_hist.eqp_sts_cd,
    dm18_maf_hist.fid_cd,
    dm18_maf_hist.inspt_jcn,
    dm18_maf_hist.buno_serno,
    dm18_maf_hist.icrl_ovrd_fg,
    dm18_maf_hist.awp_loctn,
    dm18_maf_hist.ty_maf_cd,
    dm18_maf_hist.wuc,
    dm18_maf_hist.wc_cd,
    dm18_maf_hist.tec,
    dm18_maf_hist.se_mtr,
    dm18_maf_hist.org_cd,
    dm18_maf_hist.apprvl_fg,
    dm18_maf_hist.matl_delv_pt,
    dm18_maf_hist.ti_ddsn,
    dm18_maf_hist.cage_se_comp,
    dm18_maf_hist.part_no,
    dm18_maf_hist.onsite_ndi_fg,
    dm18_maf_hist.clsout_fg,
    dm18_maf_hist.trblsh_fg,
    dm18_maf_hist.awp_clsout_fg,
    'Y',
    dm18_maf_hist.inv_cd,
    dm18_maf_hist.ovrd_td_fg,
    dm18_maf_hist.ti_maf_fg,
    dm18_maf_hist.maint_lv_cd,
    dm18_maf_hist.itm_prc,
    dm18_maf_hist.maint_act_dttm,
    dm18_maf_hist.init_dttm,
    dm18_maf_hist.maint_trans_cd,
    dm18_maf_hist.bcm_hist,
    dm18_maf_hist.cannib_dttm,
    dm18_maf_hist.tot_awm_hrs,
    dm18_maf_hist.tot_emt_hrs,
    dm18_maf_hist.tot_man_hrs,
    dm18_maf_hist.cannib_ddsn,
    dm18_maf_hist.del_ind,
    dm18_maf_hist.cage_eng_comp,
    dm18_maf_hist.xref_ind
from dm18_maf_hist where dm18_maf_hist.mcn in ('2OMEU3O')
go




insert into dm01_fail_req 
(
    dm01_fail_req.mcn,
    dm01_fail_req.act_take_cd,
    dm01_fail_req.ref_loc_use,
    dm01_fail_req.ddsn,
    dm01_fail_req.awp_fg,
    dm01_fail_req.ref_symb,
    dm01_fail_req.fail_part_fg,
    dm01_fail_req.fail_cage,
    dm01_fail_req.fail_part_no,
    dm01_fail_req.mal_dscrptn_cd,
    dm01_fail_req.ty_itm_ind,
    dm01_fail_req.matl_index,
    dm01_fail_req.repl_reqd_fg,
    dm01_fail_req.ovrd_cgpn_fg,
    dm01_fail_req.ti_crit_fg,
    dm01_fail_req.ti_maf_fg,
    dm01_fail_req.proj_cd,
    dm01_fail_req.scnd_adv_cd,
    dm01_fail_req.cannib_fg,
    dm01_fail_req.actl_rcpt_dttm,
    dm01_fail_req.fail_qty,
    dm01_fail_req.xref_ind,
    dm01_fail_req.iss_pri_dsg,
    dm01_fail_req.ord_dttm,
    dm01_fail_req.ti_mcn,
    dm01_fail_req.reqd_cage,
    dm01_fail_req.reqd_part_no,
    dm01_fail_req.ovrd_reqd_cgpn_fg,
    dm01_fail_req.end_itm_rep_fg,
    dm01_fail_req.reord_xref_ind,
    dm01_fail_req.ord_otcpn_fg
)
select
    dm15_fail_req_hist.mcn,
    dm15_fail_req_hist.act_take_cd,
    dm15_fail_req_hist.ref_loc_use,
    dm15_fail_req_hist.ddsn,
    dm15_fail_req_hist.awp_fg,
    dm15_fail_req_hist.ref_symb,
    dm15_fail_req_hist.fail_part_fg,
    dm15_fail_req_hist.fail_cage,
    dm15_fail_req_hist.fail_part_no,
    dm15_fail_req_hist.mal_dscrptn_cd,
    dm15_fail_req_hist.ty_itm_ind,
    dm15_fail_req_hist.matl_index,
    dm15_fail_req_hist.repl_reqd_fg,
    dm15_fail_req_hist.ovrd_cgpn_fg,
    dm15_fail_req_hist.ti_crit_fg,
    dm15_fail_req_hist.ti_maf_fg,
    dm15_fail_req_hist.proj_cd,
    dm15_fail_req_hist.scnd_adv_cd,
    dm15_fail_req_hist.cannib_fg,
    dm15_fail_req_hist.actl_rcpt_dttm,
    dm15_fail_req_hist.fail_qty,
    dm15_fail_req_hist.xref_ind,
    dm15_fail_req_hist.iss_pri_dsg,
    dm15_fail_req_hist.ord_dttm,
    dm15_fail_req_hist.ti_mcn,
    dm15_fail_req_hist.reqd_cage,
    dm15_fail_req_hist.reqd_part_no,
    dm15_fail_req_hist.ovrd_reqd_cgpn_fg,
    dm15_fail_req_hist.end_itm_rep_fg,
    dm15_fail_req_hist.reord_xref_ind,
    dm15_fail_req_hist.ord_otcpn_fg
from dm15_fail_req_hist where dm15_fail_req_hist.mcn in ('2OMEU3O')
go


insert into dm02_hours 
(
    dm02_hours.mcn,
    dm02_hours.last_nm,
    dm02_hours.toolbx_no,
    dm02_hours.init_3,
    dm02_hours.shift,
    dm02_hours.create_dttm,
    dm02_hours.hrs_wrk
)
select
    dm16_hours_hist.mcn,
    dm16_hours_hist.last_nm,
    dm16_hours_hist.toolbx_no,
    dm16_hours_hist.init_3,
    dm16_hours_hist.shift,
    dm16_hours_hist.create_dttm,
    dm16_hours_hist.hrs_wrk
from dm16_hours_hist where dm16_hours_hist.mcn in ('2OMEU3O')
go



insert into dm03_jshistory 
(
    dm03_jshistory.mcn,
    dm03_jshistory.maint_act_sts,
    dm03_jshistory.maint_act_dttm
)
select
    dm17_jshist_hist.mcn,
    dm17_jshist_hist.maint_act_sts,
    dm17_jshist_hist.maint_act_dttm
from dm17_jshist_hist where dm17_jshist_hist.mcn in ('2OMEU3O')
go



insert into dm06_maf_correct 
(
    dm06_maf_correct.mcn,
    dm06_maf_correct.logs_reqd_fg,
    dm06_maf_correct.qa_cntl_lv,
    dm06_maf_correct.corr_act,
    dm06_maf_correct.wkr_sig,
    dm06_maf_correct.logs_rec_sig,
    dm06_maf_correct.maint_cntl_sig,
    dm06_maf_correct.qa_cdi_sig,
    dm06_maf_correct.supr_sig,
    dm06_maf_correct.data_sig,
    dm06_maf_correct.pc_sig,
    dm06_maf_correct.apprv_dttm,
    dm06_maf_correct.supr_signo_dttm,
    dm06_maf_correct.pc_signo_dttm
)
select
    dm19_correct_hist.mcn,
    dm19_correct_hist.logs_reqd_fg,
    dm19_correct_hist.qa_cntl_lv,
    dm19_correct_hist.corr_act,
    dm19_correct_hist.wkr_sig,
    dm19_correct_hist.logs_rec_sig,
    dm19_correct_hist.maint_cntl_sig,
    dm19_correct_hist.qa_cdi_sig,
    dm19_correct_hist.supr_sig,
    dm19_correct_hist.data_sig,
    dm19_correct_hist.pc_sig,
    dm19_correct_hist.apprv_dttm,
    dm19_correct_hist.supr_signo_dttm,
    dm19_correct_hist.pc_signo_dttm
from dm19_correct_hist where dm19_correct_hist.mcn in ('2OMEU3O')
go



insert into dm07_maf_discrep 
(
    dm07_maf_discrep.mcn,
    dm07_maf_discrep.dscrp,
    dm07_maf_discrep.dscrp_2,
    dm07_maf_discrep.dscrp_3,
    dm07_maf_discrep.dscrp_4,
    dm07_maf_discrep.dscrp_5,
    dm07_maf_discrep.dscrp_6, 
    dm07_maf_discrep.int_by
)
select
    dm20_discrep_hist.mcn,
    dm20_discrep_hist.dscrp,
    dm20_discrep_hist.dscrp_2,
    dm20_discrep_hist.dscrp_3,
    dm20_discrep_hist.dscrp_4,
    dm20_discrep_hist.dscrp_5,
    dm20_discrep_hist.dscrp_6,
    dm20_discrep_hist.int_by
from dm20_discrep_hist where dm20_discrep_hist.mcn in ('2OMEU3O')
go


insert into dm09_removed 
(
    dm09_removed.mcn,
    dm09_removed.e_part_no,
    dm09_removed.e_serno,
    dm09_removed.e_cage,
    dm09_removed.e_tm_cy,
    dm09_removed.e_tm_cy_1,
    dm09_removed.e_tm_cy_2,
    dm09_removed.g_cage,
    dm09_removed.g_part_no,
    dm09_removed.g_serno,
    dm09_removed.g_tm_cy,
    dm09_removed.g_tm_cy_1,
    dm09_removed.g_tm_cy_2,
    dm09_removed.ref_loc_use,
    dm09_removed.itm_cfg_fg,
    dm09_removed.repl_reqd_fg,
    dm09_removed.ovrd_cfgmt_fg,
    dm09_removed.ovrd_cpnrm_fg,
    dm09_removed.ovrd_otcpn_fg,
    dm09_removed.ord_more_part_fg,
    dm09_removed.icrl_ovrd_fg,
    dm09_removed.ovrd_cpni_fg,
    dm09_removed.ovrd_eqpi_fg,
    dm09_removed.rep_mcn,
    dm09_removed.rem_itm_dttm
)
select
    dm21_removed_hist.mcn,
    dm21_removed_hist.e_part_no,
    dm21_removed_hist.e_serno,
    dm21_removed_hist.e_cage,
    dm21_removed_hist.e_tm_cy,
    dm21_removed_hist.e_tm_cy_1,
    dm21_removed_hist.e_tm_cy_2,
    dm21_removed_hist.g_cage,
    dm21_removed_hist.g_part_no,
    dm21_removed_hist.g_serno,
    dm21_removed_hist.g_tm_cy,
    dm21_removed_hist.g_tm_cy_1,
    dm21_removed_hist.g_tm_cy_2,
    dm21_removed_hist.ref_loc_use,
    dm21_removed_hist.itm_cfg_fg,
    dm21_removed_hist.repl_reqd_fg,
    dm21_removed_hist.ovrd_cfgmt_fg,
    dm21_removed_hist.ovrd_cpnrm_fg,
    dm21_removed_hist.ovrd_otcpn_fg,
    dm21_removed_hist.ord_more_part_fg,
    dm21_removed_hist.icrl_ovrd_fg,
    dm21_removed_hist.ovrd_cpni_fg,
    dm21_removed_hist.ovrd_eqpi_fg,
    dm21_removed_hist.rep_mcn,
    dm21_removed_hist.rem_itm_dttm
from dm21_removed_hist where dm21_removed_hist.mcn in ('2OMEU3O')
go



insert into dm12_maf_note 
(
    dm12_maf_note.mcn,
    dm12_maf_note.orignr,
    dm12_maf_note.subj,
    dm12_maf_note.maf_note,
    dm12_maf_note.note_dttm
)
select
    dm22_note_hist.mcn,
    dm22_note_hist.orignr,
    dm22_note_hist.subj,
    dm22_note_hist.maf_note,
    dm22_note_hist.note_dttm
from dm22_note_hist where dm22_note_hist.mcn in ('2OMEU3O')
go

insert into dm14_in_proc_inspt
(
	dm14_in_proc_inspt.mcn,
	dm14_in_proc_inspt.inspt_title,
	dm14_in_proc_inspt.inspt_dscrptn,
	dm14_in_proc_inspt.inspt_by,
	dm14_in_proc_inspt.inspt_dttm,
	dm14_in_proc_inspt.init_dttm,
	dm14_in_proc_inspt.step
)
select
	dm23_in_proc_hist.mcn,
	dm23_in_proc_hist.inspt_title,
	dm23_in_proc_hist.inspt_dscrptn,
	dm23_in_proc_hist.inspt_by,
	dm23_in_proc_hist.inspt_dttm,
	dm23_in_proc_hist.init_dttm,
	dm23_in_proc_hist.step
from dm23_in_proc_hist where dm23_in_proc_hist.mcn in ('2OMEU3O')
go





/*************************************************************/
/*   Delete dm18_maf_hist after move to ACTIVE               */
/*************************************************************/
delete from dm23_in_proc_hist where dm23_in_proc_hist.mcn in ('2OMEU3O')
go

delete from dm22_note_hist where dm22_note_hist.mcn in ('2OMEU3O')
go

delete from dm21_removed_hist where dm21_removed_hist.mcn in ('2OMEU3O')
go

delete from dm20_discrep_hist where dm20_discrep_hist.mcn in ('2OMEU3O')
go


delete from dm19_correct_hist where dm19_correct_hist.mcn in ('2OMEU3O')
go

delete from dm17_jshist_hist where dm17_jshist_hist.mcn in ('2OMEU3O')
go

delete from dm16_hours_hist where dm16_hours_hist.mcn in ('2OMEU3O')
go

delete from dm15_fail_req_hist where dm15_fail_req_hist.mcn in ('2OMEU3O')
go

delete from dm18_maf_hist where dm18_maf_hist.mcn in ('2OMEU3O')
go

