#!/usr/bin/env bash

set -e

eval $(minikube -p minikube docker-env)
kubectl delete -f nginx.yml
kubectl delete -f tomcat.yml
kubectl delete -f tomcat-sample.yml
kubectl delete -f jenkins.yml
