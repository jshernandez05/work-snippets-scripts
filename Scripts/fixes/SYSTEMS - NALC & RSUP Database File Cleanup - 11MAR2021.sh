# Removes all core files #
# Core files created to store memory image of terminated process#
find / -name core -print -exec rm {} \;

/* NTCSS DIRECTORY */

# Removes all "Nightly Error Log" files (in /h/NTCSS_NALC/errors directory) greater than 7 days old #
find /h/NTCSS_NALC/errors -name "log.*" -mtime +7 -print -exec rm {} \;


/* SYBASE DIRECTORY */

# Removes all "Sybase Error Log" files (in /opt/sybase/install directory) greater than 30 days old #
find /opt/sybase/ASE-15_0/install -name "*errorlog*" -mtime +30 -print -exec rm {} \;


/* REPORTS DIRECTORY - NALCOMIS DATABASE */

cd /h/OIMABT/data/reports 

# Removes all "MILSTRIP" files greater than 7 days #
# find /h/OIMABT/data/reports -name "E*" -mtime +15 -print | more
find /h/OIMABT/data/reports -name "E*" -mtime +15 -print | wc -l
find /h/OIMABT/data/reports -name "E*" -mtime +15 -print -exec rm {} \;

# Removes all "NALCOMIS Reports" files greater than 7 days #
# find /h/OIMABT/data/reports -name "J*" -mtime +15 -print | more
find /h/OIMABT/data/reports -name "J*" -mtime +15 -print | wc -l
find /h/OIMABT/data/reports -name "J*" -mtime +15 -print -exec rm {} \;

# Removes all "NALCOMIS Reports" files greater than 7 days #
# find /h/OIMABT/data/reports -name "H4*" -mtime +15 -print | more
# find /h/OIMABT/data/reports -name "H4*" -mtime +15 -print | wc -l
find /h/OIMABT/data/reports -name "H4*" -mtime +15 -print -exec rm {} \;

# Removes all "NALCOMIS Reports" files greater than 7 days #
find /h/OIMABT/data/reports -name "H8*" -mtime +15 -print | more
find /h/OIMABT/data/reports -name "H8*" -mtime +15 -print | wc -l
find /h/OIMABT/data/reports -name "H8*" -mtime +15 -print -exec rm {} \;

# Removes all "MRIL DOP" files greater than 7 days #
find /h/OIMABT/data/reports -name "P*" -mtime +15 -print | more
find /h/OIMABT/data/reports -name "P*" -mtime +15 -print | wc -l
find /h/OIMABT/data/reports -name "P*" -mtime +15 -print -exec rm {} \;

# Removes all "AV3M" files greater than 7 days #
find /h/OIMABT/data/reports -name "U*" -mtime +15 -print | more
find /h/OIMABT/data/reports -name "U*" -mtime +15 -print | wc -l
find /h/OIMABT/data/reports -name "U*" -mtime +15 -print -exec rm {} \;

# Removes all "Interface Reports" files greater than 30 days #
find /h/OIMABT/data/reports -name "R*" -mtime +15 -print | more
find /h/OIMABT/data/reports -name "R*" -mtime +15 -print | wc -l
find /h/OIMABT/data/reports -name "R*" -mtime +15 -print -exec rm {} \;


/* FILE DIRECTORY */

# Removes all "MILTRIP RECORDS" files greater than 7 days #
find /h/data/local/OIMABT/ -name "E6*" -mtime +7 -print -exec rm {} \;

# Removes all "AV3M Extract" files greater than 7 days #
find /h/data/local/OIMABT/ -name "J2*" -mtime +7 -print -exec rm {} \;

# Removes all "X08" files greater than 7 days #
find /h/data/local/OIMABT/ -name "J6*" -mtime +7 -print -exec rm {} \;

# Removes all "Month End Closeout" files greater than 30 days #
find /h/data/local/OIMABT/ -name "J0*" -mtime +30 -print -exec rm {} \;

# Removes all "RSUPPLY Drawdown" files greater than 30 days #
find /h/data/local/OIMABT/ -name "JS*" -mtime +30 -print -exec rm {} \;


/* INTERFACE DIRECTORY */

# Removes all "RSUPPLY Outgoing Interface" files greater than 5 days #
find /h/data/local/OIMABT/sup_interface -name "INTFCRT*" -mtime +5 -print -exec rm {} \;

# Removes all "RSUPPLY Outgoing Interface Log" files greater than 5 days #
find /h/data/local/OIMABT/sup_interface/log -name "*.log" -mtime +5 -print -exec rm {} \;


/* EXTERNAL DIRECTORY */

# Removes all "Milstrip Extract" files (in /h/NTCSS_NALC/data/exts directory) greater than 15 days #
find /h/data/local/OIMABT/ext -name "E*" -mtime +15 -print -exec rm {} \;


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
RSUPMAST
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
# Removes all core files #
# Core files created to store memory image of terminated process#
find / -name core -print -exec rm {} \;

/* NTCSS DIRECTORY */

# Removes all "Nightly Error Log" files (in /h/NTCSS_RSUP/errors directory) greater than 7 days old #
find /h/NTCSS_RSUP/errors -name "log.*" -mtime +7 -print -exec rm {} \;


/* SYBASE DIRECTORY */

# Removes all "Sybase Error Log" files (in /opt/sybase/install directory) greater than 30 days old #
find /opt/sybase/ASE-15_0/install -name "*errorlog*" -mtime +30 -print -exec rm {} \;


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* REPORTS DIRECTORY - SUPPLY DATABASE */


