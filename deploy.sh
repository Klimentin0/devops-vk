#!/bin/bash

kind create cluster --config kind-config.yaml
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace \
  --set controller.service.type=NodePort \
  --set controller.admissionWebhooks.enabled=false

kubectl apply -f manifests/