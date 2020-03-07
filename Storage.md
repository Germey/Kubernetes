## Azure Disk

建议新建一个 StorageClass，并配置支持扩容的 Azure 磁盘，yaml 配置如下，命名为 azure-disk.yml：

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: azure-disk
provisioner: kubernetes.io/azure-disk
parameters:
  storageaccounttype: Standard_LRS
  kind: Managed
allowVolumeExpansion: true
volumeBindingMode: Immediate
```

安装：

```shell
kubectl apply -f azure-disk.yml
```

## Azure File

需要配置支持扩容的 Azure Storage File，同时使用 Standard_GRS，yaml 配置如下，命名为 azure-file.yml：

```yaml
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: azure-file
  labels:
    kubernetes.io/cluster-service: "true"
provisioner: kubernetes.io/azure-file
mountOptions:
  - dir_mode=0777
  - file_mode=0777
  - uid=1000
  - gid=1000
  - mfsymlinks
  - nobrl
  - cache=none
parameters:
  skuName: Standard_GRS
allowVolumeExpansion: true
```

安装：

```shell
kubectl apply -f azure-file.yml
```

