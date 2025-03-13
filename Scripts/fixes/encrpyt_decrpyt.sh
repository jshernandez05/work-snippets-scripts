# encrypt 
openssl enc -aes128 -md sha256 -pass file:/h/NTCSSS/database/MASTER -in /opt/sybase/2N_MVO -out /opt/sybase/DBISQL/2N_MVO/2N_MVO.enc


# decrypt
/usr/bin/openssl enc -d -aes128 -md sha256 -pass file:/h/NTCSSS/database/MASTER -in /opt/sybase/DBISQL/2N_MVO/2N_MVO.enc -out /opt/sybase/DBISQL/2N_MVO/2N_MVO_kick.sh


chmod 777 /opt/sybase/DBISQL/2N_MVO/2N_MVO_kick.sh
chown sybase:sybase /opt/sybase/DBISQL/2N_MVO/2N_MVO_kick.sh
/opt/sybase/DBISQL/2N_MVO/2N_MVO_kick.sh
rm -f /opt/sybase/DBISQL/2N_MVO/2N_MVO_kick.sh

/h/NTCSSS/database/MASTER