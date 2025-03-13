echo -en "DELETE FROM dr01_acthistory
WHERE ddsn in (SELECT ddsn FROM dr09_requisition 
				WHERE ord_dttm < dateadd(mm, -36, getdate())
					AND lsc not in (
									'EXREP',
									'INPRO',
									'ISSIP',
									'OFFMP',
									'OFFTR',
									'OSSUF',
									'PHKIT',
									'RCANC',
									'REFER',
									'ROBN',
									'ROBS'
									)
				)
\nGO" > $purge_sql

echo -en "DELETE FROM dr02_action
WHERE ddsn in (SELECT ddsn FROM dr09_requisition 
				WHERE ord_dttm < dateadd(mm, -36, getdate())
					AND lsc not in (
									'EXREP',
									'INPRO',
									'ISSIP',
									'OFFMP',
									'OFFTR',
									'OSSUF',
									'PHKIT',
									'RCANC',
									'REFER',
									'ROBN',
									'ROBS'
									)
				)
\nGO" > $purge_sql

echo -en "DELETE FROM dr04_contract
WHERE ddsn in (SELECT ddsn FROM dr09_requisition 
				WHERE ord_dttm < dateadd(mm, -36, getdate())
					AND lsc not in (
									'EXREP',
									'INPRO',
									'ISSIP',
									'OFFMP',
									'OFFTR',
									'OSSUF',
									'PHKIT',
									'RCANC',
									'REFER',
									'ROBN',
									'ROBS'
									)
				)
\nGO" > $purge_sql


echo -en "DELETE FROM dr05_external
WHERE ddsn in (SELECT ddsn FROM dr09_requisition 
				WHERE ord_dttm < dateadd(mm, -36, getdate())
					AND lsc not in (
									'EXREP',
									'INPRO',
									'ISSIP',
									'OFFMP',
									'OFFTR',
									'OSSUF',
									'PHKIT',
									'RCANC',
									'REFER',
									'ROBN',
									'ROBS'
									)
				)
\nGO" > $purge_sql

echo -en "DELETE FROM dr07_lschistory
WHERE ddsn in (SELECT ddsn FROM dr09_requisition 
				WHERE ord_dttm < dateadd(mm, -36, getdate())
					AND lsc not in (
									'EXREP',
									'INPRO',
									'ISSIP',
									'OFFMP',
									'OFFTR',
									'OSSUF',
									'PHKIT',
									'RCANC',
									'REFER',
									'ROBN',
									'ROBS'
									)
				)
\nGO" > $purge_sql


echo -en "DELETE FROM dr10_stathistory
WHERE ddsn in (SELECT ddsn FROM dr09_requisition 
				WHERE ord_dttm < dateadd(mm, -36, getdate())
					AND lsc not in (
									'EXREP',
									'INPRO',
									'ISSIP',
									'OFFMP',
									'OFFTR',
									'OSSUF',
									'PHKIT',
									'RCANC',
									'REFER',
									'ROBN',
									'ROBS'
									)
				)
\nGO" > $purge_sql

echo -en "DELETE FROM dr09_requisition 
WHERE ord_dttm < dateadd(mm, -36, getdate())
AND lsc not in (
'EXREP',
'INPRO',
'ISSIP',
'OFFMP',
'OFFTR',
'OSSUF',
'PHKIT',
'RCANC',
'REFER',
'ROBN',
'ROBS'
)\nGO" > $purge_sql

echo -en "DELETE FROM dr11_acthist_hist
WHERE ddsn in (SELECT ddsn FROM dr14_rqn_hist 
WHERE ord_dttm < dateadd(mm, -36, getdate())
AND lsc not in (
'EXREP',
'INPRO',
'ISSIP',
'OFFMP',
'OFFTR',
'OSSUF',
'PHKIT',
'RCANC',
'REFER',
'ROBN',
'ROBS'
)
)\nGO" > $purge_sql

echo -en "DELETE FROM dr12_action_hist
WHERE ddsn in (SELECT ddsn FROM dr14_rqn_hist 
WHERE ord_dttm < dateadd(mm, -36, getdate())
AND lsc not in (
'EXREP',
'INPRO',
'ISSIP',
'OFFMP',
'OFFTR',
'OSSUF',
'PHKIT',
'RCANC',
'REFER',
'ROBN',
'ROBS'
)
)\nGO" > $purge_sql

echo -en "DELETE FROM dr13_lschist_hist
WHERE ddsn in (SELECT ddsn FROM dr14_rqn_hist 
WHERE ord_dttm < dateadd(mm, -36, getdate())
AND lsc not in (
'EXREP',
'INPRO',
'ISSIP',
'OFFMP',
'OFFTR',
'OSSUF',
'PHKIT',
'RCANC',
'REFER',
'ROBN',
'ROBS'
)
)\nGO" > $purge_sql

echo -en "DELETE FROM dr15_stshist_hist
WHERE ddsn (SELECT ddsn FROM dr14_rqn_hist 
WHERE ord_dttm < dateadd(mm, -36, getdate())
AND lsc not in (
'EXREP',
'INPRO',
'ISSIP',
'OFFMP',
'OFFTR',
'OSSUF',
'PHKIT',
'RCANC',
'REFER',
'ROBN',
'ROBS'
)
)\nGO" > $purge_sql

echo -en "DELETE FROM dr14_rqn_hist 
WHERE ord_dttm < dateadd(mm, -36, getdate())
AND lsc not in (
'EXREP',
'INPRO',
'ISSIP',
'OFFMP',
'OFFTR',
'OSSUF',
'PHKIT',
'RCANC',
'REFER',
'ROBN',
'ROBS'
)\nGO" > $purge_sql





"echo -en "DELETE FROM dr04_contract WHERE ddsn in (SELECT ddsn FROM dr09_requisition WHERE ord_dttm < dateadd(mm, -36, getdate())
AND lsc not in ('EXREP', 'INPRO', 'ISSIP', 'OFFMP', 'OFFTR', 'OSSUF', 'PHKIT', 'RCANC', 'REFER', 'ROBN', 'ROBS'))\n\nGO" > $purge_sql" > $purge_sql


