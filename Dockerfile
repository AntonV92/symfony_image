FROM php:8.1-fpm

WORKDIR /app

ADD ./composer.sh /app

RUN bash /app/composer.sh
RUN mv composer.phar /usr/local/bin/composer

RUN apt update && apt -y install libicu-dev
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

RUN docker-php-ext-install opcache

RUN echo 'deb [trusted=yes] https://repo.symfony.com/apt/ /' | tee /etc/apt/sources.list.d/symfony-cli.list
RUN apt update
RUN apt -y install symfony-cli
RUN apt -y install nano
RUN mv /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini