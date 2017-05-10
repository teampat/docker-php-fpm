FROM php:7.0-fpm

RUN set -ex; apt-get update; \
    apt-get install -y libjpeg-dev libpng12-dev; \
	rm -rf /var/lib/apt/lists/*; \
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
	docker-php-ext-install gd mysqli opcache

RUN usermod -u 1000 www-data; \
    usermod -a -G users www-data

RUN chown -R www-data:www-data /var/www

WORKDIR /var/www/html

CMD ["php-fpm"]