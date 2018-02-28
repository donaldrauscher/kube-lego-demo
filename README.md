``` bash
export PROJECT_ID=$(gcloud config get-value project -q)

terraform apply -var project=${PROJECT_ID}

gcloud container clusters get-credentials test-cluster
gcloud config set container/cluster test-cluster

kubectl create serviceaccount -n kube-system tiller
kubectl create clusterrolebinding tiller-binding --clusterrole=cluster-admin --serviceaccount kube-system:tiller
helm init --service-account tiller

# helm install \
#   --set config.LEGO_EMAIL=donald.rauscher@gmail.com \
#   --set config.LEGO_URL=https://acme-staging.api.letsencrypt.org/directory \
#   stable/kube-lego

helm install .
```
