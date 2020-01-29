## Ingress

```shell script
helm install --name ingress-splash --namespace splash --set defaultBackend.image.repository=mirrorgooglecontainers/defaultbackend-amd64 stable/nginx-ingress
```