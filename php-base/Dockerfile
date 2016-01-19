FROM centos:7

RUN yum update -y && yum clean all

RUN yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
  && yum -y install --enablerepo=remi,remi-php56 \
  php-5.6* \
  php-devel-5.6* \
  php-gd-5.6* \
  php-mbstring-5.6* \
  php-mcrypt-5.6* \
  php-mysqlnd-5.6* \
  php-opcache-5.6* \
  php-pdo-5.6* \
  php-pear-1.9 \
  php-xml-5.6* \
  php-bcmath-5.6* \
  php-pecl-memcached-2.2* \
  php-pecl-imagick-3.3* \
  php-fpm-5.6* \
  httpd-2.4.6 \
  supervisor \
  npm \
  bzip2 \
  git \
  make \
  mysql \
  ImageMagick \
  mod_ssl \
  openssl \
  telnet \
  nano

RUN pecl install Xdebug

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN npm update -g npm

RUN rm /etc/httpd/conf.d/welcome.conf \
  && sed -i -e "s/Options\ Indexes\ FollowSymLinks/Options\ -Indexes\ +FollowSymLinks/g" /etc/httpd/conf/httpd.conf \
  && sed -i -e "s/EnableSendfile on/EnableSendfile off/g" /etc/httpd/conf/httpd.conf \
  && sed -i -e "s/expose_php\ =\ On/expose_php\ =\ Off/g" /etc/php.ini \
  && echo "FileETag None" >> /etc/httpd/conf/httpd.conf \
  && echo "ServerTokens Prod" >> /etc/httpd/conf/httpd.conf \
  && echo "ServerSignature Off" >> /etc/httpd/conf/httpd.conf

COPY php.d/* /etc/php.d/

RUN usermod -u 1000 apache && ln -sf /dev/stdout /var/log/httpd/access_log && ln -sf /dev/stderr /var/log/httpd/error_log

CMD httpd -D FOREGROUND