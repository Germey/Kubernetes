## MySQL

推荐使用的 Chart 为：https://github.com/bitnami/charts/tree/master/bitnami/mysql，支持 maser-slave 架构、metrics 等。

这里需要配置的内容如下：

```yaml
global:
  storageClass: azure-disk

volumePermissions:
  enabled: true

master:
  resources:
    requests:
      memory: 500Mi
      cpu: 200m
    limits:
      memory: 1Gi
      cpu: 400m

slave:
  replicas: 2
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
helm install --name mysql --namespace mysql -f values.yml bitnami/mysql
```

 删除：

```shell
helm delete mysql --purge
```

