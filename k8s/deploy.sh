#!/usr/bin/env bash

set -e

eval $(minikube -p minikube docker-env)
kubectl apply -f nginx.yml
kubectl apply -f tomcat.yml
kubectl apply -f tomcat-sample.yml
kubectl apply -f jenkins.yml
