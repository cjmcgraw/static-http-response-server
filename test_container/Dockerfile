FROM python:3.7
WORKDIR /app/
ADD docker-entrypoint.sh /app/docker-entrypoint.sh
ADD requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
ADD *.py /app/
ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
