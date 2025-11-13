FROM alpine:3.22.2

# Setting metadata
LABEL maintainer="Aecio Pires" \
      date_create="11/20/2023" \
      description="A simple and small Docker image with some handy networking tools installed" \
      licensce="GPLv3"

# Changing sh to bash. Reference: https://github.com/moby/moby/issues/7281
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

# Installing packages
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
    mlocate \
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

# Clearing cache of packages in Alpine Linux
# Source: https://wiki.alpinelinux.org/wiki/Local_APK_cache
# https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management
rm -rf /var/cache/apk/*
rm -rf /tmp/*
EOF

# Getting ZSH plugins and themes
RUN <<EOF
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -
EOF

# Copying files from host to container
COPY files/zshrc .zshrc
COPY files/99-motd.sh /etc/profile.d/99-motd.sh

RUN <<EOF
# Getting custom prompt script for bash
curl -o $HOME/.bash_prompt https://gist.githubusercontent.com/aeciopires/6738c602e2d6832555d32df78aa3b9bb/raw/b96be4dcaee6db07690472aecbf73fcf953a7e91/.bash_prompt

# Configuring prompt and motd for bash
echo """
source $HOME//.bash_prompt
/etc/profile.d/99-motd.sh
cat /etc/motd
""" >> $HOME/.bashrc

# Configuring motd for ash
echo """
/etc/profile.d/99-motd.sh
cat /etc/motd
""" >> $HOME/.ashrc

# Configuring motd for profile
echo """
if [ -t 0 ]; then
    [ -f /etc/profile.d/motd.sh ] && . /etc/profile.d/motd.sh
fi
cat /etc/motd
""" >> /etc/profile

# Fixing permissions
chmod -R g=u $HOME/
chmod +x /etc/profile.d/99-motd.sh $HOME/.ashrc $HOME/.bash_prompt
EOF

# Entrypoint
# Infinite loop to keep container run until be stop manually
#CMD ["bash","-c","while true; do sleep 30; done;"]
CMD ["zsh","-c","while true; do sleep 30; done;"]
