## Prometheus

推荐的 Chart 为：https://github.com/helm/charts/tree/master/stable/prometheus，支持 Alert Manager、Node Exporter 等配置

修改配置如下：

```yaml
alertmanager:
  persistentVolume:
    storageClass: azure-file
    resources:
      requests:
        memory: 200Mi
        cpu: 100m
      limits:
        memory: 200Mi
        cpu: 100m
nodeExporter:
  resources:
    limits:
      cpu: 200m
      memory: 50Mi
    requests:
      cpu: 100m
      memory: 30Mi
server:
  persistentVolume:
    storageClass: azure-file
  resources:
    requests:
      memory: 500Mi
      cpu: 500m
    limits:
      memory: 500Mi
      cpu: 500m
pushgateway:
  resources:
    limits:
      cpu: 100m
      memory: 50Mi
    requests:
      cpu: 100m
      memory: 50Mi
  persistentVolume:
    enabled: true
    storageClass: azure-file
```

初始化：

```shell
helm repo add stable https://kubernetes-charts.storage.googleapis.com
```

安装：

```shell
helm install --name prometheus --namespace monitor -f values.yml stable/prometheus
```

删除：

```
helm delete prometheus --purge
```

