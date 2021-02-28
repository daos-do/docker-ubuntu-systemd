FROM ubuntu:latest

LABEL maintainer="daos-do"

ENV container=docker

RUN DEBIAN_FRONTEND="noninteractive";\
    sed -i 's/# deb/deb/g' /etc/apt/sources.list; \
    apt-get -y clean; \
    apt-get -y update; \
    apt-get -y install tzdata; \
    apt-get -y install systemd systemd-sysv; \
    apt-get -y install python3.8 python3-pip python3-apt sudo curl wget gzip tar less; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*; \
    cd /lib/systemd/system/sysinit.target.wants/; \
    ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1; \
    rm -f /lib/systemd/system/multi-user.target.wants/*; \
    rm -f /etc/systemd/system/*.wants/*; \
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*; \
    rm -f /lib/systemd/system/anaconda.target.wants/*; \
    rm -f /lib/systemd/system/plymouth*; \
    rm -f /lib/systemd/system/systemd-update-utmp*

RUN mkdir -p /localhome; \
    groupadd --gid 5000 ansible; \
    useradd -b /localhome -m --gid 5000 --uid 5000 -s /bin/bash -c ansible ansible; \
    echo "ansible  ALL=(ALL)  NOPASSWD:ALL" > /etc/sudoers.d/ansible; \
    chmod 600 /etc/sudoers.d/ansible

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/lib/systemd/systemd"]
