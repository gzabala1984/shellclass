#!/bin/bash

# This script creates local user
# This has to be executed by root


create_user() {

 useradd -c "${2}" -m ${1}

 if [[ "${?}" -ne 0 ]]
   then 
    echo "Invalid Username/Details!"
    exit 1
  fi

 echo ${3} | passwd --stdin ${1}
 
 if [[ "${?}" -ne 0 ]]
  then
    echo "Invalid Password!"
    exit 1
 fi
 
# Expiring password
 passwd -e ${USERNAME}

# Print Details
echo "Username: ${1}"
echo "Comments: ${2}"
echo "Passowrd: ${3}"
echo "Host    : $(hostname)"
 
return 0
}

#MAIN
# Checks whether user is root or not
if [[ "${UID}" -ne 0 ]]
  then
   echo "You must be \"root\" to execute this script!"
   exit 1
fi

# Checks how many arguments are passed

if [[ "${#}" -lt 2 ]] 
  then
    echo "Usage : ${0} USERNAME DETAILS [DETAILS]..."
    exit 1
fi

USERNAME="${1}"
shift
COMMENTS="${*}"

# Generate Random Password
SPECIAL_CHAR='`~!@#$%^&*()_-+='
S=$(echo $SPECIAL_CHAR| fold -w1| shuf | head -n1)
PASSWORD=$(echo $(date +%s%N)${RANDOM}${RANDOM} | sha256sum | head -c15)${S}


# Create User
echo "Create User"
echo "username ${USERNAME}"
echo "comments ${COMMENTS}"
echo "password ${PASSWORD}"
create_user "${USERNAME}" "${COMMENTS}" ${PASSWORD}

exit 0

