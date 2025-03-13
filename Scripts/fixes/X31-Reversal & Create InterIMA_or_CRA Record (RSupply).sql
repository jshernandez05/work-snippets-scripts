--===========================================================================--
-- This script/process is to reverse the X31 and X22 in RSUPPLY & NALCOMIS
-- The item can then be placed back in the DIFM and CRA
-- There are SQLs and Processes that must be run in both NALCOMIS & RSUPPLY
--===========================================================================--
--							{ RSUPPLY Processes }                            --
--===========================================================================--

--======================{ Step 2:  REVERSE THE X31 }=========================--

-- CHECK AND IDENTIFY IF REQUISITION HAS BEEN PROCESSED ON A TL 
-- IF TL HAS POSTED, SFOEDL WILL HAVE TO BE PROCESSED AT THE END 

SELECT	ml.niin, (RIGHT(DATENAME(yy, mr.mr_document_date), 1) + 
		RIGHT(STR(1000 + DATEPART(dy, mr.mr.document_date)), 3) + 
		mr.mr_document_nr_serial) ddsn, mr.optar_ty, mr.doc_id, 
		mr.mr_organization_code, mr.trnsmtl_fy, mr.trnsmtl_dt, 
		mr.trnsmtl_no, mr.trnsmtl_amt, mr.fund_code_original
FROM	material_request_tbl mr
		JOIN
		material_request_line ml 
		ON mr.mr_document_date = ml.mr_document_date
		AND mr.mr_document_nr_serial = ml.mr_document_nr_serial						
WHERE	(RIGHT(DATENAME(yy, mr.mr_document_date), 1) + 
		RIGHT(STR(1000 + DATEPART(dy, mr.mr.document_date)), 3) + 
		mr.mr_document_nr_serial) 
		IN ('1256GY01')
GO

-- CHECK LOCATION AND OH_QTY IN RSUPPLY (TO IDENTIFY IF X31R PROCESSED) 

SELECT	s.niin NIIN, s.requisitioning_objective RO , s.reorder_point_qty RP, 
		s.on_hand_quantity_total TOT_OH, s.pack_up_quantity PUK_QTY,
		s.not_ready_for_issue_qty NRFI, s.cstdy_qty CSTDY_QTY, 
		i.location_number LOC, i.onhand_quantity LOC_OH, i.last_inv_date INV_DT
FROM	stock_item s
  JOIN  item_loc i ON s.niin = i.niin
WHERE	s.niin = '012238123'
GO

-- Validate suprt_pkg_serno to ensure interface record processes 
-- if the suprt_pkg_serno is NULL   
-- update the SUPRT PKG SERNO to " " BLANK       

SELECT
	material_request.dt_last_prcsd, 
	material_request.mr_document_date, 
	material_request.mr_document_nr_serial, 
	material_request.suprt_pkg_serno, 
	material_request.ownr_cd 
FROM 
	material_request 
WHERE 
	(RIGHT(DATENAME(yy, mr_document_date), 1) + 
	RIGHT(STR(1000 + DATEPART(dy, mr_document_date)), 3) + 
	mr_document_nr_serial) = '1256GY01'
GO

UPDATE	material_request 
SET     material_request.suprt_pkg_serno = '' 
WHERE 	(RIGHT(DATENAME(yy, mr_document_date), 1) + 
		RIGHT(STR(1000 + DATEPART(dy, mr_document_date)), 3)
		+ mr_document_nr_serial) = '1280G220'
GO


-- REPROCESS X31R FROM INTERFACE FROM NALC OUTGOING (INTERNAL) INTFC 
-- CHECK stk_rpt, stock_item,& mfcs_dtl tables TO ENSURE ISSUE RVRSL PROCESSED

SELECT * FROM stk_rpt
WHERE niin = '012238123'
AND dsn = 'GY01'


-- Verify the change in location quantity

SELECT	s.niin NIIN, s.requisitioning_objective RO , s.reorder_point_qty RP, 
		s.on_hand_quantity_total TOT_OH, s.pack_up_quantity PUK_QTY,
		s.not_ready_for_issue_qty NRFI, s.cstdy_qty CSTDY_QTY, 
		i.location_number LOC, i.onhand_quantity LOC_OH, i.last_inv_date INV_DT
FROM	stock_item s
  JOIN  item_loc i ON s.niin = i.niin
WHERE	s.niin = '012238123'
GO

-- Verify the D7A reversal on the MFCS data

SELECT	* 
FROM	mfcs_dtl
WHERE	niin  = '012238123'
ORDER BY 2 desc

-- The Curly Bracket Indicates the transaction was reversed

doc_id	trans_dt			data_text									
D7A		Jan 18 2022 10:12AM	NUA 1680012238123GFEA}0001R091111256GY01 Y      7L 3B73003   5GQ41WA 018D
DZA		Jan 18 2022  7:30AM	NUA 1680012238123GFEA000003                        3B 27454611 Q41WA 013DU
A0A		Jan 13 2022  3:52PM	NRPS1680012238123  EA00001R0911120131712RYSTOCKAKZ 3BAE006   5X      D
D7A	J	an 13 2022  3:52PM	NUA 1680012238123GFEA00001R091111256GY01 Y      7L 3B73003   5GQ41WA 013D


--=============={ Step 3:  DELETE THE X31 & X22 IN RSUPPLY }=================--

-- THE carcass TABLE REMOVES THE X22

"""Child Table"""
SELECT	(RIGHT(DATENAME(yy, trk_doc_dt), 1) 
		+ RIGHT(STR(1000 + DATEPART(dy,trk_doc_dt )), 3) 
		+ trk_dsn) DDSN, * 
