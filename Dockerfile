FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7
ADD requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt
ADD server.py /app/server.py
ENV RESPONSE default
ENV APP_MODULE server:app
ENV WEB_CONCURRENCY 2

