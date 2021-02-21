ARG BASE_IMAGE=alpine:latest
FROM alpine AS source

COPY dev-base /setup/dev-base

RUN apk add git

WORKDIR /setup/
RUN git clone --depth=1 https://github.com/wstein/bin &&\
    git clone --depth=1 https://github.com/wstein/.config 

# ---------------------------
FROM $BASE_IMAGE

COPY --from=source /setup/ /tmp/setup
COPY --from=source /setup/bin/ /root/bin
COPY --from=source /setup/.config/ /root/.config

WORKDIR /root/
RUN /tmp/setup/dev-base &&\
    rm -rf /tmp/*

CMD [ "/usr/bin/env", "zsh" ]
