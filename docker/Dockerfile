FROM alpine:3.10

RUN apk --no-cache add \
  git \
  curl \
  openssl \
  php7 \
  php7-cli \
  php7-mbstring \
  php7-session \
  php7-json \
  php7-openssl \
  php7-pear \
  php7-phar \
  php7-iconv \
  php7-xml \
  php7-simplexml \
  php7-curl \
  apache2 \
  apache2-proxy \
  apache2-ssl \
  php7-apache2

#composer
RUN curl -sS https://getcomposer.org/installer \
  | php7 -- --version=1.10.22 --install-dir=/usr/bin --filename=composer

RUN git clone "https://github.com/open774/p2-php.git" /app

# COPY phpinfo.php /var/www/html/index.php

WORKDIR /app

RUN chmod 0777 /app/data/* /app/rep2/ic

RUN composer remove --no-update "dropbox/dropbox-sdk"
RUN composer install

COPY apache-site.conf /etc/apache2/conf.d/site.conf

COPY conf_admin_ex.inc.php /app/conf/conf_admin_ex.inc.php

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]
# httpd -D FOREGROUND
