SELECT dm18.maint_act_sts  'dm18 maint_sts', dm18.maint_act_dttm 'dm18 dttm', 
       dm17.maint_act_sts ' dm17 maint_sts', dm17.maint_act_dttm 'dm17 dttm', 
       DATEDIFF(dd,dm18.maint_act_dttm,dm17.maint_act_dttm) 'datediff', ty_maf_cd
FROM dm18_maf_hist dm18
  JOIN dm17_jshist_hist dm17 ON dm18.mcn = dm17.mcn
WHERE (cur_ti_ddsn not like null or cur_ti_ddsn not like '')
 AND  dm17.maint_act_sts like ('A1')
  