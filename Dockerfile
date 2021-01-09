ARG BASE_IMAGE=alpine:latest
FROM alpine AS source

COPY . /setup

RUN apk add git

WORKDIR /setup
RUN git submodule init &&\
    git submodule update

# ---------------------------
FROM $BASE_IMAGE

COPY --from=source /setup/bin /setup/.config /root/bin/
COPY --from=source /setup/.config /root/.config/

WORKDIR /root/
RUN bin/install-minimal &&\
    sh -x bin/setup-user &&\
    zsh -il -c true

CMD [ "/usr/bin/env", "zsh" ]
