## Ingress

```shell script
helm install --name ingress --namespace <namespace> --set defaultBackend.image.repository=mirrorgooglecontainers/defaultbackend-amd64 stable/nginx-ingress
```