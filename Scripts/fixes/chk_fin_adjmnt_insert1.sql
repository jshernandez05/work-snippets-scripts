-- ========================================================================
--	<< chk_fin_adjmnt_insert1 >>			<< chk_fin_adjmnt_insert1 >>
-- ========================================================================
/*
--	This trigger is invoked whenever a row is inserted in the financial_adjustment table.

--	This trigger will make a corresponding change to optar.sumry_difnc and sumry_oblgn
--	 in the associated row within the optar table.*/

--	[NOTE: Except for "BATCH" refresh activities intended to insure consistency,
--		other programs will NEVER update these columns.
CREATE trigger chk_fin_adjmnt_insert1 on financial_adjustment for insert as
-- $Author:   jmchendr  $
-- $Workfile:   fin_adj_i_trg1.sql  $
-- $Revision:   1.2  $
--	Author:	J. E. Yurco (TCI)	Date:10/30/96
--	Version:	8/13/2001a
--	Script:	fin_adj_i_trg1.sql
--  TR 89289      2/11/10    JMc  Update jon & jon_uic until jon accounting is offically turned on.

DECLARE	@adjmt_dt	datetime,
	@adjmt_mo_yr	datetime,
	@bud_cat	char(15),	
	@comments	char(42),							--{A 981014}
	@cr_amt		money,								--{A 980924}
	@debug		char(6),
	@delta_sfoedl	money,
	@delta_oblgn	money,
	@dept_org_cd	char(5),
	@div_org_cd	char(5),
	@doc_dt		datetime,
	@doc_id		char(3),							--{A 980928}
	@doc_suf_cd	char(1),
	@dsn		char(4),
	@errno		int,
	@errmsg		varchar(255),
	@fc		char(2),
	@f_year		year_only,
	@io_type	char(3),
	@mr_doc_dt	datetime,
	@mr_dsn		char(4),
	@mr_org_cd	char(5),
	@mr_optar_ty	char(15),
	@mr_rcc		char(2),
	@mr_tec		char(4),
	@optar_ty	char(15),
	@org_cd	 	char(5),
	@org_cd_fin	char(5),							--{C19990831}
	@pc_tr_amt	money,								--{A 980924}
	@serial_org	char(5),							--{A20010419}
	@sfoedl_dt	datetime,
	@svc_dsg	char(1),
	@rcc		char(2),
	@target_org_cd	char(5),
	@tec		char(4),
	@irows		int,								--{A20010620}
	@pc_cnt		int,								--{A20010813}
	@rvrsl_dt	datetime,							--{A20010813}
	@rvrsl_dtX	char(21),							--{A20010813}
	@auol_dscrptn	varchar(37),							--{A20010813}
    @jon              char(6),
    @jon_uic       char(5),
    @var_trnsmtl char(1),
    @year             int,    
    @month         int,
	@curr_fy	       char(4),
    @oldst_fy      char(4),
 	@cyear		   char(4),
	@hold_dt     datetime,
	@yr_2		       char(1),
	@av_mnt_tec		char(4)


--======{ Process for updates to adjmt_auol_mony_val, adjmt_sfoedl_val,     }
--	{        and/or adjmt_auol_mony_val in table financial_adjustment.  }=================

--	{    The following code is required because SYBASE will call the trigger when   	}
--	{      ever an UPDATE or INSERT is executed even if NO rows can be updated      	}
--	{      in a trigger such a call may result in processing a row with null columns	}
SELECT	@irows = count(*) 								--{A20010620}
	FROM	inserted								--{A20010620}
IF	@irows > 1									--{A20010620}
	BEGIN										--{A20010620}
	SELECT @errno = 99999								--{A20010620}
	SELECT @errmsg =								--{A20010620}
	"ERROR: Multiple row inserts to financial_adjustment are not allowed!"		--{A20010620}
	ROLLBACK  TRIGGER with raiserror @errno @errmsg					--{A20010620}
	END										--{A20010620}
IF	@irows = 1									--{A20010620}
 	GOTO RealChg
ELSE	RETURN
RealChg:									
BEGIN 
--	===={ Determine who is changing and calculate the delta (new - old) amount }==========
SELECT 	@delta_oblgn =  adjmt_oblgn_val+adjmt_auol_mony_val,
	@delta_sfoedl = adjmt_sfoedl_val,  	@f_year = adjmt_fy, 
	@org_cd = org_cd, 			@doc_dt = doc_dt,		@dsn = dsn,
	@doc_suf_cd = doc_suf_cd,		@svc_dsg = fc_svc_dsg,
	@fc = fc,				@adjmt_dt = adjmt_dt,
	@adjmt_mo_yr = adjmt_mo_yr,		@sfoedl_dt = sfoedl_dt,
 	@tec = tec,				@rcc = rcc,
	@doc_id = doc_id,			@auol_dscrptn = auol_dscrptn		--{C20010813}
	FROM 	inserted
--	===={ If no dollar change, return! }==================================================
IF 	@delta_sfoedl = 0.00  AND   @delta_oblgn = 0.00
        RETURN		--{ if no "real" change, end process } 
--	===={ Determine budget category and optar type of optar to change }===================
SELECT 	@bud_cat = budget_cat,	@optar_ty = optar_ty
	FROM 	fc
	WHERE	fc_service_designator_code = @svc_dsg
	  AND	fund_code = @fc

 /*  Update for jon and jon_uic based on optar_type  'jon accounting' must be turned off
       for this update to occur =====================*/
       
     /* Get the current and 2 prior fiscal year */
SELECT 	@year =  datepart(yy,getdate() ),
		@month = datepart(mm,getdate() )
IF	@month > 9 
    	SELECT  @curr_fy = convert(char(4),(@year+1))
	ELSE
	SELECT  @curr_fy = convert(char(4),@year)
SELECT @oldst_fy = convert(char(4), convert(int,@curr_fy) -2)

SELECT @var_trnsmtl = trnsmtl_ty from variable_parameters
 
 /*Get last digit of adjmt_fy for substring of data*/
SELECT	@hold_dt = @f_year
SELECT	@cyear = convert(char(4),(datepart(yy,@hold_dt)))

 
IF      @var_trnsmtl <> "B"
AND @optar_ty in ("AOM", "S&E", "FLTOPS", "Reimbursable")
 BEGIN      
      SELECT	@yr_2  = substring(@cyear,4,1)
      SELECT @jon = (@yr_2 + @fc + '000')
      UPDATE financial_adjustment 
      SET  jon        = isnull(rtrim(jon), @jon),      
               jon_uic = isnull(rtrim(jon_uic), @org_cd)
  FROM financial_adjustment f               
  WHERE f.adjmt_fy         = @f_year
   AND      f.adjmt_mo_yr  =  @adjmt_mo_yr
   AND      f.fc                    =  @fc
   AND      f.fc_svc_dsg      =  @svc_dsg
   AND      f.adjmt_dt         =   @adjmt_dt
   AND      (rtrim(jon) is NULL OR rtrim(jon_uic) IS NULL)
 END

--	===={ Add optar_type to the financial_adjustment row }================================
IF	@bud_cat = "Non-Chargeable"	OR	@optar_ty = "Non-Chargeable"		--{C20000921}
	BEGIN
	SELECT @errno = 99999
	SELECT @errmsg =
		"Cannot enter financial adjustment for 'Non-Chargeable' fund code"
	ROLLBACK  TRIGGER with raiserror @errno @errmsg
	END
--	===={ Check if tec is null, and make match to aviation_maintenance if record exists }=
IF	@tec IS NULL
	BEGIN
		SELECT @av_mnt_tec = am.supply_tec
		FROM aviation_maintenance am
		WHERE @mr_doc_dt = am.mr_document_date
		AND @mr_dsn = am.mr_document_nr_serial
		
		IF @@rowcount = 1
			BEGIN
				SET @tec = @av_mnt_tec
			END
	END
--	===={ Check if tec is blank }=========================================================
IF	@tec = " "
	BEGIN		
	SELECT @errno = 99999
	SELECT @errmsg =
		"On financial adjustment, tec cannot be blank!"
	ROLLBACK  TRIGGER with raiserror @errno @errmsg
	END
--	===={ Check if rcc is blank }=========================================================
IF	@rcc = " "
	BEGIN
	SELECT @errno = 99999
	SELECT @errmsg =
		"On financial adjustment, rcc cannot be blank!"
	ROLLBACK  TRIGGER with raiserror @errno @errmsg
	END
--	===={ If doc_id = S76 or X76 (SMARTS sfoedl), treat as if document not on db }========
IF	@doc_id = "S76"	OR	@doc_id = "X76"					--{C 980929)
	BEGIN									--{A 981006}
	SELECT	@mr_org_cd = @org_cd,	@mr_doc_dt = @doc_dt, 	@mr_dsn = @dsn	--{A 981006}
	GOTO	No_Doc		--{ Use input data only!}			--{A 980928}
	END									--{A 981006}
--	===={ Determine organization to receive adjustment }==================================
SELECT 	@org_cd_fin = organization_code,	@dept_org_cd = dept_cd,			--{C19990831}
	@div_org_cd = div_cd,			@mr_org_cd = mr_org_cd, 
	@mr_doc_dt = mr_doc_dt, 		@mr_dsn = mr_dsn,
	@mr_optar_ty = m.optar_ty,		@mr_rcc = rcc,
	@mr_tec = supply_type_equip_code
	FROM	active_rqn_tbl, material_request m
	WHERE	mr_org_cd = mr_organization_code
	  AND	mr_doc_dt = mr_document_date
	  AND	mr_dsn = mr_document_nr_serial
	  AND	org_cd = @org_cd
	  AND	doc_dt = @doc_dt
	  AND	dsn = @dsn
	  AND	doc_suf_cd = @doc_suf_cd
IF	@@rowcount > 0
    	BEGIN
	GOTO	GotDoc
	END
GOTO	No_Doc
--	===={ Document exists -- process standard way }=======================================
GotDoc:
--	===={ org_cd_fin is always the "bill payer" }=========================================
SELECT	@target_org_cd = @org_cd_fin							--{A19990831}
--	===={ Check if tec or rcc from MR different than FA }=================================
ChkTecRcc:
IF	isnull(@tec,"!") = isnull(@mr_tec,"!")
	AND	isnull(@rcc,"!") = isnull(@mr_rcc,"!")
	AND	@optar_ty = @mr_optar_ty
	GOTO 	UpdtOptar
--	===={ Check "stuff" from MR }=========================================================
IF	@bud_cat <> "Non-Chargeable"	AND	@mr_optar_ty = "Non-Chargeable"		--{C20000921}
	BEGIN										--{A20000921}
	SELECT @errno = 99999								--{A20000921}
	SELECT @errmsg =								--{A20000921}
		"Illegal optar type (value = 'Non-Chargeable') in MR table ..."+	--{A20000921}
		"Cannot enter financial adjustment for 'Non-Chargeable' fund code"	--{A20000921}
	ROLLBACK  TRIGGER with raiserror @errno @errmsg					--{A20000921}
	END										--{A20000921}
ELSE	SELECT	@optar_ty = @mr_optar_ty--{ Use optar_type from MR when MR exists } 	--{C20000921}
--	===={ Check if tec is blank }=========================================================
IF	@tec = " "									--{A20000921}
	BEGIN										--{A20000921}
	SELECT @errno = 99999								--{A20000921}
	SELECT @errmsg =								--{A20000921}
	    "Illegal 'blank' tec in MR -- on financial adjustment, tec cannot be blank!"--{A20000921}
	ROLLBACK  TRIGGER with raiserror @errno @errmsg					--{A20000921}
	END										--{A20000921}
ELSE	SELECT	@tec = @mr_tec								--{C20000921}
--	===={ Check if rcc is blank }=========================================================
IF	@rcc = " "									--{A20000921}
	BEGIN										--{A20000921}
	SELECT @errno = 99999								--{A20000921}
	SELECT @errmsg =								--{A20000921}
	    "Illegal 'blank' rcc in MR -- on financial adjustment, rcc cannot be blank!"--{A20000921}
	ROLLBACK  TRIGGER with raiserror @errno @errmsg					--{A20000921}
	END										--{A20000921}
ELSE	SELECT	@rcc = @mr_rcc								--{C20000921}
GOTO	UpdtOptar
--	===={ Document not found on database }================================================
No_Doc:
--	===={ If ROV then charge the unit }===================================================
IF	@optar_ty = "S&E"	AND    @bud_cat = "ROV"					--{A19990831}
	BEGIN										--{A19990831}
	SELECT	@target_org_cd = @org_cd						--{A19990831}
	GOTO	UpdtOptar								--{A19990831}
	END										--{A19990831}
--	===={ If "own" ship try using dsn otherwise use unit number from document }===========
IF EXISTS ( SELECT 1 FROM organization WHERE organization_code = @org_cd		--{C20010420}
		 AND organization_type IN ("OWN", "ALT") )  				--{C20010420}
	BEGIN										--{M19990831}
	IF EXISTS ( SELECT 1 FROM organization 						--{M19990831}
			WHERE 	organization_code = SUBSTRING(@dsn,1,2)			--{M19990831}
			  AND	organization_type = "DIV" 				--{C20010502}
			  AND	actv_fg = 1 )						--{A20010502}
	    BEGIN									--{M19990831}
	    SELECT	@target_org_cd = SUBSTRING(@dsn,1,2)				--{M19990831}
	    GOTO	GotOrg		--{ Go check for "right" organization }		--{M19990831}
	    END										--{M19990831}
--	===={ Look in serial table for organization must be a part of "OWN ship" }============
	SELECT	@serial_org = s.organization_code					--{A20010419}
		FROM	serial s,		organization o				--{A20010419}
		WHERE	@dsn	BETWEEN	begin_nbr AND	end_nbr				--{A20010419}
		  AND	s.organization_code <> @target_org_cd				--{A20010419}
		  AND	s.organization_code = o.organization_code			--{A20010419}
		  AND	o.organization_type IN ("DIV", "DEP", "WC")			--{A20010419}
		  AND	actv_fg = 1 							--{A20010502}
	IF	@serial_org <> null							--{A20010419}
		BEGIN									--{A20010419}
		SELECT	@target_org_cd = @serial_org					--{A20010419}
		GOTO	GotOrg								--{A20010419}
		END									--{A20010419}
--	===={ Still no org_cd -- try defaults }===============================================
	IF	@optar_ty = "S&E"							--{M19990831}
	    BEGIN									--{M19990831}
	    IF EXISTS ( SELECT 1 FROM organization WHERE organization_code = "7X" )	--{M19990831}
		BEGIN									--{M19990831}
		SELECT	@target_org_cd = "7X"						--{M19990831}
		GOTO	UpdtOptar							--{M19990831}
		END									--{M19990831}
	    ELSE									--{M19990831}
		BEGIN									--{M19990831}
		SELECT @errno = 99999							--{M19990831}
		SELECT @errmsg =							--{M19990831}
		       "Unable to identify default organization for 'S&E "+		--{M19990831}
			"Differences', process cannot continue!"			--{M19990831}
		ROLLBACK  TRIGGER with raiserror @errno @errmsg				--{M19990831}
		END									--{M19990831}
	    END										--{M19990831}
	IF	@optar_ty = "AOM"							--{M19990831}
	    BEGIN									--{M19990831}
	    IF EXISTS ( SELECT 1 FROM organization WHERE organization_code = "ZX" )	--{C20010502}
		BEGIN									--{M19990831}
		SELECT	@target_org_cd = "ZX"						--{C20010502}
		GOTO	UpdtOptar							--{M19990831}
		END									--{M19990831}
	     ELSE									--{M19990831}
		BEGIN									--{M19990831}
		SELECT @errno = 99999							--{M19990831}
		SELECT @errmsg =							--{M19990831}
		   "Unable to identify default organization for 'AOM "+			--{M19990831}
			"SFOEDL Differences', process cannot continue!"			--{M19990831}
		ROLLBACK  TRIGGER with raiserror @errno @errmsg				--{M19990831}
		END									--{M19990831}
	    END										--{M19990831}
--	===={ Enter the org-cd used in the auol_dscrptn }=====================================
	UPDATE	financial_adjustment							--{A20010502}
		SET	optar_ty = "dhu62b$*bw@0s"					--{A20010502}
		WHERE	adjmt_fy = @f_year						--{A20010502}
		  AND	adjmt_mo_yr = @adjmt_mo_yr					--{A20010502}
		  AND	fc = @fc							--{A20010502}
		  AND	fc_svc_dsg = @svc_dsg						--{A20010502}
		  AND	adjmt_dt = @adjmt_dt						--{A20010502}
	UPDATE	financial_adjustment							--{A20010502}
		SET	auol_dscrptn = rtrim(@target_org_cd)+auol_dscrptn,		--{A20010502}
			optar_ty = @optar_ty						--{A20010502}
		WHERE	adjmt_fy = @f_year						--{A20010502}
		  AND	adjmt_mo_yr = @adjmt_mo_yr					--{A20010502}
		  AND	fc = @fc							--{A20010502}
		  AND	fc_svc_dsg = @svc_dsg						--{A20010502}
		  AND	adjmt_dt = @adjmt_dt						--{A20010502}
--	===={ Default for "FLTOPS" and any other optar type }=================================
	SELECT	@target_org_cd = @org_cd						--{M19990831}
	GOTO	UpdtOptar	--{ use default }					--{M19990831}
	END										--{M19990831}
--	===={ Verify that we have the 'best' organization to charge to }=====================
--	===={ Default if not "OWN" ship }=====================================================
SELECT	@target_org_cd = @org_cd							--{A19991017}
GotOrg:
EXEC 	prse_find_rents_s1	--prse_find_div_s1
	@trgt_org_cd = @target_org_cd output,
	@div_org_cd = @div_org_cd	output,
	@dept_org_cd = @dept_org_cd output,
	@io_type = @io_type output,
	@input_org_cd = @target_org_cd	
--	===={ Enter the org-cd used in the auol_dscrptn }=====================================
IF	@serial_org IS NOT NULL		OR						--{A20010509}
	@target_org_cd in ("ZX","7X")							--{A20010813}
	BEGIN										--{A20010509}
	UPDATE	financial_adjustment							--{A20010509}
		SET	optar_ty = "dhu62b$*bw@0s"					--{A20010509}
		WHERE	adjmt_fy = @f_year						--{A20010509}
		  AND	adjmt_mo_yr = @adjmt_mo_yr					--{A20010509}
		  AND	fc = @fc							--{A20010509}
		  AND	fc_svc_dsg = @svc_dsg						--{A20010509}
		  AND	adjmt_dt = @adjmt_dt						--{A20010509}
	UPDATE	financial_adjustment							--{A20010509}
		SET	auol_dscrptn = rtrim(@target_org_cd)+auol_dscrptn,		--{A20010509}
			optar_ty = @optar_ty						--{A20010509}
		WHERE	adjmt_fy = @f_year						--{A20010509}
		  AND	adjmt_mo_yr = @adjmt_mo_yr					--{A20010509}
		  AND	fc = @fc							--{A20010509}
		  AND	fc_svc_dsg = @svc_dsg						--{A20010509}
		  AND	adjmt_dt = @adjmt_dt						--{A20010509}
	END										--{A20010509}
--	===={ Check if organization is found or override applies }============================
IF	@target_org_cd = "NoPar"	OR	@target_org_cd = "eRRoR"
	GOTO	BadOrg
ELSE
	GOTO	UpdtOptar	--{ organization exists }
--	===={ Cannot determine organization -- tell user about problem }======================
BadOrg:
SELECT @errno = 99999
SELECT @errmsg = "Organization identified for action in financial adjustment does not exists!"
ROLLBACK  TRIGGER with raiserror @errno @errmsg
UpdtOptar:
--	===={ Update financial_adjustment to agree with MR }==================================
--						{relocated this section}	--{C 981014}
UPDATE	financial_adjustment		--{ Tell update trgr that insert is calling }
	SET	optar_ty = "dhu62b$*bw@0s"
	WHERE	adjmt_fy = @f_year
	  AND	adjmt_mo_yr = @adjmt_mo_yr
	  AND	fc = @fc
	  AND	fc_svc_dsg = @svc_dsg
	  AND	adjmt_dt = @adjmt_dt
UPDATE	financial_adjustment		--{ Then go do priveleged update }
	SET	optar_ty = @optar_ty,
		tec = @tec,
		rcc = @rcc
	WHERE	adjmt_fy = @f_year
	  AND	adjmt_mo_yr = @adjmt_mo_yr
	  AND	fc = @fc
	  AND	fc_svc_dsg = @svc_dsg
	  AND	adjmt_dt = @adjmt_dt

--==================================================================================
--	===={ PENDING CREDIT:  Check if pndg_cr applies }=====================================
--==================================================================================
IF	@delta_sfoedl <> 0.00	AND	@sfoedl_dt is not null				--{M20010813}
	BEGIN										--{M20010813}
	SELECT	@pc_cnt = count(*)							--{M20010813}
		FROM	pndg_cr								--{M20010813}
		WHERE	org_cd = @mr_org_cd						--{M20010813}
		  AND	doc_dt = @mr_doc_dt						--{M20010813}
		  AND	dsn = @mr_dsn							--{M20010813}
	--	===={ If no applicable rows in pndg_cr -- get out of here }===================
	IF	@pc_cnt = 0								--{M20010813}
		BEGIN									--{M20010813}
		GOTO	Continu								--{M20010813}
		END									--{M20010813}
	--	===={ If only 1 row then that row must apply }================================
	IF	@pc_cnt = 1								--{M20010813}
		BEGIN									--{M20010813}
		SELECT	@rvrsl_dt = rvrsl_dt						--{M20010813}
			FROM	pndg_cr							--{M20010813}
			WHERE	org_cd = @mr_org_cd					--{M20010813}
			  AND	doc_dt = @mr_doc_dt					--{M20010813}
			  AND	dsn = @mr_dsn						--{M20010813}
		SELECT	@debug = "FAIpc0"						--{M20010813}
		GOTO	Upd_pndg_cr							--{M20010813}
		END									--{M20010813}
	--	===={ 1. Determine the row most likely to apply  --   
	--	           Find the row with oldest (min) rvsl_dt 
	--		     Smallest (min) transmtl_amt 
	--		       Where transmtl_amt >= sfoedl and with cr_dt is null }==========
	SELECT	@rvrsl_dt = rvrsl_dt							--{M20010813}
		FROM	pndg_cr								--{M20010813}
		WHERE	rvrsl_dt = 							--{M20010813}
		( SELECT   MIN(rvrsl_dt)   FROM   pndg_cr				--{M20010813}
			WHERE	trnsmtl_amt = 						--{M20010813}
			( SELECT   MIN(trnsmtl_amt)   FROM   pndg_cr			--{M20010813}
				WHERE	trnsmtl_amt >=  @delta_sfoedl			--{M20010813}
				  AND	org_cd = @mr_org_cd				--{M20010813}
		 		  AND	doc_dt = @mr_doc_dt				--{M20010813}
				  AND	dsn = @mr_dsn 					--{M20010813}
				  AND	cr_dt IS NULL )					--{M20010813}
			  AND	org_cd = @mr_org_cd					--{M20010813}
		 	  AND	doc_dt = @mr_doc_dt					--{M20010813}
			  AND	dsn = @mr_dsn 						--{M20010813}
			  AND	cr_dt IS NULL )						--{M20010813}
		  AND	org_cd = @mr_org_cd						--{M20010813}
		  AND	doc_dt = @mr_doc_dt						--{M20010813}
		  AND	dsn = @mr_dsn							--{M20010813}
		  AND	cr_dt IS NULL							--{M20010813}
	SELECT	@pc_cnt = @@rowcount							--{M20010813}
	IF	@pc_cnt = 1								--{M20010813}
		BEGIN									--{M20010813}
		SELECT	@debug = "FAIpc1"						--{M20010813}
		GOTO	Upd_pndg_cr							--{M20010813}
		END									--{M20010813}
	--	===={ When above does not identify a row:
	--	===={ 2. Determine the row NEXT most likely to apply  --   
	--	           Find the row with oldest (min) rvsl_dt 
	--	   	     Smallest (min) transmtl_amt 
	--		       Where transmtl_amt < sfoedl and cr_dt is null }===============
	SELECT	@rvrsl_dt = rvrsl_dt							--{M20010813}
		FROM	pndg_cr								--{M20010813}
		WHERE	rvrsl_dt = 							--{M20010813}
		( SELECT   MIN(rvrsl_dt)   FROM   pndg_cr				--{M20010813}
			WHERE	trnsmtl_amt = 						--{M20010813}
			( SELECT   MIN(trnsmtl_amt)   FROM   pndg_cr			--{M20010813}
				WHERE	trnsmtl_amt < @delta_sfoedl			--{M20010813}
				  AND	org_cd = @mr_org_cd				--{M20010813}
		 		  AND	doc_dt = @mr_doc_dt				--{M20010813}
				  AND	dsn = @mr_dsn 					--{M20010813}
				  AND	cr_dt IS NULL )					--{M20010813}
			  AND	org_cd = @mr_org_cd					--{M20010813}
		 	  AND	doc_dt = @mr_doc_dt					--{M20010813}
			  AND	dsn = @mr_dsn 						--{M20010813}
			  AND	cr_dt IS NULL )						--{M20010813}
		  AND	org_cd = @mr_org_cd						--{M20010813}
		  AND	doc_dt = @mr_doc_dt						--{M20010813}
		  AND	dsn = @mr_dsn							--{M20010813}
		  AND	cr_dt IS NULL							--{M20010813}
	SELECT	@pc_cnt = @@rowcount							--{M20010813}
	IF	@pc_cnt = 1								--{M20010813}
		BEGIN									--{M20010813}
		SELECT	@debug = "FAIpc2"						--{M20010813}
		GOTO	Upd_pndg_cr							--{M20010813}
		END									--{M20010813}
	--	===={ When above does not identify a row:
	--	===={ 3. Determine the row NEXT most likely to apply  --   
	--	           Find the row with oldest (min) rvsl_dt 
	--	   	     Smallest (min) transmtl_amt - 
	--		       Where trnsmtl_amt - cr_amt >=  sfoedl and cr_dt is NOT null }==
	SELECT	@rvrsl_dt = rvrsl_dt							--{M20010813}
		FROM	pndg_cr								--{M20010813}
		WHERE	rvrsl_dt = 							--{M20010813}
		( SELECT   MIN(rvrsl_dt)   FROM   pndg_cr				--{M20010813}
			WHERE	trnsmtl_amt = 						--{M20010813}
			( SELECT   MIN(trnsmtl_amt - cr_amt)   FROM   pndg_cr		--{M20010813}
				WHERE	trnsmtl_amt - cr_amt >=  @delta_sfoedl		--{M20010813}
				  AND	org_cd = @mr_org_cd				--{M20010813}
		 		  AND	doc_dt = @mr_doc_dt				--{M20010813}
				  AND	dsn = @mr_dsn					--{M20010813}
				  AND	trnsmtl_amt > cr_amt 				--{M20010813}
		  		  AND	cr_dt IS NOT NULL )				--{M20010813}
			  AND	org_cd = @mr_org_cd					--{M20010813}
		 	  AND	doc_dt = @mr_doc_dt					--{M20010813}
			  AND	dsn = @mr_dsn						--{M20010813}
			  AND	trnsmtl_amt > cr_amt 					--{M20010813}
		  	  AND	cr_dt IS NOT NULL )					--{M20010813}
		  AND	org_cd = @mr_org_cd						--{M20010813}
		  AND	doc_dt = @mr_doc_dt						--{M20010813}
		  AND	dsn = @mr_dsn							--{M20010813}
		  AND	trnsmtl_amt > cr_amt						--{M20010813}
		  AND	cr_dt IS NOT NULL						--{M20010813}
	SELECT	@pc_cnt = @@rowcount							--{M20010813}
	IF	@pc_cnt = 1								--{M20010813}
		BEGIN									--{M20010813}
		SELECT	@debug = "FAIpc3"						--{M20010813}
		GOTO	Upd_pndg_cr							--{M20010813}
		END									--{M20010813}
	--	===={ When above does not identify a row:
	--	===={ 4. Determine the row NEXT most likely to apply  --   
	--	           Find the row with oldest row (min) rvsl_dt 
	--	             With greatest outstanding (max) trnsmtl_amt - cr_amt 
	SELECT	@rvrsl_dt = rvrsl_dt							--{M20010813}
		FROM	pndg_cr								--{M20010813}
		WHERE	rvrsl_dt = 							--{M20010813}
		( SELECT	MIN(rvrsl_dt)	FROM	pndg_cr				--{M20010813}
			WHERE	trnsmtl_amt = 						--{M20010813}
			( SELECT	MAX(trnsmtl_amt - cr_amt)  FROM	pndg_cr		--{M20010813}
				WHERE	org_cd = @mr_org_cd				--{M20010813}
		 		  AND	doc_dt = @mr_doc_dt				--{M20010813}
				  AND	dsn = @mr_dsn )					--{M20010813}
			  AND	org_cd = @mr_org_cd					--{M20010813}
		 	  AND	doc_dt = @mr_doc_dt					--{M20010813}
			  AND	dsn = @mr_dsn )						--{M20010813}
		  AND	org_cd = @mr_org_cd						--{M20010813}
		  AND	doc_dt = @mr_doc_dt						--{M20010813}
		  AND	dsn = @mr_dsn							--{M20010813}
		  AND	cr_dt IS NOT NULL						--{M20010813}
	SELECT	@pc_cnt = @@rowcount							--{M20010813}
	IF	@pc_cnt = 1								--{M20010813}
		BEGIN									--{M20010813}
		SELECT	@debug = "FAIpc4"						--{M20010813}
		GOTO	Upd_pndg_cr							--{M20010813}
		END									--{M20010813}
	--	===={ When ALL of above does not identify a DEFAULT row:
	--	===={ 5. Determine the DEFAULT row  -- 
	--	           Find the row with the newest (min) rvsl_dt 
	--	      	     and matching doc#  }=============================================
	SELECT	@rvrsl_dt = MIN(rvrsl_dt)						--{M20010813}
		FROM	pndg_cr								--{M20010813}
		WHERE	org_cd = @mr_org_cd						--{M20010813}
	 	  AND	doc_dt = @mr_doc_dt						--{M20010813}
		  AND	dsn = @mr_dsn							--{M20010813}
	SELECT	@pc_cnt = @@rowcount							--{M20010813}
	IF	@pc_cnt = 1								--{M20010813}
		BEGIN									--{M20010813}
		SELECT	@debug = "FAIpc5"						--{M20010813}
		GOTO	Upd_pndg_cr							--{M20010813}
		END									--{M20010813}
	ELSE										--{M20010813}
		BEGIN									--{M20010813}
		GOTO	Continu								--{M20010813}
		END									--{M20010813}
	--	===={ Update matching entry unconditionally }=================================
    Upd_pndg_cr:									--{M20010813}
	UPDATE	pndg_cr									--{M20010813}
		SET	cr_amt = cr_amt + @delta_sfoedl,				--{M20010813}
			cr_dt = getdate()						--{M20010813}
		WHERE	org_cd = @mr_org_cd						--{M20010813}
		  AND	doc_dt = @mr_doc_dt						--{M20010813}
		  AND	dsn = @mr_dsn							--{M20010813}
		  AND	rvrsl_dt = @rvrsl_dt						--{M20010813}
	--===={ Check for error updating pndg_cr }============================================
	IF	@@rowcount <> 1	OR @@error <> 0						--{M20010813}
		BEGIN	
		SELECT @errno = 99999
		SELECT @errmsg =
		    "FATAL ERROR - Error updating pndg_cr table - contact "+
			"RSupply DBA, SPAWARSYSCEN  - - ATLANTIC"
		ROLLBACK  TRIGGER with raiserror @errno @errmsg
		END
	--===={ Record in financial_adjustment.auol_dscrptn }=================================
	SELECT	@rvrsl_dtX = substring(convert(char(27),@rvrsl_dt,109),1,11)+		--{A20010813}
		"^"+substring(convert(char(27),@rvrsl_dt,109),13,8)+			--{A20010813}
		substring(convert(char(27),@rvrsl_dt,109),25,1)				--{A20010813}
	--===={ Above result in string that looks like "Aug 13 2001^ 8:40:50P". To use
	--	as an argument to find pndg_cr match use following:
	--	    substring(@rvrsl_dtX,1,11)+"%"+	--{ pickup date plus wildcard }
	--	    substring(@rvrsl_dtX,13,8)+"%"+	--{ then time plus wildcard   }
	--	    substring(@rvrsl_dtX,21,1)+"%"	--{ then A or P plus wildcard }
	--===={ Test if enough space in aoul_dscrptn }========================================
	IF	datalength(rtrim(@auol_dscrptn)) > 15					--{A20010813}
		BEGIN									--{A20010813}
		GOTO	NoSpace								--{A20010813}
		END									--{A20010813}
	UPDATE	financial_adjustment							--{A20010813}
		SET	optar_ty = "dhu62b$*bw@0s"	--{Tell trigger its just us}	--{A20010813}
		WHERE	adjmt_fy = @f_year						--{A20010813}
		  AND	adjmt_mo_yr = @adjmt_mo_yr					--{A20010813}
		  AND	fc = @fc							--{A20010813}
		  AND	fc_svc_dsg = @svc_dsg						--{A20010813}
		  AND	adjmt_dt = @adjmt_dt						--{A20010813}
	UPDATE	financial_adjustment		--{ Then go do priveleged update }	--{A20010813}
		SET	optar_ty = @optar_ty,						--{A20010813}
			auol_dscrptn = substring(auol_dscrptn,1,16)+@rvrsl_dtX		--{A20010813}
		WHERE	adjmt_fy = @f_year						--{A20010813}
		  AND	adjmt_mo_yr = @adjmt_mo_yr					--{A20010813}
		  AND	fc = @fc							--{A20010813}
		  AND	fc_svc_dsg = @svc_dsg						--{A20010813}
		  AND	adjmt_dt = @adjmt_dt						--{A20010813}
NoSpace:
--	===={ Insert row into debugging table }===============================================
	INSERT INTO	Tgr_DEBUG (							--{A20010813}
	     	mr_org_cd,	mr_doc_dt,	mr_dsn,		TmeStmp,		--{A20010813}	
		UserName,	Srce,		fc,		svd,			--{A20010813}
		bdgt_cat,	fscl_yr,	optar_ty,	optar_org_cd,		--{A20010813}
		net_difnc,	net_iss,	net_oblgn,				--{A20010813}
		org_cd,		doc_dt,		dsn,		doc_suf_cd,		--{A20010813}
		comments )								--{A20010813}
	    VALUES (									--{A20010813}
		@mr_org_cd,	@mr_doc_dt,	@mr_dsn,	getdate(),		--{A20010813}
		user,		"MRLUpc",	@fc,		@svc_dsg,		--{A20010813}
		@bud_cat,	@f_year,	@optar_ty,	@target_org_cd,		--{A20010813}
		0.00,		0.00,		0.00,					--{A20010813}
		null,		@rvrsl_dt,	null,		null,			--{A20010813}
		"PNDG_CR$="+convert(char(12),@delta_sfoedl)+" d_dt=rvsldt" )		--{A20010813}					
	SELECT	@comments = "PNDG_CR: Amt = "+convert(char(22),@delta_sfoedl)		--{A 981014}
	END
Continu:										--{M20010813}
--			select	"D",@target_org_cd tar,@io_type ioty
SELECT 	@delta_oblgn = isnull(@delta_oblgn,0),
	@delta_sfoedl = isnull(@delta_sfoedl,0)
--	===={ Go update the optar row effected }==============================================
--	===={ Check if tec optar }============================================================
IF	@tec <> null		--{ IF tec tx, update optar_tec }
	BEGIN
	SELECT @debug = "FAI-u1"
	UPDATE	optar_tec
	   SET	sumry_difnc = sumry_difnc + @delta_sfoedl,
		sumry_oblgn = sumry_oblgn + @delta_oblgn
	 WHERE	svc_dsg = @svc_dsg
	   AND	fscl_yr = @f_year
	   AND	org_cd = @target_org_cd
	   AND	bud_cat = @bud_cat
	   AND	optar_ty = @optar_ty
	   AND	tec = @tec
	IF @@rowcount = 0 	--or @@rowcount > 1
		BEGIN
		SELECT @debug = "FAI-i1"
		INSERT into optar_tec
		   (bud_cat,  fscl_yr, optar_ty,    org_cd,
			sumry_difnc,   sumry_iss, sumry_oblgn,   svc_dsg,  tec) 
		VALUES (@bud_cat, @f_year, @optar_ty,   @target_org_cd,
			@delta_sfoedl, 0.00,      @delta_oblgn,  @svc_dsg, @tec)
		IF     @@error <> 0	OR @@rowcount = 0
		    BEGIN
		    SELECT  @errno = 99999
		    SELECT  @errmsg = "< FATAL ERROR - Attempt to insert or update optar_tec"+
			" table failed -- probable system error >"
		    ROLLBACK  TRIGGER with raiserror @errno  @errmsg
		    END
		END
	GOTO	WrapUp	--{ All Done! }
	END
--	===={ Check if rcc optar }============================================================
IF	@rcc <> null		--{ IF rcc tx, update optar_rcc }
	BEGIN
	SELECT @debug = "FAI-u2"
	UPDATE	optar_rcc
	   SET	sumry_difnc = sumry_difnc + @delta_sfoedl,
		sumry_oblgn = sumry_oblgn + @delta_oblgn
	 WHERE	svc_dsg = @svc_dsg
	   AND	fscl_yr = @f_year
	   AND	org_cd = @target_org_cd
	   AND	bud_cat = @bud_cat
	   AND	optar_ty = @optar_ty
	   AND	rcc = @rcc
	IF @@rowcount = 0 --or @@rowcount > 1
		BEGIN
		SELECT @debug = "FAI-i2"
		INSERT into optar_rcc
		   (bud_cat,  fscl_yr, optar_ty,    org_cd,
			sumry_difnc,   sumry_iss, sumry_oblgn,   svc_dsg,  rcc) 
		VALUES (@bud_cat, @f_year, @optar_ty,   @target_org_cd,
			@delta_sfoedl, 0.00,      @delta_oblgn,  @svc_dsg, @rcc)
		IF     @@error <> 0	OR @@rowcount = 0
		    BEGIN
		    SELECT  @errno = 99999
		    SELECT  @errmsg = "< FATAL ERROR - Attempt to insert or update optar_rcc"+
			" table failed -- probable system error >"
		    ROLLBACK  TRIGGER with raiserror @errno  @errmsg
		    END
		END
	GOTO	WrapUp	--{ All Done! }
	END
--	===={ Otherwise must be regular optar }===============================================
SELECT @debug = "FAI-u3"
UPDATE	optar			--{ otherwise, update regular optar }
   SET	sumry_difnc = sumry_difnc + @delta_sfoedl,
	sumry_oblgn = sumry_oblgn + @delta_oblgn
   WHERE	svc_dsg = @svc_dsg
     AND	fiscal_year = @f_year
     AND	organization_code = @target_org_cd
     AND	budget_cat = @bud_cat
     AND	optar_type = @optar_ty
--	===={ If no row found database has been corrupted -- rollback and issue message }=====
IF @@rowcount = 0 --or @@rowcount > 1
	BEGIN
	SELECT @debug = "FAI-i3"
	INSERT into optar  (budget_cat, fiscal_year, funds, optar_type,  organization_code,
			sumry_difnc,   sumry_iss, sumry_oblgn,  svc_dsg) 
	    VALUES         (@bud_cat,   @f_year,     0.00,  @optar_ty,   @target_org_cd,
			@delta_sfoedl, 0.00,      @delta_oblgn, @svc_dsg)
	IF     @@error <> 0	OR @@rowcount = 0
		BEGIN
		SELECT  @errno = 99999
		SELECT  @errmsg = "< FATAL ERROR - Attempt to insert or update optar"+
			" table failed -- probable system error >"
		ROLLBACK  TRIGGER with raiserror @errno  @errmsg
		END
	END
WrapUp:
IF	@mr_org_cd = null	OR	@mr_doc_dt = null	OR	@mr_dsn = null
    SELECT	@mr_org_cd = @org_cd,	@mr_doc_dt = @doc_dt,	@mr_dsn = @dsn
--	===={ Record into debug table }=======================================================
--	===={ "Fix" mr_doc if missing }=======================================================
IF	@mr_doc_dt = null
	SELECT	@mr_doc_dt = getdate()
IF	@mr_dsn = null
	SELECT	@mr_dsn = ""
IF	@mr_org_cd = null	OR	@mr_doc_dt = null	OR	@mr_dsn = null
    SELECT	@mr_org_cd = @org_cd,	@mr_doc_dt = @doc_dt,	@mr_dsn = @dsn
INSERT INTO	Tgr_DEBUG	(	--{ Debug }
	mr_org_cd,	mr_doc_dt,	mr_dsn,		TmeStmp,	UserName,
	Srce,		fc,		svd,		bdgt_cat,	fscl_yr,	
	optar_ty,	optar_org_cd,	net_difnc,	net_iss,	net_oblgn,
	org_cd,		doc_dt,		dsn,		doc_suf_cd,	tec,
	rcc,		comments  )						--{C 981014}
   VALUES	(
	@mr_org_cd,	@mr_doc_dt,	@mr_dsn,	getdate(),	user,
	@debug,		@fc,		@svc_dsg,	@bud_cat,	@f_year,	
	@optar_ty,	@target_org_cd,	@delta_sfoedl,	0.00,		@delta_oblgn,
	@org_cd,	@doc_dt,	@dsn,		@doc_suf_cd,	@tec,
	@rcc,		@comments  )						--{C 981014}
--	===={ HAPPY ENDING }=================================={ HAPPY ENDING }====
END

go

go
