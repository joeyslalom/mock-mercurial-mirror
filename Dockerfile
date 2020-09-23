FROM debian

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends \
        git \
        mercurial \
        && \
    rm -rf /var/lib/apt/lists/* /var/tmp/*

WORKDIR /mirror

RUN git clone https://github.com/phpmyadmin/docker.git

WORKDIR docker

ENTRYPOINT ["hg", "serve"]