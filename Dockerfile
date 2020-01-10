FROM ubuntu:bionic

MAINTAINER Amit Gupta <amit.tigercity@gmial.com>

RUN apt-get update \
    && apt-get -q -y dist-upgrade \
    && DEBIAN_FRONTEND=noninteractive \
    apt-get -q -y install --no-install-recommends apt-utils \
    apache2 \
    mariadb-server \
    php \
    libapache2-mod-php \
    php-mysql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80
EXPOSE 443
EXPOSE 3306

ADD entrypoint.sh /
RUN chmod +x entrypoint.sh /
ENTRYPOINT /entrypoint.sh
