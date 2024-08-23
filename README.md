# nettools

<!-- TOC -->

- [nettools](#nettools)
- [About](#about)
- [Run this image](#run-this-image)
- [Contributing](#contributing)
  - [Updating this image](#updating-this-image)
  - [Publishing the image](#publishing-the-image)
    - [Option-1](#option-1)
    - [Option-2](#option-2)
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

## In Docker container:

```bash
docker run -it --rm --name nettools aeciopires/nettools:1.0.0 bash
```

## In Kubernetes cluster:

### CLI

Access the Kubernetes cluster and run this command.

```bash
kubectl run --rm -it nettools-$(< /dev/urandom tr -dc a-z-0-9 | head -c${1:-4}) --image=aeciopires/nettools:1.0.0 -n NAMESPACE -- bash
```

Creating alias ``nettools`` with this command:

```bash
echo "alias nettools='kubectl run --rm -it nettools-\$(< /dev/urandom tr -dc a-z-0-9 | head -c${1:-4}) --image=aeciopires/nettools:1.0.0 -n NAMESPACE -- bash'" >> $HOME/.bashrc
source $HOME/.bashrc

nettools
```

### Manifest:

Access the Kubernetes cluster and run this command.

```bash
kubectl apply -f nettools.yaml -n NAMESPACE

kubectl exec -i -t deploy/nettools -n NAMESPACE -- bash
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

### Option 1

* Create or access your account in Docker Hub and create the repository for custom image. Example: https://hub.docker.com/r/DOCKER_HUB_ACCOUNT/nettools. 

* Create a git tag and send it to the remote repository. The image will be built for various processor architectures and pushed to Docker Hub.


### Option 2

* Create or access your account in Docker Hub and create the repository for custom image. Example: https://hub.docker.com/r/DOCKER_HUB_ACCOUNT/nettools. 

* Commands to publish the image:

```bash
cd nettools

make publish
```

* The image will be built for linux/amd64 processor architecture only and pushed to Docker Hub https://hub.docker.com/r/DOCKER_HUB_ACCOUNT/nettools.

# License

* See the [LICENSE](LICENSE) file.
