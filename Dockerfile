# Use PHP with Apache
FROM php:8.2-apache

# Install Python, pip, and venv
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

# Copy your project files
COPY . /var/www/html/
WORKDIR /var/www/html

# Create a virtual environment and install Python dependencies inside it
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
