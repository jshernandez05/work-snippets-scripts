SELECT	niin NIIN, requisitioning_objective RO , reorder_point_qty RP, on_hand_quantity_total TOT_OH, pack_up_quantity PUK_QTY,
		not_ready_for_issue_qty NRFI, cstdy_qty CSTDY_QTY
FROM	stock_item 
WHERE	niin like '015831756'
GO



UPDATE	stock_item 
SET		on_hand_quantity_total = 18
WHERE	niin like '015831756'
GO


--Update Location Qty if Qty Moving Back to NRFI
SELECT	* 
FROM	item_loc
WHERE	niin like '015831756'
GO



UPDATE	item_loc 
SET		onhand_quantity = 10
WHERE	niin like '015831756'
GO




select data.niin, data.trans_dt, data.trans_cd, data.trans_data, code. data_breakout, data.lname, data.fname, 
trlr.cog, trlr.mcc, trlr.ui, trlr.ord_qty, trlr.atc, trlr.nomen, code.trans_phrase, code.definition
from tl_matl_trlr trlr
     left join tl_matl_data data on (data.niin = trlr.niin) 
     right join tl_trans_code code on (code.trans_cd = data.trans_cd)
where data.niin like '016102374' 
and  data.trans_dt >= '10/19/2021'
and data.trans_cd in ('SNM', 'SQD', 'SAS')
order by data.trans_dt desc 



delete from tl_matl_data
where niin like '016102374' 
and  trans_dt >= '10/19/2021'
and trans_cd in ('SQD', 'SAS')



update tl_matl_data set
trans_data = "22       \5        \0        \11       \C\6       \0        \"
where niin like '016102374' 
and  trans_dt >= '10/19/2021'
and trans_cd in ('SNM')
go