FROM debian:jessie

MAINTAINER Pierre-Antoine 'ZHAJOR' Tible <antoinetible@gmail.com>

RUN apt-get update
RUN apt-get -y install apache2 libapache2-mod-php5 php5 php5-mcrypt php5-pgsql php5-mysql
RUN apt-get clean

RUN ln -sf /dev/stdout /var/log/apache2/access.log 
RUN ln -sf /dev/stderr /var/log/apache2/error.log

COPY apache2.conf /etc/apache2/apache2.conf

RUN /usr/sbin/a2enmod rewrite

RUN rm -rf /var/www/html
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/log/apache2 /var/www/html
RUN chown -R www-data:www-data /var/lock/apache2 /var/run/apache2 /var/log/apache2 /var/www/html

ADD run.sh /run.sh
RUN chmod -v +x /run.sh

EXPOSE 80

VOLUME ["/var/www/html"]

CMD ["/run.sh"]
