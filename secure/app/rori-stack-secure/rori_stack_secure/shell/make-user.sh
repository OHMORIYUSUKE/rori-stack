#!/bin/bash

# 引数
user_name=$1
user_password=$2
app_name=$3
os_type=$4

# コンテナ作成
# ユーザーコンテナを作成(SSHできるコンテナ)
# (コンテナ名rori_stack_ec3_$app_nameのコンテナが作成される)
docker run --detach -h "rori-stack-ec3-$app_name" -t -i --privileged --name rori_stack_ec3_$app_name --network=rori-stack --env VIRTUAL_HOST=$app_name.ec3.example.local --env LANG=C.UTF-8 rori_stack/ec3_$os_type

# SSHサーバーにユーザーを追加
# /share-volume/ssh-serverをssh-serverコンテナの/にコピー
docker cp /share-volume/ssh-server ssh-server-ssh-1:/
# /ssh-server/ssh-key-register.shをssh-serverコンテナ内で実行
# 引数 user_name, user_password
docker exec ssh-server-ssh-1 sh //ssh-server/ssh-key-register.sh $user_name $user_password
# docker restart ssh-server-ssh-1

# ユーザーサーバーにユーザーを追加(not root login)
# /share-volume/ec3をrori_stack_ec3_$app_nameコンテナの/etc/にコピー
docker cp /share-volume/ec3 rori_stack_ec3_$app_name:/etc/
# rori_stack_ec3_$app_nameコンテナ内で/etc/ec3/add-user.shを実行
# 引数 user_name, user_password
docker exec rori_stack_ec3_$app_name sh //etc/ec3/add-user.sh $user_name $user_password

exit 0