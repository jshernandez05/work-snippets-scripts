SFOEDL DATA CAN BE LOCATED ON 3 TABLES
smarts_data
smarts_chlng
financial_adjustment



/**********************************************/
/* SCAN TABLES TO IDENTIFY WHERE THE DATA     */
/* RESIDES FOR THE REQUISITION		      */
/**********************************************/

select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) ddsn, *
	from smarts_data
	where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) in 
			('9120L309', '9022G657', '9080FA00', '91776L07')
go



select (right(convert(varchar,datepart(yy,doc_dt)*1000+datepart(dy,doc_dt)),4)+ dsn) ddsn,
	(right(convert(varchar,datepart(yy,rqn_dt)*1000+datepart(dy,rqn_dt)),4)+ rqn_dsn) rqn_ddsn,
	sts_cd, cmpltn_dt, *
	from smarts_chlng
	where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) in 
			('9120L309', '9022G657', '9080FA00', '91776L07')
go


select (right(convert(varchar,datepart(yy,doc_dt)*1000+datepart(dy,doc_dt)),4)+ dsn) ddsn, *
	from financial_adjustment
	where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) in 
			('9120L309', '9022G657', '9080FA00', '91776L07')
go


/**********************************************/
/* DATA ONLY LOCATED ON financial_adjustment  */
/*                                            */
/* Run Query to isolate individual requisition*/
/**********************************************/

select (right(convert(varchar,datepart(yy,doc_dt)*1000+datepart(dy,doc_dt)),4)+ dsn) ddsn, *
	from financial_adjustment
	where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '91776L07'
go


/**********************************************/
/* Triggers need to be dropped because TL     */
/* was already posted        	              */
/**********************************************/

alter table financial_adjustment disable trigger


/**********************************************/
/* Update required fields                     */
/**********************************************/

update financial_adjustment set
	adjmt_mo_yr = "Sep 1 2019 12:00AM",
	sfoedl_dt = "Sep 1 2019 12:00AM"
	where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '91776L07'
go

/**********************************************/
/* Validate the changes                       */
/**********************************************/

select (right(convert(varchar,datepart(yy,doc_dt)*1000+datepart(dy,doc_dt)),4)+ dsn) ddsn, *
	from financial_adjustment
	where (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) like '91776L07'
go

/**********************************************/
/* !!!! Ensure you re-enable the triggers !!!!*/
/* !!!! upon completion                   !!!!*/
/**********************************************/

alter table financial_adjustment enable trigger





