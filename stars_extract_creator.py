#!/usr/bin/python
"""
Recreate stars output file.

The following script recreates the stars output file
from a JSF404 Financial (Live) report and places it
into the tape_out directory so it can be exported
from application as normal.
"""

from datetime import datetime, date, timedelta
from dateutil.relativedelta import relativedelta
from dateutil.parser import parse
import os
import glob

# val_parms() variables
outfile = '/opt/sybase/DBISQL/STARS_VAL.sql'
pd = '/opt/sybase/DBISQL/pd'
pkickoff = '/opt/sybase/DBISQL/pkickoff.sh'
create_pd = "/h/NTCSSS/bin/getlinkdata -q ssabtusr > /opt/sybase/DBISQL/pd"
valfile = '/opt/sybase/DBISQL/STARS_VAL.out'
output_str = list(' '*150)

# run_stars_creator() variables
reports_dir = '/h/data/local/SUP1BT/reports/'
JSF404_list = glob.glob('/h/data/local/SUP1BT/reports/JSF404*')
latest_report = max(JSF404_list, key=os.path.getmtime)
report_date = os.path.getmtime(latest_report)
latest_batch_no = latest_report[-13:]
tape_out = '/h/data/local/SUP1BT/tape_out/'


def val_parms():

    def get_last_day_of_mo(mydate):
       last_date_of_mo = datetime(mydate.year, mydate.month, 1) + relativedelta(months=1, days=-1)
       return last_date_of_mo.date()

    def get_last_day_of_prev(mydate):
        last_date_of_prev = datetime(mydate.year, mydate.month, 1) + relativedelta(days=-1)
        return last_date_of_prev.date()

    def convert_print_str(output_str):
        print_str = ""
        for c in output_str:
            print_str += c

        print(print_str.rstrip())
        return print_str

    def check_varparm_bordt():
        output_str = list(' '*150)
        #print_str = ""
        if monthly == 'n' and var_parm_bordt.date() == get_last_day_of_prev(date.today()):
            output_str[0] = 'BOR date is good! '
            output_str[48] = 'variable_parameters.bor_dt   =  ' + str(var_parm_bordt.date())
            output_str[58] = 'Last day of prev month =  ' + str(get_last_day_of_prev(date.today()))
            convert_print_str(output_str)

        elif monthly == 'y' and var_parm_bordt.date() == fin_tldt.date() == get_last_day_of_mo(date.today()):
            output_str[0] = 'BOR date is good! '
            output_str[48] = 'variable_parameters.bor_dt   =  ' + str(var_parm_bordt.date())
            output_str[58] = 'Last day of prev month =  ' + str(get_last_day_of_mo(date.today()))
            convert_print_str(output_str)

        else:
            if monthly == 'y':
                output_str[0] = 'BOR date is no good! '
                output_str[48] = 'variable_parameters.bor_dt   =  ' + str(var_parm_bordt.date())
                output_str[58] = 'variable_parameters.bor_dt should be:   ' + str(get_last_day_of_prev(date.today()))
                convert_print_str(output_str)

            elif monthly == 'n':
                output_str[0] = 'BOR date is no good! '
                output_str[48] = 'variable_parameters.bor_dt   =  ' + str(var_parm_bordt.date())
                output_str[58] = 'variable_parameters.bor_dt should be:   ' + str(get_last_day_of_mo(date.today()))
                convert_print_str(output_str)

    def check_mrdt_bortecdt():
        output_str = list(' '*150)
        #print_str = ""

        if mtl_tldt != bor_tldt:
            output_str[0] = "material_request_tbl tl date doesn't match bor_mo_tec_rpt tl date. "
            output_str[5] = 'material_request_tbl tl date =  '  + str(mtl_tldt.date())
            output_str[13] = 'bor_mo_tec_rpt tl date = ' + str(bor_tldt.date())
            convert_print_str(output_str)
        else:
            output_str[0] = "material_request_tbl tl date matches bor_mo_tec_rpt tl date. "
            output_str[5] = 'material_request_tbl tl date =  '  + str(mtl_tldt.date())
            output_str[13] = 'bor_mo_tec_rpt tl date = ' + str(bor_tldt.date())
            convert_print_str(output_str)

    def check_tl_no():
        output_str = list(' '*150)

        if bor_tl_no == fin_tl_no == mtl_tl_no:
            output_str[0] = "TL numbers match. "
            output_str[47] = 'bor_mo_tec_rpt tl_no = ' + str(bor_tl_no)
            output_str[53] = 'fin_trnsmtl tl_no =  ' +  str(fin_tl_no)
            output_str[58] = 'material_request_tbl tl_no =  ' +  str(mtl_tl_no)
            convert_print_str(output_str)
        else:
            output_str[0] = "TL numbers do not match! "
            output_str[47] = 'bor_mo_tec_rpt tl_no = ' + str(bor_tl_no)
            output_str[53] = 'fin_trnsmtl tl_no =  ' +  str(fin_tl_no)
            output_str[58] = 'material_request_tbl tl_no =  ' +  str(mtl_tl_no)
            convert_print_str()

    os.system(create_pd)
    os.chmod(pd, 0755)
    os.chown(pd, 1000,1000)
    with open(outfile, 'w') as wf:
        text = "select 'VarParmDate: ' +  rtrim(cast(cast(last_bor_dt as date) as char)) from dbo.variable_parameters\n"\
               +"union\n"\
               +"select\n"\
               +"(select 'bor_mo_rpt_tecFY: ' + rtrim(cast(max(fscl_yr) as char)) from bor_mo_rpt_tec)\n"\
               +"union\n"\
               +"(select 'bor_mo_rpt_tecTL: ' + rtrim(cast(max(trnsmtl_no) as char)) "\
               +"from bor_mo_rpt_tec where fscl_yr = (select max(fscl_yr) from bor_mo_rpt_tec))\n"\
               +"union\n"\
               +"(select 'bor_mo_rpt_tecTLdt: ' + rtrim(cast(cast(max(trnsmtl_dt) as date) as char)) from bor_mo_rpt_tec)\n"\
               +"union\n"\
               +"select\n"\
               +"(select 'fin_trnsmtlFY: ' + rtrim(cast(max(fy) as char)) from fin_trnsmtl)\n"\
               +"union\n"\
               +"(select 'fin_trnsmtlTL: ' + rtrim(cast(max(trnsmtl_no) as char))" \
               +"from fin_trnsmtl where fy = (select max(fy) from fin_trnsmtl))\n"\
               +"union\n"\
               +"(select 'fin_trnsmtlTLdt: ' + rtrim(cast(cast(max(bor_dt) as date) as char)) from fin_trnsmtl)\n"\
               +"union\n"\
               +"select\n"\
               +"(select 'material_request_tblFY: ' + rtrim(cast(max(trnsmtl_fy) as char)) from material_request_tbl)\n"\
               +"union\n"\
               +"(select 'material_request_tblTL: ' + rtrim(cast(max(trnsmtl_no) as char)) "\
               +"from material_request_tbl where trnsmtl_fy = (select max(trnsmtl_fy) from material_request_tbl))\n"\
               +"union\n"\
               +"(select 'material_request_tblTLdt: ' + rtrim(cast(cast(max(trnsmtl_dt) as date) as char)) from material_request_tbl)\n"\
               +"go"
        wf.writelines(text)
    with open(pkickoff, 'w') as kf:
        kf.write('/opt/sybase/OCS-15_0/bin/isql -Ussabtusr -P$(cat /opt/sybase/DBISQL/pd) -SNTCSS_RSUP -Dsupply'\
                 ' -i /opt/sybase/DBISQL/STARS_VAL.sql -o /opt/sybase/DBISQL/STARS_VAL.out')

    os.chmod(outfile, 0755)
    os.chown(outfile, 1000, 1000)
    os.chmod(pkickoff, 0755)
    os.chown(pkickoff, 1000, 1000)
    os.system('su - sybase -c /opt/sybase/DBISQL/pkickoff.sh')
    os.remove(pd)
    os.remove(outfile)
    os.remove(pkickoff)

    with open(valfile, 'r') as vf:
        val_lines = vf.readlines()
        var_parm_bordt = (val_lines[2].strip()).partition(':')[-1]
        bor_tldt = (val_lines[5].strip()).partition(':')[-1]
        fin_tldt = (val_lines[8].strip()).partition(':')[-1]
        mtl_tldt = (val_lines[11].strip()).partition(':')[-1]
        bor_tl_no = (val_lines[4].strip()).partition(':')[-1]
        fin_tl_no = (val_lines[7].strip()).partition(':')[-1]
        mtl_tl_no = (val_lines[10].strip()).partition(':')[-1]
        bor_fy = (val_lines[3].strip()).partition(':')[-1]
        fin_fy = (val_lines[6].strip()).partition(':')[-1]
        mtl_fy = (val_lines[9].strip()).partition(':')[-1]

    var_parm_bordt = parse(var_parm_bordt)
    bor_tldt = parse(bor_tldt)
    fin_tldt = parse(fin_tldt)
    mtl_tldt = parse(mtl_tldt)

    # cli interface to identify monthly or weekly closeout
    monthly = raw_input('Is this a monthly closeout? Enter [y/n]:  ')
    monthly = monthly.lower()

    print('\n')
    check_varparm_bordt()
    check_mrdt_bortecdt()
    check_tl_no()

