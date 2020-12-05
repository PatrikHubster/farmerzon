# database section
# microk8s helm3 install nfs-client stable/nfs-client-provisioner --set nfs.server=10.0.0.34 --set nfs.path=/mnt/nfsshare --set image.repository=quay.io/external_storage/nfs-client-provisioner-arm --set storageClass.defaultClass=true --set persistence.enabled=true --set persistence.size=10Gi
# microk8s helm3 install postgres bitnami/postgresql --set image.repository=arm64v8/postgres --set image.tag=11.6 --set persistence.mountPath=/mnt/nfsshare/data --set persistence.storageClass=nfs-client --set persistence.size=10Gi --set postgresqlDataDir=/mnt/nfsshare/data/pgdata --set volumePermissions.image.repository=arm32v7/alpine --set volumePermissions.image.tag=3.10 --set securityContext.fsGroup=999 --set securityContext.runAsUser=999 --set livenessProbe.initialDelaySeconds=300 --set readinessProbe.initialDelaySeconds=300

# microservice section
microk8s kubectl apply -f farmerzon-authentication-deployment.yml
microk8s kubectl apply -f farmerzon-articles-deployment.yml
microk8s kubectl apply -f farmerzon-address-deployment.yml
microk8s kubectl expose deployment farmerzon-authentication-deployment --type=NodePort --name=farmerzon-authentication-service
microk8s kubectl expose deployment farmerzon-articles-deployment --type=NodePort --name=farmerzon-articles-service
microk8s kubectl expose deployment farmerzon-address-deployment --type=NodePort --name=farmerzon-address-service


# ingress section
farmerzonArticlesPort=$(microk8s kubectl get service farmerzon-articles-service -o json | jq '.spec.ports[0].nodePort')
farmerzonAddressPort=$(microk8s kubectl get service farmerzon-address-service -o json | jq '.spec.ports[0].nodePort')
farmerzonAuthenticationPort=$(microk8s kubectl get service farmerzon-authentication-service -o json | jq '.spec.ports[0].nodePort')

echo "apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: farmerzon-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
    - http:
        paths:
          - path: /article
            backend:
              serviceName: farmerzon-article-service
              servicePort: $farmerzonArticlesPort
          - path: /address
            backend:
              serviceName: farmerzon-address-service
              servicePort: $farmerzonAddressPort
          - path: /authentication
            backend:
              serviceName: farmerzon-authentication-service
              servicePort: $farmerzonAuthenticationPort" > ./farmerzon-ingress.yml

# microk8s kubectl apply -f farmerzon-ingress.y

# load balancer section
