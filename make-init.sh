#!/bin/bash

app_name=$1

# 初期化
echo "既存の環境を消す"
docker container rm -f ssh-server-ssh-1
docker container rm -f nginx-proxy-nginx-proxy-1

# docker 
echo "ec3(ubuntu, centos)のイメージ作成"
docker image rm -f rori_stack/ec3_ubuntu
docker image rm -f rori_stack/ec3_centos
cd ec3/ubuntu/
docker build ./ -t rori_stack/ec3_ubuntu
cd ../../ec3/centos/
docker build ./ -t rori_stack/ec3_centos
cd ..
echo "インフラコンテナ起動"
cd ../nginx-proxy/
docker compose up -d
cd ../ssh-server/
docker compose up -d
cd ../secure/
docker compose up -d
cd ../admin/
docker compose up -d

# init

echo "SSHサーバの初期設定"
cd ..
# sshサーバー起動初回のみ
docker cp ./share-volume/ssh-server ssh-server-ssh-1:/ssh-server
docker exec ssh-server-ssh-1 sh //ssh-server/init.sh
docker restart ssh-server-ssh-1

exit 0
