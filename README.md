# particle41
This README is prepared as part of the assessment for Particle41. It provides a step-by-step guide to deploy the SimpleTimeService Python application, covering the complete process from infrastructure provisioning to application deployment and access.

# Directory structure
Note: there are 3 folders in this repository
1. App-dockerfile-github_action
2. EKS-Cluster-Terraform
3. k8-deployment-file

# How to use
1. **App-dockerfile-github_action**
   --> This folder contains the main Python application, along with the requirements.txt, Dockerfile, and a GitHub Actions workflow file for automated build and push (CI/CD). The latest version of the application image has already been built and published as a public image via GitHub Actions, which can be used for testing purposes. For more details on the build and push process, please refer to the GitHub Actions pipeline configuration. The workflow is configured such that on every push to the main branch, it automatically builds the Docker image and publishes it as a publicly accessible image.

2. **EKS-Cluster-Terraform**
   ---> This directory contains complete Terraform configuration files, including main.tf, variables.tf, and terraform.tfvars, which are used to deploy a full Kubernetes (K8) cluster in your AWS account. To begin, initialize Terraform by running "terraform init". Then configure your AWS credentials using <aws configure> command, where you will provide your "AWS Access Key", "Secret Key", default region, and output format. After the setup is complete, run <terraform plan> to review the execution plan and then deploy the infrastructure using <terraform apply --auto-approve>. Once Terraform has successfully provisioned the Kubernetes cluster, you can connect to it by updating your kubeconfig with the command "aws eks update-kubeconfig --region <your-region> --name <your-cluster-name>", and verify the connection using command <kubectl get nodes>.

3. **k8-deployment-file**
   ---> This directory contains the complete Kubernetes deployment manifest, including a NodePort service definition. Once the Kubernetes cluster has been successfully provisioned, you can deploy the application by running <kubectl apply -f k8-deployment.yml>. This command will create all the required Kubernetes resources and deploy the "SimpleTimeService" application. The container image for the application has already been specified in the manifest, so no additional configuration is required. After successful deployment, the application will be accessible via the external IP and port exposed through the NodePort service.