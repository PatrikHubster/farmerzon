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

# postgres services
microk8s kubectl apply -f farmerzon-address-cip.yml
microk8s kubectl apply -f farmerzon-articles-cip.yml
microk8s kubectl apply -f farmerzon-authentication-cip.yml

# deployments
microk8s kubectl apply -f farmerzon-address-deploy.yml
microk8s kubectl apply -f farmerzon-articles-deploy.yml
microk8s kubectl apply -f farmerzon-authentication-deploy.yml
microk8s kubectl apply -f farmerzon-backend-deploy.yml

# microservice services
microk8s kubectl apply -f farmerzon-authentication-ingress-cip.yml
microk8s kubectl apply -f farmerzon-backend-ingress-cip.yml

# ingress
microk8s kubectl apply -f farmerzon-ingress.yml
