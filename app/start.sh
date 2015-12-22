#!/usr/bin/env bash

cd /var/www/html

composer install

# Clean up old hhtpd context. Httpd won't start correctly if it thinks it is already running
rm -rf /run/httpd/* /tmp/httpd*

httpd -D FOREGROUND