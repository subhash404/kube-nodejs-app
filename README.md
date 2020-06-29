# kube-nodejs-app

# For Node js Image Build 

    Dockerfile,package.json,package-lock.json,index.json are the files which are related to build the Docker image

# For build the Docker image Enter the Directory of the Docker file and Enter the Below Command

    docker build -t tagname:version .

#Login to the docker/ECR with your creds

aws ecr get-login

	you will get the command and run it then automatically you will logged into the ecr

#				or else 

	enter docker login it will ask you your username and password 

docker push tagname:version

# For pulling the images we need to create secret of AWS ECR that secret must be with the name aws-ecr because of we set imagepullsecret with that name

        sh aws-ecr-login.sh

# For nodejs Deployment run the Below command 

      kubectl create -f Deployment.yaml 

# For nodejs Service creation run the below command

          kubectl create -f service.yaml

# For Autoscalling purpose need to create the HPA # Horizontalpod autoscaler kind for that execute the below command 

           kubectl create -f hpa.yaml

# if you want to check the hpa increse the load on the nodejs container then it will automatically increase the pods 


# For Checking the pods always we have count of 7 or not we need to chaange the version of a nodejs image by using below command 

kubectl set image deployment nodejs nodejs=subhash403/nodejs:v2 --record

# then check the result by using below command 

watch kubectl get pods 


