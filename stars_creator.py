#!/usr/bin/python
import os
import glob
import subprocess
import argparse
from datetime import datetime, date
from dateutil.relativedelta import relativedelta
from dateutil.parser import parse


# Constants
DBISQL_DIR = '/opt/sybase/DBISQL'
OUTFILE = os.path.join(DBISQL_DIR, 'STARS_VAL.sql')
PD = os.path.join(DBISQL_DIR, 'pd')
PKICKOFF = os.path.join(DBISQL_DIR, 'pkickoff.sh')
CREATE_PD = "/h/NTCSSS/bin/getlinkdata -q ssabtusr > /opt/sybase/DBISQL/pd"
VALFILE = os.path.join(DBISQL_DIR, 'STARS_VAL.out')
REPORTS_DIR = '/h/data/local/SUP1BT/reports/'
TAPE_OUT = '/h/data/local/SUP1BT/tape_out/'

class StarsFileCreator:
    """
    Recreate stars output file.

    The following class recreates the stars output file
    from a JSF404 Financial (Live) report and places it
    into the tape_out directory so it can be exported
    from the application as normal.
    """
    
    def __init__(self, batch_no=None, is_monthly=None):
        self.latest_report = max(glob.glob(os.path.join(REPORTS_DIR, 'JSF404*')), key=os.path.getmtime)
        self.report_date = os.path.getmtime(self.latest_report)
        self.latest_batch_no = self.latest_report[-13:]
        self.batch_no = batch_no
        self.is_monthly = is_monthly


    @staticmethod
    def get_last_day_of_month(current_date):
        """
        Get the last day of the current month.
        """
        return (current_date.replace(day=1) + relativedelta(months=1, days=-1)).date()


    @staticmethod
    def get_last_day_of_previous_month(current_date):
        """
        Get the last day of the previous month.
        """
        return (current_date.replace(day=1) + relativedelta(days=-1)).date()


    @staticmethod
    def convert_print_str(output_str):
        """
        Convert the list of output parts to a single string and print it.
        """
        print_str = "".join(output_str).rstrip()
        print(print_str)
        return print_str


    def check_varparm_bordt(self, is_monthly, var_parm_bordt, fin_tldt):
        """
        Check and print the BOR date status.
        """
        status = 'BOR date is good!' if (is_monthly == 'n' and var_parm_bordt == self.get_last_day_of_previous_month(date.today())) or \
                                        (is_monthly == 'y' and var_parm_bordt == fin_tldt == self.get_last_day_of_month(date.today())) \
                                        else 'BOR date is no good!'
        output_parts = [
            '{:<30}'.format(status),
            '{:<40}'.format('variable_parameters.bor_dt = {}'.format(var_parm_bordt))
        ]
        print(" | ".join(output_parts))


    def check_mrdt_bortecdt(self, material_request_tldt, bor_tldt):
        """
        Check and print the material request table and BOR date status.
        """
        status = "material_request_tbl tl date matches bor_mo_tec_rpt tl date." if material_request_tldt == bor_tldt else \
                 "material_request_tbl tl date doesn't match bor_mo_tec_rpt tl date."
        output_parts = [
            '{:<60}'.format(status),
            '{:<40}'.format('material_request_tbl tl date = {}'.format(material_request_tldt)),
            '{:<40}'.format('bor_mo_tec_rpt tl date = {}'.format(bor_tldt))
        ]
        print(" | ".join(output_parts))


    def check_tl_no(self, bor_tl_no, fin_tl_no, material_request_tl_no):
        """
        Check and print the TL number status.
        """
        status = "TL numbers match." if bor_tl_no == fin_tl_no == material_request_tl_no else "TL numbers do not match!"
        output_parts = [
            '{:<30}'.format(status),
            '{:<40}'.format('bor_mo_tec_rpt tl_no = {}'.format(bor_tl_no)),
            '{:<40}'.format('fin_trnsmtl tl_no = {}'.format(fin_tl_no)),
            '{:<40}'.format('material_request_tbl tl_no = {}'.format(material_request_tl_no))
        ]
        print(" | ".join(output_parts))


    def ensure_directories(self):
        """
        Ensure that required directories exist.
        """
        if not os.path.exists(DBISQL_DIR):
            os.makedirs(DBISQL_DIR, mode=0o755)


    @staticmethod
    def get_sybase_ocs_path():
        """
        Get the path to the Sybase OCS directory.
        """
        ocs_dirs = glob.glob('/opt/sybase/OCS-*')
        if not ocs_dirs:
            raise RuntimeError('No Sybase OCS directory found.')
        return max(ocs_dirs)  # Assume the highest version is the correct one


    def create_pd_file(self):
        """
        Create the pd file by running the appropriate shell command.
        """
        subprocess.call(CREATE_PD, shell=True)
        os.chmod(PD, 0o755)
        os.chown(PD, 1000, 1000)


    def generate_sql_script(self):
        """
        Generate the SQL script for validation.
        """
        sql_text = (
            "select 'VarParmDate: ' + rtrim(cast(cast(last_bor_dt as date) as char)) from dbo.variable_parameters\n"
            "union\n"
            "(select 'bor_mo_rpt_tecFY: ' + rtrim(cast(max(fscl_yr) as char)) from bor_mo_rpt_tec)\n"
            "union\n"
            "(select 'bor_mo_rpt_tecTL: ' + rtrim(cast(max(trnsmtl_no) as char)) from bor_mo_rpt_tec where fscl_yr = (select max(fscl_yr) from bor_mo_rpt_tec))\n"
            "union\n"
            "(select 'bor_mo_rpt_tecTLdt: ' + rtrim(cast(cast(max(trnsmtl_dt) as date) as char)) from bor_mo_rpt_tec)\n"
            "union\n"
            "(select 'fin_trnsmtlFY: ' + rtrim(cast(max(fy) as char)) from fin_trnsmtl)\n"
            "union\n"
            "(select 'fin_trnsmtlTL: ' + rtrim(cast(max(trnsmtl_no) as char)) from fin_trnsmtl where fy = (select max(fy) from fin_trnsmtl))\n"
            "union\n"
            "(select 'fin_trnsmtlTLdt: ' + rtrim(cast(cast(max(bor_dt) as date) as char)) from fin_trnsmtl)\n"
            "union\n"
            "(select 'material_request_tblFY: ' + rtrim(cast(max(trnsmtl_fy) as char)) from material_request_tbl)\n"
            "union\n"
            "(select 'material_request_tblTL: ' + rtrim(cast(max(trnsmtl_no) as char)) from material_request_tbl where trnsmtl_fy = (select max(trnsmtl_fy) from material_request_tbl))\n"
            "union\n"
            "(select 'material_request_tblTLdt: ' + rtrim(cast(cast(max(trnsmtl_dt) as date) as char)) from material_request_tbl)\n"
            "go"
        )

        with open(OUTFILE, 'w') as wf:
            wf.write(sql_text)
        os.chmod(OUTFILE, 0o755)
        os.chown(OUTFILE, 1000, 1000)


    def generate_pkickoff_script(self, sybase_ocs_path):
        """
        Generate the pkickoff script for executing the SQL script.
        """
        pkickoff_text = (
            "{}/bin/isql -Ussabtusr -P$(cat {}) "
            "-SNTCSS_RSUP -Dsupply -i {} -o {}".format(
                sybase_ocs_path, PD, OUTFILE, VALFILE
            )
        )

        with open(PKICKOFF, 'w') as kf:
            kf.write(pkickoff_text)
        os.chmod(PKICKOFF, 0o755)
        os.chown(PKICKOFF, 1000, 1000)


    def execute_pkickoff_script(self):
        """
        Execute the pkickoff script and remove temporary files.
        """
        subprocess.call('su - sybase -c {}'.format(PKICKOFF), shell=True)
        os.remove(PD)
        os.remove(OUTFILE)
        os.remove(PKICKOFF)


    def parse_valfile(self):
        """
        Parse the valfile and extract relevant parameters.
        """
        with open(VALFILE, 'r') as vf:
            val_lines = vf.readlines()

        var_parm_bordt = parse(val_lines[2].strip().partition(':')[-1])
        bor_tldt = parse(val_lines[5].strip().partition(':')[-1])
        fin_tldt = parse(val_lines[8].strip().partition(':')[-1])
        material_request_tldt = parse(val_lines[11].strip().partition(':')[-1])
        bor_tl_no = val_lines[4].strip().partition(':')[-1]
        fin_tl_no = val_lines[7].strip().partition(':')[-1]
        material_request_tl_no = val_lines[10].strip().partition(':')[-1]

        return var_parm_bordt, bor_tldt, fin_tldt, material_request_tldt, bor_tl_no, fin_tl_no, material_request_tl_no


    def val_parameters(self):
        """
        Main function to validate parameters.
        """
        self.ensure_directories()
        self.create_pd_file()
        self.generate_sql_script()
        sybase_ocs_path = self.get_sybase_ocs_path()
        self.generate_pkickoff_script(sybase_ocs_path)
        self.execute_pkickoff_script()

        var_parm_bordt, bor_tldt, fin_tldt, material_request_tldt, bor_tl_no, fin_tl_no, material_request_tl_no = self.parse_valfile()

        if not self.is_monthly:
            self.is_monthly = raw_input('Is this a monthly closeout? Enter [y/n]:  ').strip().lower()
        
        print('\n')
        self.check_varparm_bordt(self.is_monthly, var_parm_bordt, fin_tldt)
        self.check_mrdt_bortecdt(material_request_tldt, bor_tldt)
        self.check_tl_no(bor_tl_no, fin_tl_no, material_request_tl_no)


    @staticmethod
    def validate_batch_input(batch_no):
        """
        Validates the batch number input by the user.
        The input must be 13 characters and start with JSF404.
        The file with new JSF must exist in the reports directory.
        Allows only 3 attempts before exiting.
        """
        if len(batch_no) != 13 or not batch_no.startswith("JSF404"):
            print("\nSorry, the batch number must be 13 characters long and begin with JSF404")
            return False
        elif os.path.exists(os.path.join(REPORTS_DIR, batch_no)):
            print("\nThe batch number entered: {} will be utilized.".format(batch_no))
            return True
        else:
            print("\nCould not identify batch number, try again.")
            return False


    @staticmethod
    def format_line(line):
        """
        Extract and format fields from a given line.
        """
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
        return di, ri, ms, fsc, niin, ui, qty, doc_no, tec, dmd, sig, fc, cog, prj, pri, adv, tn, fy, smv, rmks, fmv


    def create_stars(self, infile, outfile, pid):
        """
        Creates stars output.
        Output from validated batch number in the reports directory.
        """
        with open(infile, 'r') as rf:
            original_lines = rf.readlines()
            header = "HEADERRSUPPLY   {}\n".format(datetime.now().strftime('%Y%m%d%H%M%S'))
            output_lines = [header]
            total = 0

            for line in original_lines:
                if ('X0A' in line or 'Z0A' in line) and len(line) == 182:
                    di, ri, ms, fsc, niin, ui, qty, doc_no, tec, dmd, sig, fc, cog, prj, pri, adv, tn, fy, smv, rmks, fmv = self.format_line(line)
                    total += fmv
                    if fsc + niin == "             ":
                        formatted_line = "{}{}{}{}{}{}   {}{}{} {}{}{}   {}{}{}{}\n".format(di, ri, ms, rmks, ui, qty, doc_no, tec, sig, fc, cog, prj, pri, adv, tn, fy, smv)
                    else:
                        formatted_line = "{}{}{}{}{}  {}{}{}   {}{}{} {}{}{}   {}{}{}{}\n".format(di, ri, ms, fsc, niin, ui, qty, doc_no, tec, sig, fc, cog, prj, pri, adv, tn, fy, smv)
                    output_lines.append(formatted_line)

            rec_count = str(len(output_lines) - 1).zfill(15)  # excluding header
            trailer = "TRAILERSTARSFL   {}{}stars{}r.txt".format(rec_count, str(total).zfill(19), pid)
            output_lines.append(trailer)

        with open(outfile, 'w') as wf:
            wf.writelines(output_lines)


    def run_stars_creator(self):
        """
        Runs the stars creator process.
        """
        if not self.batch_no:
            if os.path.exists(self.latest_report):
                print('\n\nThe latest Financial LIVE batch id is:\n\n{} run on {}\n'.format(self.latest_batch_no, datetime.fromtimestamp(self.report_date).strftime("%b-%d-%Y @ %H:%M:%S")))
                confirmation = raw_input("\nIs this the correct batch id you are looking for?\n\nEnter Y if yes, or N if no, or Q to quit: ").strip().lower()

                if confirmation in ('y', 'yes'):
                    self.batch_no = self.latest_batch_no.upper()
                elif confirmation in ('n', 'no'):
                    attempts = 0
                    while attempts < 3:
                        self.batch_no = raw_input("Please enter the correct Job Batch No: ").strip().upper()
                        if self.validate_batch_input(self.batch_no):
                            break
                        attempts += 1
                    else:
                        print("Maximum number of attempts reached. Exiting program.")
                        exit(1)
                elif confirmation in ('q', 'quit'):
                    exit()
                else:
                    print("\nCould not identify batch number, try again.")
                    return
            else:
                print('No valid JSF404 file found')
                return

        infile = os.path.join(REPORTS_DIR, self.batch_no)
        pid = self.batch_no[-3:]
        outfile = os.path.join(TAPE_OUT, self.batch_no + 'RR')
        self.create_stars(infile, outfile, pid)
        os.chmod(outfile, 0o660)
        os.chown(outfile, os.geteuid(), 1001)
        print("\nStars output file is complete and located in the tape_out directory.\nDBA can export file from RSupply via normal methods.")


def main():
    """
    Main function to run the StarsFileCreator.
    """
    parser = argparse.ArgumentParser(description="Recreate stars output file from a JSF404 Financial (Live) report.")
    parser.add_argument('-b', '--batch', type=str, help="Batch number (must be 13 characters starting with JSF404)")
    group = parser.add_mutually_exclusive_group()
    group.add_argument('-m', '--monthly', action='store_true', help="Flag to indicate monthly closeout")
    group.add_argument('-d', '--daily', action='store_true', help="Flag to indicate daily closeout")
    
    args = parser.parse_args()
    
    if args.monthly:
        is_monthly = 'y'
    elif args.daily:
        is_monthly = 'n'
    else:
        is_monthly = None
    
    creator = StarsFileCreator(batch_no=args.batch, is_monthly=is_monthly)
    creator.val_parameters()
    creator.run_stars_creator()

if __name__ == "__main__":
    main()
