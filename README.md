# Minimalist Application Development / Docker / Kubernetes

A  microservice that returns the current UTC timestamp and the client's IP address. We will automate our application using Jenkins CI/CD and deploy it on Kubernetes.

# Requirements
We require two EC2 instances, the first EC2 will be used for the Jenkins server and the CI pipeline. The second one will be used to deploy our application. We have to take SSH from 1st server to the second server.

# For 1st ec2 server
Install Jenkins  Docker, git, trivy
Jenkins - to automate our application, add a Jenkins user to the /etc/sudoers file, configure AWS, and an IAM role
Docker - to create an image of our application
Trivy - for scanning image vulnerabilities
Start Jenkins, it will run on port 8080.
Create a job pipeline -
# CI pipeline
In this pipeline, we clone our git repo onto our server, which creates a Docker image of our application. Then, our image will get scanned using trivy, then the Docker image is pushed to ECR.
Create a repo inside ECR 
Give IAM role to our server for accessing ECR.

# For 2nd EC2 Server
Install Kubernetes and Docker

# CD pipeline
Create a cluster, inside that cluster, create a deployment using any image.
Jenkins server will SSH into the Kubernetes server, and it will pull the image from ECR and set this pull image into the deployment, and using the service, we will expose our application externally.
