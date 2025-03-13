General Support Request Description: The WCB mistakenly cleared the below 
BCM Repair and Return records out of the Inter IMA Service Mailbox, which 
posted X31s and Z0As for FY20.  Each unit is currently not supposed to spend 
FY20 funds, so we need these transactions reversed in R-Supply. 
R09136-0161G209
R09136-0187G299
R09136-0198G698

PROBLEM 1: X31 REVERSAL
PROBLEM 2: CREATE INTER IMA/CUSTOMER SERVICE ITEM

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*  Step 1:  Create X31R Interface Record                            */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

-- GET DDSN INFO

SELECT	ddsn, lsc, lsc_dttm, cur_mcn, rep_mcn, cur_niin, jcn, org_cd
FROM	dr09_requisition
WHERE 	ddsn like '0187G299'
GO 	

ddsn		lsc		lsc_dttm			cur_mcn	rep_mcn	cur_niin	jcn			org_cd
0187G299	COMPL	Jul  5 2020 10:25PM	GC1J383	GC1J383	016003206	GC6176397	GC6


-- IDENTIFY IF MCN IS ACTIVE OR IN HISTORY
-- IF IN HISTORY AND RECORD WILL NEED TO BE PROCESSED
-- BRING MCN TO ACTIVE (MAF HISTORY TO ACTIVE SQL)

SELECT	mcn 
FROM    dm04_maf
WHERE 	mcn LIKE 'GC1J383'
GO

--CHECK RSUPPLY SUSPENSE AND OUTGOING INTERFACE
--ENSURE TO DELETE ALL RECORDS BEFORE REGENERATING X31
--REGENERATE X31 (DON'T REPROCESS YET)

--UPDATE INTFC RECORD TO X31R
--reversal indicator is in CC 137

UPDATE	di03_outgoing_intfc 
SET		di03_outgoing_intfc.data_1 = SUBSTRING(di03_outgoing_intfc.data_1, 1, 136) + 'Y' + 
									 SUBSTRING(di03_outgoing_intfc.data_1, 138, 117),
		key_3 = "Y" 
WHERE 	di03_outgoing_intfc.key_1 = '0187G299' 
	AND SUBSTRING(di03_outgoing_intfc.data_1, 137, 1) LIKE 'N' 
GO

--VALIDATE INTFC RECORD CHANGE
SELECT --reversal indicator is in CC 137 
		key_1, SUBSTRING(di03_outgoing_intfc.data_1, 137, 1) "Reversal Ind", key_3, rqst_dttm
FROM 	di03_outgoing_intfc 
WHERE	di03_outgoing_intfc.key_1 = '0187G299' 
GO

-- DELETE SUSPENSE RECORD IN RSUPPLY

""""""""""""""
/* RSUPPLY */
""""""""""""""
-- CHECK LOCATION AND OH_QTY IN RSUPPLY (TO IDENTIFY IF X31R PROCESSED)


SELECT	niin NIIN, on_hand_quantity_total TOT_OH, not_ready_for_issue_qty NRFI
FROM	stock_item 
WHERE	niin LIKE '016003206'
GO

-- REPROCESS X31R FROM INTERFACE FROM NALC OUTGOING(INTERNAL) INTFC


/* First SQL is ONLY USED when the REVERSAL RECORD does not */
/* process because the SUPRT PKG SERNO value is NULL   */
/* update the SUPRT PKG SERNO to " " BLANK             */


SELECT 
   material_request.dt_last_prcsd, 
   material_request.mr_document_date, 
   material_request.mr_document_nr_serial, 
   material_request.suprt_pkg_serno, 
   material_request.ownr_cd 
FROM 
   material_request 
WHERE (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy, mr_document_date)),4)
      + mr_document_nr_serial)
      like '0187G299'


UPDATE	material_request 
SET     material_request.suprt_pkg_serno = '' 
WHERE 	(right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy, mr_document_date)),4)
		+ mr_document_nr_serial) like '83325738'
GO

-- CHECK stk_rpt, stock_item,& mfcs_dtl tables TO ENSURE ISSUE RVRSL PROCESSED

SELECT * FROM stk_rpt
WHERE niin like '016003206'
AND dsn like 'G299'

SELECT	niin NIIN, on_hand_quantity_total TOT_OH, not_ready_for_issue_qty NRFI
FROM	stock_item 
WHERE	niin like '016003206'
GO


SELECT	* 
FROM	mfcs_dtl
WHERE	niin  like '016003206'
ORDER BY 2 desc

