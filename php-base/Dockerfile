FROM centos:7

RUN yum update -y && yum clean all

RUN yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
  && yum -y install --enablerepo=remi,remi-php56 \
  php \
  php-devel \
  php-gd \
  php-zip \
  php-mbstring \
  php-mcrypt \
  php-mysqlnd \
  php-opcache \
  php-pdo \
  php-xml \
  php-bcmath \
  php-pecl-memcached \
  php-pecl-imagick \
  php-fpm \
  httpd \
  supervisor \
  npm \
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