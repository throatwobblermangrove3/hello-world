#!/bin/bash -x

#  See page 17, Chapter 2, Running Software in Containers from the book _Docker_In_Motion_

# Wordpress version 5.7
# PHP 7.2
# Apache

# Create database

DB_CID=$(docker create -e MYSQL_ROOT_PASSWORD=Ad1scgolf mysql:5.7)

# Start the database

docker start $DB_CID


# Create a Wordpress 5.0 CMS  with PHP 7.2 and serve it from an Apache Web Server

WP_CID=$(docker create --link $DB_CID:mysql -p 9299:80 \
    --read-only -v /run/apache2/ --tmpfs /tmp \
    wordpress:5.0.0-php7.2-apache)

# Start Wordpress

docker start $WP_CID
