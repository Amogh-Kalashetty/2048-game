FROM ubuntu:latest AS build

RUN apt update -y && apt install nginx -y

RUN mkdir -p /var/www/html

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

COPY . /var/www/html/

FROM scratch 

COPY --from=build /var/www/html /var/www/html

EXPOSE 80

CMD ["usr/sbin/nginx"]
