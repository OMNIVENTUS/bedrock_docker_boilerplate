# Use an official Debian-based PHP 8.2.10 image with Apache
FROM php:8.2.10-apache-bullseye

# Enable necessary PHP extensions
RUN docker-php-ext-install pdo_mysql mysqli

# Set the working directory
WORKDIR /app

# Copy your PHP application to the container
COPY . .
RUN apt-get update 
RUN apt-get install -y zip unzip p7zip-full vim 
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_VERSION 2.5.8
# Copy your custom php.ini file into the container
#COPY custom-php.ini /usr/local/etc/php/conf.d/
COPY vhost.conf /etc/apache2/sites-available/000-default.conf

RUN a2ensite 000-default.conf

# Enable mod_rewrite for WordPress permalinks
RUN a2enmod rewrite

# Install dependencies using Composer
RUN composer install

# Expose port 80 for Apache
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]
