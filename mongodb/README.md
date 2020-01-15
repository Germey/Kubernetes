## MongoDB


```shell script
helm install --name mongodb --namespace mongodb --set volumePermissions.enabled=true,replicaSet.enabled=true,metrics.enabled=true,metrics.livenessProbe.enabled=true,metrics.readinessProbe.enabled=true,service.type=LoadBalancer stable/mongodb
```
