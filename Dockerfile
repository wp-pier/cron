FROM alpine:latest as build

RUN apk add --no-cache openssl

ARG SUPERCRONIC_VERSION=v0.1.3
ARG SUPERCRONIC=supercronic-linux-amd64
ARG SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/${SUPERCRONIC_VERSION}/${SUPERCRONIC}
ARG SUPERCRONIC_SHA1SUM=96960ba3207756bb01e6892c978264e5362e117e

RUN wget "$SUPERCRONIC_URL" \
 && echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - \
 && chmod +x "$SUPERCRONIC" \
 && mv "$SUPERCRONIC" "/usr/local/bin/supercronic"

FROM alpine:latest

LABEL name="wppier/cron"
LABEL version="0.0.2"

COPY --from=build /usr/local/bin/supercronic /usr/local/bin/supercronic
