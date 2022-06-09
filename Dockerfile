FROM python:3.10.5-alpine3.15 as builder
WORKDIR /app
RUN apk add --no-cache git
RUN git clone --depth=1 https://github.com/christgau/wsdd.git

FROM python:3.10.5-alpine3.15
WORKDIR /app
COPY --from=builder /app/wsdd/src/wsdd.py /app
EXPOSE 3702 5357
ENTRYPOINT [ "python", "/app/wsdd.py" ]