# static-http-response-server
This project is pretty straight forward. The container attaches to port 80, and serves an application that gives back the results of the environmental variable `RESPONSE` at run time. 

### why?

While I was working on a manager node that orchestrates machine learning model deployments to a swarm cluster, It suddenly became very valuable for me to be able to up a container and have it return a static result.

I could up the container with an environmental variable, then it would return it to me. If I could up multiple of them I could thoroughly test my deployments using this piece of infrastructure.

This repository was created to fill that niche!


### But I don't even want to customize the text
Well then just call the different versions, they all default echo their build numbers.  Jeeze. You really should consider setting it to something that makes sense, or is known random. 


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

### developing

I highly recommend becoming familiar with the needed docker-compose commands to run
this repository. Here is a brief example of how to build and run this stack:


build all images:
```
docker-compose build
```

run all images:
```
docker-compose up
```

run tests exclusively:
```
docker-compose run test_container 
```

or you can just use the `run-tests.sh` on a *nix system
