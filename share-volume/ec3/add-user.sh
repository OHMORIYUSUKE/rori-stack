#!/bin/bash

# 引数
user_name=$1
user_password=$2

# user_nameのユーザーを作成する
useradd $user_name
# /home/user_nameを作成
# (-pオプションは再帰的にディレクトリを作る)
mkdir -p /home/$user_name
# rootののパスワードをuser_passwordに変更
echo "root:$user_password" | chpasswd
# userのパスワードをuser_passwordに変更
echo "$user_name:$user_password" | chpasswd
# .bashrcに`cd /home/user_name`と書き込む
# (コンテナにloginした直後に必ず実行されるコマンド)
echo "cd /home/$user_name" >> /home/$user_name/.bashrc
# userのhomeディレクトリの所有者をrootからuserに変更する
# (userのhomeディレクトリなのでuserで編集できるようにする)
chown -hR $user_name:$user_name /home/$user_name
# userをsudoグループに追加(sudoコマンドを実行できるようにする)
usermod -aG sudo $user_name

exit 0