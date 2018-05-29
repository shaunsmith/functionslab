#! /usr/bin/env bash

docker save fnproject/fnserver:latest | gzip -c > fnproject-fnserver.latest.tgz 
docker save fnproject/flow:latest | gzip -c > fnproject-flow.latest.tgz 
docker save fnproject/flow:ui | gzip -c > fnproject-flow.ui.tgz 
docker save fnproject/fn-java-fdk-build:latest | gzip -c > fnproject-fn-java-fdk-build.latest.tgz 
docker save fnproject/fn-java-fdk:latest | gzip -c > fnproject-fn-java-fdk.latest.tgz 
docker save fnproject/fn-java-fdk:jdk9-latest | gzip -c > fnproject-fn-java-fdk.jdk9-latest.tgz 
docker save fnproject/fn-java-fdk-build:jdk9-latest | gzip -c > fnproject-fn-java-fdk-build.jdk9-latest.tgz
docker save fnproject/ui:latest | gzip -c > fnproject-ui.latest.tgz
docker save fnproject/go:latest | gzip -c > fnproject-go.latest.tgz
docker save fnproject/go:dev | gzip -c > fnproject-go.dev.tgz
docker save node:8-alpine | gzip -c > node.8-alpine.tgz
