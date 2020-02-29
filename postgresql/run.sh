helm install --name postgresql --namespace postgresql bitnami/postgresql -f values-production.yaml --set postgresqlPassword=$PGSQL_PASSWORD --set replication.password=$PGSQL_PASSWORD




# ok
helm repo add cetic https://cetic.github.io/helm-charts
helm install --name postgresql --namespace postgresql -f values-production.yml cetic/postgresql