FROM alpine:3.22.2

# Setting metadata
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

# Setting User and Home
USER root
WORKDIR /root

# Install packages
RUN <<EOF 
echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
apk update
apk add --no-cache --update \
    apache2-utils \
    bash \
    bind-tools \
    bird \
    bridge-utils \
    busybox-extras \
    conntrack-tools \
    coreutils \
    curl \
    dhcping \
    drill \
    elinks \
    ethtool \
    file \
    fping \
    git \
    gnupg \
    httpie \
    iftop \
    iperf \
    iperf3 \
    iproute2 \
    ipset \
    ip6tables \
    iptables \
    iputils \
    iputils-tracepath \
    iptraf-ng \
    ipvsadm \
    jq \
    keepalived \
    lshw \
    lz4 \
    mtr \
    nano \
    net-tools \
    netcat-openbsd \
    net-snmp-tools \
    nftables \
    ngrep \
    nmap \
    nmap-nping \
    nmap-scripts \
    oh-my-zsh \
    openssl \
    openssh \
    speedtest-cli \
    socat \
    strace \
    swaks \
    tcpdump \
    tcptraceroute \
    trippy \
    vim \
    websocat \
    wget \
    zsh \
    zstd

# Clear cache of packages in Alpine Linux
# Source: https://wiki.alpinelinux.org/wiki/Local_APK_cache
# https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management
rm -rf /var/cache/apk/*
rm -rf /tmp/*
EOF

# ZSH Themes
RUN <<EOF
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
EOF

COPY files/zshrc .zshrc
COPY files/99-motd.sh /etc/profile.d/99-motd.sh

# Fix permissions for OpenShift
RUN <<EOF

echo """
/etc/profile.d/99-motd.sh
cat /etc/motd
""" >> /root/.bashrc


echo """
/etc/profile.d/99-motd.sh
cat /etc/motd
""" >> /root/.ashrc

echo """
if [ -t 0 ]; then
    [ -f /etc/profile.d/motd.sh ] && . /etc/profile.d/motd.sh
fi
cat /etc/motd
""" >> /etc/profile

chmod -R g=u /root
chmod +x /etc/profile.d/99-motd.sh /root/.ashrc
EOF

# Entrypoint
# Infinite loop to keep container run until be stop manually
#CMD ["bash","-c","while true; do sleep 30; done;"]
CMD ["zsh","-c","while true; do sleep 30; done;"]
