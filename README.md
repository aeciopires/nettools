# nettools

<!-- TOC -->

- [nettools](#nettools)
- [About](#about)
- [Run this image](#run-this-image)
  - [In Docker container](#in-docker-container)
  - [In Kubernetes cluster](#in-kubernetes-cluster)
    - [CLI](#cli)
    - [Manifest](#manifest)
- [Contributing](#contributing)
  - [Updating and publishing this image](#updating-and-publishing-this-image)
  - [Creating container](#creating-container)
- [Maintainers](#maintainers)
- [License](#license)

<!-- TOC -->

# About

A simple and small Docker image with some handy networking tools installed.

References:
- https://github.com/pmietlicki/docker-nettools
- https://github.com/travelping/docker-nettools
- https://github.com/nicolaka/netshoot
- https://hub.docker.com/r/pmietlicki/nettools
- https://hub.docker.com/r/travelping/nettools
- https://hub.docker.com/r/nicolaka/netshoot
- https://gist.github.com/pythoninthegrass/d2cc2ef4ba6d5291f3f6d0c51fc3e099

Repository in Docker Hub:
- [hub.docker.com/r/aeciopires/nettools](https://hub.docker.com/r/aeciopires/nettools)
- [https://hub.docker.com/r/aeciopires/nettools/tags](https://hub.docker.com/r/aeciopires/nettools/tags)

> Attention!!!
> This image supports the linux/amd64, linux/arm/v6, linux/arm/v7, and linux/arm64 processor architectures

Tools:

Consult the documentation about how use theese tools.
> - Some use cases: https://github.com/nicolaka/netshoot/tree/master?tab=readme-ov-file#sample-use-cases
> - https://man7.org/linux/man-pages/dir_all_alphabetic.html
> - https://explainshell.com
> - https://linuxcommand.org/lc3_man_page_index.php
> - https://trippy.rs/

- apache2-utils
- bash
- bind-tools
- bird
- bridge-utils
- busybox-extras
- conntrack-tools
- coreutils
- curl
- dhcping
- drill
- elinks
- ethtool
- file
- fping
- git
- gnupg
- httpie
- iftop
- iperf
- iperf3
- iproute2
- ipset
- ip6tables
- iptables
- iputils
- iputils-tracepath
- iptraf-ng
- ipvsadm
- jq
- keepalived
- lshw
- lz4
- mtr
- nano
- net-tools
- netcat-openbsd
- net-snmp-tools
- nftables
- ngrep
- nmap
- nmap-nping
- nmap-scripts
- oh-my-zsh
- openssl
- openssh
- speedtest-cli
- socat
- strace
- swaks
- tcpdump
- tcptraceroute
- trippy
- vim
- websocat
- wget
- zsh
- zstd

Please see the [Dockerfile](Dockerfile) for a complete list of tools.

# Run this image

## In Docker container

```bash
docker run -it --rm --name nettools aeciopires/nettools:3.0.0 zsh
```

## In Kubernetes cluster

### CLI

Access the Kubernetes cluster and run this command.

```bash
kubectl run --rm -it nettools-$(< /dev/urandom tr -dc a-z-0-9 | head -c${1:-4}) --image=aeciopires/nettools:3.0.0 -n NAMESPACE -- /bin/zsh

# or
kubectl run --rm -it nettools-$(< /dev/urandom tr -dc a-z-0-9 | head -c${1:-4}) --image=aeciopires/nettools:3.0.0 -n NAMESPACE -- /bin/bash

# or
kubectl run --rm -it nettools-$(< /dev/urandom tr -dc a-z-0-9 | head -c${1:-4}) --image=aeciopires/nettools:3.0.0 -n NAMESPACE -- /bin/sh
```

Creating alias ``nettools`` with this command:

```bash
echo "alias nettools='kubectl run --rm -it nettools-$(< /dev/urandom tr -dc a-z-0-9 | head -c${1:-4}) --image=aeciopires/nettools:3.0.0 -n NAMESPACE -- /bin/zsh'" >> $HOME/.bashrc
source $HOME/.bashrc

nettools
```

### Manifest

Access the Kubernetes cluster and run this command.

```bash
kubectl apply -f nettools.yaml -n NAMESPACE

kubectl exec -i -t deploy/nettools -n NAMESPACE -- zsh
```

# Contributing

- See the [REQUIREMENTS.md](REQUIREMENTS.md) file.
- See the [CONTRIBUTING.md](CONTRIBUTING.md) file.

## Updating and publishing this image

- Create or access your account in Docker Hub and create the repository for custom image. Example: https://hub.docker.com/r/DOCKER_HUB_ACCOUNT/nettools.

- Change the ``Dockerfile``.

- Change the value of the ``VERSION`` variable in ``nettools/Makefile`` file.

- Commands to build the image:

```bash
cd nettools

make image
```

## Creating container

Commands to run a container:

```bash
cd nettools

make container
```

# Maintainers

- Aécio dos Santos Pires ([linkedin.com/in/aeciopires](https://www.linkedin.com/in/aeciopires))

# License

- See the [LICENSE](LICENSE) file.
