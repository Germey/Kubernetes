## Prometheus Operator

推荐 Charts：https://github.com/helm/charts/tree/master/stable/prometheus-operator

安装：

```
helm install --name prometheus-operator --namespace monitoring stable/prometheus-operator -f values.yml
```

升级：

```
helm upgrade -f values.yml prometheus-operator --namespace monitoring stable/prometheus-operator
```