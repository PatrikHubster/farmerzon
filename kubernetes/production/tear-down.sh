# load balancer section


# ingress section
microk8s kubectl delete ingress farmerzon-ingress

# service section
microk8s kubectl delete service farmerzon-authentication-service
microk8s kubectl delete service farmerzon-articles-service
microk8s kubectl delete service farmerzon-address-service

# microservice section
microk8s kubectl delete deployment farmerzon-authentication-deployment
microk8s kubectl delete deployment farmerzon-articles-deployment
microk8s kubectl delete deployment farmerzon-address-deployment

# database section
microk8s helm3 delete postgres
microk8s helm3 delete nfs-client
