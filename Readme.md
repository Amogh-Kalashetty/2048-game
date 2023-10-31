## 1. Install java 17

sudo apt update
sudo apt install fontconfig openjdk-17-jre

## 2. Install jenkins

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins

## 3. Install docker

sudo apt-get install docker.io -y


## 4. add users to docker group - 
sudo usermod -aG docker $USER
sudo usermod -aG docker jenkins

## 5. start Jenkins service 
sudo systemctl enable jenkins
sudo sysemctl start jenkins


## 6. Build the docker image

docker build . -t 2048

## 7. Run the docker image
docker run -d -p 80:80 2048:latest

<!-- Make sure to allow the ports 80 in inbound rules in the security group if you are running the docker in aws ec2 instance -->


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