# persistent volumes
microk8s kubectl apply -f postgres-pv.yml

# persistent volume claims
microk8s kubectl apply -f farmerzon-authentication-pvc.yml

# config maps
microk8s kubectl apply -f farmerzon-authentication-cm.yml

# stateful sets
microk8s kubectl apply -f farmerzon-authentication-ss.yml