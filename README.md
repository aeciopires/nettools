# nettools

<!-- TOC -->

- [nettools](#nettools)
- [About](#about)
- [Run this image](#run-this-image)
- [Contributing](#contributing)
  - [Updating this image](#updating-this-image)
  - [Publishing the image](#publishing-the-image)
- [License](#license)

<!-- TOC -->

# About

A simple and small Docker image with some handy networking tools installed.

Reference:
* https://github.com/pmietlicki/docker-nettools
* https://hub.docker.com/r/pmietlicki/nettools
* https://hub.docker.com/r/travelping/nettools

Repository in Docker Hub:
* [hub.docker.com/r/aeciopires/nettools](https://hub.docker.com/r/aeciopires/nettools)
* [https://hub.docker.com/r/aeciopires/nettools/tags](https://hub.docker.com/r/aeciopires/nettools/tags)

> Attention!!!
> This image has binaries and has been compiled to support the x86_64 processor only


Tools:
* vim
* nano
* elinks
* net-tools
* conntrack-tools
* coreutils
* curl
* wget
* drill
* iperf3
* iproute2
* iptables
* iputils
* ip6tables
* keepalived
* nftables
* socat
* netcat-openbsd
* bind-tools
* ethtool
* mtr
* tcpdump
* lshw
* nmap

Please see the [Dockerfile](Dockerfile) for a complete list of tools.

# Run this image

In Docker container:

```bash
docker run -it --rm --name nettools aeciopires/nettools:1.0.0 bash
```

In Kubernetes cluster:

Access the Kubernetes cluster and run this command.

```bash
kubectl run --rm -it nettools-$(< /dev/urandom tr -dc a-z-0-9 | head -c${1:-4}) --image=aeciopires/nettools:1.0.0 -n default -- bash
```

Creating alias ``nettools`` with this command:

```bash
echo "alias nettools='kubectl run --rm -it nettools-$(< /dev/urandom tr -dc a-z-0-9 | head -c${1:-4}) --image=aeciopires/nettools:1.0.0 -n default -- bash'" >> $HOME/.bashrc
source $HOME/.bashrc

nettools
```

# Contributing

* See the [REQUIREMENTS.md](REQUIREMENTS.md) file.
* See the [CONTRIBUTING.md](CONTRIBUTING.md) file.

## Updating this image

* Change the ``Dockerfile``.

* Change the value of the ``VERSION`` variable in ``nettools/Makefile`` file.

* Commands to build the image:

```bash
cd nettools

make image
```

Commands to run a container:

```bash
cd nettools

make container
```

## Publishing the image

* Create or access your account in Docker Hub and create the repository for custom image. Example: https://hub.docker.com/r/DOCKER_HUB_ACCOUNT/nettools

* Commands to publish the image:

```bash
cd nettools

make publish
```

# License

* See the [LICENSE](LICENSE) file.
