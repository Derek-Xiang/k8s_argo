!#/bin/bash

kubectl create -f voting-app-deploy.yaml
kubectl create -f voting-app-service.yaml

kubectl create -f redis-deploy.yaml
kubectl create -f redis-service.yaml

kubectl create -f postgres-deploy.yaml
kubectl create -f postgres-service.yaml

kubectl create -f worker-app-depoy.yaml
kubectl create -f worker-app-service.yaml

kubectl create -f result-app-deploy.yaml
kubectl create -f result-app-service.yaml

