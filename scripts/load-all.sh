#! /usr/bin/env bash

if [ -z "$1" ]; then
  SOURCE_DIR=.
else
  SOURCE_DIR=${1}
fi

docker load < ${SOURCE_DIR}/fnproject-fnserver.latest.tgz 
docker load < ${SOURCE_DIR}/fnproject-fn-java-fdk-build.latest.tgz 
docker load < ${SOURCE_DIR}/fnproject-fn-java-fdk.latest.tgz 
docker load < ${SOURCE_DIR}/fnproject-ui.latest.tgz
docker load < ${SOURCE_DIR}/fnproject-go.latest.tgz
docker load < ${SOURCE_DIR}/fnproject-go.dev.tgz
docker load < ${SOURCE_DIR}/node.8-alpine.tgz
