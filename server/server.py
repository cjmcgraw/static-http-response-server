from fastapi import FastAPI
import logging as log
import sys
import os

log.basicConfig(level=log.DEBUG, stream=sys.stdout)

app = FastAPI()


@app.get("/")
def get():
    return os.environ["RESPONSE"]


log.info("default_response: " + get())
