FROM alpine:3.22.2

# Set metadata
LABEL maintainer="Aecio Pires" \
      date_create="11/20/2023" \
      description="A simple and small Docker image with some handy networking tools installed" \
      licensce="GPLv3"

# Change sh to bash. Reference: https://github.com/moby/moby/issues/7281
# Only Ubuntu
#SHELL ["/usr/bin/bash", "-c"]
# Only Alpine
SHELL ["/bin/sh", "-c"]

#---------------------------------#
# Variables
#---------------------------------#


#-------- End - Variables --------#

# Set user default
USER root

# Install packages
RUN <<EOF 
apk update
apk add --no-cache --update \
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
    busybox-extras

# Clear cache of packages in Alpine Linux
# Source: https://wiki.alpinelinux.org/wiki/Local_APK_cache
# https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management
rm -rf /var/cache/apk/*
rm -rf /tmp/*
EOF

# Entrypoint
# Infinite loop to keep container run until be stop manually
CMD ["bash","-c","while true; do sleep 30; done;"]
