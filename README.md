# nettools

<!-- TOC -->

- [nettools](#nettools)
- [About](#about)
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
