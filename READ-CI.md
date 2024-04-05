# Continuous Integrationn (CI) Project Overview:

Helpful commands:
- `docker ps -a` - This command lists all containers, including those that are currently running (-a flag shows all containers, not just running ones). It provides information such as the container ID, image used to create the container, command being run, creation time, status, ports, and names.
- `docker images` - This command lists all Docker images that are stored locally on your system. These images are essentially the blueprints for creating Docker containers. The list includes the repository, tag, image ID, and creation time.
- `docker start <image_name:tag>` - This command starts a Docker container based on the specified image. You need to provide the image name and tag. If the container is already created but stopped, this command will start it up.
- `docker attach <container_name>` - This command attaches the terminal session to a running container based on the specified image. It allows you to interact with the container's running processes. Note that you should provide the container's name or ID
- `docker rmi <image_name:tag>` - removes image
- `docker rm <container_name>` - removes container

### 1. What are you doing?

Setting up a workflow to run a project locally using Docker. This involves installing Docker and its dependencies, building a Docker image from a Dockerfile, running the container, and viewing the project running inside the container.

### 2. Why?

Setting up a local development environment with Docker allows developers to have consistent and reproducible environments across different machines. It helps in isolating dependencies and ensures that the project behaves consistently across various environments, including development, testing, and production.

### 3. What tools?

I'll use Docker for containerization and use WSL2 running the project. I'll also use any necessary dependencies required by Docker, such as Docker Desktop for Windows or Docker Engine for Linux. Additionally, I may need a web browser to view the project running inside the container.

### 4. How to install Docker + Dependencies (WSL2, for example):

