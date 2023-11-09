from fastapi import FastAPI, Response
import json
import os
import configparser



app = FastAPI()


@app.get("/")
async def root():
    parser = configparser.ConfigParser()
    parser.read("pyproject.toml")
    __version__ = parser['tool.poetry']['version'].replace('"', '')
    env = os.environ.get("ENV")
    data = {"Hello": "World 2", "env": env, "version": __version__}

    json_data = json.dumps(data)

    return Response(content=json_data, media_type="application/json")
