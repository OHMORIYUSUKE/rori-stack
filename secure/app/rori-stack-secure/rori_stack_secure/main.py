import pprint
from fastapi import FastAPI
from pydantic import BaseModel

import docker

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
    client = docker.DockerClient(base_url='unix://tmp/docker.sock')
    print(client)
    for data in client.containers.list():
        print("========================")
        print(data.name)
    return {"user_id": 1}