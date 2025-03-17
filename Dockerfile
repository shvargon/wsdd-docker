ARG WSDD_VERSION=v0.8

FROM python:3.13.2-alpine3.21 AS builder
ARG WSDD_VERSION

WORKDIR /app

RUN apk add --no-cache git && \
    git clone --branch ${WSDD_VERSION} --depth=1 https://github.com/christgau/wsdd.git 

FROM python:3.13.2-alpine3.21
ARG WSDD_VERSION
ARG USERNAME=wsdd
ARG USERGROUP=$USERNAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID

LABEL version="${WSDD_VERSION}" \
      maintainer="animekazna@gmail.com" \
      description="Minimal wsdd image based on Alpine"

WORKDIR /app

COPY --from=builder /app/wsdd/src/wsdd.py .
COPY ./entrypoint.sh /

RUN addgroup -g ${USER_GID} ${USERGROUP} && \
    adduser -D -H -u ${USER_UID} -G ${USERNAME} wsdd && \
    chmod -R 555 /entrypoint.sh /app

USER wsdd

EXPOSE 3702 5357

ENTRYPOINT [ "/entrypoint.sh" ]