def run_stars_creator():

    def validate_batch_input(prompt):
        """
        Validates the batch number inputed by user.

        input must be 13 characters and start with JSF404
        file with new JSF must exist in reports directory.
        """
        while True:
            try:
                value = raw_input(prompt).upper()
            except ValueError:
                print("\nSorry, the batch number must be 13 characters long and begin with JSF404")
                continue

            if len(value) != 13 or value[:6] != "JSF404":
                print("\nSorry, the batch number must be 13 characters long and begin with JSF404")
                continue
            else:
                break
        if os.path.exists(reports_dir + value) and len(value) == 13 and value[:6] == "JSF404":
            print("\nThe batch number entered: " + value + " will be utilized.")
        else:
            print("\nCould not identify batch number please exit and try again.")
        return value

    def create_stars():
        """
        Creates stars output.

        Output from validated batch number in reports directory.
        """
        with open(infile, 'r') as rf:
            original_lines = rf.readlines()
            with open(outfile, 'w') as wf:
                header = "HEADERRSUPPLY   " + datetime.now().strftime('%Y%m%d%H%M%S') + "\n"
                wf.write(header)
            with open(outfile, 'a+') as wf:
                output_lines = []
                total = 0
                for line in original_lines:
                    if ('X0A' in line or 'Z0A' in line) and len(line) == 182:
                        di = line[6:9]
                        ri = line[12:15]
                        ms = line[18:19]
                        fsc = line[24:28]
                        niin = line[30:32] + line[33:36] + line[37:41]
                        ui = line[44:46]
                        qty = line[50:55]
                        doc_no = line[57:71]
                        tec = line[73:77]
                        dmd = line[80:81]
                        sig = line[86:87]
                        fc = line[91:93]
                        cog = line[96:98]
                        prj = line[101:104]
                        pri = line[107:109]
                        adv = line[113:115]
                        tn = line[118:121]
                        fy = line[127:128]
                        mv = line[134:142] + line[143:145]
                        fmv = abs(int(mv))
                        smv = str(fmv).zfill(10)
                        rmks = line[148:163]
                        total = total + fmv
                        if fsc + niin == "             ":
                            formated_line = di + ri + ms + rmks + ui + qty + doc_no + "   " \
                            + tec + sig + fc + " " + cog + prj + pri + "   " + adv \
                            + tn + fy + smv + "\n"
                        else:
                            formated_line = di + ri + ms + fsc + niin + "  " + ui + qty + doc_no + "   " \
                            + tec + sig + fc + " " + cog + prj + pri + "   " + adv \
                            + tn + fy + smv + "\n"
                        output_lines.append(formated_line)
                        wf.writelines(formated_line)
            with open(outfile, 'a+') as wf:
                rec_count = str(len(output_lines)).zfill(15)
                trailer = "TRAILERSTARSFL   " + rec_count + \
                          str(total).zfill(19) + "stars" + pid + "r.txt"
                wf.write(trailer)

    # Looks for latest file in reports directory
    # if latest file found is not the correct
    # batch id, user can input batch id manually
    if os.path.exists(latest_report):
        print('\n\nThe latest Financial LIVE batch id is:\n\n' + latest_batch_no +
              ' run on ' + (datetime.fromtimestamp(report_date).strftime('%b-%d-%Y @ %H:%M:%S\n')))
        confirmation = raw_input("\nIs this the correct batch id you are looking for?\n\nEnter Y if yes, or N if no, or Q to quit: ")
        confirmation = confirmation.lower()

        if confirmation == 'y' or confirmation == 'yes':
            batch_no = str(latest_batch_no)
            batch_no = batch_no.upper()
            infile = reports_dir + batch_no
            pid = batch_no[-3:]

        elif confirmation == 'n' or confirmation == 'no':
            batch_no = validate_batch_input("Please enter the correct Job Batch No: ")
            infile = reports_dir + batch_no
            pid = batch_no[-3:]

        elif confirmation == 'q' or confirmation == 'quit':
            exit()

        else:
            print("\nCould not identify batch number please exit and try again.")

        outfile = tape_out + batch_no + 'RR'
        create_stars()
        os.chmod(outfile,0660)
        os.chown(outfile,os.geteuid(),1001)
        print("\nStars output file is complete and located in tape_out directory.\nDBA can export file from RSupply via normal methods")

    else:
        print('No valid JSF404 file found')

def main():
    val_parms()
    run_stars_creator()

if __name__ == "__main__":
    main()