-- The Curly Bracket Indicates the transaction was reversed
doc_id	trans_dt	data_text	fname	trans_cd	mname	lname	seq_no	file_ty	niin
D7A	Dec 19 2020  5:21AM	N32 6115016003206V2EA}0001R091360187G299 Y      9S 7RBCM02   5GQ53WA 354H	NALCOMIS	SD	NALCOMIS	NALCOMIS	NULL	1	016003206
D7A	Dec 19 2020  4:06AM	N32 6115016003206V2EA}0001R091360198G698 Y      9S 7RBCM02   5GQ53WA 354H	NALCOMIS	SD	NALCOMIS	NALCOMIS	NULL	1	016003206
D7A	Dec 19 2020  2:28AM	N32 6115016003206V2EA}0001R091360161G209 Y      9S 7RBCM02   5GQ53WA 354H	NALCOMIS	SD	NALCOMIS	NALCOMIS	NULL	1	016003206



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*  Step 2:  DELETE THE X31 & X22 IN RSUPPLY                         */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

-- THE carcass TABLE REMOVES THE X22

"""Child Table"""
SELECT	* 
FROM	carcass_status_in
WHERE	(right(convert(varchar,datepart(yy, trk_doc_dt)*1000+datepart(dy,trk_doc_dt )),4)+ trk_dsn)
		like '0187G299'
GO

DELETE FROM carcass_status_in
WHERE		(right(convert(varchar,datepart(yy, trk_doc_dt)*1000+datepart(dy,trk_doc_dt )),4)+ trk_dsn)
			like '0187G299'
GO

"""Parent Table"""

SELECT	* 
FROM	carcass
WHERE	(right(convert(varchar,datepart(yy, trk_doc_dt)*1000+datepart(dy,trk_doc_dt )),4)+ trk_dsn)
		like '0187G299'
GO

DELETE FROM carcass
WHERE		(right(convert(varchar,datepart(yy, trk_doc_dt)*1000+datepart(dy,trk_doc_dt )),4)+ trk_dsn)
			like '0187G299'
GO


-- The material_request_tbl REMOVES the X31
-- Must first delete all child records

"""Child Table"""

SELECT	(right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy, mr_document_date)),4)+ mr_document_nr_serial), * 
FROM	aviation_maintenance
WHERE	(right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy, mr_document_date)),4)+ mr_document_nr_serial)
		like '0187G299'
GO

DELETE FROM	aviation_maintenance
WHERE		(right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy, mr_document_date)),4)+ mr_document_nr_serial)
			like '0187G299'
GO


"""Child Table"""
SELECT	* 
FROM	material_request_line
WHERE	(right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial)
		like '0187G299'
GO


--ALTER TABLE material_request_line DISABLE TRIGGER
GO

DELETE FROM	material_request_line
WHERE		(right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial)
			like '0187G299'
GO

--ALTER TABLE material_request_line ENABLE TRIGGER
GO


--original_rqn and active_rqn_tbl should not contain
--any records for the DDSN

"""Parent Table"""
SELECT	optar_ty, doc_id, mr_organization_code,
		(right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial) ddsn,   
		optar_ty, trnsmtl_fy, trnsmtl_dt, trnsmtl_no,  trnsmtl_amt, fund_code_original, request_emv, approved_date, matl_issue_date, 
		doc_id, dt_last_prcsd, supply_type_equip_code
FROM	material_request_tbl
WHERE	(right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial) 
		like '0187G299'
GO



--ALTER TABLE material_request_tbl DISABLE TRIGGER
GO

DELETE FROM	material_request_tbl
WHERE		(right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date)),4) + mr_document_nr_serial) 
			like '0187G299'
GO

--ALTER TABLE material_request_tbl ENABLE TRIGGER


--CHECK INSIDE APPLICATION TO VERIFY THAT X31 &
--X22 HAVE BEEN REMOVED FROM Repairable Qry Screen

--THE X31R PLACES A QUANTITY BACK IN LOCATION
--UPDATE QUANTIES IF NEEDED


SELECT	niin NIIN, requisitioning_objective RO , reorder_point_qty RP, on_hand_quantity_total TOT_OH, pack_up_quantity PUK_QTY,
		not_ready_for_issue_qty NRFI, cstdy_qty CSTDY_QTY
FROM	stock_item 
WHERE	niin like '016003206'
GO



UPDATE	stock_item 
SET		not_ready_for_issue_qty = 7
WHERE	niin like '016003206'
GO


--Update Location Qty if Qty Moving Back to NRFI
SELECT	* 
FROM	item_loc
WHERE	niin like '016003206'
GO



UPDATE	item_loc 
SET		onhand_quantity = 3
WHERE	niin like '016003206'
GO


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*  Step 3:  Create Inter IMA / Customer Service Record              */
/*           Repair & Return                                         */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

-- ENSURE REQUISITION cur_mcn & rep_mcn match

SELECT	ddsn, cur_mcn, rep_mcn 
FROM	dr09_requisition 
WHERE	ddsn in ('0187G299')
GO

