Install java 17
Install jenkins
Install docker

add users to docker group - 
sudo usermod -aG docker $USER
sudo usermod -aG docker jenkins

sudo systemctl enable jenkins
sudo sysemctl start jenkins


docker build . -t 2048
docker run -d -p 80:80 2048:latest




## Dockerfile ( data stored locally ) 

FROM ubuntu:22.04

RUN apt-get update -y && apt-get install -y nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN mkdir -p /var/www/html

COPY . /var/www/html/

EXPOSE 80

CMD ["usr/sbin/nginx"]


##Dockerfile ( download data directly from the server)

FROM ubuntu:22.04

RUN apt-get update -y && apt-get install zip curl nginx -y

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN mkdir -p /var/www/html \
    && curl -o /var/www/html/master.zip -L https://codeload.github.com/gabrielecirulli/2048/zip/master \
    && cd /var/www/html \
    && unzip master.zip \
    && mv 2048-master/* . \
    && rm -rf 2048-master master.zip

EXPOSE 80

CMD ["/usr/sbin/nginx"]