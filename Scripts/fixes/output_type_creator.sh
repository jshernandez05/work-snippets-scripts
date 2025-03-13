use p2db
go
select distinct
+ char(13) + char(10) + "report"
+ char(13) + char(10) + "NALCOMIS"
+ char(13) + char(10) + "REPORT"
+ char(13) + char(10)
+ char(13) + char(10) + "0"
from da05_workcenter
where org_cd in
 (select aimd_org from da07_site_data)
union
select distinct
+ char(13) + char(10) + "DEFAULT"
+ char(13) + char(10) + "NALCOMIS"
+ char(13) + char(10) + "DEFAULT"
+ char(13) + char(10)
+ char(13) + char(10) + "0"
from da05_workcenter
where org_cd in
 (select aimd_org from da07_site_data)
union
select distinct
+ char(13) + char(10) + org_cd + wc_cd + "01"
+ char(13) + char(10) + "NALCOMIS"
+ char(13) + char(10) + "HCN"
+ char(13) + char(10)
+ char(13) + char(10) + "0"
from da05_workcenter
where org_cd in
 (select aimd_org from da07_site_data)
and substring(wc_cd, 2, 2) not like '00'
go



#######################################################

use p2db
go
select distinct
+ char(13) + char(10) + "LOC" + substring(loctn, 1, 2) + "*01"
+ char(13) + char(10) + "NALCOMIS"
+ char(13) + char(10) + "HCN"
+ char(13) + char(10)
+ char(13) + char(10) + "0"
from ds07_niinloc
go


##################################################


#!/bin/csh -f
# Created by SPAWAR Pacific
# Robert Heend, Felix Lozada
# 04 March 2018
# /h/NTCSSS/bin/output_type creator on nalc
# Do not kick off unless you want to overwrite your current printer output types.
# We will also backup your old output_type and output_prt in this script to /h/NTCSSS/bin/output_type_old and output_prt_old
(cp -f /h/NTCSSS/database/output_type_old1 /h/NTCSSS/database/output_type_old2) >& /dev/null
(cp -f /h/NTCSSS/database/output_type_old /h/NTCSSS/database/output_type_old1) >& /dev/null
cp -f /h/NTCSSS/database/output_type /h/NTCSSS/database/output_type_old
(cp -f /h/NTCSSS/database/output_prt_old1 /h/NTCSSS/database/output_prt_old2) >& /dev/null
(cp -f /h/NTCSSS/database/output_prt_old /h/NTCSSS/database/output_prt_old1) >& /dev/null
mv /h/NTCSSS/database/output_prt /h/NTCSSS/database/output_prt_old
touch /h/NTCSSS/database/output_prt; chmod 600 /h/NTCSSS/database/output_prt
/h/NTCSSS/bin/getlinkdata nalc get > /opt/sybase/ppd ;  grep Second /opt/sybase/ppd | awk '{print$4}' > /opt/sybase/pd
rm -f /opt/sybase/ppd
echo '/opt/sybase/OCS-15_0/bin/isql -Usybbtusr -SNTCSS_NALC -P`cat /opt/sybase/pd` -i/opt/sybase/output_type.sql -o/opt/sybase/output_type.out' > /opt/sybase
/output_type.sh
echo '/opt/sybase/OCS-15_0/bin/isql -Usybbtusr -SNTCSS_NALC -P`cat /opt/sybase/pd` -i/opt/sybase/output_type1.sql -o/opt/sybase/output_type1.out' > /opt/syba
se/output_type1.sh
chmod 777 /opt/sybase/output_type.sh; chmod 777 /opt/sybase/output_type1.sh; chown sybase:sybase /opt/sybase/output_type.s*; chown sybase:sybase /opt/sybase/
output_type1.s*
su - sybase -c /opt/sybase/output_type.sh
cat /opt/sybase/output_type.out | grep -v "row" | grep -v "-" > /opt/sybase/output_type


hostname | cut -c 6 | grep "l" > /h/NTCSSS/database/ldeck
wc -c /h/NTCSSS/database/ldeck > /h/NTCSSS/database/chk_ldeck; rm -f /h/NTCSSS/database/ldeck
set ldeck=`cut -c 1 /h/NTCSSS/database/chk_ldeck`
if ($ldeck > 1) then
echo "This is a L-class ship, ommitting adding locations"
echo "Successfully built Nalc print output types off of your workcenters"
echo "You will need to manually relink your printers to your created output types in (Application Printer Configuations)"
goto end
else
echo "Successfully built Nalc print output types off of your workcenters"
echo "You will need to manually relink your printers to your created output types in (Application Printer Configuations)"
su - sybase -c /opt/sybase/output_type1.sh
sed -i 's,-\*,\*\*,g' /opt/sybase/output_type1.out
sed -i -e 1,3d /opt/sybase/output_type1.out
cat /opt/sybase/output_type1.out | grep -v "row" | grep -v "-" >> /opt/sybase/output_type

endif
end:
chmod 600 /opt/sybase/output_type
(dos2unix /opt/sybase/output_type) >& /dev/null
sed -i -e 1,2d /opt/sybase/output_type
sed -i 's, ,,g' /opt/sybase/output_type
cp -pf /opt/sybase/output_type /h/NTCSSS/database
rm -f /opt/sybase/output_type*
rm -f /h/NTCSSS/database/chk_ldeck




