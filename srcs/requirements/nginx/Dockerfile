FROM debian:buster
RUN apt-get update && apt-get install nginx -y && apt-get install openssl -y
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=RU/L=Kazan/O=21School/OU=IT/CN=elaronda.42.fr"
COPY ./conf/default etc/nginx/sites-enabled/
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
