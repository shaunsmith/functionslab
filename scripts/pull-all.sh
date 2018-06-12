#! /usr/bin/env bash

if [ -z "$1" ]; then
  FDK_VERSION=1.0.62
else
  FDK_VERSION=${1}
fi

docker pull node:8-alpine
docker pull fnproject/fnserver:latest
docker pull fnproject/ui:latest
docker pull fnproject/go:latest
docker pull fnproject/go:dev
docker pull fnproject/fn-java-fdk:jdk9-${FDK_VERSION}
docker pull fnproject/fn-java-fdk-build:jdk9-${FDK_VERSION}
