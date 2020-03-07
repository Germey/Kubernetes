helm init --history-max 200 --service-account tiller \
  --node-selectors "beta.kubernetes.io/os=linux" \
  --tiller-image gcr.azk8s.cn/kubernetes-helm/tiller:v2.13.0 \
  --stable-repo-url https://mirror.azure.cn/kubernetes/charts/