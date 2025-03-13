2N replacing 7L for FRS Squadrons
9R replacing 9S for FRS Squadrons

/****************/
/*   STEP 1     */
/****************/

	/* - Identify if fund codes 2N and 9R are loaded to fc_MASTER1 
	   - Update existing fc 2N and 9R data to match 7L and 9S data respectively
        */

select * from fc_MASTER1
where fc in ('2N', '9R','7L','9S')
go

fc	sdc	fc_dscrpt	bud_cat	optar_ty	state_cd	fc_rstc_ind	appn_ind	comments
2N	R	AOM Maintenance Non-AVDLR                                   	AOM            	AOM            	I	4	K	
2N	V	AOM Maintenance Non-AVDLR                                   	AOM            	AOM            	I	4	7	
7L	N	Aircraft Maintenance                                        	AOM            	AOM            	A	4	7	
7L	R	Material Used on Aircraft Maintenance                       	AOM            	AOM            	A	4	7	
7L	V	Material Used on Aircraft Maintenance                       	AOM            	AOM            	A	4	7	
9R	R	NWCF AVDLR                                                  	AOM            	AOM            	I	4	K	
9R	V	NWCF AVDLR                                                  	AOM            	AOM            	I	4	7	
9S	R	NSA AVDLR 7R COG                                            	AOM            	AOM            	A	4	7	
9S	V	NSA AVDLR 7R COG                                            	AOM            	AOM            	A	4	7	



/****************/
/*   STEP 1A    */
/****************/

	/* - Use below SQL to update existing 2N or 9R records 
	   - Update existing fc 2N and 9R data to match 7L and 9S data respectively
	   - If 2N or 9R doesn't exist on table, insert new records for each 
	   - set fc_rstc_ind to "X" 
	   - set appn_ind t "7"
	   - set bud_cat and optar_ty to "FLTOPS"
           - set fc_dscrpt to "AOM Maintenance FRS"
           - set state_cd to "A"
        */


-- update fc_MASTER1 set
fc_rstc_ind = "X",
appn_ind = "7",
bud_cat = "FLTOPS",
optar_ty = "FLTOPS",
fc_dscrpt = "AOM Maintenance FRS",
state_cd = "A" 
where fc in ('2N', '9R')  
go

fc	sdc	fc_dscrpt	bud_cat	optar_ty	state_cd	fc_rstc_ind	appn_ind	comments
2N	R	AOM Maintenance FRS                                         	FLTOPS         	FLTOPS         	A	X	7	
2N	V	AOM Maintenance FRS                                         	FLTOPS         	FLTOPS         	A	X	7	
7L	N	Aircraft Maintenance                                        	AOM            	AOM            	A	4	7	
7L	R	Material Used on Aircraft Maintenance                       	AOM            	AOM            	A	4	7	
7L	V	Material Used on Aircraft Maintenance                       	AOM            	AOM            	A	4	7	
9R	R	AOM Maintenance FRS                                         	FLTOPS         	FLTOPS         	A	X	7	
9R	V	AOM Maintenance FRS                                         	FLTOPS         	FLTOPS         	A	X	7	
9S	R	NSA AVDLR 7R COG                                            	AOM            	AOM            	A	4	7	
9S	V	NSA AVDLR 7R COG                                            	AOM            	AOM            	A	4	7	


/****************/
/*   STEP 1B    */
/****************/

	/* - If there are any fc sdc combinations for 2N or 9R that don't exist, use
             the below SQLs to obtain the input values and insert record to table. 
        */



select '( "' + fc + '", ' + '"' + sdc + '", ' + '"' + rtrim(fc_dscrpt) + '", ' + '"' + rtrim(bud_cat) + '", ' +
       '"' + rtrim(optar_ty) + '", ' + '"' + state_cd + '", ' + '"' + fc_rstc_ind + '", ' + '"' + appn_ind  + '", ' + '"' + comments + '" )'  
from fc_MASTER1
where fc in ('2N', '9R')
go


( "2N", "R", "AOM Maintenance Non-AVDLR", "AOM", "AOM", "I", "4", "K", "" )
( "2N", "V", "AOM Maintenance Non-AVDLR", "AOM", "AOM", "I", "4", "7", "" )
( "9R", "R", "NWCF AVDLR", "AOM", "AOM", "I", "4", "K", "" )
( "9R", "V", "NWCF AVDLR", "AOM", "AOM", "I", "4", "7", "" )


