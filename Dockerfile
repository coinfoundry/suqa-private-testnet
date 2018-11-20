FROM ubuntu:xenial
MAINTAINER oliver@weichhold.com

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz \
    https://github.com/SUQAORG/SUQA-CORE/releases/download/v6.0.2.1/SUQA-CORE-6.0.2-x86_64-pc-linux-gnu.tar.lzma /tmp/

RUN apt-get update -y && apt-get --no-install-recommends install xz-utils -y && \
    tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    cd /tmp && tar xf SUQA*.tar.lzma && cp -r /tmp/SUQA* /usr/bin && \
    rm -rf /usr/share/man/* /usr/share/groff/* /usr/share/info/* /var/cache/man/* /tmp/* /var/lib/apt/lists/*

EXPOSE 16001 16002 16003

ENTRYPOINT ["/init"]
VOLUME ["/data"]
ADD rootfs /
