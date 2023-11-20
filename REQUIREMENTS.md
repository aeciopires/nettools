<!-- TOC -->

- [Requirements to develop/test in this project](#requirements-to-developtest-in-this-project)
- [Packages](#packages)
  - [Ubuntu](#ubuntu)
- [Docker](#docker)
- [Trivy](#trivy)

<!-- TOC -->

# Requirements to develop/test in this project

# Packages

## Ubuntu

Install the following packages:

```bash
sudo apt install make git
```

# Docker

Follow the instructions on the page to install Docker.

```bash
sudo apt update
sudo apt install -y pkg-config acl

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
# Add your user to the Docker group
sudo usermod -aG docker $USER
sudo setfacl -m user:$USER:rw /var/run/docker.sock

```

References:
* Ubuntu: https://docs.docker.com/engine/install/ubuntu/
* Debian: https://docs.docker.com/engine/install/debian/
* CentOS: https://docs.docker.com/engine/install/centos/
* MacOS: https://docs.docker.com/desktop/install/mac-install/
* https://docs.docker.com/engine/install/linux-postinstall/#configure-docker-to-start-on-boot

# Trivy

To perform a vulnerability scan of Docker images locally, before sending to the Docker Hub, ECR, GCR or other remote registry, you can use trivy: https://github.com/aquasecurity/trivy

The documentation on Github presents information about installing on Ubuntu and other GNU / Linux distributions and / or other operating systems, but it is also possible to run via Docker using the following commands:

```bash
mkdir /tmp/caches

docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/caches:/root/.cache/ aquasec/trivy image IMAGE_NAME:IMAGE_TAG
```

References:
* https://aquasecurity.github.io/trivy/v0.47/getting-started/installation/#use-container-image
* https://aquasecurity.github.io/trivy/
