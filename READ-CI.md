# Continuous Integrationn (CI) Project Overview:

### 1. What are you doing?

We are setting up a workflow to run a project locally using Docker. This involves installing Docker and its dependencies, building a Docker image from a Dockerfile, running the container, and viewing the project running inside the container.

### 2. Why?

Setting up a local development environment with Docker allows developers to have consistent and reproducible environments across different machines. It helps in isolating dependencies and ensures that the project behaves consistently across various environments, including development, testing, and production.

### 3. What tools?

For this task, we'll use Docker for containerization and running our project. We'll also use any necessary dependencies required by Docker, such as Docker Desktop for Windows or Docker Engine for Linux. Additionally, we may need a web browser to view the project running inside the container.

### 4. Run Project Locally:

Assuming the project is Dockerized and contains a Dockerfile, we'll proceed with the following steps:

### 5. How to install Docker + Dependencies (WSL2, for example):

- For WSL2, you can follow the instructions provided by Docker to install Docker Desktop for Windows: [Docker Desktop for Windows](https://docs.docker.com/desktop/install/).

### 6. How to build an image from the Dockerfile:

- Once Docker is installed, navigate to the directory containing your Dockerfile in your terminal.

## Create the container image:
- To create a container image you can do the following:
- `touch Dockerfile` Create a New File Named Dockerfile in project directory.
- Edit the Dockerfile: Open the Dockerfile in a text editor of your choice and add the necessary instructions. The structure of the Dockerfile will depend on your specific requirements, such as the base image you want to use and the setup of your application. Here's a basic example for setting up a simple web server using NGINX:
```
  # Use an official NGINX runtime as the base image
FROM nginx:latest

# Copy the contents of the current directory into the container at /usr/share/nginx/html
COPY . /usr/share/nginx/html

# Expose port 80 to allow external access to the NGINX server
EXPOSE 80
```
- In this example:

FROM: Specifies the base image to use. Here, we're using the official NGINX image.
COPY: Copies the contents of the current directory (the project directory) into the container's /usr/share/nginx/html directory, which is where NGINX serves its content from by default.
EXPOSE: Exposes port 80 to allow external access to the NGINX server.
- Use the `docker build` command to build the Docker image. For example:
  ```
  docker build -t your_image_name .
  ```
  
### 7. How to run the container:

- After building the Docker image, you can run a container using the `docker run` command. For example:
  ```
  docker run -d -p 8080:80 your_image_name
  ```

### 8. How to view the project running in the container:

- Open a web browser and navigate to `http://localhost:8080` to view the project running inside the container.
- If you're using WSL2, you may need to find the IP address of your WSL2 instance and use that instead of `localhost`. You can find the IP address by running `ip addr show eth0` inside your WSL2 terminal and looking for the `inet` address.

By following these steps, you'll be able to run your project locally using Docker and view it in a web browser. This setup provides a consistent and isolated environment for local development.

Resources:
1. [CEG3120 - containers.md](https://github.com/pattonsgirl/CEG3120/blob/main/CourseNotes/containers.md
2. [complete-intro-to-containers](https://btholt.github.io/complete-intro-to-containers/)
3. [container-networking-from-scratch](https://labs.iximiuz.com/tutorials/container-networking-from-scratch)
4. [DockerLabs - Docker Cheat Sheet](https://labs.iximiuz.com/tutorials/container-networking-from-scratch)
5. [Ivan Velichko's blog](https://iximiuz.com/en/)
