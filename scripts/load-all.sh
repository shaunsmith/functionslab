#! /usr/bin/env bash

docker load < fnproject-fnserver.latest.tgz 
docker load < fnproject-flow.latest.tgz 
docker load < fnproject-flow.ui.tgz 
docker load < fnproject-fn-java-fdk-build.latest.tgz 
docker load < fnproject-fn-java-fdk.latest.tgz 
docker load < fnproject-fn-java-fdk.jdk9-latest.tgz 
docker load < fnproject-fn-java-fdk-build.jdk9-latest.tgz
docker load < fnproject-ui.latest.tgz
docker load < fnproject-go.latest.tgz
docker load < fnproject-go.dev.tgz
docker load < node.8-alpine.tgz
