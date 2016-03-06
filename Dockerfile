FROM php:5.6-apache
USER ROOT
COPY src/ /var/www/html/
