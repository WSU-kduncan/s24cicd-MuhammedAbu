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

