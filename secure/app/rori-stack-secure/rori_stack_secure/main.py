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
@app.get("/create/container")
async def setting():
    return {"hello": "world"}