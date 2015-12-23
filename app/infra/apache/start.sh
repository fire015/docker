#!/usr/bin/env bash

# Symlink the apache vhosts file
ln -s /run/apache/vhosts.conf /etc/httpd/conf.d/vhosts.conf

cd /var/www/html

composer install

# Clean up old hhtpd context. Httpd won't start correctly if it thinks it is already running
rm -rf /run/httpd/* /tmp/httpd*

httpd -D FOREGROUND