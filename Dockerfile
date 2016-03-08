FROM debian:jessie

MAINTAINER Jon Borgonia "jon.borgonia@hpe.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_5.x | bash - && \
    apt-get install -y nodejs nginx && \
    rm -rf /var/lib/apt/lists/*

ADD nginx.conf /etc/nginx/nginx.conf
ADD server/index.js /app/server/
ADD static/index.html /app/static/
ADD docker.entrypoint.sh /

EXPOSE 80

WORKDIR /app

ENTRYPOINT ["/bin/sh","/docker.entrypoint.sh"]
