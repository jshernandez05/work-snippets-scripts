if object_id('sybsystemprocs..col') is not null or object_id('col') is not null  begin
	/*code special for FM*/
	exec col 'dbo.dm04_maf'
end else begin
	select
		"#"      = colid,
		column   = c.name,
		type     = t.name,
		byte_len = c.length,
		isnull   = convert (smallint , convert(bit, c.status&8))
	from   
	syscolumns c,systypes t   
	where   
		c.id = object_id('dbo.dm04_maf')   
		and c.usertype *= t.usertype   
	order by 2
end