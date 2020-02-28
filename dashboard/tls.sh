kubectl create secret tls tls-kubernetes-cuiqingcai-com -n dashboard  --cert 1_kubernetes.cuiqingcai.com_bundle.crt --key 2_kubernetes.cuiqingcai.com.key

kubectl create secret tls tls-k8s-cuiqingcai-com --cert 1_k8s.cuiqingcai.com_bundle.crt --key 2_k8s.cuiqingcai.com.key -n dashboard
