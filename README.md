# Docker Ubuntu Systemd

[![build status](https://img.shields.io/docker/cloud/build/daosdo/ubuntu-systemd)](https://hub.docker.com/repository/docker/daosdo/ubuntu-systemd)

Ubuntu image that has systemd enabled.

## Branches

Each branch in the repository is used for building a specific version.

| Branch | Ubuntu Version | FROM Docker image tag |
| ------ | -------------- | --------------------- |
| master | latest         | latest                |
| 20.10  | 20.10          | 20.10                 |
| 20.04  | 20.04          | 20.04                 |
| 18.04  | 18.04          | 18.04                 |

## Usage

### Run it

```bash
docker run -d \
  --tty \
  --privileged \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
  --name daosd-ubuntu-systemd \
  daosdo/ubuntu-systemd:latest
```

Adding `--tty` allocates a pseudo-TTY and enables color in the logs when
running `docker logs`.

### Enter it

```bash
docker exec -it daosd-ubuntu-systemd /bin/bash
```

### Remove it

```bash
docker rm -f daosd-ubuntu-systemd
```
