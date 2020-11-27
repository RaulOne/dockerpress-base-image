FROM php:7.4.12-fpm

RUN set -ex; \
    \
    apt-get update && apt-get install -y --no-install-recommends \
        libjpeg-dev \
        libpng-dev \
        libfreetype6-dev \
        libzip-dev \
        libwebp-dev \
        nginx \
        supervisor \
        gnupg \
        libxml2 \
        libxml2-dev \
        subversion \
        nano \
        git \
    ; \
    \
    docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp; \
    docker-php-ext-install gd mysqli zip bcmath xml; \
    \
    rm -rf /var/lib/apt/lists/*
