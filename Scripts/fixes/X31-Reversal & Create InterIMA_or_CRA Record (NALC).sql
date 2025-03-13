--===========================================================================--
-- This script/process is to reverse the X31 and X22 in RSUPPLY & NALCOMIS
-- The item can then be placed back in the DIFM and CRA
-- There are SQLs and Processes that must be run in both NALCOMIS & RSUPPLY
--===========================================================================--
--						  { NALCOMIS Processes }                             --
--===========================================================================--

--================{ Step 1:  Create X31R Interface Record }==================--

-- GET DDSN INFO

SELECT	ddsn, lsc, lsc_dttm, cur_mcn, rep_mcn, cur_niin, jcn, org_cd
FROM	dr09_requisition
WHERE 	ddsn = '0187G299'
GO 	


-- IDENTIFY IF MCN IS ACTIVE OR IN HISTORY
-- IF IN HISTORY, BRING MCN TO ACTIVE (MAF HISTORY TO ACTIVE SQL)

SELECT	mcn 
FROM    dm04_maf
WHERE 	mcn = 'GC1J383'
GO

-- CHECK RSUPPLY SUSPENSE AND OUTGOING INTERFACE
-- ENSURE TO DELETE ALL RECORDS BEFORE REGENERATING X31
-- REGENERATE X31 (******DON'T REPROCESS YET******)

-- UPDATE INTFC RECORD TO X31R
-- reversal indicator is in CC 137

UPDATE	di03_outgoing_intfc 
SET		di03_outgoing_intfc.data_1 = SUBSTRING(di03_outgoing_intfc.data_1, 1, 136) + 'Y' + 
									 SUBSTRING(di03_outgoing_intfc.data_1, 138, 117),
		key_3 = "Y" 
WHERE 	di03_outgoing_intfc.key_1 = '0187G299' 
	AND SUBSTRING(di03_outgoing_intfc.data_1, 137, 1) = 'N' 
GO

--VALIDATE INTFC RECORD CHANGE
SELECT  
		key_1, SUBSTRING(di03_outgoing_intfc.data_1, 137, 1) "Reversal Ind",
		key_3, rqst_dttm
		--reversal indicator is in CC 137
FROM 	di03_outgoing_intfc 
WHERE	di03_outgoing_intfc.key_1 = '0187G299' 
GO

-- DELETE SUSPENSE RECORD IN RSUPPLY
-- CONTINUE WITH RSUPPLY PROCESSES BEFORE CONTINUING BELOW
-- RSUPPLY CONTAINS STEPS 2 & 3

--==============={ Step 4:  Completed Repair Action Record  }================--
--==============={ OR   Inter IMA / Customer Service Record }================--

-- ENSURE REQUISITION cur_mcn & rep_mcn match

SELECT	ddsn, cur_mcn, rep_mcn 
FROM	dr09_requisition 
WHERE	ddsn IN ('0187G299')
GO

ddsn		cur_mcn	rep_mcn
0187G299	GC1J383	GC1J383

--Verify Counters and Adjust acct_qty & difm_qty if needed

SELECT	niin, difm_qty, exrp_qty, owe_qty, ssp_qty, so_iou_qty, eriou_qty
FROM	ds02_invdata
WHERE	niin = '016003206'
GO


UPDATE	ds02_invdata 
SET		difm_qty = 6,
		acct_qty = 16
WHERE	niin = '016003206'
GO

-- GET NECESSARY INFO FROM MAF & ENSURE cur_ti_ddsn & ti_ddsn match

SELECT	dm04.mcn, wc_cd, cur_ti_ddsn, ti_ddsn, maint_act_sts, act_take_cd,
		e_serno, pc_signo_dttm, corr_act 
FROM	dm04_maf dm04
		LEFT JOIN dm06_maf_correct dm06 ON (dm04.mcn = dm06.mcn)
		LEFT JOIN dm09_removed dm09 ON (dm04.mcn = dm09.mcn)
WHERE	dm04.mcn IN ('GC1J1M0', 'GC1J383', 'GC1J3YD')
GO

-- CORRECTIVE ACTION WILL NORMALLY STATE WHERE ITEM WAS D-CODED TO
-- CREATE R&R DIFM RECORD IF NEEDED
-- IF CRA RECORD IS NEEDED, REMOVE
-- THE aimd_loctn FROM THE STATEMENT
-- OR CHANGE THE UIC TO ""

INSERT ds03_item
(
niin, cur_mcn, rep_mcn, cur_ti_ddsn, ti_ddsn, comp_serno, 
wc_cd, cur_mgmt_cd,  bal_cd, cur_purp_cd,
-- aimd_loctn,  -- This UIC makes it Inter-IMA; Leave Blank if its not Inter-IMA
itm_qty, bal_dttm, itm_dttm
)
SELECT 
	dr09.cur_niin, 
	dr09.cur_mcn, 
	dr09.rep_mcn, 
	dr09.ddsn, 
	dr09.ddsn,
	dm09.e_serno, 
	dm04.wc_cd, 
	"SO",
	"DF", 
	"W", 
	1,
--	"R09116", -- This UIC makes it Inter-IMA; Leave Blank if its not Inter-IMA 
	GETDATE (), 
	GETDATE ()
FROM
	dr09_requisition dr09
	JOIN dm04_maf dm04 ON dr09.cur_mcn = dm04.mcn
	JOIN dm09_removed dm09 ON dm04.mcn = dm09.mcn
WHERE dr09.ddsn = '13567J00'



-- VERIFY THE ds03_item record
SELECT	niin, cur_mcn, rep_mcn, cur_ti_ddsn, ti_ddsn, itm_qty,
		cur_mgmt_cd, cur_purp_cd, comp_serno, wc_cd, bal_cd,
		bal_dttm, itm_dttm, rmks_50_itm, aimd_loctn
FROM 	ds03_item 
WHERE	niin = '016003206'
	AND bal_cd = 'DF' 
GO



-- CREATE CRA MAILBOX 

INSERT INTO dg12_comp_rep_act
(mcn, fgc, niin, comp_serno, maint_act_sts, maint_act_dttm, act_take_cd, wc_cd)
SELECT	dm04.mcn, ds05.fgc, dm04.niin, dm09.e_serno, dm04.maint_act_sts, 
		dm04.maint_act_dttm, dm04.act_take_cd, dm04.wc_cd
FROM	dm04_maf dm04
		LEFT JOIN ds05_niin ds05 ON (dm04.niin = ds05.niin)
		LEFT JOIN dm09_removed dm09 ON (dm04.mcn = dm09.mcn)
WHERE	dm04.mcn = 'GC1K7ND'


-- VERIFY RECORDS EXIST IN INTER IMA/CUSTOMER SERVICE MAILBOX OR CRA
-- IN NALCOMIS