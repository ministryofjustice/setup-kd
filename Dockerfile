FROM docker.io/alpine:3

COPY src/setup-kd.sh /src/setup-kd.sh

RUN apk add --no-cache --update \
    bash \
    ca-certificates \
    curl \
    jq \
    wget

ENTRYPOINT bash /src/setup-kd.sh