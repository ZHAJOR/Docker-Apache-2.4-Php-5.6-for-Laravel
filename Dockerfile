FROM debian:jessie

MAINTAINER Pierre-Antoine 'ZHAJOR' Tible <antoinetible@gmail.com>

COPY run.sh /run.sh

RUN apt-get update && apt-get -y install\
        apache2=2.4.*\
        libapache2-mod-php5\
        php5\
        php5-mcrypt\
        php5-pgsql\
        php5-mysql\
        php5-gd\
        php5-curl &&\
        apt-get clean &&\
        /usr/sbin/a2enmod rewrite &&\
        rm -rf /var/www/html &&\
        mkdir -p /var/lock/apache2 /var/run/apache2 /var/log/apache2 /var/www/html &&\
        chown -R www-data:www-data /var/lock/apache2 /var/run/apache2 /var/log/apache2 /var/www/html &&\
        chmod -v +x /run.sh &&\
        ln -sf /dev/stderr /var/log/apache2/error.log &&\
        ln -sf /dev/stdout /var/log/apache2/access.log

COPY apache2.conf /etc/apache2/apache2.conf

EXPOSE 80

VOLUME ["/var/www/html"]

CMD ["/run.sh"]