- For WSL2, follow the instructions provided by Docker to install Docker Desktop for Windows: [Docker Desktop for Windows](https://docs.docker.com/desktop/install/).

### 5. How to build an image from the Dockerfile:

- Once Docker is installed, navigate to the directory containing your Dockerfile in your terminal.

## Create the container image:
- To create a container image you can do the following:
- `touch Dockerfile` Create a New File Named Dockerfile in project directory.
- Edit the Dockerfile: Open the Dockerfile in a text editor of your choice and add the necessary instructions. The structure of the Dockerfile will depend on your specific requirements, such as the base image you want to use and the setup of your application. Here's a basic example for setting up a simple web server using NGINX:
```
# Uses latest ubuntu base image from docker hub
FROM ubuntu:latest

# Update packages and install apache2
RUN apt-get update
RUN apt-get install -y apache2

# Copy my index.html into apache2 container
COPY ./website/index.html /var/www/html

#Listen on port 80 for apache2
EXPOSE 80

#Runs apache2 in the foreground of the container
CMD ["apache2ctl", "-D", "FOREGROUND"]

```
- In this example:

FROM: Specifies the base image to use. Here, we're using the official NGINX image.
COPY: Copies the contents of the current directory (the project directory) into the container's /usr/share/nginx/html directory, which is where NGINX serves its content from by default.
EXPOSE: Exposes port 80 to allow external access to the NGINX server.
- Use the `docker build` command to build the Docker image. For example:
  ```
  docker build -t your_image_name .
  ```
![image](https://github.com/WSU-kduncan/s24cicd-MuhammedAbu/assets/112053604/f802048b-9017-4b80-b10e-3d6a4cf57e67)

### 6. How to run the container:

- After building the Docker image, run a container using the `docker run` command. For example:
  ```
  docker run --name <specify_container_name> -d -p 80:80 <image_name_here>:<tag>

  ```
* The `-d` is detached mode which runs the container in the background
* The `-p` is portfowarding the host port 80 and mapping it to the container on port 80 so traffic on host port 80 is forwarded to port 80 on the container

* ![image](https://github.com/WSU-kduncan/s24cicd-MuhammedAbu/assets/112053604/9aedb005-026d-4e72-9a58-4506db3732d1)



### 7. How to view the project running in the container:

- Open a web browser and navigate to `localhost` to view the project running inside the container.
- If using WSL2, you may need to find the IP address of your WSL2 instance and use that instead of `localhost`. You can find the IP address by running `ip addr show eth0` inside your WSL2 terminal and looking for the `inet` address.

- ![image](https://github.com/WSU-kduncan/s24cicd-MuhammedAbu/assets/112053604/95a2e0cb-5860-4214-9e76-8e01de2e6035)

## Part 2: Github Actions and Dockerhub
Here's a basic outline for your README-CI.md:

# Continuous Integration with DockerHub and GitHub Actions

## DockerHub Repository Setup
1. **Create DockerHub Account**: Visit [DockerHub](https://hub.docker.com/) and create an account. Choose the Free tier if prompted.
2. **Create Public Repository**: Once logged in, navigate to the "Repositories" tab and click "Create Repository". Follow the prompts to create a public repository.

## Authenticating with DockerHub via CLI
1. **Using Docker CLI**: After installing Docker on your machine, you can authenticate with DockerHub via the CLI by running:
   ```bash
   docker login -u your_username
   ```
   You will then be prompted to enter your DockerHub password.

## Pushing Container Image to DockerHub (without GitHub Actions)
1. **Build Image**: First, build your Docker image locally using the Docker CLI. Navigate to your project directory and run:
   ```bash
   docker build -t your_username/image_name .
   ```
2. **Push Image**: Once the image is built, push it to DockerHub with:
   ```bash
   docker push your_username/image_name
   ```

## Link to DockerHub Repository
- [Link to DockerHub Repository](https://hub.docker.com/repository/docker/your_username/repository_name)

## Configuring GitHub Secrets
1. **Setting a Secret**: In my GitHub repository, went to "Settings" > "Secrets" and clicked "New Repository Secret". Typed in my DockerHub username and password as secrets named `DOCKER_USERNAME` and `DOCKER_PASSWORD` respectively.

## GitHub Workflow
- **Behavior**: The GitHub Actions workflow is set up to automatically build and push your Docker image to DockerHub whenever changes are pushed to the repository.
- **Custom Variables**:
   - `DOCKER_USERNAME`: The DockerHub username.
   - `DOCKER_PASSWORD`: The DockerHub password.
   - Other variables specific to your project can be customized within the workflow file.
   - Make sure to update any variables or configurations that might need to be changed if someone else is using or reusing this workflow.

To set up a GitHub Actions workflow to build and push a Docker image to DockerHub, you need to create a YAML file in your GitHub repository that defines the workflow. Here's a step-by-step guide:

Create GitHub Actions Workflow File: Inside your GitHub repository, create a directory named .github/workflows if it doesn't exist already. Then, create a YAML file inside this directory. You can name it anything, for example, docker_build.yml.

Define Workflow Steps: In the YAML file, define the steps for your workflow. You need to include steps for checking out the repository, logging in to DockerHub, building the Docker image, and pushing it to DockerHub. Here's a basic example:

```
name: Build and Push Docker Image

on:
  push:
    branches:
      - main  # Change this to your main branch name

jobs:
  build-and-push:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Log in to DockerHub
        run: echo "${{ secrets.DOCKER_PASSWORD }}" | docker login -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin

      - name: Build Docker image
        run: docker build -t your_username/image_name .

      - name: Push Docker image to DockerHub
        run: docker push your_username/image_name
```

[My dockerhub repository](https://hub.docker.com/u/muhammeda)


Resources for Part 1:
1. [CEG3120 - containers.md](https://github.com/pattonsgirl/CEG3120/blob/main/CourseNotes/containers.md
2. [complete-intro-to-containers](https://btholt.github.io/complete-intro-to-containers/)
3. [container-networking-from-scratch](https://labs.iximiuz.com/tutorials/container-networking-from-scratch)
4. [DockerLabs - Docker Cheat Sheet](https://labs.iximiuz.com/tutorials/container-networking-from-scratch)
5. https://docs.docker.com/reference/cli/docker/image/build/

Resources for part 2:
- [Docker Docs - CICD with GitHub Actions](https://docs.docker.com/ci-cd/github-actions/)
- [GitHub Actions - build-push-action documentation](https://github.com/marketplace/actions/build-and-push-docker-images)
- [GitHub - publishing images to DockerHub](https://docs.github.com/en/actions/guides/publishing-docker-images#publishing-images-to-docker-hub)



