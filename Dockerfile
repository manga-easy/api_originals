FROM php:8.1.7-alpine

RUN apt-get update -y
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql

EXPOSE 80

# CMD supervisord -n -c /etc/supervisor/supervisord.conf
#CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]