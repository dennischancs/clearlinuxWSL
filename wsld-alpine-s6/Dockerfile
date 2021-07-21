FROM alpine:edge
## Reference:
## https://github.com/gliderlabs/docker-alpine/issues/437
## https://git.jordanclark.us/devops/s6-alpine-docker#project42s6-alpine

ENV S6_OVERLAY_VERSION 2.2.0.3
ENV S6_OVERLAY_MD5HASH e49a47715f5f187928c98e6eaba41a39

COPY container-files /
RUN chmod u+x,g+x /usr/local/bin/entrypoint.sh \
    && ln -s /usr/local/bin/entrypoint.sh / # backwards compat

# add s6-overlay && chang timezone(TZ)
RUN apk --update --no-cache add wget ca-certificates \
    # add s6-overlay
    && cd /tmp \
    && wget https://github.com/just-containers/s6-overlay/releases/download/v$S6_OVERLAY_VERSION/s6-overlay-amd64.tar.gz \
    && echo "$S6_OVERLAY_MD5HASH *s6-overlay-amd64.tar.gz" | md5sum -c - \
    && tar xzf s6-overlay-amd64.tar.gz -C / \
    && rm s6-overlay-amd64.tar.gz \
    && rm ~/.wget-hsts \
    # change TZ
    && echo "export TZ=CST-8" >> /etc/profile \
    # clean files
    && rm -vrf /var/cache/apk/* \
    && rm -vrf /var/lib/apk/* \
    && rm -vrf /etc/apk/cache/*

# add docker
RUN apk --update --no-cache add tar \
      sed \
      docker \
      # tool: service
      openrc \
      # tool: chattr
      e2fsprogs-extra \
    && addgroup root docker \
    # clean files
    && rm -vrf /var/cache/apk/* \
    && rm -vrf /var/lib/apk/* \
    && rm -vrf /etc/apk/cache/*

# add docker mirrors
COPY daemon.json /etc/docker/

# wsl setting，DNS no 172.28.160.1
RUN wget "https://raw.githubusercontent.com/dennischancs/clearlinuxWSL/main/general-settings/tmp.tar.gz" -O /tmp/tmp.tar.gz \
    && cd /tmp && tar -xzf tmp.tar.gz \
    && chmod +x run.sh && . run.sh \
    && rm -rf /tmp/* \
    && rm ~/.wget-hsts

# Tips: `service docker start` in alpine
ENTRYPOINT ["entrypoint.sh"]
