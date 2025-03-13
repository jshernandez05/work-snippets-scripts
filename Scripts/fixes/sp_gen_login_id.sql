use sybsystemprocs
go
if exists(select 1
		from sysobjects
		where id=object_id('dbo.sp_gen_login_id')
		and type='P')
	drop procedure dbo.sp_gen_login_id
go

/* Sccsid = "%Z% generic/sproc/src/%M% %I% %G%" */
/*	4.8	1.1	06/14/90	sproc/src/gen_login_id */

/*
** The suid generation logic should match the suid generation logic used by
** the "create login" command. This is because rep agent uses the 
** "create login" command to create a login on a replicated master. The suids
** generated should be consistent.
** Modify the suid generation logic in "create login" whenever the suid
** logic in this procedure is changed.
*/
create procedure sp_gen_login_id
@loginame varchar(30),			/* login name of the new user */
@insertsuid int output			/* suid corresponding to
					** insert slot in Syslogins
					*/
as

declare @msg varchar(250),
	@suid   int,                    /* temp variable */
	@retstat  int

/* suid 2 is reserved for 'probe' */
if (@loginame = "probe")
	select @insertsuid = @@probesuid
else
begin

	/* Generate an appropriate suid */
	select @suid = max(suid)
		from master.dbo.syslogins(index syslogins) where suid > @@probesuid

	if @suid is NULL
	begin
		select @insertsuid = @@probesuid + 1
	end
	else if @suid != @@maxsuid
		select @insertsuid = @suid + 1

	else
	begin
		select @suid = min(suid)
			from master.dbo.syslogins(index syslogins) where suid < -2

		if @suid is NULL
		begin
			select @insertsuid = -3
		end
		else if @suid != @@minsuid
			select @insertsuid = @suid - 1

		/* check for holes if we already used up all suids */
		else
		begin
			/* Start looking for holes between @@minsuid and
 			** @@maxsuid. */
                        select @insertsuid = @@minsuid
                        while exists (select * from master.dbo.syslogins
							(index syslogins)
                                        where suid = @insertsuid)
                        begin
                                select @insertsuid = @insertsuid + 1

                                if (@insertsuid = @@invalidsuid)
                                begin
                                        /*
                                        ** Uids -2, -1, 0 and 2 are all invalid
                                        */
                                        select @insertsuid = @insertsuid + 5
                                end

                                if @insertsuid = @@maxsuid
                                begin
                                        /*
                                        ** 17266, "All logins have been
                                        ** assigned. No more logins can be
                                        ** added at this time."
                                        */
                                        raiserror 17266
                                        return (1)
                                end
                        end
	
		end
	end
end

return (0)

go
grant execute on dbo.sp_gen_login_id to public /*dbo*/
go
