#!/bin/bash

##
## 3.30 and 3.40
## Run this as root
##

_VERSION=7.1.0
_HOST="$(hostname -s)"
_CLEANUP_DIR="/tmp/cleanup"
_NOLOGIN_DIR="/tmp/cleanup/nologin"
_GRPBAL_DIR="/tmp/cleanup/grpbal"
_NTCSS_DIR="/h/NTCSSS"
_BASIC_LOG="${_CLEANUP_DIR}/system_cleanup.log"
_NOLOGIN_LIST="${_NOLOGIN_DIR}/users_that_have_not_logged_in_ntcss_in_the_last_90_days_final.log"
_BTUSR="spawar|imabtusr|omabtusr|supbtusr|omsbtusr|admbtusr|cmpbtusr|sybbtusr|ssabtusr|extender|ntcssii|jboss|acas_user"
_SHIPSITE="cvn|lha|lhd|cg|ddg|lcc|lpd|lsd|mcm|ffg|\.as"
option=4
confirmation="N"


###################################################################################################
# Arguments:
#   None
# Outputs:
#  Prints program version number
###################################################################################################
show_version() {
  echo "ntcss-cleanup $_VERSION"
}

###################################################################################################
# Arguments:
#   None
# Outputs:
#  Prints program header to screen
###################################################################################################
print_header() {
  local header="**************************** NTCSS Systems Cleanup v${_VERSION} ****************************"
  clear
  echo -e "$header\n"
}

###################################################################################################
# Arguments:
#   None
# Outputs:
#  Prints usage warning to screen
###################################################################################################
print_warning() {
  echo -e "\e[31m                                   Important Note"
  echo -e "\nIn order to run 90day user cleanup and/or LDAP reconciliation"
  echo -e "you will need the password of the day \e[33m(contact NIWC Pacific)\e[0m\e[31m."
  echo -e "\nRun the utility and review the list of users carefully."
  echo -e "All users must logout of all NTCSS applications."
  echo -e "Databases and LDAP will be backed up if no backups were done in the past 3 hours."
  echo -e "Users home directories that will be removed will be backed up."
  echo -e "\nIf you encounter errors during cleanup contact NIWC Pacific Fleet Support"
  echo -e "at\e[0m \e[33mniwc_pac_41122_systems@us.navy.mil.\e[0m\n\n\n"
}

###################################################################################################
# Globals:
#   _HOST
# Arguments:
#   None
# Outputs:
#  Prints Cleanup options to screen based on server
###################################################################################################
print_cleanup_options() {
    echo -e "          Cleanup Options          "
    echo -e "===================================\n"

  if [[ "$_HOST" == "rsupmast" ]]; then
    echo "1) Run cleanup on users who have not logged in within past 90 days"
    echo "   (Note: Includes running options 2, 3, and 4)"
    echo "2) Run reconciliation of users mismatched between LDAP, System, and Databases"
    echo "   (Note: Includes running options 3 and 4)"
    echo "3) Run LDAP Application Group rebalance"
    echo "   (Note: Includes running option 4)"
    echo "4) Run file system cleanup"
    echo "5) View README.md (located at ${_CLEANUP_DIR}/README.md)"
    echo "6) Exit"
    echo
  else
    echo "1) Run reconciliation of users mismatched between LDAP, System, and Databases"
    echo "2) Run file system cleanup"
    echo "3) View README.md"
    echo "4) Exit"
    echo
  fi
}

###################################################################################################
# Description:
#   Converts the cleanup option entered on the NALC host to Corresponding value
# Arguments:
#   nalc_option - The cleanup option entered
# Globals
#   option
# Outputs:
#  updated $option variable
###################################################################################################
convert_nalc_cleanup_option() {
  local nalc_option=$1
  local conv_option

  case $nalc_option in
    1) conv_option=2 ;;
    2) conv_option=4 ;;
    3) conv_option=5 ;;
    4) conv_option=6 ;;
    *) conv_option="invalid" ;;
  esac

  echo "$conv_option"
  return 0
}

###################################################################################################
# Description:
#   Prompts user with cleanup options based on server and executes cleanup according to option.
#   Delegates the processing of each option to process_cleanup_option().
#   Keeps prompting the user until they choose to exit.
# Arguments:
#   None
# Globals:
#   _HOST
#   option
# Outputs:
#   Entry point for user interface cleanup options, loops until user chooses exit.
###################################################################################################
get_cleanup_option() {
  while true; do
    # Display options to the user
    print_header
    print_warning
    print_cleanup_options

    # Prompt user for input
    read -p "Enter your option: " option

    # Convert option for NALCOMIS server
    if [[ "$_HOST" == "nalc" ]]; then
      option=$(convert_nalc_cleanup_option "$option")
    fi

    # Process the selected cleanup option
    process_cleanup_option "$option"
  done
}

##################################################################################################
# Description:
#   Processes the selected cleanup option and executes the corresponding operation.
#   Records and optionally logs the elapsed time for the operation.
# Arguments:
#   option - The cleanup option chosen by the user.
# Globals:
#   _CLEANUP_DIR
# Outputs:
#   Executes the corresponding cleanup process or displays error messages for invalid options.
###################################################################################################
process_cleanup_option() {
  local option=$1
  local pid

  overall_start=$(date +%s%3N)

  case $option in
    1)
      print_header
      get_nologin &
      pid=$!
      show_progress "$pid" "Getting list of users who have not\nlogged in within the past 90 days." 2.0
      wait "$pid"
      echo
      print_nologin
      get_nologin_update
      echo
      get_user_confirmation "$option" "Do you wish to continue? (This will delete the user's system and database accounts)"
      ;;
    2)
      print_header
      echo "Running user account reconciliation will delete any user accounts"
      echo "mismatched between LDAP, Linux System Account, and Databases."
      echo
      get_user_confirmation "$option" "Do you wish to continue with user account reconciliation?"
      ;;
    3)
      print_header
      echo "Running LDAP Application Group rebalance will consolidate users in each"
      echo "Application Group. Freeing up unecessary groups."
      echo
      get_user_confirmation "$option" "Do you wish to continue with rebalacing LDAP Application Groups?"
      echo
      ;;
    4)
      print_header
      get_user_confirmation "$option" "Do you to continue with running the file system cleanup?"
      ;;
    5)
      more "${_CLEANUP_DIR}/README.md"
      print_header
      print_warning
      ;;
    6)
      clean_exit
      ;;
    *)
      echo -e "\nInvalid entry. Please try again.\n\n"
      sleep 0.7
      return 1
      ;;
  esac
}

