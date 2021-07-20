FROM alpine:edge

ENV S6_OVERLAY_VERSION 2.2.0.3
ENV S6_OVERLAY_MD5HASH e49a47715f5f187928c98e6eaba41a39

COPY container-files /

RUN apk --update --no-cache add wget ca-certificates \
  && cd /tmp \
  && wget https://github.com/just-containers/s6-overlay/releases/download/v$S6_OVERLAY_VERSION/s6-overlay-amd64.tar.gz \
  && echo "$S6_OVERLAY_MD5HASH *s6-overlay-amd64.tar.gz" | md5sum -c - \
  && tar xzf s6-overlay-amd64.tar.gz -C / \
  && rm s6-overlay-amd64.tar.gz \
  && apk del wget \
  && rm ~/.wget-hsts

ENTRYPOINT ["/init"]
