## Redis


```shell script
helm install --name redis --namespace redis --set cluster.slaveCount=2,networkPolicy.enabled=true,metrics.enabled=true,master.service.type=LoadBalancer stable/redis
```