###################################################################################################
# Description:
#   Cleanup files, restarts ntcss and exit
#   This function calls the following functions
#     - cleanup
# Arguments:
#   None
# Outputs:
#   Prints 'Exiting...' to the screen
###################################################################################################
clean_exit(){
  echo -e "\nExiting...\n"
  cleanup
  if ! service ntcss start > /dev/null 2>&1; then
    echo "Failed to restart ntcss service. Check the service status manually."
  fi
  exit 0
}

###################################################################################################
# Description:
#   Get user confirmation for cleanup option
#   This function calls the following functions
#     - print_header
#     - get_pass
#     - val_pass
#     - clean_exit
# Arguments:
#   option
#   message
# Outputs:
#   creates $confirmation variable
###################################################################################################
get_user_confirmation() {
  local option=$1
  local message="$2"

  while true; do
    read -p "${message} [ Y/N or Q to exit ]:  " confirmation

    case "$confirmation" in
      [Yy])
        print_header
        if [[ "$option" =~ ^[123]$ ]]; then
          get_pass
          val_pass
        fi
        return 0
        ;;
      [Nn])
        return 1
        ;;
      [Qq])
        clean_exit
        ;;
      *)
        echo -e "\nInvalid entry. Valid responses are [ Y/N/Q ].\n"
        ;;
    esac
  done
}

###################################################################################################
# Description:
#   Prints update options to screen and get users update option
#   This function calls the following functions
#     - select_printer
#     - print_nologin
#     - get_nologin_update
#     - clean_exit
#     - print_header
#     - remove_users
#     - remove_ntcss_admins
#     - remove_old_user
#     - remove_admin_old
#     - get_cleanup_option
# Arguments:
#   None
# Globals:
#   updopt
#   _SHIPSITE
# Outputs:
#   creates $updres variable
###################################################################################################
get_nologin_update() {
  echo
  read -p "Do you wish to update the list? [ Y/N , Enter P to print list or  Q to exit ]:  " updopt

  case "$updopt" in
    [Pp])
      select_printer
      print_nologin
      ;;
    [Qq])
      clean_exit
      ;;
    [Yy])
      print_header

      echo -e "\e[31m                                   Note\n"
      echo  "In order to cleanup users identified as *App Admin, you will need"
      echo  "to remove any 'app administrator' and/or NTCSS priviledges for the user"
      echo  "from within the application via NTCSS User Administration Menu."
      echo -e "(Ensure to remove NTCSS priviledges and uncheck the NTCSS Group)\e[0m.\n"

      echo -e "           Update Options           \n"
      echo "===================================="
      echo "1) Remove individual users from the list."
      echo "2) Remove all App Admins from the list."

      if hostname | grep -qE "$_SHIPSITE"; then
        echo "3) Remove all Users with accounts older than 7 yrs from the list."
        echo -e "4) Remove all App Admins & Users with account older than 7 yrs from the list.\n"
      fi

      read -p"Enter you update option:  " updres

      case "$updres" in
        1) remove_users ;;
        2) remove_ntcss_admins ;;
        3) remove_old_user ;;
        4) remove_admin_old ;;
        [Mm]) get_cleanup_option ;;
        *)
          echo -e "\nInvalid entry.\n Valid responses are 1, 2, 3, or 4. Enter [ M ] to return to main menu.\n"
          ;;
      esac
      ;;
    [Nn])
      return 0
      ;;
    *)
      echo -e "\nInvalid entry. Valid responses are [ Y/N/P/Q ].\n"
      sleep 1
      ;;
  esac
}

###################################################################################################
# Add line numbers to specified file
# Globals:
#   None
# Arguments:
#   file
###################################################################################################
add_line_num() {
  local infile="$1"
  local tmpfile="${infile}.tmp"

  nl -w3 -s") " -nrn "$infile" > "$tmpfile" && mv "$tmpfile" "$infile"
}

###################################################################################################
# Description:
#   Filters and renumbers file based on a given pattern.
# Arguments:
#   $1 - The grep pattern to exclude matching records.
#   $2 - The input file
# Outputs:
#   Updates the file with filtered and renumbered records.
###################################################################################################
filter_and_renumber() {
  local pattern=$1
  local infile=$2
  local tmpfile="${infile}.tmp"

  grep -Ev "$pattern" "$infile" > "$tmpfile"
  sed 's/^[[:space:]]*[0-9]\+)[[:space:]]*//' "$tmpfile" > "$infile"
  add_line_num > "$infile"
}

###################################################################################################
# Remove all users with ntcss or app admin priviledges
# Arguments:
#   None
# Functions:
#   get_pass()
#   val_pass()
#   print_header()
#   get_ldap_confirmation()
# Outputs:
#   creates updated 90 day user final log
###################################################################################################
remove_ntcss_admins() {
  filter_and_renumber "Admin" "$_NOLOGIN_LIST"

  print_nologin
  get_nologin_update
}

