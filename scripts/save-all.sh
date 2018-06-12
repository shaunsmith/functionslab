#! /usr/bin/env bash

if [ -z "$1" ]; then
  TARGET_DIR=.
else
  TARGET_DIR=${1}
fi

if [ -z "$2" ]; then
  FDK_VERSION=1.0.62
else
  FDK_VERSION=${2}
fi

docker save fnproject/fnserver:latest | gzip -c > ${TARGET_DIR}/fnproject-fnserver.latest.tgz 
docker save fnproject/fn-java-fdk-build:jdk9-${FDK_VERSION} | gzip -c > ${TARGET_DIR}/fnproject-fn-java-fdk-build.latest.tgz 
docker save fnproject/fn-java-fdk:jdk9-${FDK_VERSION} | gzip -c > ${TARGET_DIR}/fnproject-fn-java-fdk.latest.tgz 
docker save fnproject/ui:latest | gzip -c > ${TARGET_DIR}/fnproject-ui.latest.tgz
docker save fnproject/go:latest | gzip -c > ${TARGET_DIR}/fnproject-go.latest.tgz
docker save fnproject/go:dev | gzip -c > ${TARGET_DIR}/fnproject-go.dev.tgz
docker save node:8-alpine | gzip -c > ${TARGET_DIR}/node.8-alpine.tgz
