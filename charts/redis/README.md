## Redis

```shell script
kubectl create secret generic redis-auth -n redis --from-literal=auth=xxxxxx
```

```shell script
helm install --name $NAME --namespace $NAMESPACE -f values.yml stable/redis-ha
```

