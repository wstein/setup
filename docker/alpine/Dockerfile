
FROM alpine:latest

COPY ./dev-base /tmp/dev-base

WORKDIR /root/
RUN sh -x /tmp/dev-base

CMD [ "/usr/bin/env", "zsh" ]
