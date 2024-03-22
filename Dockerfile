# Use an official NGINX runtime as the base image
FROM ubuntu:latest

# Update packages and install apache2
RUN apt-get update
RUN apt-get install -y nginx

# Copy my index.html into nginx container
COPY ./website/index.html /var/www/html

# Expose port 80 to allow external access to the NGINX server
EXPOSE 80

# start nginx
CMD ["systemctl", "start", "nginx"]

