#!/bin/bash

app_name=$1

# 初期化
echo "既存の環境を消す"
docker container rm -f ssh-server-ssh-1
docker container rm -f nginx-proxy-nginx-proxy-1
docker container rm -f rori_stack_ec3_$app_name

# docker 
echo "インフラコンテナ起動"
cd nginx-proxy/
docker compose up -d
cd ../ssh-server/
docker compose up -d

# init

echo "SSHサーバの初期設定"
cd ..
# sshサーバー起動初回のみ
docker cp ./share-volume/ssh-server ssh-server-ssh-1:/ssh-server
docker exec ssh-server-ssh-1 sh //ssh-server/init.sh
docker restart ssh-server-ssh-1

exit 0
