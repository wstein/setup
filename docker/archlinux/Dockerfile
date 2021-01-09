FROM wstein/alpine:latest AS source

COPY . /setup
WORKDIR /setup
RUN git submodule init &&\
    git submodule update

# ---------------------------
FROM archlinux:latest

COPY --from=source /setup/bin /setup/.config /root/bin/
COPY --from=source /setup/.config /root/.config/

WORKDIR /root/
RUN bin/install-minimal &&\
    sh bin/setup-user &&\
    zsh -il -c true

CMD [ "/usr/bin/env", "zsh" ]
