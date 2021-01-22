FROM wstein/alpine:latest AS source

COPY . /setup
WORKDIR /setup
RUN git submodule init &&\
    git submodule update

# ---------------------------
FROM ubuntu:20.10

COPY --from=source /setup/bin /root/bin/
COPY --from=source /setup/.config /root/.config/

WORKDIR /root/
RUN bin/install-minimal &&\
    sh bin/setup-user &&\
    zsh -il -c true

CMD [ "/usr/bin/env", "zsh" ]
