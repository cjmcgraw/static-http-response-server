from fastapi import FastAPI
import os

app = FastAPI()


@app.get("/")
def get():
    return os.environ["RESPONSE"]