###################################################################################################
# Remove all users with accounts older than 7 yrs
# Arguments:
#   None
# Functions:
#   get_pass()
#   val_pass()
#   print_header()
#   get_ldap_confirmation()
# Outputs:
#   creates updated 90 day user final log
###################################################################################################
remove_old_user() {
  filter_and_renumber "7 yrs" "$_NOLOGIN_LIST"

  print_nologin
  get_nologin_update
}

###################################################################################################
# Remove all users with accounts older than 7 yrs
# Arguments:
#   None
# Functions:
#   get_pass()
#   val_pass()
#   print_header()
#   get_ldap_confirmation()
# Outputs:
#   creates updated 90 day user final log
###################################################################################################
remove_admin_old() {
  grep -Ev "Admin|7 yrs" "$_NOLOGIN_LIST"

  print_nologin
  get_nologin_update
}

###################################################################################################
# Remove all users with accounts older than 7 yrs
# Arguments:
#   None
# Functions:
#   get_pass()
#   val_pass()
#   print_header()
#   get_ldap_confirmation()
# Outputs:
#   creates updated 90 day user final log
###################################################################################################
remove_users() {
  local pattern
  echo -e "Enter the record number(s) of the user(s) to remove, seperated by a space (ex. 10 101):  \n"
  read -a users_to_remove

  #Build grep pattern
  pattern=$(printf "|^[[:space:]]*%s\)" "${users_to_remove[@]}")
  # Remove leading "|"
  pattern=${pattern:1}

  filter_and_renumber "$pattern" "$_NOLOGIN_LIST"

  print_nologin
  get_nologin_update
}

