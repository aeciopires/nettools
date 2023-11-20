FROM alpine:3.18.4

LABEL maintainer="Aecio Pires" \
      date_create="11/20/2023" \
      description="A simple and small Docker image with some handy networking tools installed" \
      licensce="GPLv3"

#---------------------------------#
# Variables
#---------------------------------#


#-------- End - Variables --------#



USER root

RUN apk update \
    && apk add --no-cache --update \
    elinks \
    vim \
    nano \
    bash \
    net-tools \
    conntrack-tools \
    coreutils \
    curl \
    wget \
    drill \
    iperf3 \
    iproute2 \
    iptables \
    iputils \
    ip6tables \
    keepalived \
    nftables \
    socat \
    netcat-openbsd \
    bind-tools \
    ethtool \
    mtr \
    tcpdump \
    lshw \
    nmap \
    busybox-extras \
    libcrypto3=3.1.4-r1 \
    libssl3=3.1.4-r1

# Clear cache of packages in Alpine Linux
# Source: https://wiki.alpinelinux.org/wiki/Local_APK_cache
# https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management
RUN rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

# Entrypoint
CMD bash
