#!/usr/bin/env python2
"""
Run to find status of required batch jobs
in NALCOMIS and RSUPPLY
"""
from __future__ import print_function
import os
import platform

def main():
    """
    Identifies host and runs bash commands to
    batch job status
    """
    os.system('clr||clear')
    SHORT_HOST = platform.node().split('.', 1)[0]

    if SHORT_HOST == 'rsupmast':
        command = "ps -ef | grep 'JSS110\|JSS105\|INTFC'"

    elif SHORT_HOST == 'nalc':
        command = "ps -ef | grep 'hcn\|intfc'"

    else:
        sys.exit('Hostname not recognized.....exiting!!!!')

    os.system(command)


if __name__ == "__main__":
    main()

