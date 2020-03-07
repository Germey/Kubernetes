## RabbitMQ

推荐的 Chart 为：https://github.com/bitnami/charts/tree/master/bitnami/rabbitmq，支持 slave 架构。

需要配置的内容如下：

```yaml
global:
  storageClass: azure-disk

resources:
  requests:
    memory: 256Mi
    cpu: 100m

replicas: 3

service:
  type: LoadBalancer

nodeSelector:
  beta.kubernetes.io/arch: amd64

metrics:
  enabled: true

volumePermissions:
  enabled: true
```

初始化：

```shell
helm repo add bitnami https://charts.bitnami.com/bitnami
```

安装：

```shell
helm install --name rabbitmq --namespace rabbitmq -f values.yml bitnami/rabbitmq
```

 删除：

```shell
helm delete rabbitmq --purge
```



