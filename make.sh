#!/bin/bash

echo "初期化・初期設定"
./make-init.sh u-tan-app

echo "サンプルユーザー作成"
./make-user.sh u-tan u-tan-password u-tan-app

exit 0