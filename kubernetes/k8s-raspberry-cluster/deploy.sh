# persistent volumes
microk8s kubectl apply -f postgres-pv.yml

# persistent volume claims
microk8s kubectl apply -f farmerzon-address-pvc.yml
microk8s kubectl apply -f farmerzon-articles-pvc.yml
microk8s kubectl apply -f farmerzon-authentication-pvc.yml

# config maps
microk8s kubectl apply -f farmerzon-address-cm.yml
microk8s kubectl apply -f farmerzon-articles-cm.yml
microk8s kubectl apply -f farmerzon-authentication-cm.yml

# stateful sets
microk8s kubectl apply -f farmerzon-address-sts.yml
microk8s kubectl apply -f farmerzon-articles-sts.yml
microk8s kubectl apply -f farmerzon-authentication-sts.yml

# services
microk8s kubectl apply -f farmerzon-authentication-cip.yml