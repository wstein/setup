
FROM wstein/alpine:latest AS source

COPY . /setup
WORKDIR /setup
RUN git submodule init &&\
    git submodule update

# ---------------------------
FROM crystallang/crystal:latest-alpine

COPY ./dev-base /tmp/dev-base

WORKDIR /root/
RUN sh -x /tmp/dev-base

VOLUME [ "/data/crystal" ]
WORKDIR /data/crystal

CMD [ "/usr/bin/env", "zsh" ]
