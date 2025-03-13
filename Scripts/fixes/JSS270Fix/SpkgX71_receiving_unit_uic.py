#!/usr/bin/python
from datetime import datetime
import os
import glob

filepath = '/h/data/local/SUP1BT/tape_in/JSS270'
outfile = '/opt/sybase/DBISQL/JSS270_X71_Insert.sql'
now = datetime.now()
date = now.strftime("%b %d %Y %H:%M%p")
reports_dir = glob.glob('/h/data/local/SUP1BT/reports/JSS270*')
latest_file = max(reports_dir, key=os.path.getctime)
pd = '/opt/sybase/DBISQL/pd'
pkickoff = '/opt/sybase/DBISQL/pkickoff.sh'
create_pd = "/h/NTCSSS/bin/getlinkdata ssabtusr | grep Second | awk '{print$4}' > /opt/sybase/DBISQL/pd"

if os.path.exists(filepath) and latest_file != '':
    os.system(create_pd)
    os.chmod(pd, 0755)
    os.chown(pd, 1000, 1000)
    with open(filepath, 'r') as rf:
        with open(outfile, 'w') as wf:
            header = rf.readline()
            pkg_serno = header[23: 29]
            uic_from = header[60: 65]
            batch = latest_file[29: 42]
            original_lines = rf.readlines()
            front = '"'
            back = '", "'
            final_header = (front + uic_from + back + header[23: 29] + front)
            insert_statement = "insert malsp_rcpt (doc_id, rcpt_gen_dt, rqst_no, rcpt_prcs_dt, cosal_ty_cd,"\
                "source_ind, updt_cd, fsc, niin, smic, ui, rcpt_doc_qty_rcvd, fc_svc_dsg, org_cd, doc_dt, dsn,"\
                "doc_suf_cd, fc, cog, ownr_cd, rcpt_excpt_ty, mcc, actl_cnt_stow_qty, matl_loctn, uic_from,"\
                "suprt_pkg_serno) values ("
            for line in original_lines:
                if 'X71' in line:
                     final_lines = (insert_statement + front + line[15: 18] + back + date + back + batch
                         + back + date + back + 'A' + back + 'C' + back + 'I' + back + line[22: 26] + back
                         + line[26: 35] + back + line[35: 37] + back + line[37: 39] + back + line[39: 44]
                         + back + line[44: 45] + back + line[45: 50] + back + line[50: 54] + back + line[54: 58]
                         + back + line[58: 59] + back + line[66: 68] + back + line[69: 71] + back + line[77: 82]
                         + back + line[84: 85] + back + line[86: 87] + back + line[88: 93] + back + line[130: 136]
                         + '", ' + final_header + ')\ngo\n')
                     wf.writelines(final_lines)
        with open(pkickoff, 'w') as kf:
            kf.write('/opt/sybase/OCS-15_0/bin/isql -Ussabtusr -P`cat /opt/sybase/DBISQL/pd` -SNTCSS_RSUP -Dsupply'\
                ' -i /opt/sybase/DBISQL/JSS270_X71_Insert.sql -o /opt/sybase/DBISQL/JSS270_X71_Insert.out') 
    os.chmod(outfile, 0755)
    os.chown(outfile, 1000, 1000)
    os.chmod(pkickoff, 0755)
    os.chown(pkickoff, 1000, 1000)    
    os.system('su - sybase -c /opt/sybase/DBISQL/pkickoff.sh')
    os.remove(pd)
    os.remove(outfile)
    os.remove(filepath)
    os.remove(pkickoff)
    os.remove('/opt/sybase/DBISQL/SpkgX71.py')