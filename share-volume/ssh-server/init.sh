#!/bin/bash

chmod 711 /home
chmod 755 /ssh-server

chmod 777 /var/run/docker.sock

groupadd docker

exit 0