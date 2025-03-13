
/************************************/
/*  Search CTL in RSupply by NIIN   */
/************************************/

select data.niin, data.trans_dt, data.trans_cd, data.trans_data, data.lname, data.fname, 
trlr.cog, trlr.mcc, trlr.ui, trlr.ord_qty, trlr.atc, trlr.nomen, code.trans_phrase, code.definition
from tl_matl_trlr trlr
     left join tl_matl_data data on (data.niin = trlr.niin) 
     right join tl_trans_code code on (code.trans_cd = data.trans_cd)
where data.niin like '016003206'
order by data.trans_dt desc 


/************************************************/
/*  List of Trans Codes & CTL line Definition   */
/*                                              */
/* (will give you a list and breakout of all    */  
/*  columns in the CTL data fields)             */
/************************************************/

select * from tl_trans_code
