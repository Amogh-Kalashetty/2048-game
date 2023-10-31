FROM ubuntu:22.04

RUN apt-get update -y && apt-get install -y nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN mkdir -p /var/www/html

COPY . /var/www/html/

EXPOSE 80

CMD ["usr/sbin/nginx"]
