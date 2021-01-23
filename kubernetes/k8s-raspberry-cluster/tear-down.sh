# ingress
microk8s kubectl delete ingress farmerzon-ingress

# microservice services
microk8s kubectl delete svc farmerzon-frontend-cip
microk8s kubectl delete svc farmerzon-backend-ingress-cip
microk8s kubectl delete svc farmerzon-authentication-ingress-cip

# deployments
microk8s kubectl delete deploy farmerzon-frontend-deploy
microk8s kubectl delete deploy farmerzon-backend-deploy
microk8s kubectl delete deploy farmerzon-address-deploy
microk8s kubectl delete deploy farmerzon-articles-deploy
microk8s kubectl delete deploy farmerzon-authentication-deploy

# postgres services
microk8s kubectl delete svc farmerzon-address-cip
microk8s kubectl delete svc farmerzon-articles-cip
microk8s kubectl delete svc farmerzon-authentication-cip

# stateful sets
microk8s kubectl delete sts farmerzon-address-sts
microk8s kubectl delete sts farmerzon-articles-sts
microk8s kubectl delete sts farmerzon-authentication-sts

# config maps
microk8s kubectl delete cm farmerzon-address-cm
microk8s kubectl delete cm farmerzon-articles-cm
microk8s kubectl delete cm farmerzon-authentication-cm

# persistent volume claims
microk8s kubectl delete pvc farmerzon-address-pvc
microk8s kubectl delete pvc farmerzon-articles-pvc
microk8s kubectl delete pvc farmerzon-authentication-pvc

# persistent volumes
microk8s kubectl delete pv postgres-pv