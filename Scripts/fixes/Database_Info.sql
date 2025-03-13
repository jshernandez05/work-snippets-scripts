

/*In order to get a list of all tables in the current database, you can filter the sysobjects table by
type = ‘U’ 
e.g.:
*/
select convert(varchar(30),o.name) AS table_name
from sysobjects o
where type = 'U'
order by table_name


/*In order to get the number of rows of each table, you can use the row_count function. It takes
two arguments:
 the database ID – you can get the ID of the current database using the db_id function
 the object ID – it’s the id column in sysobjects
e.g.:
*/

select convert(varchar(30),o.name) AS table_name,
row_count(db_id(), o.id) AS row_count
from sysobjects o
where type = 'U'
order by table_name




/*And in order to get some size information you can use the data_pages function. It will return the
number of pages and you can then multiply it by the number of kilobyte per page 
e.g.:
*/
select convert(varchar(30),o.name) AS table_name,
row_count(db_id(), o.id) AS row_count,
data_pages(db_id(), o.id, 0) AS pages,
data_pages(db_id(), o.id, 0) * (@@maxpagesize/1024) AS kbs
from sysobjects o
where type = 'U'
order by table_name

/*
The first column returned by this statement contains the table name (if you have names longer
than 30 characters, you should replace 30 by something higher), the number of rows, the number
of data pages, the size in kilobytes.
*/






/*
Use the following SQL statement in order to get information about the size and usage of the data
and log segments in all databases:
*/
SELECT 
	DB_NAME(d.dbid) AS DB_NAME,
	CEILING(SUM(CASE WHEN u.segmap != 4 THEN u.size/1048576.*@@maxpagesize END )) AS data_size_MB,
	CEILING(SUM(CASE WHEN u.segmap != 4 THEN size - CURUNRESERVEDPGS(u.dbid,
			u.lstart, u.unreservedpgs) END)/1048576.*@@maxpagesize) AS data_used_MB,
	CEILING(100 * (1 - 1.0 * SUM(CASE WHEN u.segmap != 4 THEN
			CURUNRESERVEDPGS(u.dbid, u.lstart, u.unreservedpgs) END) / SUM(CASE WHEN
			u.segmap != 4 THEN u.size END))) AS data_used_pct,
	CEILING(SUM(CASE WHEN u.segmap = 4 THEN u.size/1048576.*@@maxpagesize END)) AS log_size_MB,
	CEILING(SUM(CASE WHEN u.segmap = 4 THEN u.size/1048576.*@@maxpagesize END) -
			LCT_ADMIN("logsegment_freepages",d.dbid)/1048576.*@@maxpagesize) AS log_used_MB,
	CEILING(100 * (1 - 1.0 * LCT_ADMIN("logsegment_freepages",d.dbid) / SUM(CASE
			WHEN u.segmap IN (4, 7) THEN u.size END))) AS log_used_pct
FROM 
	master..sysdatabases d, 
	master..sysusages u
WHERE u.dbid = d.dbid AND d.status != 256
GROUP BY d.dbid
ORDER BY DB_NAME(d.dbid)

/* This will display 7 columns:
? The name of the database
? The total size of the data segments of this database (in MB)
? The usage of the data segments of this database (in MB)
? The usage percentage
? The size of the log segments of this database (in MB). This columns will be empty if
there is no separated log segment i.e. this database has mixed log/data segment
? The usage of the log segments of this database (in MB). This columns will be empty if
there is no separated log segment i.e. this database has mixed log/data segment
? The usage percentage. This column will contain no value if there is neither a separate log
segment nor a mixed log segment (e.g. for the dbcc database). If there is a mixed data/log
segment, it will display the same percentage as the data segment usage.

A few details about the query:
@@maxpagesize returns the server’s logical page size. It's basically the same value you'd get by
using the following:

select low from master.dbo.spt_values where number = 1 and type = "E"

So multiplying a number of pages by @@maxpagesize returns the corresponding number of
bytes.

1048576 is the number of bytes in a megabyte. Dividing by 1048576 thus converts all number of
bytes in number of megabyte. 

The dot after 1048576 is used so that we implicitly convert those
integers to floats. 
Here an example of why we need this dot:

? 1048575 / 1048576 * 4096 returns 0 as 1048575 / 1048576 is 0 when doing some pure
integer arithmetic
? 1048575 / 1048576. * 4096 returns 4095.99606784

When computing the values you have to make sure that you avoid arithmetic overflow which
would happen e.g. if you multiplied by @@maxpagesize before dividing by 1048576.

The values of master..sysusages.segmap mean the following:
? 3: Data stored on this segment
? 4: Log stored on this segment
? 7: Since 7=4+3, both log and data stored on this segment

That's why we exclude segmap = 4 when computing values for the "data" columns, 
consider only segmap = 4 for the columns related to the size of the log segment or it's usage. 
But we do consider both segmap=4 and segment=7 for the usage percentage of the log since when both are
on the same segment, a full segment would also indicate a full log.
curunreservedpgs returns the number of free pages in the specified piece of disk. The third
parameter (we provide here sysusages.unreservedpgs) is returned instead of the value in memory
when the database is not opened i.e. not in use.

lct_admin with "logsegment_freepages" as the first
 parameter returns the number of free pages in
a dedicated log segment
*/

-- DUPLICATE RECORDS
select ddsn, ddsn_suf, lsc
from dr09_requisition t1
where 
	(select count(*) from dr09_requisition t2 where t1.ddsn = t2.ddsn) > 1
order by 1 asc, 2 desc
go