crontab -l
30 1 1 * * /usr/local/sbin/dumpArchiver -t monthly -n 12
* * * * * chmod -R 660 /h/NTCSS_APP/data/xferd/NALC_IMA


crontab -e


