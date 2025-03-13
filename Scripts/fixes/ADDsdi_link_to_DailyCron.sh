#Create sdi_link on rsupmast /h/NTCSSS/bin/sdi_link
cd /h/NTCSSS/bin/
vi sdi_link

#!/bin/bash
rm -Rf /opt/sybase/DBISQL/car_tr
mkdir -p /opt/sybase/DBISQL/car_tr
chmod 777 -R /opt/sybase/DBISQL/car_tr
chown -R sybase:sybase /opt/sybase/DBISQL/car_tr

/h/NTCSSS/bin/getlinkdata ssabtusr > /opt/sybase/DBISQL/car_tr/Pcrr ;  grep Second /opt/sybase/DBISQL/car_tr/Pcrr | awk '{print$4}' > /opt/sybase/DBISQL/car_tr/pd

rm -f /opt/sybase/DBISQL/car_tr/Pcrr

echo 'update carcass set' > /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql
echo 'carcass.ship_dt = getdate()' >> /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql
echo 'where carcass.ship_dt is null' >> /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql
echo 'go' >> /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql

chmod 777 -R /opt/sybase/DBISQL/car_tr
chown -R sybase:sybase /opt/sybase/DBISQL/car_tr

echo '/opt/sybase/OCS-15_0/bin/isql -Ussabtusr -Dsupply -P`cat /opt/sybase/DBISQL/car_tr/pd` -i /opt/sybase/DBISQL/car_tr/carcass_cleanup.sql -o /opt/sybase/DBISQL/car_tr/carcass_cleanup.out' > /opt/sybase/DBISQL/car_tr/carcass_cleanup.sh

chmod 777 -R /opt/sybase/DBISQL/car_tr
chown -R sybase:sybase /opt/sybase/DBISQL/car_tr
su - sybase -c /opt/sybase/DBISQL/car_tr/carcass_cleanup.sh
chmod 777 /opt/sybase/DBISQL/car_tr/carcass_cleanup.out
chown sybase:sybase /opt/sybase/DBISQL/car_tr/carcass_cleanup.out


# Add to daily cron
create sdi_link in /etc/cron.daily/sdi_link

cd /etc/cron.daily/
touch sdi_link

echo /h/NTCSSS/bin/sdi_link > sdi link