FROM debian:buster-slim

RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    gnupg \
    ca-certificates \
    unzip \
    php7.3 \
    php7.3-fpm \
    php7.3-mysql \
    php7.3-curl \
    php7.3-gd \
    php7.3-intl \
    php7.3-mbstring \
    php7.3-soap \
    php7.3-xml \
    php7.3-xmlrpc \
    php7.3-zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html



RUN curl -o latest.zip -SL https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    rm latest.zip

RUN cp -r wordpress /var/www/html/wordpress/

RUN rm /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php/

RUN touch /run/php/php7.3-fpm.pid

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/wp-config.php /var/www/html/wordpress/wp-config.php

WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

#ENTRYPOINT [ "tail", "-f","/dev/null" ]
CMD ["php-fpm7.3", "-F", "-R"]