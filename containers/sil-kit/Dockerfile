ARG BASE_DEBIAN_IMAGE=ubuntu:latest
FROM $BASE_DEBIAN_IMAGE


ENV TZ "UTC"
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND "noninteractive"

RUN \
        apt-get update && \
        apt-get install --no-install-recommends --no-install-suggests -y \
            wget \
            unzip

ARG SILKIT_VERSION=4.0.48
ARG SILKIT_DOWNLOAD_URL=https://github.com/vectorgrp/sil-kit/releases/download/sil-kit%2Fv${SILKIT_VERSION}/SilKit-${SILKIT_VERSION}-ubuntu-18.04-x86_64-gcc.zip

ARG WGET_SSL_OPTIONS=--no-check-certificate
RUN wget --quiet ${WGET_SSL_OPTIONS} ${SILKIT_DOWNLOAD_URL}
COPY install_silkit.sh .

RUN chmod +x install_silkit.sh && \
    ./install_silkit.sh $(basename  ${SILKIT_DOWNLOAD_URL}); \
    rm $(basename ${SILKIT_DOWNLOAD_URL}); \
    rm install_silkit.sh

