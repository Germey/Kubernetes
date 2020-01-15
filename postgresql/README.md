## Postgresql

```shell script
helm install --name postgresql --namespace postgresql --set replication.enabled=true,replication.slaveReplicas=2,replication.synchronousCommit=on,replication.numSynchronousReplicas=1,postgresqlDatabase=postgres,service.type=LoadBalancer stable/postgresql
```