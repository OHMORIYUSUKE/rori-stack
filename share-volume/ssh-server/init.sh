#!/bin/bash

# バナー
echo "Banner /etc/ssh/banner_msg.txt" >> /etc/ssh/sshd_config
cp /ssh-server/banner_msg.txt /etc/ssh/banner_msg.txt

chmod 711 /home
chmod 755 /ssh-server

chmod 777 /var/run/docker.sock

groupadd docker

exit 0