-- insert into fc_MASTER1 
(fc, sdc, fc_dscrpt, bud_cat, optar_ty, state_cd, fc_rstc_ind, appn_ind, comments)
values
( "2N", "N", "AOM Maintenance FRS", "FLTOPS", "FLTOPS", "A", "X", "7", "" )



fc	sdc	fc_dscrpt	bud_cat	optar_ty	state_cd	fc_rstc_ind	appn_ind	comments
2N	N	AOM Maintenance FRS                                         	FLTOPS         	FLTOPS         	A	X	7	 
2N	R	AOM Maintenance FRS                                         	FLTOPS         	FLTOPS         	A	X	7	
2N	V	AOM Maintenance FRS                                         	FLTOPS         	FLTOPS         	A	X	7	
7L	N	Aircraft Maintenance                                        	AOM            	AOM            	A	4	7	
7L	R	Material Used on Aircraft Maintenance                       	AOM            	AOM            	A	4	7	
7L	V	Material Used on Aircraft Maintenance                       	AOM            	AOM            	A	4	7	
9R	N	AOM Maintenance FRS                                         	FLTOPS         	FLTOPS         	A	X	7	 
9R	R	AOM Maintenance FRS                                         	FLTOPS         	FLTOPS         	A	X	7	
9R	V	AOM Maintenance FRS                                         	FLTOPS         	FLTOPS         	A	X	7	
9S	R	NSA AVDLR 7R COG                                            	AOM            	AOM            	A	4	7	
9S	V	NSA AVDLR 7R COG                                            	AOM            	AOM            	A	4	7	

/****************/
/*   STEP 2     */
/****************/

	/* - Identify whether or not 2N and 9R are loaded to the fc table 
	   - Update existing fc 2N and 9R data to match 7L and 9S data respectively
	   - If 2N or 9R doesn't exist on table, insert new records for each
        */

select *
from fc
where fund_code in ('2N', '9R')
go


select *
from fc
where fund_code in ('7L', '9S')
go

fund_code	fc_service_designator_code	fund_code_description	fund_code_start_date		fund_code_stop_date	budget_cat		optar_ty
7L	N	Marine reserves?                                            	Oct  1 2003 12:00AM	Sep 30 2019 12:00AM	Non-Chargeable		S&E            
7L	R	Material Used on Aircraft Maintenance                       	Oct  1 1998 12:00AM	Sep 30 2019 12:00AM	AOM			AOM            
7L	V	[Conversion] Material Used on Aircraft Maintenance          	Sep 30 2019 12:00AM				AOM			AOM            
9S	N	NSA AVDLR 7R COGS                                           	Oct  1 2005 12:00AM	Sep 30 2019 12:00AM	Non-Chargeable		S&E            
9S	R	NSA AVDLR 7R COG                                            	Oct  1 1998 12:00AM	Sep 30 2019 12:00AM	AOM			AOM            
9S	V	[Conversion] NSA AVDLR 7R COG                               	Sep 30 2019 12:00AM				AOM			AOM 


fund_code	fc_service_designator_code	fund_code_description	fund_code_start_date	fund_code_stop_date		budget_cat	optar_ty
2N	N	AOM Maintenance FRS                                         	Aug 21 2019 12:00AM	Aug 21 2019 12:00AM	FLTOPS		FLTOPS         
2N	R	AOM Maintenance FRS                                         	Oct  1 2000 12:00AM	Sep 30 2019 12:00AM	FLTOPS		FLTOPS         
2N	V	AOM Maintenance FRS                                         	Aug 21 2019 12:00AM	Aug 21 2019 12:00AM	FLTOPS		FLTOPS         
9R	N	AOM Maintenance FRS                                         	Aug 21 2019 12:00AM	Aug 21 2019 12:00AM	FLTOPS		FLTOPS         
9R	R	AOM Maintenance FRS                                         	Oct  1 2000 12:00AM	Sep 30 2019 12:00AM	FLTOPS		FLTOPS         
9R	V	AOM Maintenance FRS                                         	Aug 21 2019 12:00AM	Aug 21 2019 12:00AM	FLTOPS		FLTOPS                                      

/****************/
/*   STEP 2A    */
/****************/

	/* Update for each fc_service_designator_code combination */ 

-- update fc set
optar_ty = "FLTOPS",
budget_cat = "FLTOPS",
fund_code_description = "AOM Maintenance FRS"    
where fund_code like '9R'
and fc_service_designator_code like 'N'
go     



