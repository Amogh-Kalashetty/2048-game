FROM ubuntu:latest 

RUN apt update -y && apt install nginx -y

RUN mkdir -p /var/www/html

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

COPY . /var/www/html/

EXPOSE 80

CMD ["usr/sbin/nginx"]
