#!/usr/bin/env bash

set -e

eval $(minikube -p minikube docker-env)
docker build -t tomcat-sample:latest .
