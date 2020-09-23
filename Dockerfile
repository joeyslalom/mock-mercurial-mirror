FROM debian

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends \
        ca-certificates \
        git \
        mercurial \
        && \
    rm -rf /var/lib/apt/lists/* /var/tmp/*

WORKDIR /mirror

COPY .hgrc /root/

RUN git clone https://github.com/phpmyadmin/docker.git && \
    cd docker && \
    hg init && \
    hg add && \
    hg commit -m "mock mirror"

WORKDIR /mirror/docker

ENTRYPOINT ["hg", "serve"]