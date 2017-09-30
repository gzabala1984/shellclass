#!/bin/bash

echo "Your UID is ${UID}"

USER_NAME=$(whoami)
#could be written as $(id -un)
#could be written as `id -un`


echo "Your USERNAME is ${USER_NAME}."

if [ ${UID} -eq 0 ]
then
 echo "You are root!"
else
 echo "You are not root!"
fi


