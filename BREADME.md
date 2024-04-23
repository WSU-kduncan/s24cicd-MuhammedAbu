# Bonus 1 - Return of the Load Balancer - 5% Extra Credit

***The updated template can be found in this directory and is called `bonus-cf-template.yml`.***

## Flow Diagram:
Here is visual representation of the flow, showcasing a load balancer distributing incoming traffic across multiple EC2 instances. Each instance is configured to execute a Docker container, thereby hosting the web application and ensuring optimal performance and scalability.

### Flow diagram: ![flow-diagram](![image](https://github.com/WSU-kduncan/s24cicd-MuhammedAbu/assets/112053604/7d04eca2-58d3-475c-b424-a724558836b4)


## CF Project Overview:
This bonus project is to revisit project 3, the load balancing project, and configure my hosts run a containerized web app instead of my manually configured web service I originally had done in the load balancer project. I'll use the infrastructure of an EC2 instance in conjunction with a load balancer. Central to this deployment strategy is the utilization of an enhanced CloudFormation template, created to facilitate a seamless installation of Docker on EC2 instances and the subsequent deployment of the web application container sourced from Docker Hub, without installing any unneeded software. 

## Deployment Process:

1. **CloudFormation Template Enhancement:** The initial phase entails the refinement of the CloudFormation template to incorporate essential modifications necessary for Docker installation and the retrieval of the web application image from Docker Hub.
2. **Resource Deployment:** With the enhanced CloudFormation template finalized, the deployment process continues, provisioning of requisite AWS resources in accordance with the refined specifications.
3. **Validation and Accessibility Verification:** A pivotal aspect of the deployment process involves rigorous validation that each EC2 instance successfully executes the Docker container housing the web application. Furthermore, verification of accessibility via the load balancer ensures seamless user interaction with the deployed application.

4. To deploy the Docker container using the CloudFormation stack via the AWS CloudFormation console, utilize the updated CF template when prompted to specify the template and upload the template file. The template will handle tasks such as downloading Docker, adding the ubuntu user to the Docker group, pulling the Docker image, and managing minor actions on the two instances. Next, log into each instance using `ssh -i <keypair> ubuntu@<InstanceIP>` then use `docker ps -a` to check running containers. If a container is running, stop it with docker stop `<container-name>`, otherwise restart it with docker restart `<container-name>`. Navigate to the AWS console to locate Load Balancers and confirm that the load balancer for two instances is operational. Copy and paste the DNS name into your web browser to confirm that the deployment process was succesful and that the web application can be accessed. 
