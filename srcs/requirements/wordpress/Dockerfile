FROM debian:buster
RUN apt-get update && apt-get install -y php7.3-fpm php-mysql php-mbstring vim wget
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

ADD https://wordpress.org/latest.tar.gz /var/www/
RUN cd /var/www && tar -xzvf latest.tar.gz
RUN rm -f /var/www/latest.tar.gz

COPY ./conf/wp-config.php /var/www/wordpress/
COPY ./conf/wp-install.sh /

ADD ["https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar", "./"] 
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir ./run/php/
CMD ./usr/sbin/php-fpm7.3 -F

ENTRYPOINT ["./wp-install.sh"]
