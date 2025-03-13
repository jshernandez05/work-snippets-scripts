#!/bin/bash
rm -Rf /opt/sybase/DBISQL/car_tr
mkdir -p /opt/sybase/DBISQL/car_tr
chmod 777 -R /opt/sybase/DBISQL/car_tr
chown -R sybase:sybase /opt/sybase/DBISQL/car_tr
/h/NTCSSS/bin/getlinkdata -q ssabtusr > /opt/sybase/pd
chmod 666 /opt/sybase/pd
chown sybase:sybase /opt/sybase/pd
echo 'update carcass set' > /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql
echo 'carcass.ship_dt = getdate()' >> /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql
echo 'where carcass.ship_dt is null' >> /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql
echo 'go' >> /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql
echo -e '\nupdate carcass set' >> /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql
echo 'ship_dt = getdate(),' >> /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql
echo 'comp_ser_no = "NA",' >> /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql
echo 'dept_ti_dt = getdate(),' >> /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql
echo 'sts_resp_cd = "A",' >> /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql
echo 'shpmt_mode = " ",'>> /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql
echo 'ti_org_cd = trk_org_cd,' >> /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql
echo 'ti_doc_dt = trk_doc_dt,' >> /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql  
echo 'ti_dsn = trk_doc_dt' >> /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql
echo 'where (dept_ti_dt is null or dept_ti_dt like " ")' >> /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql
echo 'go' >> /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql
chmod 777 -R /opt/sybase/DBISQL/car_tr
chown -R sybase:sybase /opt/sybase/DBISQL/car_tr
echo '/opt/sybase/OCS-15_0/bin/isql -Ussabtusr -Dsupply -P`cat /opt/sybase/pd` -i /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql -o /opt/sybase/DBISQL/car_tr/carcass_cleanup.out' > /opt/sybase/DBISQL/car_tr/carcass_cleanup.sh
chmod 777 -R /opt/sybase/DBISQL/car_tr
chown -R sybase:sybase /opt/sybase/DBISQL/car_tr
su - sybase -c /opt/sybase/DBISQL/car_tr/carcass_cleanup.sh
chmod 644 /opt/sybase/DBISQL/car_tr/carcass_cleanup.out
chown sybase:sybase /opt/sybase/DBISQL/car_tr/carcass_cleanup.out

cd /etc/cron.daily/
vi sdi_link

/h/NTCSSS/bin/sdi_link

vi /h/NTCSSS/bin/sdi_link (insert script)
chmod 777 /h/NTCSSS/bin/sdi_link
chmod 777 sdi_link
more sdi_link
/h/NTCSSS/bin/sdi_link

update carcass set
ship_dt = getdate(),
comp_ser_no = "NA",
dept_ti_dt = getdate(),
sts_resp_cd = "A",
shpmt_mode = " ",
ti_org_cd = trk_org_cd,
ti_doc_dt = trk_doc_dt, 
ti_dsn = trk_doc_dt
where (dept_ti_dt is null or dept_ti_dt like ' ')









