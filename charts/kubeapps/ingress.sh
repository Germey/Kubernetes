helm install --name ingress-kubeapps --namespace kubeapps --set defaultBackend.image.repository=mirrorgooglecontainers/defaultbackend-amd64 stable/nginx-ingress
