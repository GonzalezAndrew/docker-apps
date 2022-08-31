# build
# docker build -t amzn2 .

# run as detchaged container
# docker run --detach --name amzn2 --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro --env-file <(env | grep GIT_TOKEN) amzn2 

# access the container 
# docker exec --tty amzn2 env TERM=xterm ansible --version
# docker exec -it amzn2 /bin/sh -c "[ -e /bin/bash ] && /bin/bash || /bin/sh"

# run docker and go inside
# docker run -it --rm --entrypoint="/bin/bash" amzn2

FROM amazonlinux:2

ENV container=docker

# Update packages to the latest version
RUN : \ 
    && yum -y update \
    && yum clean all \
    && yum -y autoremove \
    && :

# Install required packages.
# Remove packages that are nolonger requried.
# Clean the yum cache.
RUN : \ 
    && yum makecache fast \
    && yum -y install \
        https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
        initscripts \
    && yum -y update \
    && yum -y install \
        python \
        python-pip \
        sudo \
        jq \
        git \
    && yum -y autoremove \
    && yum clean all \
    && rm -rf /var/cache/yum/* \
    && :

# Configure systemd.
# See https://hub.docker.com/_/centos/ for details.
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN : \ 
    && pip install --upgrade pip \
    && pip install ansible boto3 \
    && :

# Install Ansible inventory file.
RUN mkdir -p /etc/ansible
RUN echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts

# Stop systemd from spawning agettys on tty[1-6].
RUN rm -f /lib/systemd/system/multi-user.target.wants/getty.target

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/lib/systemd/systemd"]