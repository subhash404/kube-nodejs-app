KUBERNETES_REGISTRY=aws-ecr
echo "Enter Docker ECR"
read DOCKER_ECR
echo "Docker UserName"
read DOCKER_USERNAME
echo "Docker EMAIL"
read DOCKER_EMAIL
DOCKER_SECRET=$(aws ecr get-login | sed -e 's/.*-p //' -e 's/ .*$//')
kubectl delete secrets ${KUBERNETES_REGISTRY} 2> /dev/null
kubectl create secret docker-registry ${KUBERNETES_REGISTRY} \
--docker-server=${DOCKER_ECR} \
--docker-username=${DOCKER_USERNAME} \
--docker-password=${DOCKER_SECRET} \
--docker-email=${DOCKER_EMAIL}
