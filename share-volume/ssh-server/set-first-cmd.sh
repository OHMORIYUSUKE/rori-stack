#!/bin/bash

user_name=$1

echo "docker exec -it rori_stack_ec3_$user_name bash" > /home/$user_name/.profile

exit 0