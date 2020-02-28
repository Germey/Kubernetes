## MySQL

```shell script
helm install --name mysql --namespace mysql --set volumePermissions.enabled=true,slave.replicas=2,master.resources. bitnami/mysql
```