/****************/
/*   STEP 2B    */
/****************/

	/* Ensure to insert any missing records for fc and fc_service_designator_code combination */

insert into fc
(fund_code, fc_service_designator_code, fund_code_description, fund_code_start_date, fund_code_stop_date, budget_cat, optar_ty)
values
( "2N",	"V", "AOM Maintenance FRS", "Oct  1 2000 12:00AM", "Sep 30 2019 12:00AM", "FLTOPS", "FLTOPS") 
go


/****************/
/*   STEP 3     */
/****************/

	/* - Identify whether or not 2N and 9R are loaded to the fc_appn table for the correct appn_fiscal_year
	   - Update existing fc 2N and 9R data to match 7L and 9S data respectively
	   - If 2N or 9R doesn't exist on table, insert new records for each
           - Ensure there is a record for each applicable fc_service_designator_code ("R", "V", "N")+
	   - Ensure appn_ind is set to "7"
        */


select * from fc_appn
where fund_code in ('2N', '9R')
and appn_fiscal_year >= '01/01/2019'
order by appn_fiscal_year, fund_code asc
go


fc_service_designator_code	appn_ind	appn_fiscal_year	fund_code
R				7		Jan  1 2017 12:00AM	2N
R				7		Jan  1 2017 12:00AM	9R
R				7		Jan  1 2018 12:00AM	2N
R				7		Jan  1 2018 12:00AM	9R
R				7		Jan  1 2019 12:00AM	2N
R				7		Jan  1 2019 12:00AM	9R



-- update fc_appn set
appn_ind = "7"
where fund_code like '9R'
and fc_service_designator_code like 'R'
go


-- insert into fc_appn
(fc_service_designator_code, appn_ind, appn_fiscal_year, fund_code)
values 
("V", "7", "Jan  1 2019 12:00AM", "2N")
go



/****************/
/*   STEP 4     */
/****************/


	/* - Verify that the appropriation records are loaded for each fc_service_designator_code
             ("N", "R", "V") with appn_ind of "7" and the correct appn_fiscal_year
        */

select * from appn
where appn_ind like '7'
and appn_fiscal_year >= '01/01/2019'
go


fc_service_designator_code	appn_ind	appn_fiscal_year	appropriation_department	fiscal_year_limit	appropriation_symbol	appropriation_subhead	authzn_acctg_actvy	operating_budget_number_bcn	operating_budget_suffix
N	7	Jan  1 2019 12:00AM	17	9	1804	70AE	N60957	57025	
R	7	Jan  1 2019 12:00AM	17	9	1804	70AE	060957	57025	M
V	7	Jan  1 2019 12:00AM	17	9	1804	60AA	060951	00060	Y





/****************/
/*   STEP 5     */
/****************/


/*** GO TO APPLICATION SITE > VALIDATION TABLES > COG 
   UPDATE FLTOPS TO 2N OR 9R FOR RESPECTIVE COG
   FINANCIAL AUDIT PASSWD REQUIRED TO UPDATE TABLE ***/



select cognizance_symbol, cog_desc,  fc_fltops, fc_aom
from cog 
where  fc_aom in ('7L', '9S')
order by fc_aom
go


cognizance_symbol	cog_desc							fc_fltops		fc_aom
1R			NAVICP-P Aviation Photographic & Meterological Material     	7F			7L
3B			Navy Owned Stock of Field Level Repairables DLA BSM Matl    	7F			7L
9B			Navy Owned Stock of DLA BSM material                        	7F			7L
7R			NAVICP-P Depot Level Repairable Aviation Material           	#			9S



/****************/
/*   STEP 6     */
/****************/


	/* - In p2db (NALCOMIS), identify all the distinct rsup_div_cd for the org_cd
	     being updated and the IMA org_cd
	   - Identify the document series for the OMA training squadrons 
	   - The workcenters for the IMA org will need to be updated in RSupply also to allow 
	     for bit piece parts ordered against Training Squadron org to be processed through RSupply
           - In RSupply go to Site > Activity Controls > Activity Organization Info 
		- Select Deptartment "7" and click the Divisions tab.
		- Set the "FC Rstrn" to "X" for all Division codes from the below SQL. 
        */

       
select distinct rsup_div_cd, org_cd
from df15_suadps_logon
where org_cd in ('GR1', 'GK0', 'GKP')
order by rsup_div_cd asc
go