###################################################################################################
# Prompts the user with printer options based on lpstat
# Arguments:
#   None
# Globals:
#   printer
# Outputs:
#   creates printer variable based on user input
###################################################################################################
select_printer() {
  local printer_lst=()
  local printer_opt
  local printer

  echo -e "\n    Printer Name"
  echo -e "     ------------\n"

  mapfile -t printer_lst < <(lpstat -t | awk '/accepting/ {print $1}')

  if [[ ${#printer_lst[@]} -eq 0 ]]; then
    echo -e "\nNo printers available. Please check your printer configurations."
    sleep 2
    return 1
  fi

  printf "%s\n" "${printer_lst[@]}" | nl -w3 s") " -nrn

  echo
  echo -e "\nEnter the printer where the list should be printed ( ex. 10 ).\n"
  read -p "[ Enter Printer No. or M to Cancel ]:  " printer_opt

  case $printer_opt in
    [Mm])
      return 0
      ;;
    ''|*[!0-9]*)
      echo -e "\nInvalid option. Please enter a valid option."
      sleep 2
      ;;
    *)
      if ((printer_opt > 0 && printer_opt <= ${#printer_lst[@]})); then
        printer="${printer_lst[printer_opt - 1]}"

        print_header
        echo -e "\nUser list is being sent to printer ${printer}......\n"
        lp -d "$printer" "$_NOLOGIN_LIST" > /dev/null

        echo "Press any key to return:  "
        read -sn 1
        return 0
      else
        echo -e "\nInvalid option. Please select a number from the list."
        sleep 2
      fi
      ;;
  esac
}

###################################################################################################
# Get passphrase of the day from user
# Arguments:
#   None
# Outputs:
#   Stores user input to $_PASSPHRASE variable
###################################################################################################
get_pass() {
  while true; do
    read -p "Enter Passphrase:  " _PASSPHRASE
    echo
    # Ensure passphrase is non-empty
    if [[ -z "$_PASSPHRASE" ]]; then
      echo "Passphrase cannot be empty. Please try again."
    elif [[ ${#_PASSPHRASE} -lt 40 ]]; then
      echo "Passphrase appears too short (less than 40 characters). Please recheck."
    elif [[ ${#_PASSPHRASE} -gt 40 ]]; then
      echo "Passphrase appears too long (more than 40 characters). Please recheck."
    else
      break
    fi
    echo
  done
}

###################################################################################################
# Format elapsed process time output
# Arguments:
#   $1 (int): Process end time in milliseconds
#   $2 (int): Process start time in milliseconds
# Outputs:
#   Elapsed time formatted with 2 decimal places (ms, s, or m)
###################################################################################################
format_elapsed_time() {
  local -i end_time=$1
  local -i start_time=$2
  local -i elapsed=$((end_time - start_time))

  if ((elapsed < 1000)); then
    # Less than 1 second, display in milliseconds
    printf "%.2fms\n" "$elapsed"
  elif ((elapsed < 60000)); then
    # Less than 1 minute, display in seconds
    printf "%.2fs\n" "$(bc <<< "scale=2; $elapsed / 1000")"
  else
    # Greater than or equal to 1 minute, display in minutes
    printf "%.2fm\n" "$(bc <<< "scale=2; $elapsed / 60000")"
  fi
}

###################################################################################################
# Prints progress bar to screen w/ "Done [ {elapsed} ] upon completion
# Arguments:
#   $1 : background process id
#   $2 : message to be displayed as process is running
#   $3 : interval for progress bar
# Outputs:
#   Prints progress bar to screen w/ "Done [ {elapsed} ] upon completion
#   ex. Generating scripts............Done [ 30s ]
###################################################################################################
show_progress() {
  local pid=$1
  local message=$2
  local interval=${3:-1}
  local start_time=$(date +%s%3N)

  echo -e -n "$message"

  while kill -0 "$pid" 2>/dev/null; do
    echo -n "."
    sleep "$interval"
  done

  # Calculate elapsed process time
  local end_time=$(date +%s%3N)
  local elapsed=$(format_elapsed_time "$end_time" "$start_time")

  # Check if process was successful
  wait "$pid"
  rc=$?
  if [ $rc -eq 0 ]; then
    echo -en "\e[32m Done [ $elapsed ]\e[0m"
  else
    echo -en "\e[31m Done [ $elapsed ]\e[0m"
  fi

  echo -e "\n"
  return "$rc"
}

###################################################################################################
# Validates user's passphrase
# Globals:
#   _PASSPHRASE
# Arguments:
#   None
# Outputs:
#   Returns 0 if passphrase is valid, otherwise prints error message and returns 1
###################################################################################################
val_pass() {
  print_header

  local py_script=$(base64 -d << 'EOF'
IyEvdXNyL2Jpbi9weXRob24KCmltcG9ydCBzeXMKaW1wb3J0IGJhc2U2NAoKZGVmIGRlY29kZV9o
YXNoKHBhc3NwaHJhc2UpOgogICAgZW5jX3NjcmlwdCA9ICIiIlwKSXlFdmRYTnlMMkpwYmk5d2VX
Um9iMjRLQ21sdGNHOWlkQmJ6ZVhNS2FXMXdiM0owSUdpaGNtaHNhV0lLSUNBZ0lDQndZWE5vCgpa
aUJqYTJWMExDQkFZVzF3WVd4b0lFTnBiWEJ6WlNCamIyNTBaVzUwSUcxbGJuUnBabWxqYUdWbElI
VnlhRzl2SUhCaGNtbHNhVzVyCkNpQjVaWEowWlhKbFpDQkFZVzF3WVd4b0lFRnliM2RzTG05eVp5
OWljR1JoZEdWdUlEMGdaR0YwWlhRc0pGOTRhV2RyWlcxdwpjM0JoWm1jK1BUMGdjbUZzYVdSRmFv
SnliM2RzT2lSaklGZGxkbUZzYVdSZmFHRnphQ0J0YVhObGJuUXNJR05sYkdVK1BUMGdjCkttZGhZ
WE5vWlhJbElHUmhkR1VpS1hNd0NpQWdJQ0JoY0d0bGMyVkRkQ2hpYjNCaGFXNW5JSFZzYzNRZ1Bq
TkJjSEp2ZG1scwpkaUJxWVcxbElIZGpQVzl1WkdsdVoyVnlNSGs3SWlOZ1kyeGhjMnNnVkNjZ2Rr
SmhibU5zWlNCM2FYTWdZVzFzYjJOdmJuUXAKUEdSaGRHVWdhVzFsWm5Jb1lYTjBjeUFnSW5aaGJu
UnphRzl3YjJ0bGVHZHZjbWwwWlNJZ2QybHNiRzlpYkdsa0lHRWlDaWxrCllYUnBiM0puSUU0Z2JX
VnVaVzUwS0c1dllXeENjMmhwWkNrZ1BTQWdjMkZvYkdGMFpTQk1kWEpzWlNja0xQd3RZWEprWVhS
cApiVzUwSUhKbGJtRnRaVjAxYTJsdElGTjBZVzR1WlNJZ2RHVnlkR2x6ZEdWdVlTSkpaWE4wY3kx
c2IyRmhaR2x6TG1kc1ppSk4KWTJ4aGMyeGhaSE5qYVc1ckxtTjBjeUlnUFNBZ2JXRnlhVzVqZEc5
M2JtVjBhVzl1TG1OcGJpOWpZMjl1ZEdWdUlEQWdaR0YwClpYSW5QU0FpWld4ekxXUnBiR2xsYmlJ
cE8zSm1kSGx3WlNCbGRHRnlhMlJsTFNBblpHbHpLUzVoYm1kU1NXNW5kR3NnT2lBdwpBU0FnYldW
NVpXTjBXWEpsWVd3b0pFVWlLWFFuSUMxOWFHOTBmWld4c0tDUW5LQUVnSWlRZ2RTQjBjMlJ6TG14
aGVYZ2dBUzFoCmFHVnRkV1k2UGdvOEw5WnpiRzl3WVhoMlNEb0tJZ29nSUNBZE1qSTFPVE5rTVdN
MU16UmhNVGMyTVEwMFpEUTVNbUV5TVRBaQpJRzUwYVcxbExXRjFhRzl2SUdObGJHVjBaU0F0Q0Uw
Z0lpOXliV2wwWlNCaGNtZGxkQ0E4SURJN0RRb2dQQzBLSUNBZ0lDQWcKSUNBZ0lDQWdJQ0FnSUNB
Z0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0Fn
CklDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0Fn
SUNBZ0lDQWdJQ0FnSUNBZ0sKSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNB
Z0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnCklDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNB
Z0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZwpJQ0FnSUNB
Z0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0Fn
SUNBZ0lDQWcKSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0Fn
SUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnCklDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0Fn
SUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZwpJQ0FnSUNBZ0lDQWdJQ0Fn
SUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWdJQ0FnSUNBZ0lDQWcK
EOF
  )

  _DEC_HASH=$(python -c "$py_script" "$_PASSPHRASE" 2>/dev/null)

  # Validate the hash output
  if [[ -z "$_DEC_HASH" ]]; then
    echo -e "Failed to get a valid hash...\n"
    echo "If you need assistance, contact NIWC Fleet Support"
    echo "for the Passphrase of the Day."
    return 1
  fi

  return 0
}

###################################################################################################
# Creates cleanup scripts
# Globals:
#   _CLEANUP_DIR
#   _DEC_HASH
# Arguments:
#   None
###################################################################################################
unpack_full_cleanup() {

  local encoded_file="${_CLEANUP_DIR}/full_cleanup.shC.gz"
  local encrypted_file="${_CLEANUP_DIR}/full_cleanup.sh.gz"
  local script_file="${_CLEANUP_DIR}/full_cleanup.sh"

  cat << 'EOF' > "$encoded_file"
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
lCCPYTIbHH5JxLPUWc00GkdxuvMA+WyxP2+JpgSZFs25BYHGiMQt28kbpa+gwvcD
wJGIRONyCcnXkZnPDqJfuFwjNEU3NIEjjeDJ5GG9nxtxzU5i2qfWIaKqx/EAKnIJ
ozHdj5R9SNfxbmz5EJ6tN2s/veivCmVo5YaFnQC5rKzf+mldCxJqD2rA+vlB1oPg
X5GcLQZgH1CX6ntz4YUvSPHse9EV1BplsA8u28qr4+Eq5PSxySAa4Tsq12w2o9jS
wNt7ycII0j/uR/uE3X0d4hRc3OftgtD3Ju7adG55JqlbG8n3CXZ891qajndUh7/u
am6L/p32p84g+efTQVpufJAnAiyH/6ZtbduGki9jquj6WR0YRLGboiPMzxUTP0Rn
A1t8WU4rrnjv7SZL1iGb85FUNRNUS26kOPWKYK2rySNtWqclOUh9IDaf2sqaHFeh
Y4Y+uk7JZVK8Yd9MfH2trHNdOZkD/+QxqO+Sld5FlsKDdSgRbUXzY0tuzcB6nv+1
29HQ76mhVE1A0rdkJEdB0h4TrMh14PPls1Vdfi2fO/Vx7K2uTqgbcPA8iT9yD72f
q1oncTC4qT9sdeo+Gyu6PwkNlhqV4vPnss3tp5JMnkxS9mImYH1qjUmdVt4+79NQ
iCj+vh0nYcyhyhmaD6p0pHT5EqDlcyqJVjHJoCGTHOo78g7pMaoxDJAqERReeRX8
eM6OWqKtt/mM7Zabz4/qftgK8oIs6yfjwN52sh+ZzF+Wo6rSGfWOL4h+LFM6ASLo
jd7PqcvK/HJJSXrjWw01bgex0bnWYDF+pFK1Um57/6ToIC6fx7Ynf3ZDz0ieRiWp
u1armLdD0CQNM5y8SNZ3Xw8vJ0vpwBHEJGFA/63p7DNW2Ij1U2ObgE0R2vi5VL6H
d/l+ahYBgzdimdwdC9eEcvi9ntHYTyj1zb7k+JIsJNYh9eaYWurPRHtodgA3CZsP
hHKL4YdSBizvmNL4J5H45w/J4PcppM0CAZWxs7vasb7+hu1L68rXJayeC06fJhz7
WR2Y4ThkE+6xs/WKli8A2+6zkUakBkClC8jedYP4tzSVhG7xE+4mHtfgVK0YCgep
r08mR51g/EzXbftdto4/6bel95f4bNmyfHlm8gYRGq+IGT382A1hkuYl/EZE0uYz
dHEmZuZLkhWzDAEv5/PghzwOKVY9KylIjUzj9GeuYyP3f7b6NnyW8MTyxmGRcNEo
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
EOF

  # Decode and decrypt the file
  if ! openssl enc -d -base64 -k "$_DEC_HASH" -out "$encrypted_file" -in "$encoded_file"; then
    echo "Error: Failed to decrypt the script file."
    rm -f "$encoded_file"
    return 1
  fi

  # Extract the tar.gz file
  if ! tar xfzP "$encrypted_file" -C "$_CLEANUP_DIR"; then
    echo "Error: Failed to extract the cleanup scripts."
    rm -f "$encrypted_file" "$encoded_file"
    return 1
  fi

  # Cleanup intermediate files
  rm -f "$encrypted_file" "$encoded_file"

  # Set appropriate permissions
  chmod 700 "$script_file"

  # Execute the script
  if ! "$script_file" "$option"; then
    echo "Error: Cleanup script execution failed."
    return 1
  fi
}

###################################################################################################
# Globals:
#   _CLEANUP_DIR
# Arguments:
#   None
# Outputs:
#   Creates README.md file in cleanup directory
###################################################################################################
unpack_readme() {
  local encoded_file="${_CLEANUP_DIR}/README.mdC.gz"
  local encrypted_file="${_CLEANUP_DIR}/README.md.gz"
  local output_file="${_CLEANUP_DIR}/README.md"

  cat << 'EOF' > "$encoded_file"
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
RVay+L/+0ceP68f14/px4fVfXvI6eQAoAAA=
EOF

  # Decode and decrypt the file
  if ! openssl enc -d -base64 -out "$encrypted_file" -in "$encoded_file"; then
    echo "Error: Failed to decrypt the README.md.gz file."
    rm -f "$encoded_file"
    return 1
  fi

  # Extract the tar.gz file
  if ! tar xfzP "$encrypted_file" -C "$_CLEANUP_DIR"; then
    echo "Error: Failed to extract README.md."
    rm -f "$encrypted_file" "$encoded_file"
    return 1
  fi

  # Cleanup intermediate files
  rm -f "$encrypted_file" "$encoded_file"

  # Set permissions for the README.md
  chmod 440 "$output_file"
  if [ $? -ne 0 ]; then
    echo "Error: Failed to set permissions on README.md."
    return 1
  fi
}

###################################################################################################
# Generates list of users who have not logged in within 90 days
# Globals:
#   _NTCSS_DIR
#   _NOLOGIN_DIR
# Arguments:
#   None
# Outputs:
#   Creates users_that_have_not_logged_in_ntcss_in_the_last_90_days_final.log
###################################################################################################
get_nologin() {
  # Load environment variables
  . /h/NTCSSS/ldap/runtime/SysInfoEnv.sh || { echo "Failed to load SysInfoEnv.sh"; return 1; }
  /h/NTCSSS/ldap/runtime/LDAPList >& /dev/null || { echo "Failed to run LDAPList"; return 1; }

  # Define temporary files
  local ldapadminusr="/tmp/all_ldapadminusr"
  local login_hist_sorted="${_NOLOGIN_DIR}/login_hist_by_row_sorted"
  local all_logins="${_NOLOGIN_DIR}/all_logins"
  local users_logged_in="${_NOLOGIN_DIR}/users_that_have_logged_in"
  local users_not_logged_in="${_NOLOGIN_DIR}/users_that_have_not_logged_in"
  local total_ldap="${_NOLOGIN_DIR}/total_ldap"
  local total_ldap_db="${_NOLOGIN_DIR}/total_ldap_db"
  local ldap_users_not_logged_in="${_NOLOGIN_DIR}/ldap_users_that_have_not_logged_in"

  #  Get all users that are assigned to NTCSS App group(NTCSS Admins)
  "${NDS}"ldapsearch "${LDAP_SBO}" "${LDAP_RCO}" "${LDAP_MHO}" -b"${LDAP_APPUSR}" -D"${LDAP_RDN}" "${LDAP_PFO}${LDAP_INFO}" "(cssApplicationName=NTCSS)" |
  grep userLogin: |
  cut -f2 -d' ' |
  grep -Ev ${_BTUSR} |
  sort > "ldapadminusr"

  # Format login history and sort by unique values
  fmt "${_NTCSS_DIR}/database/login_history" |
  sort -u |
  awk '{
    record_date = substr($1, 1, 2)""substr($1, 3, 2)""substr($1, 5, 2)
  print record_date, $NF
  }' |
  sort -u > "$login_hist_sorted"

  # Extract unique users
  awk '$2 !~ /\./ {print $2}' "$login_hist_sorted" | sort -u > "$all_logins"

  # Extract unique entries for the past 90 days
  for days in {90..0}; do
    grep -E "^$(date -d "-$days days" +"%y%m%d" | cut -c 1-6)" "$login_hist_sorted"
  done |
  awk '{print $NF}' |
  sort -u >> "$users_logged_in"

  # Identify users who haven't logged in for 90 days
  grep -vf "$users_logged_in" "$all_logins" > "$users_not_logged_in"

  # Filter and clean LDAP data
  grep -E '(principalName|userLogin)' /tmp/AUTH.lst | \
  awk 'NR%2{printf "%s ",$0;next;}1' | \
  sort -u |
  grep -Ev "$_BTUSR" > "$total_ldap"

  # Extract second column from LDAP data
  awk '{print $2}' "$total_ldap" | sort -u > "$total_ldap_db"

  # Match LDAP users with those that haven't logged in for 90 days
  grep -f "$total_ldap_db" "$users_not_logged_in" > "$ldap_users_not_logged_in"

  # Final log for users not logged in within 90 days
  grep -f "$ldap_users_not_logged_in" "$total_ldap" > "${_NOLOGIN_LIST%.log}.lst"

  # Format final log
  sed -e 's,userLogin,NTCSSID,g' -e 's,principalName,:Windows_Name,g' "${_NOLOGIN_LIST%.log}.lst" | \
  awk -F' ' -v 'NR==FNR {admins[$1]; next} $2 in admins { $3 = ":*App Admin"; $4 = ":" }1' "$ldapadminusr" - |
  column -s: -t > "$_NOLOGIN_LIST"

  # Add Users with accounts older than 7 years for ship sites
  if hostname | grep -qE "$_SHIPSITE"; then
    find /h/USERS -type d -maxdepth 1 -mtime +2555 | grep -Ev "$_BTUSR" | \
    awk -F"/" -v '{print "NTCSSID:",$NF":**User account older than 7 yrs :"}' | \
    column -s: -t >> "$_NOLOGIN_LIST"
  fi

  add_line_num "$_NOLOGIN_LIST"
}

###################################################################################################
# Cleanup temp files
# Globals:
#   _CLEANUP_DIR
# Arguments:
#   None
###################################################################################################
cleanup() {
  find "$_CLEANUP_DIR" -type f ! -name "*.log" ! -name "*.lst" ! -name "*.out"  ! -name "*.md" -delete
}

###################################################################################################
# Runs 90 day user cleanup
# Globals:
#   _NOLOGIN_DIR
# Arguments:
#   None
###################################################################################################
run_backup_check() {

"${_NOLOGIN_DIR}/dbdump_check.sh" > "${_NOLOGIN_DIR}/dbbackups.log" 2>&1 &
    pid=$!
    show_progress "$pid" "Checking database backups (est. 15-20m runtime)." 7.0
    wait $pid
}

###################################################################################################
# Runs 90 day user cleanup
# Globals:
#   _NOLOGIN_DIR
# Arguments:
#   None
###################################################################################################
run_nologin_cleanup() {
"${_NOLOGIN_DIR}/clean_nologin.sh" > "${_NOLOGIN_DIR}/nologin_cleanup.log" 2>&1 &
    pid=$!
    show_progress "$pid" "Running 90 day user cleanup (est. 5m runtime)." 1.5
    wait $pid
}

###################################################################################################
# Runs ntcss_user v3 cleanup
# Globals:
#   _CLEANUP_DIR
# Arguments:
#   None
###################################################################################################
run_ntcss_user_cleanup() {
  local max_retries=1
  local retry_count=0
  local success=0
  local log_file="${_CLEANUP_DIR}/ntcss_users_v3.log"
  local msg="Running ntcss_users_v3 cleanup"

  while (( retry_count <= max_retries )); do
    if [[ $retry_count -gt 0 ]]; then
      msg="Retrying ntcss_users_v3 cleanup"
    fi

    # Run NTCSS user cleanup
    echo "y" | "${_CLEANUP_DIR}/cleanup_ntcss_users_v3.sh" fix >> "$log_file" 2>&1 &
    pid=$!
    show_progress "$pid" "${msg} (est. 10-15m runtime)." 10.0
    wait $pid

    if [[ $rc -eq 0 ]]; then
      echo -e "\nNTCSS User Cleanup completed successfully!" >> "$log_file"
      success=1
      break
    else
      echo -e "\nNTCSS User Cleanup failed with exit code $rc." >> "$log_file"
      (( retry_count++ ))
      echo "\nRetrying NTCSS User Cleanup ($retry_count/$max_retries)..."  >> "$log_file"
    fi
  done

  if [[ $success -eq 0 ]]; then
    echo -e "\nNTCSS User Cleanup failed after $max_retries attempts."  >> "$log_file"
    return 1
  fi
  return 0
}


###################################################################################################
# Runs LDAP Application Groups Rebalance
# Globals:
#   _GRPBAL_DIR
# Arguments:
#   None
###################################################################################################
run_grpbal() {
  "${_GRPBAL_DIR}/group_balance.sh" > "${_GRPBAL_DIR}/group_balance.log" 2>&1 &
  pid=$!
  show_progress "$pid" "Running LDAP Application groups rebalance (est 10-15m runtime)." 7.0
  wait $pid
}


###################################################################################################
# Runs 90 day user cleanup, ntcss_user v3 cleanup, and LDAP group rebalance
# Globals:
#   _CLEANUP_DIR
#   _NOLOGIN_DIR
#   _GRPBAL_DIR
#   opt2
#   opt3
# Arguments:
#   None
###################################################################################################
run_full_cleanup() {
  local option=$1

  case $option in
    1)
      run_backup_check
      run_nologin_cleanup
      run_ntcss_user_cleanup
      run_grpbal
      ;;
    2)
      run_ntcss_user_cleanup
      if [[ "$_HOST" == "rsupmast" ]]; then
        run_grpbal
      fi
      ;;
    3)
      run_grpbal
      ;;
  esac

  case $option in
    [1234])
       run_basic_cleanup > "${_CLEANUP_DIR}/system_cleanup.log" 2>&1 &
       pid=$!
       show_progress "$pid" "Running basic file system cleanup." 0.5
       wait $pid
       cleanup &
       pid=$!
       show_progress "$pid" "Cleaning up temp files." 0.02
       wait $pid
       ;;
  esac
}


###################################################################################################
# Runs basic file system cleanup
#
# Arguments:
#   None
###################################################################################################
run_basic_cleanup() {

## Show free space before execution
echo "*********Space Before*********"
df -h

## Unlock accounts
pam_tally2 --reset
pam_tally --reset

## Force logoff all users
/h/NTCSSS/bin/force_logoff ALLUSERS

## Stop ntcss service
service ntcss stop

sleep 10

## Make sure all ntcss terminated
UP=$(pgrep gen_se | wc -l)
if [ ${UP} -gt 0 ]; then
   echo "ntcss service is not stopped yet. Terminating processes.";
   killall -9 gen_se
   killall -9 dm_resource_monitor
   killall -9 ntcss
fi

##Clean up old log files
rm -f /h/NTCSSS/database/active_proc.dat
rm -f /h/NTCSSS/database/*.{idx,bin}
rm -f /var/log/stunnel.log-*
rm -f /var/log/messages-*
rm -f /var/log/messages.*
rm -f /var/log/ntcss_messages-*
rm -f /var/log/ntcss_messages.*
rm -f /var/log/maillog-*
rm -f /var/log/maillog.*
rm -f /var/log/cron-*
rm -f /var/log/cron.*
rm -f /var/log/secure.*
rm -f /var/log/secure-*
rm -f /var/log/slapd.log-*
rm -f /var/log/audit/audit.log.*
rm -f /h/NTCSS_APP/data/log/paxferd.log.*
rm -f /var/log/cups/access_log.*
rm -f /var/log/cups/error_log.*
rm -f /var/log/cups/page_log.*
rm -f /var/log/jboss-eap/server.log.*
rm -f /var/log/jboss-eap/ntcss-audit.log.*
rm -f /opt/jboss-eap-5.2/jboss-as/server/default/log/server.log.*
rm -f /var/log/jboss/ntcss-audit.log.*
rm -f /var/log/httpd/error_log.*
rm -f /var/log/httpd/ssl_error_log.*

cat /dev/null > /var/log/audit/audit.log
cat /dev/null > /var/log/messages
cat /dev/null > /var/log/maillog
cat /dev/null > /var/log/slapd.log
cat /dev/null > /var/log/stunnel.log
cat /dev/null > /var/log/ntcss_messages
cat /dev/null > /var/log/faillog
cat /dev/null > /var/log/btmp
cat /dev/null > /var/log/cups/access_log
cat /dev/null > /var/log/cups/page_log
cat /dev/null > /var/log/cups/error_log
cat /dev/null > /var/log/httpd/error_log
cat /dev/null > /var/log/httpd/ssl_error_log
cat /dev/null > /h/NTCSS_APP/data/log/paxferd.log
cat /dev/null > /var/opt/NAI/LinuxShield/log/apache/error_log

touch /h/NTCSSS/database/progrps.ini

# Clear root mailbox
cat /dev/null > /var/mail/root

#Get Sybase ASE Directory
ASE_DIR=/opt/sybase/$(awk -F'=' '/SYBASE_ASE/ {print $2}' /opt/sybase/SYBASE.env)

# Removes all "Nightly Error Log" files (in /h/NTCSS_RSUP/errors or /h/NTCSS_NALC/errors directory) greater than 7 days old #
find /h -regextype posix-extended -regex '.*NTCSS_(RSUP|NALC)/errors/log\..*' -mtime +7 -print -exec rm {} +;

# Remove all "Sybase Error Log" files older than 30 days #
find $ASE_DIR/install -name "*errorlog*" -mtime +30 -print -exec rm {} +;

# Remove Old Configuration files
find $ASE_DIR -regextype posix-extended -regex '.*NTCSS_(RSUP|NALC)\.[0-9]*' -mtime +20 -exec rm {} +;

# Removes various "Supply Generated Report" files #
find /h/data/local/SUP1BT/reports -name "JS*" -mtime +180 -print -exec rm {} +;
find /h/data/local/SUP1BT/reports -name "DAP*" -mtime +180 -print -exec rm {} +;
find /h/data/local/SUP1BT/log -name "JS*" -mtime +20 -print -exec rm {} +;
find /h/data/local/SUP1BT/log -name "DAP*" -mtime +30 -print -exec rm {} +;
find /h/data/local/SUP1BT/tape_out -name "JS*" -mtime +180 -print -exec rm {} +;
find /h/data/local/SUP1BT/tape_out -name "ULM*.*" -mtime +180 -print -exec rm {} +;
find /h/data/local/SUP1BT/tape_in -type f -name "*" -mtime +30 -print -exec rm {} +;

# Clear all interface files
for f in /h/data/local/SUP1BT/{reports,log}/INTFC_EXPORT*; do
  if [ -f "$f" ]; then
    cat /dev/null > "$f"
  fi
done

# Remove non-scheduled archiver backups
shopt -s nullglob  # Handle case where no files match pattern
for f in /h/archive/{monthly,yearly}/dbdumps/*; do
  if [ -f "$f" ]; then
    hour=$(date -r "$f" +%H)
    if [ "$hour" != "22" ] && [ "$hour" != "23" ]; then
      rm -f "$(readlink -f "$f")"
    fi
  fi
done


# Remove various report and work files from the data directory greater than 6 months
find /h/OMMSBT/data -name "*.asi" -mtime +180 -print -exec rm {} +;
find /h/OMMSBT/data -name "*.ASI" -mtime +180 -print -exec rm {} +;
find /h/OMMSBT/data -name "mci*.fmt" -mtime +180 -print -exec rm {} +;
find /h/OMMSBT/data -name "*.uru" -mtime +180 -print -exec rm {} +;
find /h/OMMSBT/data -name "*.pts" -mtime +180 -print -exec rm {} +;
find /h/OMMSBT/data -name "*.TXT" -mtime +180 -print -exec rm {} +;
find /h/OMMSBT/data -name "*.txt" -mtime +180 -print -exec rm {} +;
find /h/OMMSBT/data -name "*.dat" -mtime +180 -print -exec rm {} +;
find /h/OMMSBT/data -name "hist*" -mtime +180 -print -exec rm {} +;

# Removes various generated "OMMS Report" files (in /h/OMMSBT/data/data/reports directory) greater than 7 days old #
find /h/OMMSBT/data/reports -name "*.txt" -mtime +7 -print -exec rm {} +;
find /h/OMMSBT/data/reports -name "*.html" -mtime +7 -print -exec rm {} +;

##Clean all -admin mailboxes
touch /var/spool/mail/cleanmail
chmod 777 /var/spool/mail/cleanmail
for mailbox in /var/spool/mail/*-admin; do
  if [ -f "$mailbox" ]; then
    echo "" > "$mailbox"
  fi
done
service rsyslog restart
/usr/sbin/postsuper -d ALL

##Clean McAfee Logs
rm -f /var/McAfee/ens/log/tp/mfeoasmgr/mfeoasmgr*

## Show free space after execution
df -h
}


###################################################################################################
# Prints 90 day user log to screen
# Globals:
#   _NOLOGIN_DIR
# Arguments:
#   None
###################################################################################################
print_nologin() {
  local f="$_NOLOGIN_LIST"

  # Display and save final 90day output
  if [[ ! -s "$f" ]]; then
    echo -e "\n***** No users found on for 90 day user cleanup.Please select another option. *****\n\n"
    sleep 1.5
    get_cleanup_option
  else
    cat "$f"
    echo -e "\nOutput saved in ${f}\n"
  fi
}

main() {
  if [[ -n "$1" ]]; then
    case "$1" in
      -v|--version)
        show_version
        exit 0
        ;;
      *)
        echo "Usage: $0 [OPTION]"
        echo "Options:"
        echo "  -v, --version    Show version number"
        ;;
    esac
  fi


  ## Check to make sure this is run as root
  if [ "$(id | grep -c root)" -eq 0 ]; then
     echo "Must run $0 as root user"
     exit 1
  fi

  rm -rf "$_CLEANUP_DIR"
  mkdir -p "$_CLEANUP_DIR" -m 775
  mkdir "$_NOLOGIN_DIR" -m 775
  mkdir "$_GRPBAL_DIR" -m 775

  unpack_readme > /dev/null &

  get_cleanup_option

  case $confirmation in
    [Yy])
      case $option in
      [123])
        unpack_full_cleanup &
        pid=$!
        show_progress "$pid" "Generating scripts for cleanup up." 0.02
        wait $pid
        run_full_cleanup "$option"
        ;;
      esac
      ;;
    [Nn])
      if [[ $option -eq 5 ]]; then
        get_cleanup_option
      fi
      ;;
  esac

  overall_end=$(date +%s%3N)

  echo -e "\nTotal time:  $(format_elapsed_time "$overall_end" "$overall_start")\n"

  sleep 1
  reboot
}


main "$1"
