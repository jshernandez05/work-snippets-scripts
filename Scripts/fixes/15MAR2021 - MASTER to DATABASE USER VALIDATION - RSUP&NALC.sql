--Can be used to validate user logins after restoring master or LDAP

/* RSUPMAST - User logon clean-up/check */

--Users in master syslogins not in supply database supply_users--
select 	dbname, name, "" as logon, fullname
from   	master.dbo.syslogins
where 	name not in (select logon from supply_user)
	and name not in ('sa', 'probe', 'sybbtusr', 'ssabtusr', 'jboss')

union

--Users in supply supply_user not in master sys_logins--
select "supply", "", logon, fname +  " " + mname + " " + lname
from 	supply_user
where	logon not in (select name from master.dbo.syslogins)

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* NALC- User login_id clean-up/check */

--Users in master syslogins not in p2db database du05_personnel--
select 	dbname, name, "" as login_id, fullname
from   	master.dbo.syslogins
where 	name not in (select login_id from du05_personnel)
	and name not in ('sa', 'probe', 'sybbtusr', 'ssabtusr', 'jboss')

union

--Users in p2db du05_personnel not in master sys_logins--
select "p2db", "", login_id, init +  " " + last_nm
from 	du05_personnel
where	login_id not in (select name from master.dbo.syslogins)
