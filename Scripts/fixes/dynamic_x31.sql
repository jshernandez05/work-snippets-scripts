declare @niin			char(9),
		@Rddsn			char(8),
		@jcn_org		char(3),
		@jcn_dt			char(3),
		@jcn_ser		char(3),
		@jcn_suf		char(2),
		@dsn			char(3),
		@orig_doc_dt 	datetime,
		@orig_dsn		char(4),
		@orig_ddsn 		char(8),
		@datestamp		char(15),
		@ui				char(2),
		@qty			char(5),
		@svc			char(1),
		@uic			char(5),
		@dmd			char(1),
		@fc				char(2),
		@cog			char(2),
		@proj			char(3),
		@iss			char(2),
		@adv			char(2),
		@tec			char(4),
		@wuc			char(7),
		@cage			char(5),
		@maint_org		char(3),
		@sqdn_org		char(3),
		@rsup_log		char(2),
		@fnsn			char(15),
		@loc			char(6),
		@dept_cd		char(1),
		@div			char(2),
		@sup_id			char(2),
		@cmp_dt			char(5),
		@sqdn_uic		char(5)

------------{ Update variable values in this section as necessary }-----------------------------
select	@niin 		= '012238123',
		@Rddsn		= '1256GY01',
		@jcn_org 	= 'GZ4',
		@jcn_dt		= '256',
		@jcn_ser	= '884',
		@jcn_suf	= '  ',
		@dsn		= '%01',
		@dmd		= 'R',
		@dept_cd	= '7'

------------------------------------------------------------------
select @maint_org = aimd_org_code
from variable_parameters
-------------------------------------------------------------------
select
		@orig_doc_dt = mt.mr_document_date,
		@orig_dsn	= mt.mr_document_nr_serial,
		@orig_ddsn	= (right(convert(varchar,datepart(yy, mt.mr_document_date)*1000+datepart(dy,mt.mr_document_date)),4)+ mt.mr_document_nr_serial),
		@datestamp	= convert(char(4), datepart(yy, getdate())) + right('000' + rtrim(convert(char(3), datepart(dy, getdate()))), 3)
					+ right('00' + rtrim(convert(char(2), datepart(hh, getdate()))), 2) + right('00' + rtrim(convert(char(2),datepart(mm, getdate()))), 2)
					+ right('00' + rtrim(convert(char(2), datepart(ss, getdate()))), 2) + left(convert(char(3),datepart(ms, getdate())),2),
		@ui			= ml.unit_of_issue,
		@qty 		= RIGHT('0000000000' + RTRIM(convert(char, ml.quantity_requested)), 5),
		@svc 		= mt.fc_service_designator_code,
		@uic 		= mt.mr_organization_code,
		@fc	 		= mt.fund_code_original,
		@cog		= ml.cognizance_symbol,
		@proj		= mt.project_code,
		@iss		= rtrim(mt.issue_priority_designatr),
		@adv		= ltrim(mt.advice_code),
		@rsup_log	= left(mt.mr_document_nr_serial, 2),
		@sup_id		= left(mt.mr_document_nr_serial, 2)
from material_request_tbl mt
	join	material_request_line ml on (ml.mr_document_date = mt.mr_document_date
										 and ml.mr_document_nr_serial = mt.mr_document_nr_serial
										)
where (right(convert(varchar,datepart(yy, mt.mr_document_date)*1000+datepart(dy,mt.mr_document_date)),4)+ mt.mr_document_nr_serial)
  in	(select (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy, mr_document_date)),4)+ mr_document_nr_serial)
		from aviation_maintenance
		where niin like @niin
			AND jcn_org_code LIKE @jcn_org
			AND jcn_date LIKE @jcn_dt
			AND jcn_serial_nbr_aviation LIKE @jcn_ser
			AND (mr_document_nr_serial NOT LIKE 'R%'
			AND mr_document_nr_serial LIKE @dsn)
		)
----------------
------------------------------------------------------------
select	@tec = supply_tec,
		@wuc = rtrim(work_unit_code),
		@cage = ltrim(cage),
		@sqdn_org = jcn_org_code

from aviation_maintenance
where (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy, mr_document_date)),4)+ mr_document_nr_serial)
like @orig_ddsn

------------------------------------------------------------
select  @fnsn = i.fed_sup_classification + i.niin + i.spcl_matl_idfcn_code,
		@loc  = il.location_number
from item i
	join item_loc il on il.niin = i.niin
where i.niin like @niin
-------------------------------------------------------------
select @div = organization_code
	from serial
	where left(begin_nbr,2) like @rsup_log
--------------------------------------------------------------
select @cmp_dt = (right(convert(varchar,datepart(yy, data.trans_dt)*1000+datepart(dy, data.trans_dt)),5))
from tl_matl_trlr trlr
     left join tl_matl_data data on (data.niin = trlr.niin)
     right join tl_trans_code code on (code.trans_cd = data.trans_cd)
where data.niin like @niin
and data.trans_cd in ('SB')
and substring(trans_data, 17, 8) like @Rddsn
--------------------------------------------------------------
select @sqdn_uic = organization_code
	from air_squadron
	where squadron_org_code like @jcn_org
---------------------------------------------------------------
select "insert into di03_outgoing_intfc"
+ char(13) + char(10) + "(doc_id, key_1, key_3, data_1, data_3, xfr_fg, xmit_ind, match_del_fg,"
+ char(13) + char(10) + " rpt_fg, rqst_dttm, intfc_cd, rpt_r60450_ind,"
+ char(13) + char(10) + " rpt_r60550_ind, key_6, key_7)"
+ char(13) + char(10) + "values"
+ char(13) + char(10) + "("
+ char(13) + char(10) + "'X31',"
+ char(13) + char(10) + "'" + @Rddsn + "',"
+ char(13) + char(10) + "'N',"
+ char(13) + char(10) + "'"  + @datestamp + "X31" + "   " + "1" + @fnsn + @ui + @qty + @svc + @uic + @Rddsn + @dmd + "Y      "
	+ @fc + " " + @cog + @proj + @iss + "   " + @adv + "              000000000N                " + @loc
	+ "         Y" + @cmp_dt + @qty + "                  " + @dept_cd + @div + "',"
+ char(13) + char(10) + "'" + @sup_id + " N10000000000" + @tec + "000000000" + @sqdn_uic
	+ "    0000Y               001                                                      0"
	+ @jcn_org+@jcn_dt+@jcn_ser+@jcn_suf + @tec + @wuc + @cage + @maint_org
	+ "           " + @sqdn_org + @rsup_log + "',"
+ char(13) + char(10) + "'Y',"
+ char(13) + char(10) + "'Y',"
+ char(13) + char(10) + "'N',"
+ char(13) + char(10) + "'N',"
+ char(13) + char(10) + "getdate(),"
+ char(13) + char(10) + "'I',"
+ char(13) + char(10) + "'N',"
+ char(13) + char(10) + "'Y',"
+ char(13) + char(10) + "'" + @loc + "',"
+ char(13) + char(10) + "'001'"
+ char(13) + char(10) + ")"
from material_request_tbl
where (right(convert(varchar,datepart(yy, mr_document_date)*1000+datepart(dy,mr_document_date )),4)+ mr_document_nr_serial) like @orig_ddsn
go
