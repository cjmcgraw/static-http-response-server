FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7
ARG TAG_AS_RESPONSE 
ADD requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt
ADD server.py /app/server.py
ENV RESPONSE $TAG_AS_RESPONSE
ENV APP_MODULE server:app
ENV WEB_CONCURRENCY 2

