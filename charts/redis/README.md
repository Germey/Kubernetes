## Redis


```shell script
helm install --name redis --namespace redis --set cluster.slaveCount=2,networkPolicy.enabled=true,metrics.enabled=true stable/redis
```