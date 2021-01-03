ARG UBUNTU_VERSION=20.10
FROM ubuntu:${UBUNTU_VERSION}

ARG TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime 
RUN echo $TZ > /etc/timezone 
RUN apt-get -y update &&\
    apt-get -y upgrade &&\
    apt-get -y install curl sudo wget  &&\
    curl -L git.io/devbase | sh -s &&\
    apt-get -y clean

WORKDIR /root
ENTRYPOINT [ "zsh" ]
