FROM alpine:3.6 as build

RUN apk add --no-cache openssl

ARG SUPERCRONIC_VERSION=v0.1.4
ARG SUPERCRONIC=supercronic-linux-amd64
ARG SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/${SUPERCRONIC_VERSION}/${SUPERCRONIC}
ARG SUPERCRONIC_SHA1SUM=3a631023f9f9dd155cfa0d1bb517a063d375055a

RUN wget "$SUPERCRONIC_URL"                                      &&\
    echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - &&\
    chmod +x "$SUPERCRONIC"                                      &&\
    mv "$SUPERCRONIC" "/usr/local/bin/supercronic"

FROM alpine:3.6

LABEL name="wppier/cron"
LABEL version="latest"

COPY --from=build /usr/local/bin/supercronic /usr/local/bin/supercronic