type: 
cd /h/data/local/SUP1BT/reports


/* VERIFY & DELETE- "Batch Jobs" over 60 Days */
# Removes all "Logistics Listings" files greater than 60 days #
find /h/data/local/SUP1BT/reports -name "JSL*" -mtime +60 -print | more
find /h/data/local/SUP1BT/reports -name "JSL*" -mtime +60 -print | wc -l
find /h/data/local/SUP1BT/reports -name "JSL*" -mtime +60 -print -exec rm {} \;

# Removes all "Site Report" files greater than 60 days #
find /h/data/local/SUP1BT/reports -name "JSS*" -mtime +60 -print | more
find /h/data/local/SUP1BT/reports -name "JSS*" -mtime +60 -print | wc -l
find /h/data/local/SUP1BT/reports -name "JSS*" -mtime +60 -print -exec rm {} \;

# Removes all "Inventory Report" files greater than 60 days #
find /h/data/local/SUP1BT/reports -name "JSI*" -mtime +90 -print | more
find /h/data/local/SUP1BT/reports -name "JSI*" -mtime +90 -print | wc -l
find /h/data/local/SUP1BT/reports -name "JSI*" -mtime +90 -print -exec rm {} \;

# Removes all "Financial Listings" files greater than 60 days #
find /h/data/local/SUP1BT/reports -name "JSF*" -mtime +180 -print | more
find /h/data/local/SUP1BT/reports -name "JSF*" -mtime +180 -print | wc -l
find /h/data/local/SUP1BT/reports -name "JSF*" -mtime +180 -print -exec rm {} \;


/* VERIFY - "Batch Jobs" - RETAINED */

find /h/data/local/SUP1BT/reports -name "JSL*" -print | wc -l
find /h/data/local/SUP1BT/reports -name "JSS*" -print | wc -l
find /h/data/local/SUP1BT/reports -name "JSI*" -print | wc -l
find /h/data/local/SUP1BT/reports -name "JSF*" -print | wc -l

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

 /* TAPE_IN DIRECTORY - SUPPLY DATABASE */
echo 'Removes all import files transferred to the server greater than 7 days #'
# find /h/data/local/SUP1BT/tape_in -mtime +7 -print
find /h/data/local/SUP1BT/tape_in -mtime +7 -print | wc -l
find /h/data/local/SUP1BT/tape_in -mtime +7 -print -exec rm {} \;


/* TAPE_OUT DIRECTORY - SUPPLY DATABASE */
# Removes all stars output files greater than 365 days #
# find /h/data/local/SUP1BT/tape_out -name "JSF*" -mtime +365 -print
find /h/data/local/SUP1BT/tape_out -name "JSF*" -mtime +365 -print | wc -l
find /h/data/local/SUP1BT/tape_out -name "JSF*" -mtime +365 -print -exec rm {} \;

# Removes inventory files greater than 180 days #
# find /h/data/local/SUP1BT/tape_out -name "JSI*" -mtime +180 -print
find /h/data/local/SUP1BT/tape_out -name "JSI*" -mtime +180 -print | wc -l
find /h/data/local/SUP1BT/tape_out -name "JSI*" -mtime +180 -print -exec rm {} \;

# Removes all requisition/status release files greater than 30 days #
# find /h/data/local/SUP1BT/tape_out -name "JSL*" -mtime +30 -print
find /h/data/local/SUP1BT/tape_out -name "JSL*" -mtime +30 -print | wc -l
find /h/data/local/SUP1BT/tape_out -name "JSL*" -mtime +30 -print -exec rm {} \;

# Removes all temp files greater than 30 days #
# find /h/data/local/SUP1BT/tape_out -name "TMP*" -mtime +30 -print
find /h/data/local/SUP1BT/tape_out -name "TMP*" -mtime +30 -print | wc -l
find /h/data/local/SUP1BT/tape_out -name "TMP*" -mtime +30 -print -exec rm {} \;

# Removes all TIR files greater than 180 days #
# find /h/data/local/SUP1BT/tape_out -name "ULM*" -mtime +180 -print
find /h/data/local/SUP1BT/tape_out -name "ULM*" -mtime +180 -print | wc -l
find /h/data/local/SUP1BT/tape_out -name "ULM*" -mtime +180 -print -exec rm {} \;


/* VERIFY - "Batch Jobs" - RETAINED */
find /h/data/local/SUP1BT/tape_out -name "JSL*" -print | wc -l
find /h/data/local/SUP1BT/tape_out -name "JSS*" -print | wc -l
find /h/data/local/SUP1BT/tape_out -name "JSI*" -print | wc -l
find /h/data/local/SUP1BT/tape_out -name "JSF*" -print | wc -l
find /h/data/local/SUP1BT/tape_out -name "TMP*" -print | wc -l
find /h/data/local/SUP1BT/tape_out -name "ULM*" -print | wc -l

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 /* WORKSPACE DIRECTORY - SUPPLY DATABASE */

# Removes all files greater than 30 days #
find /h/data/local/SUP1BT/workspace -mtime +30 -print -exec rm {} \;


 /* LOG DIRECTORY - SUPPLY DATABASE */
# Removes all files greater than 30 days #
find /h/data/local/SUP1BT/log -name "J*" -mtime +30 -print -exec rm {} \;







































