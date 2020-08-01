# Docker Ubuntu Systemd

[![docker build](https://github.com/daos-do/docker-ubuntu-systemd/workflows/docker%20build/badge.svg?branch=20.04)](https://hub.docker.com/repository/docker/daosdo/ubuntu-systemd)

A Dockerfile for building Ubuntu images that have systemd enabled.

## Branches

Each branch in this git repository is used for building specific versions
of Ubuntu images.

|Branch |Ubuntu Version       |FROM Docker image tag|
|-------|---------------------|---------------------|
|master |latest               |latest               |
|20.10  |20.10                |20.10                |
|20.04  |20.04                |20.04                |
|18.04  |18.04                |18.04                |

## Usage

### Run it

```
docker run -d \
  --tty \
  --privileged \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
  --name daosd-ubuntu20.04-systemd \
  daosdo/ubuntu-systemd:latest
```

Adding `--tty` allocates a pseudo-TTY and enables color in the logs when
running `docker logs`.

### Enter it

```
docker exec -it daosd-ubuntu20.04-systemd /bin/bash
```

### Remove it

```
docker rm -f daosd-ubuntu20.04-systemd
```
