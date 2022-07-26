FROM php:8.1.7-apache

RUN apt-get update -y
RUN apt-get install -y unzip vim
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN HASH=`curl -sS https://composer.github.io/installer.sig`
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN mkdir /var/www/public
#config supervisord
RUN mkdir -p /var/www/html/ /var/log/supervisor
COPY supervisord.conf /etc/supervisor/supervisord.conf
#config apache
COPY apache/apache2.conf /etc/apache2/apache2.conf
COPY apache/revers_proxy.conf /etc/apache2/conf-available/revers_proxy.conf
COPY apache/.htaccess /var/www/public/
COPY apache/.htaccess_public /var/www/
RUN a2enconf revers_proxy
RUN a2enmod rewrite
RUN a2enmod actions
RUN a2enmod proxy proxy_http
#config composer
WORKDIR /var/www/public
COPY . /var/www/public
RUN rm -rf composer.lock
RUN rm -rf vendor
RUN composer install
EXPOSE 80

# CMD supervisord -n -c /etc/supervisor/supervisord.conf
#CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]