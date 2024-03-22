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
  docker run --name <container_name_here> -d -p 80:80 <image_name_here>:<tag>

  ```
* The `-d` is detached mode which runs the container in the background
* The `-p` is portfowarding the host port 80 and mapping it to the container on port 80 so traffic on host port 80 is forwarded to port 80 on the container

* ![image](https://github.com/WSU-kduncan/s24cicd-MuhammedAbu/assets/112053604/9aedb005-026d-4e72-9a58-4506db3732d1)




### 7. How to view the project running in the container:

- Open a web browser and navigate to `localhost` to view the project running inside the container.
- If using WSL2, you may need to find the IP address of your WSL2 instance and use that instead of `localhost`. You can find the IP address by running `ip addr show eth0` inside your WSL2 terminal and looking for the `inet` address.

Resources:
1. [CEG3120 - containers.md](https://github.com/pattonsgirl/CEG3120/blob/main/CourseNotes/containers.md
2. [complete-intro-to-containers](https://btholt.github.io/complete-intro-to-containers/)
3. [container-networking-from-scratch](https://labs.iximiuz.com/tutorials/container-networking-from-scratch)
4. [DockerLabs - Docker Cheat Sheet](https://labs.iximiuz.com/tutorials/container-networking-from-scratch)
5. https://docs.docker.com/reference/cli/docker/image/build/


