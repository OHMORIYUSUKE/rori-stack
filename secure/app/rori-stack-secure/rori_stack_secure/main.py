import pprint
from fastapi import FastAPI
from pydantic import BaseModel

import os
import docker

import subprocess
from subprocess import PIPE,TimeoutExpired

app = FastAPI()

class UserContainerInfo(BaseModel):
    user_password: str
    user_name: str
    app_name: str
    ssh_key: str

@app.get("/")
async def root():
    return "hello world"

# 設定画面
@app.post("/create/container")
async def create_container(userContainerInfo: UserContainerInfo):
    # ssh鍵書き込み
    PWD = "/src/app/rori-stack-secure/rori_stack_secure"
    os.makedirs(f'{PWD}/shell/ssh-server/user-keys/{userContainerInfo.user_name}', exist_ok=True)
    f = open(f'{PWD}/shell/ssh-server/user-keys/{userContainerInfo.user_name}/id_rsa.pub', 'w')
    f.write(f'command="docker exec -u {userContainerInfo.user_name} -it rori_stack_ec3_{userContainerInfo.app_name} bash" {userContainerInfo.ssh_key}')
    f.close()
    # コンテナ起動
    proc = subprocess.run(f"sh {PWD}/shell/make-user.sh {userContainerInfo.user_name} {userContainerInfo.user_password} {userContainerInfo.app_name}", timeout=100, shell=True, stdout=PIPE, stderr=PIPE, text=True)
    out = proc.stdout
    err = proc.stderr
    if out != '':
        return {"result": "success"}
    else:
        return {"result": "error"}

@app.post("/delete/container")
async def create_container(userContainerInfo: UserContainerInfo):
    # 認証
    # コンテナ削除
    PWD = "/src/app/rori-stack-secure/rori_stack_secure"
    proc = subprocess.run(f"sh {PWD}/shell/rm-container.sh {userContainerInfo.app_name}", timeout=100, shell=True, stdout=PIPE, stderr=PIPE, text=True)
    out = proc.stdout
    err = proc.stderr
    print(out)
    if out != '':
        return {"result": "success"}
    else:
        return {"result": "error"}