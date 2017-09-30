#!/bin/bash

# This script creates local user
# This has to be executed by root

USERID=${UID}

# Checks if user is root

create_user() {
 read -p 'Enter Username: ' USERNAME
 read -p 'Enter User Details: ' COMMENT
 read -p 'Enter Initial Password: ' PASSWORD

 useradd -c "${COMMENT}" -m ${USERNAME}

 if [[ "${?}" -ne 0 ]]
   then 
    echo "Invalid Username/Details!"
    exit 1
  fi

 echo ${PASSWORD} | passwd --stdin ${USERNAME}
 
 if [[ "${?}" -ne 0 ]]
  then
    echo "Invalid Password!"
    exit 1
 fi
 
# Expiring password
 passwd -e ${USERNAME}

# Print Details
echo "Username: ${USERNAME}"
echo "Passowrd: ${PASSWORD}"
echo "Host    : $(hostname)"
 
return 0
}

#Main
if [[ "${USERID}" -eq 0 ]]
  then 
    create_user
else
  echo "You must be \"root\" to execute this script!"
  exit 1
fi

exit 0

