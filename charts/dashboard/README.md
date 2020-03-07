## Ingress

```shell script
helm install --name ingress-dashboard --namespace dashboard --set defaultBackend.image.repository=mirrorgooglecontainers/defaultbackend-amd64 stable/nginx-ingress
```