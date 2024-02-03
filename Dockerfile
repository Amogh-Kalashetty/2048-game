FROM nginx:alpine

COPY . /usr/share/nginx/html/

RUN apk update && apk add bash

#RUN apt update -y && apt install nginx -y

#RUN mkdir -p /var/www/html

#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

#COPY . /var/www/html/

EXPOSE 80

#CMD ["usr/sbin/nginx"]

#CMD ["nginx", "-g", "daemon off;"]

