## MongoDB

推荐使用的 Chart 为：https://github.com/bitnami/charts/tree/master/bitnami/mongodb-sharded  支持副本集、分片集群。

这里需要配置的内容如下：

```yaml
global:
  storageClass: azure-disk

shards: 4

volumePermissions:
  enabled: true

service:
  type: LoadBalancer

configsvr:
  replicas: 3

shardsvr:
  dataNode:
    replicas: 2
    resources:
      requests:
        memory: 500Mi
        cpu: 200m
      limits:
        memory: 1Gi
        cpu: 400m
    persistence:
      size: 50Gi
  arbiter:
    replicas: 1

metrics:
  enabled: true
```

初始化：

```shell
helm repo add bitnami https://charts.bitnami.com/bitnami
```

安装：

```shell
helm install --name mongodb --namespace mongodb -f values.yml bitnami/mongodb-sharded
```

 删除：

```shell
helm delete mongodb --purge
```

