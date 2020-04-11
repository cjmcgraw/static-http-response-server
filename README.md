# static-http-response-server
This project is pretty straight forward. The container attaches to port 80, and serves an application that gives back the results of the environmental variable `RESPONSE` at run time. 

### why?

While I was working on a manager node that orchestrates machine learning model deployments to a swarm cluster, It suddenly became very valuable for me to be able to up a container and have it return a static result.

I could up the container with an environmental variable, then it would return it to me. If I could up multiple of them I could thoroughly test my deployments using this piece of infrastructure.

This repository was created to fill that niche!

---
### running with docker

Running with docker:
 ```
docker run -p 80:80 -e RESPONSE=hello,world! qarlm/static-http-response-server
```

Then you can send a request into the endpoint and get your response. I am using [httpie](https://httpie.org/) in the following example:

```
http -v localhost
GET / HTTP/1.1
Accept: */*
Accept-Encoding: gzip, deflate
Connection: keep-alive
Host: localhost
User-Agent: HTTPie/2.0.0



HTTP/1.1 200 OK
content-length: 14
content-type: application/json
date: Sat, 11 Apr 2020 08:14:16 GMT
server: uvicorn

"hello,world!"
```

----

### running with docker-compose

Running with docker-compose. Use this as your docker-compose.yml file:
```
version: "3.7"

services:
  first_server:
    image: qarlm/static-http-response-server
    ports:
      - 8001:80
    environment:
      RESPONSE: first_server

  second_server:
    image: qarlm/static-http-response-server
    ports:
      - 8002:80
    environment:
      RESPONSE: second_server
```

then running the following http requests yields the expected results:

```
http -v localhost:8001
GET / HTTP/1.1
Accept: */*
Accept-Encoding: gzip, deflate
Connection: keep-alive
Host: localhost:8001
User-Agent: HTTPie/2.0.0



HTTP/1.1 200 OK
content-length: 14
content-type: application/json
date: Sat, 11 Apr 2020 08:15:50 GMT
server: uvicorn

"first_server"
```

and

```
http -v localhost:8002
GET / HTTP/1.1
Accept: */*
Accept-Encoding: gzip, deflate
Connection: keep-alive
Host: localhost:8002
User-Agent: HTTPie/2.0.0



HTTP/1.1 200 OK
content-length: 15
content-type: application/json
date: Sat, 11 Apr 2020 08:16:16 GMT
server: uvicorn

"second_server"
```
