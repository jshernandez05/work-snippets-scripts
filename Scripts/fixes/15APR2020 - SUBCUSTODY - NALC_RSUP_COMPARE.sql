/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* Step 1:  Identify NALC Suspense, SubCustody, and T&C/TD/WR DDSNs*/
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

select niin, org_cd, cur_ti_ddsn, bal_cd, itm_qty, itm_dttm 
from ds03_item
where bal_cd in ('SB', 'SP')
or (substring(cur_ti_ddsn,5,1) not like '%[A-Z]%'
and substring(cur_ti_ddsn,6,1) not like '%[A-Z]%'
and (convert(int,substring(cur_ti_ddsn,5,4)) >= 1700 and convert(int,substring(cur_ti_ddsn,5,4)) <= 1999)
and bal_cd like 'DF'
and cur_mgmt_cd like 'SO')
order by bal_cd, cur_ti_ddsn
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* Step 1A:  Isolate NALC Suspense and SubCustody DDSNs            */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

select "'" + cur_ti_ddsn + "', "
from ds03_item
where bal_cd in ('SB', 'SP')
or (substring(cur_ti_ddsn,5,1) not like '%[A-Z]%'
and substring(cur_ti_ddsn,6,1) not like '%[A-Z]%'
and (convert(int,substring(cur_ti_ddsn,5,4)) >= 1700 and convert(int,substring(cur_ti_ddsn,5,4)) <= 1999)
and bal_cd like 'DF'
and cur_mgmt_cd like 'SO')
order by bal_cd, cur_ti_ddsn
go


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* Step 2:  Run Comaparison of DDSNs from Step 1A in RSUP          */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

-- Replace the values in the in statement with values from Step 1A
-- Match means DDSN is in NALC Suspense, SubCustody, 
-- or inducted as T&C/TD/WR and in RSUP sub_custody

select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) ddsn, sub_custody_quantity, trans_dt,
	case when ((right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) in 
					(   
						'00101703', 
						'00121700', 
						'00501705', 
						'00581706', 
						'00721706', 
						'00721708', 
						'00721709', 
						'00831701', 
						'00831704', 
						'00831705', 
						'00831711', 
						'00851713', 
						'00851718', 
						'00851720', 
						'00851721', 
						'00851722', 
						'00931706', 
						'01001711', 
						'01021701', 
						'01041700', 
						'01041701', 
						'01041704', 
						'01041705', 
						'01041706', 
						'01041707', 
						'91501701', 
						'93041706', 
						'93171701', 
						'93181700', 
						'93371719', 
						'93391708', 
						'93561700', 
						'00791701', 
						'00791702', 
						'00791703', 
						'00791704', 
						'00791705', 
						'00791706', 
						'00791707', 
						'00791708', 
						'00791709', 
						'00791710', 
						'00791711', 
						'00791712', 
						'00791714', 
						'00791715', 
						'00791716', 
						'00791717', 
						'00791718', 
						'00791719', 
						'00791720', 
						'00791722', 
						'00791724', 
						'00791725', 
						'00791726', 
						'00791727', 
						'00791728', 
						'00791729', 
						'00791730', 
						'00791731', 
						'00791732', 
						'00791733', 
						'00791735', 
						'00791737', 
						'00791738', 
						'00791740', 
						'00791741', 
						'00791742', 
						'00791743', 
						'00921713', 
						'00971710', 
						'00971711', 
						'00971713', 
						'00971714', 
						'00991700', 
						'01021708', 
						'01021709', 
						'01021710', 
						'00101715', 
						'0021GD15', 
						'0049G060', 
						'0051G098', 
						'00521707', 
						'00521708', 
						'00521710', 
						'00521711', 
						'00521712', 
						'00521713', 
						'00521714', 
						'00521715', 
						'00521716', 
						'00521717', 
						'00521718', 
						'00551705', 
						'00575K00', 
						'00621703', 
						'00621704', 
						'0064GT08', 
						'0065G088', 
						'00731703', 
						'00761707', 
						'00853483', 
						'00941713', 
						'01041708'
					))
				then'MATCH' else 'NO MATCH' end 'NALC to RSUP'
from sub_custody
order by (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn)

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* Step 3:  Identify DDSNs in RSUP sub_custody                     */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

select (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) ddsn, sub_custody_quantity, trans_dt,
from sub_custody
order by (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn)

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* Step 3A:  Isolate RSUP sub_custody DDSNs                         */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

select "'" + (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn) + "'," ddsn
from sub_custody
order by (right(convert(varchar,datepart(yy, doc_dt)*1000+datepart(dy,doc_dt )),4)+ dsn)


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* Step 4:  Run Comaparison of DDSNs from Step 3A in RSUP          */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

-- Replace the values in the in statement with values from Step 3A
-- Match means DDSN is in RSUP sub_custody and in 
-- NALC Suspense, SubCustody, or inducted as T&C/TD/WR

select niin, org_cd, cur_ti_ddsn, bal_cd, cur_mgmt_cd, itm_qty, itm_dttm,
	 case when(cur_ti_ddsn in 
				 (
					'00101703',
					'00101715',
					'00121700',
					'00501705',
					'00521707',
					'00521708',
					'00521710',
					'00521711',
					'00521712',
					'00521713',
					'00521714',
					'00521715',
					'00521716',
					'00521717',
					'00521718',
					'00521719',
					'00551705',
					'00581706',
					'00621703',
					'00621704',
					'00721706',
					'00721708',
					'00721709',
					'00731703',
					'00751709',
					'00751710',
					'00761707',
					'00791701',
					'00791702',
					'00791703',
					'00791704',
					'00791705',
					'00791706',
					'00791707',
					'00791708',
					'00791709',
					'00791710',
					'00791711',
					'00791712',
					'00791714',
					'00791715',
					'00791716',
					'00791717',
					'00791718',
					'00791719',
					'00791720',
					'00791722',
					'00791724',
					'00791725',
					'00791726',
					'00791727',
					'00791728',
					'00791729',
					'00791730',
					'00791731',
					'00791732',
					'00791733',
					'00791735',
					'00791737',
					'00791738',
					'00791739',
					'00791740',
					'00791741',
					'00791742',
					'00791743',
					'00831701',
					'00831704',
					'00831705',
					'00831711',
					'00851713',
					'00851718',
					'00851720',
					'00851721',
					'00851722',
					'00921713',
					'00931706',
					'00941700',
					'00941713',
					'00971710',
					'00971711',
					'00971713',
					'00971714',
					'00991700',
					'01001711',
					'01021701',
					'01021708',
					'01021709',
					'01021710',
					'01041700',
					'01041701',
					'01041704',
					'01041705',
					'01041706',
					'01041707',
					'01041708',
					'91501701',
					'93041706',
					'93171701',
					'93181700',
					'93371719',
					'93391708'
				))
			then 'MATCH' else 'NO MATCH' end 'RSUP to NALC'
from ds03_item
where bal_cd in ('SB', 'SP')
or (substring(cur_ti_ddsn,5,1) not like '%[A-Z]%'
and substring(cur_ti_ddsn,6,1) not like '%[A-Z]%'
and (convert(int,substring(cur_ti_ddsn,5,4)) >= 1700 and convert(int,substring(cur_ti_ddsn,5,4)) <= 1999)
and bal_cd like 'DF'
and cur_mgmt_cd like 'SO')
order by bal_cd, cur_ti_ddsn
go