ddsn		cur_mcn	rep_mcn
0187G299	GC1J383	GC1J383


--Verify Counters and Adjust acct_qty & difm_qty if needed

SELECT	niin, difm_qty, exrp_qty, owe_qty, ssp_qty, so_iou_qty, eriou_qty
FROM	ds02_invdata
WHERE	niin like '016003206'
GO


UPDATE	ds02_invdata 
SET		difm_qty = 6,
		acct_qty = 16
WHERE	niin like '016003206'
GO

-- GET NECESSARY INFO FROM MAF & ENSURE cur_ti_ddsn & ti_ddsn match

SELECT	dm04.mcn, wc_cd, cur_ti_ddsn, ti_ddsn, maint_act_sts, act_take_cd, e_serno, pc_signo_dttm, corr_act 
FROM	dm04_maf dm04
	LEFT JOIN dm06_maf_correct dm06 on (dm04.mcn = dm06.mcn)
	LEFT JOIN dm09_removed dm09 on (dm04.mcn = dm09.mcn)
WHERE	dm04.mcn in ('GC1J1M0', 'GC1J383', 'GC1J3YD')
GO

-- CORRECTIVE ACTION WILL NORMALLY STATE WHERE ITEM WAS D-CODED TO
mcn		cur_ti_ddsn	ti_ddsn	maint_act_sts	act_take_cd	e_serno	pc_signo_dttm		corr_act
GC1J1M0	0161G209	0161G209	JC			D			1357	Aug 26 2020  3:18PM	D-CODE TO MALS-16 DUE TO AECTS CURRENTLY IN A BROAD ARROW STATUS. IAW AG-AECTS-MIB-000 AND ELAR # NATC00000303333. AREA AND UUT IS FOD FREE
GC1J383	0187G299	0187G299	JC			D			1433	Aug 26 2020  2:47PM	D-CODE TO MALS-16 DUE TO AECTS CURRENTLY IN A BROAD ARROW STATUS. IAW AG-AECTS-MIB-000 AND ELAR # NATC00000303333. AREA AND UUT IS FOD FREE
GC1J3YD	0198G698	0198G698	JC			D			0710	Aug 26 2020  2:47PM	D-CODE TO MALS-16 DUE TO AECTS CURRENTLY IN A BROAD ARROW STATUS. IAW AG-AECTS-MIB-000 AND ELAR # NATC00000303333. AREA AND UUT IS FOD FREE


-- CREATE R&R DIFM RECORD IF NEEDED
-- IF CRA RECORD IS NEEDED, REMOVE
-- THE aimd_loctn FROM THE STATEMENT
-- OR CHANGE THE UIC TO ""

INSERT ds03_item
(
niin, cur_mcn, rep_mcn, cur_ti_ddsn, ti_ddsn, comp_serno, 
wc_cd, aimd_loctn, cur_mgmt_cd,  bal_cd, cur_purp_cd, 
itm_qty, bal_dttm, itm_dttm, rmks_50_itm
)
VALUES
(
	"016003206", 
	"GC1J3YD", 
	"GC1J3YD", 
	"0198G698", 
	"0198G698",
	"0710", 
	"620", 
	"R09116", -- This UIC make is Inter-IMA; Leave Blank if its not Inter-IMA
	"SO",
	"DF", 
	"W", 
	1, 
	getdate (), 
	getdate (), 
	" "
)
GO

-- VERIFY THE ds03_item record
SELECT	niin, cur_mcn, rep_mcn, cur_ti_ddsn, ti_ddsn, itm_qty,
		cur_mgmt_cd, cur_purp_cd, comp_serno, wc_cd, bal_cd,
		bal_dttm, itm_dttm, rmks_50_itm, aimd_loctn
FROM 	ds03_item 
WHERE	niin like '016003206'
	AND bal_cd like 'DF' 
GO





/* CREATE CRA MAILBOX */
INSERT INTO dg12_comp_rep_act
(mcn, fgc, niin, comp_serno, maint_act_sts, maint_act_dttm, act_take_cd, wc_cd)
SELECT	dm04.mcn, ds05.fgc, dm04.niin, dm09.e_serno, dm04.maint_act_sts, dm04.maint_act_dttm, dm04.act_take_cd, dm04.wc_cd
FROM	dm04_maf dm04
	LEFT JOIN ds05_niin ds05 on (dm04.niin = ds05.niin)
	LEFT JOIN dm09_removed dm09 on (dm04.mcn = dm09.mcn)
WHERE	dm04.mcn like 'GR1ATMD'


-- VERIFY RECORDS EXIST IN INTER IMA/CUSTOMER SERVICE MAILBOX OR CRA
-- IN NALCOMIS









