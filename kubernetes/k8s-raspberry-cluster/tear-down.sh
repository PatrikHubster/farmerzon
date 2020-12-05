# stateful sets
microk8s kubectl delete sts farmerzon-authentication-sts

# config maps
microk8s kubectl delete cm farmerzon-authentication-cm

# persistent volume claims
microk8s kubectl delete pvc farmerzon-authentication-pvc

# persistent volumes
microk8s kubectl delete pv postgres-pv