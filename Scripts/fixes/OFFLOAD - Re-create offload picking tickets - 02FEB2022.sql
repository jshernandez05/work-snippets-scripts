--===========================================================================--
-- 	Place Offload requisitions that have been released into
--	picking_ticket tbl for re-printing
--  copies data from the inv_expenditure tbl for Offload records
--===========================================================================--

--==================={Create Temp Table}=====================================--
-- Create Temp table to validate records that will be inserted 

IF EXISTS(SELECT 1 FROM tempdb..sysobjects WHERE name='my_tmp')
	BEGIN
		DROP TABLE tempdb..my_tmp
		PRINT 'table dropped........'
	END
ELSE
	PRINT 'tmp table does not exist'

GOTO tmptbl

tmptbl:
CREATE TABLE tempdb..my_tmp(
	mr_org_cd 		CHAR(5)		NOT NULL,
	mr_doc_dt 		DATETIME 	NOT NULL,
	mr_dsn			CHAR(4)		NOT NULL,
	form_ty			CHAR(1)		NOT NULL,
	mr_suf_cd		CHAR(1)		NOT NULL,
	asgn_suf_cd		CHAR(1)		NOT NULL,
	dup_cnt			INT			NOT NULL,
	tmstmp			timestamp	NULL,
	suprt_pkg_serno CHAR(6)		NULL
)
PRINT 'tmp table created'
GO	

INSERT INTO tempdb..my_tmp
(mr_org_cd, mr_doc_dt, mr_dsn, form_ty, mr_suf_cd, asgn_suf_cd, dup_cnt, suprt_pkg_serno)
SELECT
	expndtr_org_cd
	, expndtr_doc_dt
	, expndtr_dsn
	, 'O'
	, ''
	, ''
	, 0
	, NULL
FROM
	inv_expenditure
WHERE 
	(loc in ('BOX015','BOX016','BOX032','BOX033','BOX034','BOX035',
			'BOX036','BOX037','CLOT%','SEC%','PK%','SL%','PALL%',
			'HMG%','CS%','CA%','CM%','CY%','BLK%','TB%'
			)
	AND expndtr_doc_dt BETWEEN '01/13/2022' AND '01/15/2022')
		OR
	RIGHT(DATENAME(YY, expndtr_doc_dt),1) 
	+ RIGHT(STR(1000+DATEPART(DY,expndtr_doc_dt)),3) + expndtr_dsn IN (
	'20141607','20131626','20150191','20150253','20140726','20141599',
	'20150852','20130829','20140653','20131223','20131338','20131590',
	'20140147','20140430','20140577','20140589','20140792','20140868',
	'20141339','20150141','20150334','20131306','20140461','20140957',
	'20141602','20141630','20150877','20151001','20151001','20151040',
	'20151054','20141117','20141686','20130799','20130803','20130806',
	'20130817','20130886','20140254','20140290','20140863','20140989',
	'20141414','20140193','20140813','20150545','20141200','20141253',
	'20141324','20141326','20150360','20150625','20150676','20150870',
	'20150935','20150898','20130834','20131388','20131388','20140490',
	'20140116','20140737','20140956'
	)
GO
--==================={Validate Records}======================================--

SELECT * FROM tempdb..my_tmp
GO

--==================={Insert records}========================================--

INSERT INTO picking_ticket
(mr_org_cd, mr_doc_dt, mr_dsn, form_ty, mr_suf_cd,
 asgn_suf_cd, dup_cnt, suprt_pkg_serno
 )
SELECT
	expndtr_org_cd
	, expndtr_doc_dt
	, expndtr_dsn
	, 'O'
	, ''
	, ''
	, 0
	, NULL
FROM
	inv_expenditure
WHERE 
	(loc in ('BOX015','BOX016','BOX032','BOX033','BOX034','BOX035',
			'BOX036','BOX037','CLOT%','SEC%','PK%','SL%','PALL%',
			'HMG%','CS%','CA%','CM%','CY%','BLK%','TB%'
			)
	AND expndtr_doc_dt BETWEEN '01/13/2022' AND '01/15/2022')
		OR
	RIGHT(DATENAME(YY, expndtr_doc_dt),1) 
	+ RIGHT(STR(1000+DATEPART(DY,expndtr_doc_dt)),3) + expndtr_dsn IN (
	'20141607','20131626','20150191','20150253','20140726','20141599',
	'20150852','20130829','20140653','20131223','20131338','20131590',
	'20140147','20140430','20140577','20140589','20140792','20140868',
	'20141339','20150141','20150334','20131306','20140461','20140957',
	'20141602','20141630','20150877','20151001','20151001','20151040',
	'20151054','20141117','20141686','20130799','20130803','20130806',
	'20130817','20130886','20140254','20140290','20140863','20140989',
	'20141414','20140193','20140813','20150545','20141200','20141253',
	'20141324','20141326','20150360','20150625','20150676','20150870',
	'20150935','20150898','20130834','20131388','20131388','20140490',
	'20140116','20140737','20140956'
	)
GO
--==================={Drop temp tbl}========================================--

IF EXISTS(SELECT 1 FROM tempdb..sysobjects WHERE name='my_tmp')
	BEGIN
		DROP TABLE tempdb..my_tmp
		PRINT 'tmp table dropped........'
	END
ELSE
	PRINT 'tmp table does not exist'	