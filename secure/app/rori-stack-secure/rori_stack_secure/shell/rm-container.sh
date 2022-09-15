#!/bin/bash

app_name=$1

# ユーザーのコンテナを削除
# (rori_stack_ec3_$app_nameコンテナを削除)
docker rm -f rori_stack_ec3_$app_name

exit 0