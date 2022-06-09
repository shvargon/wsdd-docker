FROM python:3.10.5-alpine3.15 as builder
WORKDIR /app
RUN apk add --no-cache git
RUN git clone --depth=1 https://github.com/christgau/wsdd.git

FROM python:3.10.5-alpine3.15
WORKDIR /app
COPY --from=builder /app/wsdd/src/wsdd.py /app 
COPY ./entrypoint.sh /

RUN addgroup -g 1001 wsdd &&\
    adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --ingroup wsdd \
    --no-create-home \
    --uid 1001 \
    wsdd && \
    chgrp -R wsdd "$(pwd)" /entrypoint.sh && \
    chmod -R 550 /entrypoint.sh /app

USER wsdd

LABEL   version="1.0" \
        maintainer="animekazna@gmail.com" 

EXPOSE 3702 5357

ENTRYPOINT [ "/entrypoint.sh" ]