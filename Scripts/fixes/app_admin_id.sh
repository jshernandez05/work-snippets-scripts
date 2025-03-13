[rheend-admin@rsupmast ~]$ sudo su -
[sudo] password for rheend-admin:
[root@rsupmast ~]# ll
total 24
-rwxrwxrwx. 1 root root  691 Sep  1 14:26 app_admin_query.sh
-rwxrwxrwx. 1 root root  664 Sep  1 14:27 NTCSS_APP_admin_query.sh
drwx------. 2 root root 4096 May 17 11:40 serverGenerateCsr
drwx------. 2 root root 4096 May 17 11:39 sslWorkDir
-rw-r--r--. 1 root root 5307 May 14 09:31 stig_report_apply_2021-05-14T163108.403164.csv
[root@rsupmast ~]# more app_admin_query.sh
cd /h/NTCSSS/ldap/runtime
. ./SysInfoEnv.sh
(/h/NTCSSS/ldap/runtime/LDAPList) >& /dev/null
cat /tmp/APPUSER.lst | grep -v objectClass | grep -v  ntcssUserName | grep -v cssAppData | grep -v cssAppDB | grep -v cssAppRegistered | fmt | awk "NF" | grep -v imabtusr| grep -v "cssAppRole: 8" | grep -v "NALCOMIS cssAppRole: 4" | grep -v "NALCOMIS cssAppRole: 24" | grep NALCOMIS | sed 's,cssApplicationName: NALCOMIS cssAppRole: 12, NALC APP ADMIN,g' | sed 's,cssApplicationName: NALCOMIS cssAppRole: 28, NALC APP ADMIN,g' | sed 's,cssApplication Name: NALCOMIS cssAppRole: 60, NALC APP ADMIN,g' | sed 's,userLogin,NTCSS ID,g' | awk "NF" | tee /tmp/NALC_APP_ADMIN.log ;wc -l /tmp/NALC_APP_ADMIN.log | sed 's,/tmp/NALC_APP_ADMIN.log,Total Count,g';wc -l /tmp/NALC_APP_ADMIN.log | sed 's,/tmp/NALC_APP_ADMIN.log,Total Count,g' >> /tmp/NALC_APP_ADMIN.log

[root@rsupmast ~]# more NTCSS_APP_admin_query.sh
cd /h/NTCSSS/ldap/runtime
. ./SysInfoEnv.sh
(/h/NTCSSS/ldap/runtime/LDAPList) >& /dev/null
cat /tmp/APPUSER.lst | grep -v objectClass | grep -v  ntcssUserName | grep -v cssAppData | grep -v cssAppDB | grep -v cssAppRegistered | fmt | awk "NF" | grep -v NALCOMIS | grep -v RADM | grep -v RSUPPLY | grep -v OMMSNG | grep -v ntcssii | grep -v APPUSER_TABLE | grep -v "cssAppRole: 24" | sed 's,cssApplicationName: NTCSS cssAppRole: 12, NTCSS APP ADMIN,g' | sed 's,cssApplicationName: NTCSS cssAppRole: 28, NTCSS APP ADMIN,g' | sed 's,cssApplicationName: NTCSS cssAppRole: 4, NTCSS APP ADMIN,g' | sed 's,cssApplicationName: NTCSS cssAppRole: 16, NTCSS APP ADMIN,g' | sed 's,cssApplicationName: NTCSS cssAppRole: 20, NTCSS APP ADMIN,g'| sed 's,userLogin,NTCSS ID,g' | awk "NF" | tee /tmp/NTCSS_APP_ADMIN.log ;wc -l /tmp/NTCSS_APP_ADMIN.log | sed 's,/tmp/NTCSS_APP_ADMIN.log,Total Count,g' ;wc -l /tmp/NTCSS_APP_ADMIN.log | sed 's,/tmp/NTCSS_APP_ADMIN.log,Total Count,g' >> /tmp/NTCSS_APP_ADMIN.log


cat /tmp/APPUSER.lst | grep -v objectClass | grep -v  ntcssUserName | grep -v cssAppData | grep -v cssAppDB | grep -v cssAppRegistered | fmt | awk "NF" | grep -v supbtusr| grep -v "cssAppRole: 8" | grep -v "RSUPPLY cssAppRole: 4" | grep -v "RSUPPLY cssAppRole: 24" |grep RSUPPLY | sed 's,cssApplicationName: RSUPPLY cssAppRole: 12, RSUP APP ADMIN,g' | sed 's,cssApplicationName: RSUPPLY cssAppRole: 28, RSUP APP ADMIN,g' | sed 's,cssApplication Name: RSUPPLY cssAppRole: 60, RSUP APP ADMIN,g' | sed 's,userLogin,NTCSS ID,g' | awk "NF" | tee /tmp/RSUP_APP_ADMIN.log ;wc -l /tmp/RSUP_APP_ADMIN.log | sed 's,/tmp/RSUP_APP_ADMIN.log,Total Count,g';wc -l /tmp/RSUP_APP_ADMIN.log | sed 's,/tmp/RSUP_APP_ADMIN.log,Total Count,g' >> /tmp/RSUP_APP_ADMIN.log
