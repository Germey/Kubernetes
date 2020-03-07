## PostgreSQL

推荐使用的 Chart 为：https://github.com/helm/charts/tree/master/stable/postgresql，支持 maser-slave 架构、metrics 等。

这里需要配置的内容如下：

```yaml
global:
  storageClass: azure-disk

volumePermissions:
  enabled: true

replication:
  enabled: true
  slaveReplicas: 2
  synchronousCommit: on
  numSynchronousReplicas: 1

resources:
  requests:
    memory: 500Mi
    cpu: 200m
  limits:
    memory: 1Gi
    cpu: 400m

service:
  type: LoadBalancer

metrics:
  enabled: true
```

初始化：

```shell
helm repo add bitnami https://charts.bitnami.com/bitnami
```

安装：

```shell
helm install --name postgresql --namespace postgresql -f values.yml stable/postgresql
```

 删除：

```shell
helm delete postgresql --purge
```

