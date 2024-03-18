# Use an official NGINX runtime as the base image
FROM nginx:latest

# Copy the contents of the current directory into the container at /usr/share/nginx/html
COPY . /usr/share/nginx/html

# Expose port 80 to allow external access to the NGINX server
EXPOSE 80

