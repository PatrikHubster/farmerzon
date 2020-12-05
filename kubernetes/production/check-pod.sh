#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -s <service-name> -d <deployment> -e <service-endpoint>"
   echo -e "\t-s Name of the internal ClusterIP of the deployment you want to test."
   echo -e "\t-d Name of the deployment which should be requested."
   exit 1 # Exit script after printing help
}

while getopts ":s:d:e:" opt
do
   case "$opt" in
      s ) parameterService="$OPTARG" ;;
      d ) parameterDeployment="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$parameterService" ] || [ -z "$parameterDeployment" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct
servicePort=$(microk8s kubectl get service $parameterService -o json | jq -r '.spec.ports[0].port')
serviceIp=$(microk8s kubectl get service $parameterService -o json | jq -r '.spec.clusterIP')
echo "-- service info --------------------------------------------------------------------------------------------"
echo "service=$serviceIp:$servicePort"
echo "-- environment variables ------------------------------------------------------------------------------------"
microk8s kubectl exec $parameterDeployment -- env
