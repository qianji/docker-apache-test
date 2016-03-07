FROM php:5.6-apache
USER jenkins
COPY src/ /var/www/html/