rsup_div_cd	org_cd
20		GR1
26		GR1
2B		GK0
3E		GR1
3V		GR1
46		GR1
4L		GR1
5B		GR1
6J		GR1
6S		GR1
7A		GR1
7P		GR1
90		GKP
90		GR1
AA		GR1
D0		GR1
DP		GR1
PQ		GR1
PT		GR1
T4		GR1


/****************/
/*   STEP 7     */
/****************/


	/* - In p2db (NALCOMIS), identify all current outstanding requisitions which have
	     not interfaced to RSupply.
        */



/****************/
/*   STEP 7A    */
/****************/


	/* - Identify distinct lsc's for training squadron requisitions
           - Filter to leave only outstanding lsc's remaining (i.e remove RCANC, CANCL)
        */

select distinct lsc
from dr09_requisition
where org_cd in ('GKB', 'GK0', 'GKP')

OFFTR
REFER
EXREP
INPRO
OSSUF
ISSIP
NIS

/****************/
/*   STEP 7B    */
/****************/

	/* - Use lsc's from above to complete criteria below
	   - Update fund code for those documents
	   - Update once for 9S to 9R and then for 7L to 2N
        */



select fund_cd, cog, ddsn, proj_cd, org_cd, tec, lsc, lsc_dttm, ord_dttm
from dr09_requisition
where org_cd in ('GKB', 'GK0', 'GKP')
and cog like '7R'
and lsc in ('REFER', 'ISSIP', 'EXREP', 'OFFTR', 'OFVAL', 'OFFMP', 'OFFAR', 'NIS', 'NC', 'INPRO', 'OSSUF' )
go


-- update dr09_requisition set
fund_cd = "9R"
where org_cd in ('GKB', 'GK0', 'GKP')
and cog like '7R'
and lsc in ('REFER', 'ISSIP', 'EXREP', 'OFFTR', 'OFVAL', 'OFFMP', 'OFFAR', 'NIS', 'NC', 'INPRO', 'OSSUF' )
go


/****************/
/*   STEP 7C    */
/****************/

	/* - Identify distinct cogs for 7L requisitions
	   - Update fund code for those documents to 2N
        */

select distinct "'" + cog + "'," 
from dr09_requisition
where org_cd in ('GKB', 'GK0', 'GKP')
and lsc in ('REFER', 'ISSIP', 'EXREP', 'OFFTR', 'OFVAL', 'OFFMP', 'OFFAR', 'NIS', 'NC', 'INPRO', 'OSSUF' )
and fund_cd in ('7L')
go

'3B',
'9B',
'1R',
'99',
'9Q',
'9H',
'9P',

	/* - Use results from above query to complete below
             cog criteria.
        */

select fund_cd, cog, ddsn, proj_cd, org_cd, tec, lsc, lsc_dttm, ord_dttm
from dr09_requisition
where org_cd in ('GKB', 'GK0', 'GKP')
and cog in ('3B', '9B', '1R', '99', '9Q', '9H', '9P')
and lsc in ('REFER', 'ISSIP', 'EXREP', 'OFFTR', 'OFVAL', 'OFFMP', 'OFFAR', 'NIS', 'NC', 'INPRO', 'OSSUF' )
go



-- update dr09_requisition set
fund_cd = "2N"
where org_cd in ('GKB', 'GK0', 'GKP')
and cog in ('3B', '9B', '1R', '99', '9Q', '9H', '9P')
and lsc in ('REFER', 'ISSIP', 'EXREP', 'OFFTR', 'OFVAL', 'OFFMP', 'OFFAR', 'NIS', 'NC', 'INPRO', 'OSSUF' )
go


/****************/
/*   STEP 7D    */
/****************/

	/* - Verify fund codes on oustanding documents
           - Only fund codes 2N, 9R, Y6 should remain
        */


select fund_cd, cog, ddsn, proj_cd, org_cd, tec, lsc, lsc_dttm, ord_dttm
from dr09_requisition
where org_cd in ('GKB', 'GK0', 'GKP')
and lsc in ('REFER', 'ISSIP', 'EXREP', 'OFFTR', 'OFVAL', 'OFFMP', 'OFFAR', 'NIS', 'NC', 'INPRO' )
order by fund_cd desc 
go


select distinct fund_cd
from dr09_requisition
where org_cd in ('GKB', 'GK0', 'GKP')
and lsc in ('REFER', 'ISSIP', 'EXREP', 'OFFTR', 'OFVAL', 'OFFMP', 'OFFAR', 'NIS', 'NC', 'INPRO' )
order by fund_cd desc 
go




 
 