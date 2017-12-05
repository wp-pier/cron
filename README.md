# wppier/cron

see [https://github.com/aptible/supercronic](https://github.com/aptible/supercronic)

Don't use this image directly. Copy `/usr/local/bin/supercronic` to your own base image.

Example:
```
From wppier\cron as cron
FROM alpine:latest
COPY --from=cron /usr/local/bin/supercronic /usr/local/bin/supercronic
```
