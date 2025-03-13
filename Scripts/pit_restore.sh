#!/bin/bash

# Script: Database Point in Time Restore Utility
# Description: Interactive script for performing point-in-time database restores
# Author: Joseph Hernandez
# Date: 15 Dec 2024
# Version: 1.0.0

_DBBKUP_DIR="/opt/sybase/dbdumps"
_HOST=$(hostname -s | cut -c1-4)
_SERVER=NTCSS_$(echo "${_HOST}" | tr '[:lower:]' '[:upper:]')
_LOGDUMP_DIR="/h/${_SERVER}/logdumps"
_HEADER="******** Point in Time Database Restore ********"

# Disable shellcheck warning for ls command
# shellcheck disable=SC2012
# shellcheck disable=SC2207
# Get list of databases from backup directory, filtering for specific database names
_DBLIST=($(ls "${_DBBKUP_DIR}" | awk -F '.' '{gsub("_dbdump", ""); print $1 }' | grep -E 'supply|NTCSSADM|ommsng|ntcss_org|p2db' | sort -u))


##############################################################################################
# Function: get_restore_db
# Description: Displays an interactive menu for selecting a database to restore
# Arguments: None
# Returns: None
# Side effects:
#   - Sets global variable restore_db with selected database name
#   - Calls get_dbdumps function with selected database
##############################################################################################
get_restore_db() {
  while true; do
    # Clear screen and display header
    clear
    echo -e "\n${_HEADER}\n"
    echo -e "Databases to Restore\n"

    # Display numbered list of available databases
    for i in "${!_DBLIST[@]}"; do
      echo " $((i + 1)) - ${_DBLIST[i]}"
    done

    # Prompt user for selection
    echo -e "\nEnter Number of Option, q to quit"
    read -r restore_opt

    # Process user input
    case $restore_opt in
      [Qq])
        echo -e "\nExiting...\n"
        exit 0
        ;;
      ''|*[!0-9]*)
        echo -e "\nInvalid option. Please enter a valid option"
        sleep 2
        ;;
      *)
        # Validate input is within range of available options
        if ((restore_opt > 0 && restore_opt <= ${#_DBLIST[@]})); then
          restore_db=${_DBLIST[((restore_opt - 1))]}
          get_dbdumps "$restore_db"
        else
          echo -e "\nInvalid option. Please select a number from the list."
          sleep 2
        fi
    esac
  done
}

##############################################################################################
# Function: get_dbdumps
# Description: Displays a list of database backup files and handles user selection
# Parameters:
#   $1 (db) - The name of the database to list backups for
# Global variables used:
#   _DBBKUP_DIR - Directory containing database backups
#   _HEADER - Header text to display
# Returns:
#   - Returns to caller if 'm' is selected
#   - Exits with 0 if 'q' is selected
#   - Calls get_incremental_option if valid backup is selected
##############################################################################################
get_dbdumps() {
  local db=$1
  local fn
  local bkup_file

  # shellcheck disable=SC2207
  # Initialize array for storing backup files
  dbdumps=($(ls "${_DBBKUP_DIR}/${db}_dbdump*"))

  # Main interaction loop
  while true; do
    clear
    echo -e "\n${_HEADER}\n"
    echo -e "\nList of Backup Files From the File System:\n"

    # Display numbered list of backup files
    for i in "${!dbdumps[@]}"; do
      # Extract filename from full path
      fn=$(echo "${dbdumps[i]}" | awk -F"/" '{print $NF}')
      echo " $((i + 1)) - ${fn}"
    done

    echo -e "\nEnter Number of Option, q to quit, m to return"
    read -r  bkup_opt

    # Handle user input
    case $bkup_opt in
      [Qq])  # Quit program
        echo -e "\nExiting...\n"
        exit 0
        ;;
      [Mm])  # Return to previous menu
        return
        ;;
      ''|*[!0-9]*)  # Handle invalid non-numeric input
        echo -e "\nInvalid option. Please enter a valid option"
        sleep 2
        ;;
      *)  # Handle numeric input
        if ((bkup_opt > 0 && bkup_opt <= ${#dbdumps[@]})); then
          bkup_file=${dbdumps[((bkup_opt - 1))]}
          get_incremental_option "$db" "$bkup_file"
        else
          # Number out of range
          echo -e "\nInvalid option. Please select a number from the list."
          sleep 2
        fi
        ;;
    esac
  done
}

##############################################################################################
# Function: get_incremental_option
# Description: Prompts user to choose whether to load incremental database logdumps
#             for point-in-time recovery. Handles user input and calls appropriate
#             functions based on the selection.
#
# Parameters:
#   $1 (db) - The name of the database to be restored
#   $2 (bkup_file) - The backup file path/name to be used for restoration
#
# Returns: None
# Side effects:
#   - Calls create_restore_sql() if user selects 'n'
#   - Calls get_logdumps() if user selects 'y'
#   - Continues looping until valid input is received
##############################################################################################
get_incremental_option() {
  local db=$1
  local bkup_file=$2

  while true; do
    # Prompt user for input
    echo -e "\n${_HEADER}\n"
    echo -e "Would you like to load incremental database logdumps to restore to a point in time?"
    read -rp "[ y / n or m to return to the previous menu ]:  " pit
    clear

    # Process user input
    case $pit in
      [Nn])
        # If no incremental restore is desired, create regular restore SQL
        create_restore_sql "$db" "$bkup_file" "$pit"
        ;;
      [Yy])
        # If incremental restore is desired, get logdump information
        get_logdumps "$db" "$bkup_file" "$pit"
        ;;
      *)
        # Handle invalid input
        echo -e "\nInvalid option. Please enter a valid option"
        sleep 2
        ;;
    esac
  done
}

