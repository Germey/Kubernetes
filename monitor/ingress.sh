helm install --name monitor --namespace monitor --set defaultBackend.image.repository=mirrorgooglecontainers/defaultbackend-amd64 stable/nginx-ingress