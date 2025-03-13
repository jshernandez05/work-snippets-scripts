SELECT 'tl_que_allow_adjmt', count(trans_dt)
FROM    tl_que_allow_adjmt
where trans_dt >= '01/15/2020'
and trans_dt <= '02/05/2020 9:00AM'

UNION
SELECT 'tl_que_cosal_dist', count(trans_dt)
FROM    tl_que_cosal_dist
where trans_dt >= '01/15/2020'
and trans_dt <= '02/05/2020 9:00AM'

UNION
SELECT 'tl_que_inv1', count(trans_dt)
FROM    tl_que_inv1
where trans_dt >= '01/15/2020'
and trans_dt <= '02/05/2020 9:00AM'

UNION
SELECT 'tl_que_inv_adj', count(trans_dt)
FROM    tl_que_inv_adj
where trans_dt >= '01/15/2020'
and trans_dt <= '02/05/2020 9:00AM'

UNION
SELECT 'tl_que_malsp', count(trans_dt)
FROM    tl_que_malsp
where trans_dt >= '01/15/2020'
and trans_dt <= '02/05/2020 9:00AM'

UNION
SELECT 'tl_que_mtis_offld', count(trans_dt)
FROM    tl_que_mtis_offld
where trans_dt >= '01/15/2020'
and trans_dt <= '02/05/2020 9:00AM'

UNION
SELECT 'tl_que_mvo', count(trans_dt)
FROM    tl_que_mvo
where trans_dt >= '01/15/2020'
and trans_dt <= '02/05/2020 9:00AM'

UNION
SELECT 'tl_que_nalc_carc',count(rsup_trans_dt)
FROM    tl_que_nalc_carc
where  rsup_trans_dt  >= '01/15/2020'
and  rsup_trans_dt  <= '02/05/2020 9:00AM'

UNION
SELECT 'tl_que_rcpt', count(trans_dt)
FROM    tl_que_rcpt
where trans_dt >= '01/15/2020'
and trans_dt <= '02/05/2020 9:00AM'

UNION
SELECT 'tl_que_fgm', count(trans_dt)
FROM    tl_que_fgm
where trans_dt >= '01/15/2020'
and trans_dt <= '02/05/2020 9:00AM'

UNION
SELECT 'tl_que_fin',count(trans_dt)
FROM    tl_que_fin
where trans_dt >= '01/15/2020'
and trans_dt <= '02/05/2020 9:00AM'

UNION
SELECT 'tl_que_rqn_reord', count(trans_dt)
FROM    tl_que_rqn_reord
where trans_dt >= '01/15/2020'
and trans_dt <= '02/05/2020 9:00AM'

UNION
SELECT 'tl_que_strm_iss', count(trans_dt)
FROM    tl_que_strm_iss
where trans_dt >= '01/15/2020'
and trans_dt <= '02/05/2020 9:00AM'

UNION
SELECT 'tl_que_sts', count(trans_dt)
FROM    tl_que_sts
where trans_dt >= '01/15/2020'
and trans_dt <= '02/05/2020 9:00AM'

UNION
SELECT 'tl_que_msi', count(trans_dt)
FROM    tl_que_msi
where trans_dt >= '01/15/2020'
and trans_dt <= '02/05/2020 9:00AM'

UNION
SELECT 'tl_que_loc', count(trans_dt)
from tl_que_loc
where trans_dt >= '01/15/2020'
and trans_dt <= '02/05/2020 9:00AM'
order by 2 desc


-- alter table tl_matl_hdr disable trigger
go

create unique nonclustered
		index XPKtl_matl_hdr
	on  tl_matl_hdr
		(niin, cosal_ty_cd, mon_yr)

--ALTER TABLE supply.dbo.tl_matl_hdr
	ADD CONSTRAINT fk_tl_matl_hdr_has_matl_data
	FOREIGN KEY (cosal_ty_cd, mon_yr, niin)
	REFERENCES supply.dbo.tl_matl_data(cosal_ty_cd, mon_yr, niin)
go

-- alter table tl_matl_hdr enable trigger

select * from zq_owner4
go

select * from sysindexes
order by name
go


sp_helpindex tl_matl_hdr
go




create [unique] [clustered | nonclustered]
		index index_name
	on [[database.]owner.]table_name
		(column_name [asc | desc]
			[, column_name [asc | desc]]...)
	[with { fillfactor = pct,
			max_rows_per_page = num_rows,
			reservepagegap = num_pages,
			consumers = x, ignore_dup_key, sorted_data,
			[ignore_dup_row | allow_dup_row],
 			 statistics using num_steps values  } ]
	[on segment_name]