##############################################################################################
# Function: get_logdumps
# Description: Manages the selection and restoration of database log dumps
# Parameters:
#   $1 (db) - Database name
#   $2 (bkup_file) - Backup file path
#   $3 (pit) - Point in time reference
# Returns: None
# Dependencies: _LOGDUMP_DIR should be set, get_dbdumps() and create_restore_sql() functions should exist
##############################################################################################
get_logdumps() {
  # Initialize local variables
  local db=$1
  local bkup_file=$2
  local pit=$3
  local fn

  # shellcheck disable=SC2207
  # Initialize array to store log dumps
  # Find all log dumps newer than the backup file
  logdumps=($(find "${_LOGDUMP_DIR}" -type f -name "${db}_logdump*" -newer "${bkup_file}" -exec ls -lt {} +))

  # Main interactive loop
  while true; do
    clear
    echo -e "\n${_HEADER}\n"
    echo -e "\nList of Incremental Backups From the File System:\n"
    # Display numbered list of available log dumps
    for i in "${!logdumps[@]}"; do
      fn=$(echo "${logdumps[i]}" | awk -F"/" '{print $NF}')
      echo " $((i + 1)) - ${fn}"
    done
    # Prompt user for selection
    echo -e "\nEnter Number of Option for the Point in Time you would like to restore to, q to quit, m to return"
    read -r logdump_opt

    # Handle user input
    case $logdump_opt in
      # Quit option
      [Qq])
        echo -e "\nExiting...\n"
        exit 0
        ;;
      # Return to database dumps menu
      [Mm])
        get_dbdumps "$db"
        ;;
      # Handle invalid input
      ''|*[!0-9]*)
        echo -e "\nInvalid option. Please enter a valid option"
        sleep 2
        ;;
      # Process valid selection
      *)
        if ((logdump_opt > 0 && logdump_opt <= ${#logdumps[@]})); then
          # Get selected log dump file
          logdump_file=${logdumps[((logdump_opt - 1))]}
          # Create array of log dumps to restore (all dumps up to selected point)
          restore_logdumps=("$(for d in "${logdumps[@]}"; do
            [[ "$d" -ot "$logdump_file" || "$d" == "$logdump_file" ]] && echo "$d"
            done)")
          # Create array of backup log dumps (all dumps after selected point)
          bkup_logdumps=("$(for d in "${logdumps[@]}"; do
            [[ "$d" -nt "$logdump_file" ]] && echo "$d"
            done)")
          # Display restoration information
          echo -e "\n${db} database will be restored to ${bkup_file}\n"
          echo -e "The following ${#restore_logdumps[@]} transaction logs will be used to restore ${db} database to ${logdump_file}\n"
          for i in "${!restore_logdumps[@]}"; do
            echo " $((i + 1)) - ${restore_logdumps[i]}"
          done
          sleep 2
          # Initiate the actual restore process
          create_restore_sql "$db" "$bkup_file" "$pit" "${restore_logdumps[@]}"
        else
          echo -e "\nInvalid option. Please select a number from the list."
          sleep 2
        fi
        ;;
    esac
  done
}

##############################################################################################
# Creates SQL restore script and sets up permissions
# Globals:
#   None
# Arguments:
#   $1 - Database name
#   $2 - Backup file path
#   $3 - Point in time restore flag (Y/N)
#   $@ - Array of transaction log dumps
# Returns:
#   None
##############################################################################################
create_restore_sql() {
  local db=$1
  local bkup_file=$2
  local pit=$3
  shift 3
  local logdumps=("$@")

  # Store sql query in variable
  restore_sql="load database ${db} from '${bkup_file}'\ngo\nprint ''\nprint ''\ngo\n"

  # Add sql for each transaction log
  case $pit in
    [Yy])
      for d in "${logdumps[@]}"; do
        restore_sql+=$(echo -e "\nload tran ${db} from '${d}'\ngo\nprint ''\nprint ''\ngo\n")
      done
      ;;
  esac

  # Bring database online
  restore_sql+="\nonline database ${db}\ngo"

  echo -e "$restore_sql" > /tmp/pit_restore.sql
  chmod 750 /tmp/pit_restore.sql
  chown sybase:sybase /tmp/pit_restore.sql
  run_restore "$pit"
}

##############################################################################################
# Executes the database restore operation
# Globals:
#   _SERVER
# Arguments:
#   $1 - Point in time restore flag (Y/N)
# Returns:
#   0 if successful, 1 if failed
##############################################################################################
run_restore() {
  local pit=$1

  echo -e "\nRunning restore.......\n"

  su - sybase -c "cat /opt/sybase/pd | isql -Ussabtusr -S${_SERVER} -w3000 -X -b -i /tmp/pit_restore.sql"
  rc=$?

  if [[ $rc -eq 0 ]]; then
    echo -e "\n\e[32mRestore completed successfully!\e[0m\n"

    # If transaction log restore successful archive unneeded log dumps
    case $pit in
      [Yy])
        move_logdumps
        ;;
    esac
    exit 0
  else
    echo -e "\n\e[31mError running restore......\e[0m\n"
    exit 1
  fi
}

##############################################################################################
# Moves transaction log dumps to backup directory
# Globals:
#   _SERVER
#   bkup_logdumps
# Arguments:
#   None
# Returns:
#   None
# Side effects:
#   Creates backup directory if it doesn't exist
#   Moves log dumps to backup directory
##############################################################################################
move_logdumps() {
  local ldbkup_dir="/h/${_SERVER}/ld_bkup"
  mkdir -p "$ldbkup_dir" && chmod 750 "$ldbkup_dir" && chown sybase:sybase "$ldbkup_dir"

  for d in "${bkup_logdumps[@]}"; do
    mv "$d" "$ldbkup_dir"
  done

  if ((${#bkup_logdumps[@]} > 0)); then
    echo -e "\nThe following ${#bkup_logdumps[@]} transaction logs will be moved to ${ldbkup_dir}\n"

    for i in "${!bkup_logdumps[@]}"; do
      echo " $((i + 1)) - ${bkup_logdumps[i]}"
    done
  fi

  echo
}

main() {
  get_restore_db
}

main