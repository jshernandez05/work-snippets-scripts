ACTIVE REQUISITION INSERT
-- ===={ change fund code for FRS MVO's }=================================================

IF (SUBSTRING(@dsn,1,1) NOT LIKE '%[A-Z]%'
	AND SUBSTRING(@dsn,2,1) NOT LIKE '%[A-Z]%'
	AND	(
		(CONVERT(INT,@dsn) >= 9790 AND CONVERT(INT,@dsn) <= 9799)
		OR
		(CONVERT(INT,@dsn) >= 9660 AND CONVERT(INT,@dsn) <= 9699)
		OR
		(CONVERT(INT,@dsn) >= 8890 AND CONVERT(INT,@dsn) <= 8899))
		OR 
		@dsn LIKE 'T5%'
		OR
		@dsn LIKE '2X9%'
		)
	AND @fc NOT LIKE '2N'
	BEGIN 
		SELECT @fc = '2N'
	END
	
--	===={ Update FRS 7L to 2N & budget category to FLTOPS====================

SELECT @jcn = jcn_org_code
FROM   aviation_maintenance
WHERE  mr_document_date = @doc_dt
  AND  mr_document_nr_serial = @dsn 

IF @@rowcount = 1
BEGIN

IF @jcn = 'GQ2'
   AND @fc = '7L'
	BEGIN 
		SELECT @fc = '2N',
                       @optar_ty = 'FLTOPS'
	END

IF @jcn = 'GQ2'
   AND @fc = '9S'
	BEGIN 
		SELECT @fc = '9R',
                @optar_ty = 'FLTOPS'
	END
END	


MR INSERT
--	===={ fix FRS MVO's that are not Fund Code 2N }=========================================   
IF LEFT(@mr_dsn, 2) IN ('88', '96', '97', 'T5', '2X')
	AND @org_cd LIKE 'G6'
	AND @div_org_cd LIKE 'G6'
	AND @fc NOT LIKE '2N'
	BEGIN
		SELECT @fc = '2N'
	END

--	===={ Update FRS 7L to 2N & budget category to FLTOPS====================

SELECT @jcn = jcn_org_code
FROM   aviation_maintenance
WHERE  mr_document_date = @mr_doc_dt
AND  mr_document_nr_serial = @mr_dsn

IF @@rowcount = 1
BEGIN

IF @jcn = 'GQ2'
   AND @fc = '7L'
   AND @doc_id not like 'EUR'
	BEGIN 
		SELECT @fc = '2N',
                       @optar_ty= 'FLTOPS'
	END

IF @jcn = 'GQ2'
   AND @fc = '9S'
   AND @doc_id not like 'EUR'
	BEGIN 
		SELECT @fc = '9R',
		@optar_ty= 'FLTOPS'
	END

END

ORIG REQUISITION INSERT
-- ===={ Update fund code on FRS MVO requisitions }================================================
	
IF (SUBSTRING(@dsn,1,1) NOT LIKE '%[A-Z]%'
	AND SUBSTRING(@dsn,2,1) NOT LIKE '%[A-Z]%'
	AND	(
		(CONVERT(INT,@dsn) >= 9790 AND CONVERT(INT,@dsn) <= 9799)
		OR
		(CONVERT(INT,@dsn) >= 9660 AND CONVERT(INT,@dsn) <= 9699)
		OR 
		(CONVERT(INT,@dsn) >= 8890 AND CONVERT(INT,@dsn) <= 8899))
		OR 
		@dsn LIKE 'T5%'
		OR
		@dsn LIKE '2X9%'
		)
	AND @fc NOT LIKE '2N'
	BEGIN 
		SELECT @fc = '2N'
	END

--	===={ Update FRS 7L to 2N & budget category to FLTOPS====================

SELECT @jcn = jcn_org_code
FROM   aviation_maintenance
WHERE  mr_document_date = @doc_dt
  AND  mr_document_nr_serial = @dsn 

IF @@rowcount = 1
BEGIN

IF @jcn = 'GQ2'
   AND @fc = '7L'
	BEGIN 
		SELECT @fc = '2N'
	END

IF @jcn = 'GQ2'
   AND @fc = '9S'
	BEGIN 
		SELECT @fc = '9R'
	END
END	