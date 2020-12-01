FROM ubuntu:20.10

ARG TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime &&\
    echo $TZ > /etc/timezone &&\
    apt-get -y update &&\
    apt-get -y install curl sudo wget &&\
    wget -O- git.io/devbase | sh &&\
    apt-get -y clean

ENTRYPOINT [ "zsh" ]
