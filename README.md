``` bash
export PROJECT_ID=$(gcloud config get-value project -q)

terraform apply -var project=${PROJECT_ID}

gcloud container clusters get-credentials test-cluster
gcloud config set container/cluster test-cluster

kubectl create serviceaccount -n kube-system tiller
kubectl create clusterrolebinding tiller-binding --clusterrole=cluster-admin --serviceaccount kube-system:tiller
helm init --service-account tiller

kubectl create namespace kube-lego

helm install \
  --namespace kube-lego \
  --set config.LEGO_EMAIL=donald.rauscher@gmail.com \
  --set config.LEGO_URL=https://acme-v01.api.letsencrypt.org/directory \
  --set config.LEGO_DEFAULT_INGRESS_CLASS=gce \
  stable/kube-lego

helm install .
```
