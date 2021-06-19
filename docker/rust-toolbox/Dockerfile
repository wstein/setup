ARG BASE_IMAGE=wstein/fedora-toolbox
FROM $BASE_IMAGE

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > /tmp/install &&\
    sh /tmp/install -y &&\
    rm /tmp/install