FROM	carcass_status_in
WHERE	(RIGHT(DATENAME(yy, trk_doc_dt), 1) 
		+ RIGHT(STR(1000 + DATEPART(dy,trk_doc_dt )), 3)
		+ trk_dsn) = '1256GY01'
GO

DELETE FROM carcass_status_in
WHERE		(RIGHT(DATENAME(yy, trk_doc_dt), 1)
			+ RIGHT(STR(1000 + DATEPART(dy,trk_doc_dt )), 3)
			+ trk_dsn) = '1256GY01'
GO

"""Parent Table"""

SELECT	* 
FROM	carcass
WHERE	(RIGHT(DATENAME(yy, trk_doc_dt), 1) 
		+ RIGHT(STR(1000 + DATEPART(dy,trk_doc_dt )), 3)
		+ trk_dsn) = '1256GY01'
GO

DELETE FROM carcass
WHERE		(RIGHT(DATENAME(yy, trk_doc_dt), 1) 
			+ RIGHT(STR(1000 + DATEPART(dy,trk_doc_dt )), 3)
			+ trk_dsn) = '1256GY01'
GO

-- The material_request_tbl REMOVES the X31
-- Must first delete all child records

 """Child Table"""

SELECT	(RIGHT(DATENAME(yy, mr_document_date), 1) 
		+ RIGHT(STR(1000 + DATEPART(dy, mr_document_date)), 3)
		+ mr_document_nr_serial), * 
FROM	aviation_maintenance
WHERE	(RIGHT(DATENAME(yy, mr_document_date), 1) 
		+ RIGHT(STR(1000 + DATEPART(dy, mr_document_date)), 3)
		+ mr_document_nr_serial) = '1256GY01'
GO

DELETE FROM	aviation_maintenance
WHERE		(RIGHT(DATENAME(yy, mr_document_date), 1) 
			+ RIGHT(STR(1000 + DATEPART(dy, mr_document_date)), 3) 
			+ mr_document_nr_serial) = '1256GY01'
GO


"""Child Table"""
SELECT	* 
FROM	material_request_line
WHERE	(RIGHT(DATENAME(yy, mr.mr_document_date), 1) 
		+ RIGHT(STR(1000 + DATEPART(dy, mr.mr.document_date)), 3) 
		+ mr.mr_document_nr_serial) = '1256GY01'
GO


ALTER TABLE material_request_line DISABLE TRIGGER
GO

DELETE FROM	material_request_line
WHERE		(RIGHT(DATENAME(yy, mr.mr_document_date), 1) 
			+ RIGHT(STR(1000 + DATEPART(dy, mr.mr.document_date)), 3) 
			+ mr.mr_document_nr_serial) = '1256GY01'
GO

ALTER TABLE material_request_line ENABLE TRIGGER
GO

--original_rqn and active_rqn_tbl should not contain
--any records for the DDSN

"""Parent Table"""
SELECT	optar_ty, doc_id, mr_organization_code,
		(RIGHT(DATENAME(yy, mr.mr_document_date), 1) 
		+ RIGHT(STR(1000 + DATEPART(dy, mr.mr.document_date)), 3) 
		+ mr.mr_document_nr_serial) ddsn, optar_ty, trnsmtl_fy, trnsmtl_dt, 
		trnsmtl_no, trnsmtl_amt, fund_code_original, request_emv, approved_date,
		matl_issue_date, doc_id, dt_last_prcsd, supply_type_equip_code
FROM	material_request_tbl
WHERE	(RIGHT(DATENAME(yy, mr.mr_document_date), 1) 
		+ RIGHT(STR(1000 + DATEPART(dy, mr.mr.document_date)), 3) 
		+ mr.mr_document_nr_serial) = '1256GY01'
GO

ALTER TABLE material_request_tbl DISABLE TRIGGER
GO

DELETE FROM	material_request_tbl
WHERE		(RIGHT(DATENAME(yy, mr.mr_document_date), 1) 
			+ RIGHT(STR(1000 + DATEPART(dy, mr.mr.document_date)), 3) 
			+ mr.mr_document_nr_serial) = '1256GY01'
GO

ALTER TABLE material_request_tbl ENABLE TRIGGER
GO

--CHECK INSIDE APPLICATION TO VERIFY THAT X31 &
--X22 HAVE BEEN REMOVED FROM Repairable Qry Screen

--THE X31R PLACES A QUANTITY BACK IN LOCATION
--UPDATE QUANTIES IF NEEDED


SELECT	s.niin NIIN, s.requisitioning_objective RO , s.reorder_point_qty RP, 
		s.on_hand_quantity_total TOT_OH, s.pack_up_quantity PUK_QTY,
		s.not_ready_for_issue_qty NRFI, s.cstdy_qty CSTDY_QTY, 
		i.location_number LOC, i.onhand_quantity LOC_OH, i.last_inv_date INV_DT
FROM	stock_item s
  JOIN  item_loc i ON s.niin = i.niin
WHERE	s.niin = '012238123'
GO

--Update NRFI & Location Qtys if Qty Moving Back to NRFI

UPDATE	stock_item 
SET		not_ready_for_issue_qty = 7
WHERE	niin LIKE '016003206'
GO

SELECT	* 
FROM	item_loc
WHERE	niin LIKE '014951208'
GO

UPDATE	item_loc 
SET		onhand_quantity = 3
WHERE	niin LIKE '016003206'
GO


-- ****** NOTE: If requisiton has already been released on TL *****
-- ****** you will have TO process a SFOEDL credit TO recoup  *****
-- ****** the dollar value                                    *****