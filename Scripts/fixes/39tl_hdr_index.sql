There is no unique constraint on the referenced columns in the referenced table 'tl_matl_hdr' specified in referential constraint declaration on the
table 'tl_matl_trlr'.
Table tl_matl_trlr
Msg 3701, Level 11, State 7:
Server 'NTCSS_RSUP', Line 4:
Cannot drop the constraint 'fk_tl_matl_hdr_has_matl_trlr', because it doesn't exist in the system catalogs.




select name, object_name(id) as table_name
from sysindexes where indid > 0 and status2 & 2 = 2 
order by 2



select name, object_name(id) as table_name, * 
from sysindexes where name like 'XPKtl_%'





sp_helpconstraint tl_matl_hdr

sp_helpconstraint tl_matl_data

sp_helpconstraint tl_matl_trlr

sp_helpindex tl_matl_hdr




alter table tl_matl_data
drop constraint fk_tl_matl_hdr_has_matl_data


alter table dbo.tl_matl_trlr
    drop constraint fk_tl_matl_hdr_has_matl_trlr 
    

drop index tl_matl_hdr.XPKtl_matl_hdr 


alter table tl_matl_hdr
add constraint XPKtl_matl_hdr primary key nonclustered ( niin, cosal_ty_cd, mon_yr)

alter table dbo.tl_matl_data
    add constraint fk_tl_matl_hdr_has_matl_data foreign key ( niin,cosal_ty_cd,mon_yr )
    references dbo.tl_matl_hdr ( niin,cosal_ty_cd,mon_yr )
    
    
alter table dbo.tl_matl_trlr
    add constraint fk_tl_matl_hdr_has_matl_trlr foreign key ( niin,cosal_ty_cd,mon_yr )
    references dbo.tl_matl_hdr ( niin,cosal_ty_cd,mon_yr )

create unique index XPKtl_matl_hdr
on tl_matl_hdr (niin, cosal_ty_cd, mon_yr)
go


update statistics tl_matl_hdr