P(R$Qj1Z9_,RFi5

000089855 7L


011794064 9S

014940565  3BD





select ddsn, org_cd, cog, mcc, orig_niin, fund_cd, tec from dr09_requisition
where org_cd like 'GQ2'
and cog in ('3B', '1R')
and lsc_dttm > '07/27/2019'



select * from dbo.fc_MASTER1



select * from dbo.fc_unit

no results

select * from dbo.fc

select * from dbo.fc_appn
order by fund_code asc
go





fc	sdc	fc_dscrpt	bud_cat	optar_ty	state_cd	fc_rstc_ind	appn_ind	comments
7L	R	Material Used on Aircraft Maintenance                       	AOM            	AOM            	A	4	7	
7L	V	Material Used on Aircraft Maintenance                       	AOM            	AOM            	A	4	7	

insert into fc_MASTER1
(fc, sdc, fc_dscrpt, bud_cat, optar_ty,	state_cd, fc_rstc_ind, appn_ind, comments)
values ("9T", "V", "Material Used on Aircraft Maintenance", "AOM", "AOM", "A", "4", "7", " ")

--------------------------------------------------------------


(Unknown column name)
(Unknown column name)
table-level check const	fk_appn_has (Table-level check constraint)
table-level check const	fk_fc_may_have (Table-level check constraint)


insert into fc_appn
(fc_service_designator_code, appn_ind, appn_fiscal_year, fund_code)
values ("V", "7", "Jan  1 2018 12:00AM", "7T")
go

select * from dbo.fc_MASTER1
where fc like '7K'

go




update dbo.fc_MASTER1 set
appn_ind = "7"
where fc like '7K'

go



-------------------
/*  STEP 1      */

select * from fc_MASTER1
where fc like '9D'
go

fc	sdc	fc_dscrpt	bud_cat	optar_ty	state_cd	fc_rstc_ind	appn_ind	comments
9D	R	No Longer Required                                          	AOM            	AOM            	N	4		
9D	V	No Longer Required                                          	AOM            	AOM            	I	4	7	


-- update fc_MASTER1 set
state_cd = "A",
appn_ind = "7"
where fc like '9D'
go

fc	sdc	fc_dscrpt	bud_cat	optar_ty	state_cd	fc_rstc_ind	appn_ind	comments
9D	R	No Longer Required                                          	AOM            	AOM            	A	4	7	
9D	V	No Longer Required                                          	AOM            	AOM            	A	4	7	


/* STEP 2      */

select *
from fc
where fund_code in ('9S', '9D')
go

fund_code	fc_service_designator_code	fund_code_description	fund_code_start_date	fund_code_stop_date	budget_cat	optar_ty
9D	R	No Longer Needed: No Longer Required                        	Oct  1 2000 12:00AM	Sep 30 2019 12:00AM	AOM	AOM            
9S	N	NSA AVDLR 7R COG                                            	Oct  1 2006 12:00AM	Sep 30 2019 12:00AM	Consumable	S&E            
9S	R	NSA AVDLR 7R COG                                            	Oct  1 2000 12:00AM	Sep 30 2019 12:00AM	AOM	AOM            
9S	V	[Conversion] NSA AVDLR 7R COG                               	Oct  1 2000 12:00AM	Sep 30 2019 12:00AM	AOM	AOM      

-- update fc set

where fund_code like '9D'
go     


insert into fc
(fund_code, fc_service_designator_code, fund_code_description, fund_code_start_date, fund_code_stop_date, budget_cat, optar_ty)
values
( "9D",	"V", "No Longer Needed: No Longer Required", "Oct  1 2000 12:00AM",	"Sep 30 2019 12:00AM",	"AOM",	"AOM") 
go


fund_code	fc_service_designator_code	fund_code_description	fund_code_start_date	fund_code_stop_date	budget_cat	optar_ty
9D	R	No Longer Needed: No Longer Required                        	Oct  1 2000 12:00AM	Sep 30 2019 12:00AM	AOM	AOM            
9D	V	No Longer Needed: No Longer Required                        	Aug  6 2019 12:00AM	Aug  6 2019 12:00AM	AOM	AOM            
9S	N	NSA AVDLR 7R COG                                            	Oct  1 2006 12:00AM	Sep 30 2019 12:00AM	Consumable	S&E            
9S	R	NSA AVDLR 7R COG                                            	Oct  1 2000 12:00AM	Sep 30 2019 12:00AM	AOM	AOM            
9S	V	[Conversion] NSA AVDLR 7R COG                               	Oct  1 2000 12:00AM	Sep 30 2019 12:00AM	AOM	AOM            


/* STEP 3          */

select * from dbo.fc_appn
where fund_code like '9%'
go

select * from dbo.fc_appn
where appn_fiscal_year >= '01/01/2019'
and fund_code like '9%'
go


fc_service_designator_code	appn_ind	appn_fiscal_year	fund_code
N	7	Jan  1 2019 12:00AM	9S
R	2	Jan  1 2019 12:00AM	97
R	7	Jan  1 2019 12:00AM	9A
R	7	Jan  1 2019 12:00AM	9E
R	7	Jan  1 2019 12:00AM	9Q
R	7	Jan  1 2019 12:00AM	9S
R	K	Jan  1 2019 12:00AM	9M
R	K	Jan  1 2019 12:00AM	9N
R	K	Jan  1 2019 12:00AM	9R
R	L	Jan  1 2019 12:00AM	9D
V	7	Jan  1 2019 12:00AM	9S

insert into fc_appn
(fc_service_designator_code, appn_ind, appn_fiscal_year, fund_code)
values ("V", "7", "Jan  1 2019 12:00AM", "9D")

-- update fc_appn set
appn_ind = "7"
where fund_code like '9D'
and fc_service_designator_code like 'R'
go


fc_service_designator_code	appn_ind	appn_fiscal_year	fund_code
N	7	Jan  1 2019 12:00AM	9S
R	2	Jan  1 2019 12:00AM	97
R	7	Jan  1 2019 12:00AM	9A
R	7	Jan  1 2019 12:00AM	9E
R	7	Jan  1 2019 12:00AM	9Q
R	7	Jan  1 2019 12:00AM	9S
R	K	Jan  1 2019 12:00AM	9M
R	K	Jan  1 2019 12:00AM	9N
R	K	Jan  1 2019 12:00AM	9R
R	7	Jan  1 2019 12:00AM	9D
V	7	Jan  1 2019 12:00AM	9S
V	7	Jan  1 2019 12:00AM	9D


/* STEP 4    */

select * from appn
where appn_ind like '9%'
and appn_fiscal_year >= '01/01/2019'
go

fc_service_designator_code	appn_ind	appn_fiscal_year	appropriation_department	fiscal_year_limit	appropriation_symbol	appropriation_subhead	authzn_acctg_actvy	operating_budget_number_bcn	operating_budget_suffix
N	9	Jan  1 2019 12:00AM	97	9	4930	NH2A	N68688	28011	
R	9	Jan  1 2019 12:00AM	97	9	4930	NC1A	000367	28001	
V	9	Jan  1 2019 12:00AM	97	9	4930	NC1A	000367	28001	


/* STEP 5     */

select * from cog 
where  fc_aom like '9S'
go


cognizance_symbol	cog_desc						fc_aom
7R			NAVICP-P Depot Level Repairable Aviation Material   	9S


/* GO TO APPLICATION SITE > VALIDATION TABLES > COG 
   UPDATE AOM TO # FOR RELATED COGS 
   FINANCIAL AUDIT PASSWD REQUIRED TO UPDATE TABLE 
   **CONTACT NIWC ATLANTIC FOR PASSWD**






'( "' + fund_code + '," ' + '"' + fc_service_designator_code + '," ' + '"' + fund_code_start_date + '," ' + '"' + fund_code_stop_date + '," ' +
       '"' + fund_code_description + '," ' + '"' + budget_cat + '," ' + '"' + optar_ty + '," )' 