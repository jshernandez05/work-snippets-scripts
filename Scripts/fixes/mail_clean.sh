[root@nalc mail]# ll /var/spool/mail/*-admin | awk '{print$9}' | sed 's,^,echo 1 > ,g' > /h/USERS/jhernandez-admin/mail_clean; chmod 777 /h/USERS/jhernandez-admin/mail_clean


****change -admin account 

or 

****run it from -admin account 

ll /var/spool/mail/*-admin | awk '{print$9}' | sed 's,^,echo 1 > ,g' > $HOME/mail_clean; chmod 777 $HOME/mail_clean