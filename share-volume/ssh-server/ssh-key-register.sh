#!/bin/bash

# 引数
user_name=$1
user_password=$2

# user_nameを作成
useradd $user_name
# user_nameをdockerグループに追加
usermod -aG docker $user_name
# /home/$user_name/.sshディレクトリを再帰的に作成
mkdir -p /home/$user_name/.ssh
# /ssh-server/user-keys/$user_name/id_rsa.pubを/home/$user_name/.ssh/id_rsa.pubにコピー
cp /ssh-server/user-keys/$user_name/id_rsa.pub /home/$user_name/.ssh/id_rsa.pub
# /home/$user_name/.ssh/id_rsa.pubの中身を/home/$user_name/.ssh/authorized_keysに書き込む
cat /home/$user_name/.ssh/id_rsa.pub > /home/$user_name/.ssh/authorized_keys

exit 0