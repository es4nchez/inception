FROM debian:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    gnupg \
    mariadb-client \
    php-fpm \
    php-common \
    php-mysql \
    php-mysqli \
    curl \
    less \
    net-tools \
    zsh \
    git \
    nano \
	redis \
	php-redis \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && apt-key update

# Install WP CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Copy configuration and scripts
COPY www.conf /etc/php/8.2/fpm/pool.d/
COPY entrypoint.sh /entrypoint.sh

# COPY wp-config.php /tmp/wp-config.php

# Set permissions
RUN chmod +x /entrypoint.sh && \
    mkdir -p /var/www/html /var/log/php && \
    touch /var/log/php8.2-fpm.log && \
    chown -R www-data:www-data /var/www/html && \
    chmod 755 /var/log/php && \
    chmod 644 /var/log/php8.2-fpm.log


CMD ["/entrypoint.sh"]