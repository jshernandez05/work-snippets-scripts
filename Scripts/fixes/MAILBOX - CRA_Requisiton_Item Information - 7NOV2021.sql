SELECT	dg12.mcn, dr09.cur_mcn 'dr09_cur_mcn', dr09.rep_mcn 'dr09.rep_mcn', ds03.cur_mcn 'ds03_cur_mcn', ds03.rep_mcn 'ds03_rep_mcn',
		dg12.fgc, dg12.niin, dg12.comp_serno 'dg12 comp_serno', ds03. comp_serno 'ds03 comp_serno', maint_act_sts, maint_act_dttm, 
		act_take_cd, dr09.wc_cd, ds03.ti_ddsn 'ds03_ti', ds03.cur_ti_ddsn 'ds03_cur_ti', dr09.org_cd, dr09.jcn
		
FROM	dg12_comp_rep_act dg12
		LEFT JOIN ds03_item ds03 on (dg12.mcn = ds03.rep_mcn or dg12.mcn = ds03.cur_mcn)
		LEFT JOIN dr09_requisition dr09 on (dr09.ddsn = ds03.cur_ti_ddsn or dr09.ddsn = ds03.ti_ddsn)
		
WHERE	dg12.mcn like 'GC1K68P'


