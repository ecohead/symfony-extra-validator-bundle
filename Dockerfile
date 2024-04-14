FROM php:8.2.1-cli

# Install tool to manage PHP extensions as official Docker images
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# Install symfony-cli
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash; \
    apt install -y symfony-cli;

# Install required dependencies
RUN chmod +x /usr/local/bin/install-php-extensions; \
  install-php-extensions intl @composer;

# Copy app files from the app directory.
COPY ./ /var/www/html

WORKDIR /var/www/html
