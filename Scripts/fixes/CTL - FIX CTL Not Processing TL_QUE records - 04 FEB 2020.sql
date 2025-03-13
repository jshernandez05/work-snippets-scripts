

SELECT 'tl_que_mtis_offld', convert(varchar,trans_dt,109) trans_dt, trans_cd, niin, allow_ty_ind, logon
FROM    tl_que_mtis_offld
having trans_dt = min(trans_dt)
UNION
SELECT 'tl_que_mvo', convert(varchar,trans_dt,109) trans_dt, trans_cd, org_cd, fc_svc_dsg, logon
FROM    tl_que_mvo
having trans_dt = min(trans_dt)
UNION
SELECT 'tl_que_nalc_carc',convert(varchar,rsup_trans_dt,109) trans_dt, trans_cd, niin, allow_ty_ind, logon
FROM    tl_que_nalc_carc
having rsup_trans_dt = min(rsup_trans_dt)
UNION
SELECT 'tl_que_rcpt', convert(varchar,trans_dt,109) trans_dt, trans_cd, niin, allow_ty_ind, logon
FROM    tl_que_rcpt
having trans_dt = min(trans_dt)
UNION
SELECT 'tl_que_fgm', convert(varchar,trans_dt,109) trans_dt, trans_cd, niin, ' ', logon
FROM    tl_que_fgm
having trans_dt = min(trans_dt)
UNION
SELECT 'tl_que_fin', convert(varchar,trans_dt,109) trans_dt, trans_cd, adjmt_fy, fc_svc_dsg, fc
FROM    tl_que_fin
having trans_dt = min(trans_dt)
UNION
SELECT 'tl_que_rqn_reord', convert(varchar,trans_dt,109) trans_dt, trans_cd, niin, allow_ty_ind, logon
FROM    tl_que_rqn_reord
having trans_dt = min(trans_dt)
UNION
SELECT 'tl_que_strm_iss', convert(varchar,trans_dt,109) trans_dt, trans_cd, niin, allow_ty_ind, logon
FROM    tl_que_strm_iss
having trans_dt = min(trans_dt)
UNION
SELECT 'tl_que_sts', convert(varchar,trans_dt,109) trans_dt, trans_cd, sup_niin, allowance_type_indicator, logon
FROM    tl_que_sts
having trans_dt = min(trans_dt)
UNION
SELECT 'tl_que_msi', convert(varchar,trans_dt,109) trans_dt, trans_cd, niin, allow_ty_ind, logon
FROM    tl_que_msi
having trans_dt = min(trans_dt)
UNION
SELECT 'tl_que_loc', convert(varchar,trans_dt,109) trans_dt, trans_cd, niin, allow_ty_ind, logon
from tl_que_loc
having trans_dt = min(trans_dt)
order by 2
go



SELECT 'tl_que_allow_adjmt', count(trans_dt)
FROM    tl_que_allow_adjmt
where trans_dt >= '12/07/2021'
and trans_dt <= '12/08/2021'

UNION
SELECT 'tl_que_cosal_dist', count(trans_dt)
FROM    tl_que_cosal_dist
where trans_dt >= '12/07/2021'
and trans_dt <= '12/08/2021'

UNION
SELECT 'tl_que_inv1', count(trans_dt)
FROM    tl_que_inv1
where trans_dt >= '12/07/2021'
and trans_dt <= '12/08/2021'

UNION
SELECT 'tl_que_inv_adj', count(trans_dt)
FROM    tl_que_inv_adj
where trans_dt >= '12/07/2021'
and trans_dt <= '12/08/2021'

UNION
SELECT 'tl_que_malsp', count(trans_dt)
FROM    tl_que_malsp
where trans_dt >= '12/07/2021'
and trans_dt <= '12/08/2021'

UNION
SELECT 'tl_que_mtis_offld', count(trans_dt)
FROM    tl_que_mtis_offld
where trans_dt >= '12/07/2021'
and trans_dt <= '12/08/2021'

UNION
SELECT 'tl_que_mvo', count(trans_dt)
FROM    tl_que_mvo
where trans_dt >= '12/07/2021'
and trans_dt <= '12/08/2021'

UNION
SELECT 'tl_que_nalc_carc',count(rsup_trans_dt)
FROM    tl_que_nalc_carc
where  rsup_trans_dt  >= '12/07/2021'
and  rsup_trans_dt  <= '12/08/2021'

