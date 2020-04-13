#!/usr/bin/env bash
set -eu
for n in $(seq 1 10); do
    tag="qarlm/static-http-response-server:$n"
    docker build server \
        --build-arg TAG_AS_RESPONSE=$n \
        --tag "$tag"
    docker push $tag
done
