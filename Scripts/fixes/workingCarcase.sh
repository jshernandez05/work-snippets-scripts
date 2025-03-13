#!/bin/bash
chmod 777 /opt/sybase/DBISQL/car_tr/carcass.sql
chown sybase:sybase /opt/sybase/DBISQL/car_tr/carcass.sql
/h/NTCSSS/bin/getlinkdata ssabtusr > /opt/sybase/Pcrr ;  grep Second /opt/sybase/Pcrr | awk '{print$4}' > /opt/sybase/pd
chmod 777 /opt/sybase/pd
chown sybase:sybase /opt/sybase/pd
echo '/opt/sybase/OCS-15_0/bin/isql -Ussabtusr -P`cat /opt/sybase/pd` -i /opt/sybase/DBISQL/car_tr/carcass.sql -o /opt/sybase/DBISQL/car_tr/carcass.raw.out' > /opt/sybase/DBISQL/car_tr/carcass.sh
chmod 777 /opt/sybase/DBISQL/car_tr/carcass.sh
chown sybase:sybase /opt/sybase/DBISQL/car_tr/carcass.sh
su - sybase -c /opt/sybase/DBISQL/car_tr/carcass.sh
rm -f /opt/sybase/Pcrr







update carcass set 
carcass.ship_dt = getdate()
where carcass.ship_dt is null
go



select count(mr_doc_dt)
from carcass
where ship_dt is null
go

