#!/bin/bash
user_name=$1
user_password=$2

useradd -p $(perl -e 'print crypt("$var", "\$6\$salt03")' -- -var=$user_password) $user_name
mkdir -p /home/$user_name/.ssh
cp /ssh-server/user-keys/$user_name/id_rsa.pub /home/$user_name/.ssh/id_rsa.pub
cat /home/$user_name/.ssh/id_rsa.pub >> /home/$user_name/.ssh/authorized_keys

exit 0