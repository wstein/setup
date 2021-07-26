ARG BASE_IMAGE=registry.fedoraproject.org/fedora-toolbox:33

FROM alpine AS source

COPY dev-base /setup/dev-base

RUN apk add git

WORKDIR /setup/
RUN git clone --depth=1 https://github.com/wstein/bin &&\
    git clone --depth=1 https://github.com/wstein/.config 

# ---------------------------
FROM $BASE_IMAGE

COPY --from=source /setup/bin/ /root/bin
COPY --from=source /setup/.config/ /root/.config

WORKDIR /root/
RUN --mount=type=secret,id=GITHUB_TOKEN . /run/secrets/GITHUB_TOKEN &&\
    export GITHUB_TOKEN &&\
    /root/bin/install-3rd-pty-repos &&\
    dnf -y install libcanberra-gtk3 PackageKit-gtk3-module libxshmfence nss libdrm mesa-libgbm &&\
    bin/install-minimal &&\
    bin/setup-user

ENTRYPOINT [ "/usr/bin/env", "zsh" ]
CMD [ ]
