FROM php:7.0-fpm-alpine
# Install modules
RUN apk upgrade --update && apk add \
    autoconf file g++ gcc binutils isl libatomic libc-dev musl-dev make re2c libstdc++ libgcc libcurl binutils-libs mpc1 mpfr3 gmp libgomp coreutils freetype-dev libjpeg-turbo-dev libltdl libmcrypt-dev libpng-dev openssl-dev libxml2-dev expat-dev \
    && docker-php-ext-install iconv mysqli pdo pdo_mysql curl bcmath mcrypt mbstring json xml zip bz2 opcache \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd 

RUN rm -rf /var/cache/apk/*

RUN usermod -u 1000 www-data && usermod -G staff www-data

CMD ["php-fpm"]