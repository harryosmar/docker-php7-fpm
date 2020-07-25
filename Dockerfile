FROM php:7.2-fpm
RUN apt-get update && apt-get install -y \
        git \
		build-essential \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        locales \
        zip \
        vim \
		unzip \
		curl \
	&& docker-php-ext-install pdo_mysql mbstring zip exif pcntl \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer