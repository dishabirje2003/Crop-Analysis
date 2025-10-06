# Use PHP with Apache
FROM php:8.2-apache

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Copy your entire project into the container
COPY . /var/www/html/

# Set working directory
WORKDIR /var/www/html

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Expose port 80 for web traffic
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]
