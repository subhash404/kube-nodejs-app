 #  kube-nodejs-app

 For Node js Image Build 

    Dockerfile,package.json,package-lock.json,index.json are the files which are related to build the Docker image

 For build the Docker image Enter the Directory of the Docker file and Enter the Below Command

                           docker build -t tagname:version .


Login to the docker/ECR with your creds

			aws ecr get-login

you will get the command and run it then automatically you will logged into the ecr
or else enter docker login it will ask you your username and password 

		docker push tagname:version

 For pulling the images we need to create secret of AWS ECR that secret must be with the name aws-ecr because of we set imagepullsecret with that name

        sh aws-ecr-login.sh

For HPA we need  metric server for metric server execute the below command 

	kubectl create -f metric-server.yaml

 Validate the Metric server by using the below command 

	kubectl top nodes
	kubectl top pods 


 For nodejs Deployment run the Below command 

      kubectl create -f Deployment.yaml 

For nodejs Service creation run the below command

          kubectl create -f service.yaml

For Autoscalling purpose need to create the HPA # Horizontalpod autoscaler kind for that execute the below command 

           kubectl create -f hpa.yaml

if you want to check the hpa increse the load on the nodejs container then it will automatically increase the pods 


#### For Checking the pods always we have count of 7 or not we need to chaange the version of a nodejs image by using below command 

		kubectl set image deployment nodejs nodejs=subhash403/nodejs:v2 --record

### then check the result by using below command 

		watch kubectl get pods 

###  ------------------------------------------  ANSIBLE -------------------------------------------

### Kubernetes Deployment using  ANSIBLE 


###### For build the Docker image by using Ansible if you want to change the image version change the variable of imagename in ansible_image_build.yaml

			ansible-playbook ansible_image_build.yaml


For Create Deployment HPA service and pririty class you run the below ansible yaml

			ansible-playbook ansible_manifest.yaml


###  ------------------------------------------  Terraform -------------------------------------------

cd terraform_nodejs

### For checking and validating the tf files bu using below command

    terraform validate
    terraform plan 


### For creating the Deployments,service priority class and hpa by using below command with terraform 

           terraform apply -auto-approve


####  You can find the Sample Metrics from 

		load-test-metrics.txt
