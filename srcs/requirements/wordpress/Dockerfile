FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    wget \
    bash \
    nano \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    curl \
    tar \
    && apt-get clean

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/php-fpm.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir /run/php

COPY ./tools/script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/script.sh
ENTRYPOINT ["/usr/local/bin/script.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"]