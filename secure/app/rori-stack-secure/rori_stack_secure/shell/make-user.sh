#!/bin/bash

user_name=$1
user_password=$2
app_name=$3

# コンテナ作成
echo "ユーザーコンテナを作成"
docker run --detach -h "rori-stack-ec3-$app_name" -t -i --privileged --name rori_stack_ec3_$app_name --network=rori-stack --env VIRTUAL_HOST=$app_name.ec3.example.local --env LANG=C.UTF-8 rori_stack/ec3

# ユーザー作成
echo "SSHサーバーにユーザーを追加"
docker cp /src/app/rori-stack-secure/rori_stack_secure/shell/ssh-server ssh-server-ssh-1:/
docker exec ssh-server-ssh-1 sh //ssh-server/ssh-key-register.sh $user_name $user_password
docker restart ssh-server-ssh-1

echo "ユーザーサーバーにユーザーを追加(not root login)"
docker cp /src/app/rori-stack-secure/rori_stack_secure/shell/ec3 rori_stack_ec3_$app_name:/etc/
docker exec rori_stack_ec3_$app_name sh //etc/ec3/add-user.sh $user_name $user_password

exit 0