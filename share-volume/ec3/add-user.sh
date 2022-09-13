#!/bin/bash

user_name=$1
user_password=$2

useradd $user_name 
mkdir -p /home/$user_name
echo "root:$user_password" | chpasswd
echo "$user_name:$user_password" | chpasswd
echo "cd /home/$user_name" >> /home/$user_name/.bashrc

chown -hR $user_name:$user_name /home/$user_name

usermod -aG sudo $user_name

exit 0