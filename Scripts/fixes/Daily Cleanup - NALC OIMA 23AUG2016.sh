
type: 
cd /h/OIMABT/data/reports

type: 

ls -alt  J23900038*
ls -alt  J239*

ls -alt  J23900038* | wc -l
ls -alt  J239* | wc -l



/* VERIRY - "Batch Jobs" over 60 Days */

find . -name "R6*" -mtime +15 -print | more




find . -name "J1*" -mtime +15 -print | wc -l
find . -name "J235*" -mtime +15 -print | wc -l
find . -name "J239*" -mtime +15 -print | wc -l
find . -name "R6*" -mtime +15 -print | wc -l


find . -name "J1*" -mtime +15 -print -exec rm {} \;
find . -name "J235*" -mtime +15 -print -exec rm {} \;
find . -name "J239*" -mtime +15 -print -exec rm {} \;
find . -name "R6*" -mtime +15 -exec rm {} \;

SUPPLY
find . -name "J60*" -mtime +15 -print | wc -l
find . -name "J61*" -mtime +15 -print | wc -l
find . -name "J62*" -mtime +15 -print | wc -l
find . -name "J63*" -mtime +15 -print | wc -l
find . -name "J64*" -mtime +15 -print | wc -l
find . -name "J67*" -mtime +15 -print | wc -l
find . -name "J7*" -mtime +15 -print | wc -l


find . -name "J60*" -mtime +15 -print -exec rm {} \;
find . -name "J61*" -mtime +15 -print -exec rm {} \;
find . -name "J62*" -mtime +15 -print -exec rm {} \;
find . -name "J63*" -mtime +15 -print -exec rm {} \;
find . -name "J64*" -mtime +15 -print -exec rm {} \;
find . -name "J67*" -mtime +15 -print -exec rm {} \;
find . -name "J7*" -mtime +15 -print -exec rm {} \;









/* VERIRY - "Batch Jobs" over 60 Days */

find . -name "JSI*" -mtime +365 -print | more

find . -name "JSI*" -mtime +365 -print | wc -l



find . -name "JSL*" -mtime +365 -print | more
find . -name "JSL*" -mtime +365 -print | wc -l




find . -name "JSS*" -mtime +365 -print | more

find . -name "JSF*" -mtime +365 -print | more




/* VERIRY - "Batch Jobs" over 60 Days */

find . -name "J239*" -mtime +15 -print | wc -l

find . -name "JSL*" -mtime +60 -print | wc -l

find . -name "JSS*" -mtime +60 -print | wc -l

find . -name "JSF*" -mtime +60 -print | wc -l



 
/* DELETE "Batch Jobs" over 60 Days */

find . -name "JSI*" -mtime +90 -print -exec rm {} \;

find . -name "JSL*" -mtime +90 -print -exec rm {} \;

find . -name "JSS*" -mtime +90 -print -exec rm {} \;

find . -name "JSF*" -mtime +180 -print -exec rm {} \;




/* VERIFY - "Batch Jobs" - RETAINED */


find . -name "JSI*" -print | wc -l

find . -name "JSL*" -print | wc -l

find . -name "JSS*" -print | wc -l

find . -name "JSF*" -print | wc -l



find -mtime +60 -print | wc -l

find -mtime +60;ls -alt | more








































