## scrapyd

```shell script
helm install --name ingress-scrapyd --namespace scrapyd --set defaultBackend.image.repository=mirrorgooglecontainers/defaultbackend-amd64 stable/nginx-ingress
```