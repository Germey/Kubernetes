helm install --name ingress-gerapy --namespace gerapy --set defaultBackend.image.repository=mirrorgooglecontainers/defaultbackend-amd64 stable/nginx-ingress
