declare @id varchar(11)
select @id = '115122772'

select	'insert into du10_person_task'
		+ ' (ssn, tsk_id, per_tsk_on_off_fg) '
		+ 'values'
		+ ' ("' + ssn + '", ' + '"' + rtrim(tsk_id) + '", ' + '"' + per_tsk_on_off_fg + '") go'
from	du10_person_task
where	ssn like @id
go 


------------------------
declare @id char(9)
select @id = ssn from du05_personnel where login_id like 'hernanjs'
select @id from du05_personnel where login_id like 'hernanjs'

select	'insert into du10_person_task'
		+ ' (ssn, tsk_id, per_tsk_on_off_fg) '
		+ 'values'
		+ ' ("' + ssn + '", ' + '"' + rtrim(tsk_id) + '", ' + '"' + per_tsk_on_off_fg + '") go'
from	du10_person_task
where	ssn = @id 
go