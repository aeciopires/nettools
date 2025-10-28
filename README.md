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

Reference:
* https://github.com/pmietlicki/docker-nettools
* https://hub.docker.com/r/pmietlicki/nettools
* https://hub.docker.com/r/travelping/nettools

Repository in Docker Hub:
* [hub.docker.com/r/aeciopires/nettools](https://hub.docker.com/r/aeciopires/nettools)
* [https://hub.docker.com/r/aeciopires/nettools/tags](https://hub.docker.com/r/aeciopires/nettools/tags)

> Attention!!!
> This image supports the linux/amd64, linux/arm/v6, linux/arm/v7, and linux/arm64 processor architectures

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

## In Docker container

```bash
docker run -it --rm --name nettools aeciopires/nettools:2.2.0
```

## In Kubernetes cluster

### CLI

Access the Kubernetes cluster and run this command.

```bash
kubectl run --rm -it nettools-$(< /dev/urandom tr -dc a-z-0-9 | head -c${1:-4}) --image=aeciopires/nettools:2.2.0 -n NAMESPACE -- /bin/bash
```

Creating alias ``nettools`` with this command:

```bash
echo "alias nettools='kubectl run --rm -it nettools-$(< /dev/urandom tr -dc a-z-0-9 | head -c${1:-4}) --image=aeciopires/nettools:2.2.0 -n NAMESPACE -- /bin/bash'" >> $HOME/.bashrc
source $HOME/.bashrc

nettools
```

### Manifest

Access the Kubernetes cluster and run this command.

```bash
kubectl apply -f nettools.yaml -n NAMESPACE

kubectl exec -i -t deploy/nettools -n NAMESPACE -- bash
```

# Contributing

* See the [REQUIREMENTS.md](REQUIREMENTS.md) file.
* See the [CONTRIBUTING.md](CONTRIBUTING.md) file.

## Updating and publishing this image

* Create or access your account in Docker Hub and create the repository for custom image. Example: https://hub.docker.com/r/DOCKER_HUB_ACCOUNT/nettools.

* Change the ``Dockerfile``.

* Change the value of the ``VERSION`` variable in ``nettools/Makefile`` file.

* Commands to build the image:

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

* See the [LICENSE](LICENSE) file.
