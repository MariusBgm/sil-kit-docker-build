ARG UBUNTU_VERSION="22.04"

FROM ubuntu:${UBUNTU_VERSION}

ENV TZ "Europe/Berlin"
ENV DEBIAN_FRONTEND "noninteractive"
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN \
        apt-get update \
        && \
        apt-get install -y --no-install-recommends wget \
        && \
        wget https://apt.llvm.org/llvm.sh -P /tmp/ \
        && \
        chmod +x /tmp/llvm.sh \
        && \
        /tmp/llvm.sh 18 \
        && \
        apt update \
        && \
        apt install -y --no-install-recommends --no-install-suggests clang-format-18 \
        && \
        apt-get clean

