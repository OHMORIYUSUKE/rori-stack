import pprint
from fastapi import FastAPI
from pydantic import BaseModel

import docker

import subprocess
from subprocess import PIPE,TimeoutExpired

app = FastAPI()

# アプリケーション
class Db(BaseModel):
    password: str
    name: str
    user: str

class App(BaseModel):
    host_name: str

class AppConfig(BaseModel):
    db: Db
    app: App

@app.get("/")
async def root():
    return "hello world"

# 設定画面
@app.get("/setting")
async def setting():
    # client = docker.DockerClient(base_url='unix://tmp/docker.sock')
    # print(client)
    # for data in client.containers.list():
    #     print("========================")
    #     print(data.name)
    host_name = "u-tan"
    proc = subprocess.run(f"docker run --detach -t -i --privileged --name rori_stack_ec3_{host_name} --network=rori-stack  -p 25:25 -p 22:22 -p 3306:3306 --env VIRTUAL_HOST={host_name}.ec3.example.local --env LANG=C.UTF-8 rori_stack/ec3", timeout=100, shell=True, stdout=PIPE, stderr=PIPE, text=True)
    out = proc.stdout
    err = proc.stderr
    return {"out": out, "err": err}