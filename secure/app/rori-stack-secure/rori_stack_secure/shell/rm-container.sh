#!/bin/bash

app_name=$1

echo "ユーザーのコンテナを削除"
docker rm -f rori_stack_ec3_$app_name

exit 0