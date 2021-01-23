
FROM wstein/alpine:latest AS source

COPY . /setup
WORKDIR /setup
RUN git submodule init &&\
    git submodule update

# ---------------------------
FROM crystallang/crystal:latest-alpine


COPY --from=source /setup/.config /root/.config/
COPY --from=source /setup/bin /root/bin/

WORKDIR /root/
RUN apk add gmp-dev sqlite-dev openssl-dev libxml2-dev yaml-dev zlib-dev
RUN bin/install-minimal &&\
    sh bin/setup-user &&\
    zsh -il -c true

VOLUME [ "/data/crystal" ]
WORKDIR /data/crystal

CMD [ "/usr/bin/env", "zsh" ]
