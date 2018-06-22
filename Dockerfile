FROM modm/modm-build:latest
MAINTAINER Niklas Hauser <niklas.hauser@rwth-aachen.de>
LABEL Description="Image for building RCA software"

ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_HOME       /usr/lib/jvm/java-8-oracle
ENV LANG            en_US.UTF-8
ENV LC_ALL          en_US.UTF-8

RUN apt update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:webupd8team/java && \
    echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
    apt-get install -y --no-install-recommends oracle-java8-installer oracle-java8-set-default && \
    apt clean all