UNION
SELECT 'tl_que_rcpt', count(trans_dt)
FROM    tl_que_rcpt
where trans_dt >= '12/07/2021'
and trans_dt <= '12/08/2021'

UNION
SELECT 'tl_que_fgm', count(trans_dt)
FROM    tl_que_fgm
where trans_dt >= '12/07/2021'
and trans_dt <= '12/08/2021'

UNION
SELECT 'tl_que_fin',count(trans_dt)
FROM    tl_que_fin
where trans_dt >= '12/07/2021'
and trans_dt <= '12/08/2021'

UNION
SELECT 'tl_que_rqn_reord', count(trans_dt)
FROM    tl_que_rqn_reord
where trans_dt >= '12/07/2021'
and trans_dt <= '12/08/2021'

UNION
SELECT 'tl_que_strm_iss', count(trans_dt)
FROM    tl_que_strm_iss
where trans_dt >= '12/07/2021'
and trans_dt <= '12/08/2021'

UNION
SELECT 'tl_que_sts', count(trans_dt)
FROM    tl_que_sts
where trans_dt >= '12/07/2021'
and trans_dt <= '12/08/2021'

UNION
SELECT 'tl_que_msi', count(trans_dt)
FROM    tl_que_msi
where trans_dt >= '12/07/2021'
and trans_dt <= '12/08/2021'

UNION
SELECT 'tl_que_loc', count(trans_dt)
from tl_que_loc
where trans_dt >= '12/07/2021'
and trans_dt <= '12/08/2021'
order by 2 desc





/********************************************************/
/*    Vailidate Index and fk references/constraints     */
/********************************************************/ 

sp_depends tl_matl_hdr
go

sp_depends tl_matl_trlr 
go 

sp_depends tl_matl_data
go

sp_helpindex tl_matl_hdr
go

sp_helpindex tl_matl_trlr 
go 

sp_helpindex tl_matl_data
go


select * from sysindexes
where name in ('XIE1tl_matl_data', 'XPKtl_fin_data', 
				'XPKtl_matl_data', 'XPKtl_matl_hdr', 'XPKtl_matl_trir')
order by name
go


/*****************************************/
/*             Create index              */
/*****************************************/ 

-- alter table tl_matl_hdr disable trigger

go

create unique nonclustered
		index XPKtl_matl_hdr
	on  tl_matl_hdr 
		(niin, cosal_ty_cd, mon_yr) 

/*****************************************/
/*     Add Constraints/fk References     */
/*****************************************/ 

    /**** tl_matl_data - constraint ****/
  
-- ALTER TABLE supply.dbo.tl_matl_data
	ADD CONSTRAINT fk_tl_matl_hdr_has_matl_data
	FOREIGN KEY (niin, cosal_ty_cd, mon_yr)
	REFERENCES supply.dbo.tl_matl_hdr(niin, cosal_ty_cd, mon_yr)
go

-- ALTER TABLE supply.dbo.tl_matl_data
	ADD CONSTRAINT fk_tl_matl_hdr_has_trans_cd
	FOREIGN KEY (trans_cd)
	REFERENCES supply.dbo.tl_trans_code(trans_cd)
go


    /**** tl_matl_trlr - constraint ****/

-- ALTER TABLE supply.dbo.tl_matl_trlr
	ADD CONSTRAINT XPKtl_matl_trlr
	PRIMARY KEY NONCLUSTERED(niin, cosal_ty_cd, mon_yr)
		on 'defualt'
			
go

-- ALTER TABLE supply.dbo.tl_matl_trlr
	ADD CONSTRAINT fk_tl_matl_hdr_has_matl_trlr
	FOREIGN KEY (niin, cosal_ty_cd, mon_yr)
	REFERENCES supply.dbo.tl_matl_hdr(niin, cosal_ty_cd, mon_yr)
go


    /**** tl_matl_hdr - constraint ****/
    
	
-- ALTER TABLE supply.dbo.tl_matl_hdr
	ADD CONSTRAINT XPKtl_matl_hdr
	PRIMARY KEY NONCLUSTERED(niin, cosal_ty_cd, mon_yr)
		on 'defualt'
go



-- alter table tl_matl_hdr enable trigger	
go







