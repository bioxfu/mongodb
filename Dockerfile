FROM ubuntu
MAINTAINER bio.xfu@gmail.com

RUN perl -p -i.orig -e 's/archive.ubuntu.com/mirrors.aliyun.com\/ubuntu/' /etc/apt/sources.list; \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list && \
    apt-get update && \
    apt-get install -y mongodb-org

VOLUME ["/data/db"]
WORKDIR /data

EXPOSE 27017

CMD ["mongod"]
