#!/bin/bash

# update dependencies
docker run --rm -it -v $PWD:/go/src/github.com/xanderstrike/nonstandard-port-test -w /go/src/github.com/xanderstrike/nonstandard-port-test treeder/glide update

# build binary
docker run --rm -v "$PWD":/go/src/github.com/xanderstrike/nonstandard-port-test -w /go/src/github.com/xanderstrike/nonstandard-port-test iron/go:dev go build -o nonstandard-port-test-docker

# build docker image
docker build -t xanderstrike/nonstandard-port-test .

rm nonstandard-port-test-docker
