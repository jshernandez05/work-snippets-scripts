*******************************************************************************************
THIS SQL RUNS ALL INVENTORY ADJUSTMENTS BASED ON EXPENDITURE CODES
SEE BELOW SQL FOR FURTHER EXPLANATION 
v.1
*******************************************************************************************


SELECT 
   CASE
        WHEN inv_expenditure.xpndtr_cd = 'A' THEN 'LBI Inv Adj'
        WHEN inv_expenditure.xpndtr_cd = 'D' THEN 'LBS Inv Adj (Lost, Damaged, Stolen)'
        WHEN inv_expenditure.xpndtr_cd = 'H' THEN 'LBI Unfit for Issue (Unit)'
        WHEN inv_expenditure.xpndtr_cd = 'K' THEN 'LBS Nalc Survey (Major Disaster)'
        WHEN inv_expenditure.xpndtr_cd = 'N' THEN 'GBI Inv Adj'
        WHEN inv_expenditure.xpndtr_cd = 'O' THEN 'Offload'
        WHEN inv_expenditure.xpndtr_cd = 'P' THEN 'LBS Nalc Survey (Lost, Damaged, Stolen)'
        WHEN inv_expenditure.xpndtr_cd = 'X' THEN 'LBS Inv Adj (Major Accident)'
        WHEN inv_expenditure.xpndtr_cd = 'Y' THEN 'LBS Receipt (LIS)'
        WHEN inv_expenditure.xpndtr_cd = 'Z' THEN 'GBS Receipt (GIS)'
       ELSE NULL
   END 'Adjustments',
  inv_expenditure.trans_dt,
  inv_expenditure.doc_id,
  inv_expenditure.xpndtr_cd, 
  inv_expenditure.rvrsl_ind,
  CONVERT(char(10),inv_expenditure.rvrsl_dt,101) as rvrsl_date,
  RIGHT(DATENAME(YY, inv_expenditure.doc_dt),1)+RIGHT(STR(1000+DATEPART(DY,inv_expenditure.doc_dt)),3) + inv_expenditure.dsn as ddsn,
  inv_expenditure.cog,
  inv_expenditure.fsc,
  inv_expenditure.niin,
  item.security_code as ciic,
  inv_expenditure.adv_cd,
  inv_expenditure.ui,
  inv_expenditure.qty,
  inv_expenditure.up,
  inv_expenditure.mony_val,
  inv_expenditure.suprt_pkg_serno,
  inv_expenditure.loc,
  inv_expenditure.fc,
  inv_expenditure.org_cd,
  inv_expenditure.expndtr_org_cd,
  inv_expenditure.expndtr_doc_dt,
  inv_expenditure.expndtr_dsn
FROM 
   inv_expenditure LEFT JOIN item 
       ON inv_expenditure.niin = item.niin
WHERE 
   inv_expenditure.xpndtr_cd in ('A','D','H','K','N','P','X','Y','Z')
   AND inv_expenditure.trans_dt >=  '11/01/2021'
   AND inv_expenditure.trans_dt <=  '11/06/2021'




************************
*EXPENDITURE INDICATORS*
************************
Exp Ind DI Type Origin
A X13 LBI Inv Adj (LBI)
D X43 LBS Inv Adj (Lost, Damaged, Stolen)
H X13 LBI Unfit for issue (Unit)
K X43 LBS NALC Survey (Major Disaster)
N X13 GBI Inv Adj (GBI)
O OFF N/A Offload
P X43 LBS NALC Survey (Lost, Damaged, Stolen)
X X43 LBS Inv Adj (Major Disaster)
Y X13 LBS Receipt (Loss in shipment)
Z X13 GBS Receipt (Gain in shipment)




select data.niin, data.trans_dt, data.trans_cd, data.trans_data, data.lname, data.fname, 
trlr.cog, trlr.mcc, trlr.ui, trlr.ord_qty, trlr.atc, trlr.nomen, code.trans_phrase, code.definition
from tl_matl_trlr trlr
     left join tl_matl_data data on (data.niin = trlr.niin) 
     right join tl_trans_code code on (code.trans_cd = data.trans_cd)
where data.trans_cd in (
						'SAG',
						'SAH',
						'SAJ',
						'SAK',
						'SAM',
						'SAR',
						'SAS',
						'SHC',
						'SHD',
						'SHE',
						'SHF',
						'SHG',
						'SHH',
						'SHI',
						'SHJ',
						'SMA',
						'SNG',
						'SNG',
						'SNG',
						'SNG',
						'SNG',
						'SOA',
						'SP',
						'SPA',
						'SQC',
						'SQB',
						'SRQ',
						'SRR',
						'SRU',
						'SRV',
						'SV'
						)
	and data.trans_dt > "11/22/2021"
order by data.trans_dt desc 


**************************
*TRANSACTION LEDGER CODES*
**************************
Code Process Action
SAG  - Loss Pndg Surv - Loss Requiring Survey
SAH  - Loss NRFI - Loss Not Ready for Issue
SAJ  - Loss NRFI - Loss Not Ready for Issue
SAK  - Loss - Loss by Inventory
SAM  - Loss Surv - Loss by Inventory Requiring Survey
SAR  - Internal Audit - Loss - Internal Audit - Loss
SAS  - Internal Audit - Gain - Internal Audit - Gain
SHC  - Gain SURV - Gain by Inventory (Survey Pending)
SHD  - PNDG SURV DEL - Pending Survey Deleted (GAIN)
SHE  - Gain - Gain by Inventory
SHF  - Gain SURV - Gain by Inventory
SHG  - Loss Inv Adj - Loss Inventory Adjustments
SHH  - Loss Rvrsl Inv Adj - Loss Inventory Adjustments Reversal
SHI  - Gain Inv Adj - Gain Inventory Adjustments
SHJ  - Gain Rvrsl Inv Adj - Gain Inventory Adjustments Reversal
SMA  - Loss - Loss by Inventory
SNG  - RSupply Audit - Inventory Audit
SOA  - Loss - Loss by Inventory
SP   - Gain Rvrsl - Reversal of Gain by Inventory
SPA  - Gain - Gain by Inventory
SQB  - Loss Survey - Survey - Loss, Damage, Stolen
SQC  - Loss Rvrsl Survey - Survey Reversal - Loss, Damage, Stolen
SRQ  - Gain Rcpt Adj - Survey Created By Receipt Exception Process
SRR  - Gain Rcpt Rvrsl - Survey Created By Receipt Exception Reversal
SRU  - LBI Rcpt Adj - Survey Created By Receipt Exception Process
SRV  - LBI Rcpt Rvrsl - Survey Created By Receipt Exception Reversal
SV   - Loss Rvrsl - Reversal of Loss by inventory



