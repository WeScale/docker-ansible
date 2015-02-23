# Ansible Command and Control

This repository contains Dockerfile of Ansible command and control center for Docker's automated
build published to the public Docker Hub Registry.

## Base Docker Image

[gliderlabs/alpine:3.1](https://registry.hub.docker.com/u/gliderlabs/alpine/)

## Installation

* Install [Docker](http://www.docker.com)
* Download build from Docker Hub Registry: ```docker pull wescale/ansible```

## Usage

```
docker run -it wescale/ansible
```

That leads you to a bash, run as ```ansible``` user (non-root but
sudoer). A good way to use it would be to have your playbook file on
host and mount it in your container.

```
docker run -v $(pwd)/my_playbooks:/home/ansible/my_playbooks -it wescale/ansible
```

Have fun.
