#!/bin/bash

while [ $# -gt 0 ]; do
  case "$1" in
    -u|--user)
      USERNAME="$2"
      ;;

    -p|--password)
      PASSWORD="$2"
      ;;

    *)
      echo "Error: Invalid argument" >&2
      exit 1
      ;;
  esac

  shift
  shift
done

# Check if local account already enrolled
cgetaccount -T system -s $USERNAME >> /dev/null
if [ $? -eq 6 ]
then
  # Account does not exist in vault
  echo -e "$PASSWORD\n$PASSWORD" | passwd $USERNAME

  if [ $? -eq 0 ]
  then
    # Password updated, enrolling account
    echo $PASSWORD | csetaccount --managed=true --stdin $USERNAME

    if [ $? -ne 0 ]
    then
      # Unable to vault account 
      echo "Error: Unable to vault account '$USERNAME'." >&2
      exit 1
    fi

  else
    # Can't update password
    echo "Error: Unable to update password for account '$USERNAME'." >&2
    exit 1
  fi

elif [ $? -eq 0 ]
then
  # Account exists in vault
  echo "Warning: Account already exists in vault. Skipping enrolment."
  exit 0

else
  # Unhandled exception
  echo "Error: Unexpected error occured while checking account." >&2
  exit 1

fi
