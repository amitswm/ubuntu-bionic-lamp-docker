# ubuntu-bionic-lamp-docker
Ubuntu 18.04 (bionic) LAMP Docker container
This project bulds a simple Ubuntu 18.04 LAMP docker container. It is based on the official Ubuntu 18.04 (bionic) Docker image.

What’s included:

Ubuntu 18.04.1 LTS
Apache 2.4.29
MariaDB Server 10.1.43
PHP 7.2.24

Build instructions

Download the ubuntu-bionic-lamp-docker repository:
git clone https://github.com/amitswm/ubuntu-bionic-lamp-docker.git

Build the image:
cd ubuntu-bionic-lamp-docker
docker build -t "username/ubuntu-bionic-lamp" .

Verify that the image has been created in the local image store:

docker images  | grep ubuntu-bionic-lamp
mitgds/ubuntu-bionic-lamp            latest              1482fbd8fc14        8 minutes ago       480MB

Use it directly from Docker Hub
If you do not want to build it yourself you can pull it from https://hub.docker.com:

docker pull mitgds/ubuntu-bionic-lamp

Run the container
Prepare the necessary volumes for persistency:
docker volume create --name lamp-mariadb
docker volume create --name lamp-docroot
docker volume create --name lamp-apache-conf
docker volume create --name lamp-mariadb-conf

Run the container:

docker run -d -p 2080:80 -p 2443:443 --name lamp -v lamp-mariadb:/var/lib/mysql -v lamp-docroot:/var/www/html -v lamp-apache-conf:/etc/apache2 -v lamp-mariadb-conf:/etc/mysql mitgds/ubuntu-bionic-lamp

Verify that its up and running:

docker ps | grep lamp
9c9de31fa0d8        mitgds/ubuntu-bionic-lamp:latest   "/bin/sh -c /entrypo…"   29 seconds ago      Up 26 seconds       3306/tcp, 0.0.0.0:2080->80/tcp, 0.0.0.0:2443->443/tcp   lamp

Check the logs:

docker logs lamp

AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.3. Set the 'ServerName' directive globally to suppress this message
200110 14:55:18 mysqld_safe Logging to syslog.
200110 14:55:18 mysqld_safe Starting mysqld daemon with databases from /var/lib/mysql
