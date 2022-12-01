FROM alpine

RUN apk add --no-cache php php-apache2 tzdata && \
    rm -rf /var/www/localhost/htdocs/index.html

ENV TZ=Europe/Kiev

COPY src/index.php /var/www/localhost/htdocs
COPY src/default.conf /etc/apache2/conf.d

EXPOSE 80

ENTRYPOINT ["httpd", "-D", "FOREGROUND"]