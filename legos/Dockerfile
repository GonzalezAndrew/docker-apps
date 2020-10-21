FROM ubuntu:18:04

LABEL MAINTAINER="Andrew Gonzalez <andrewgonzo23@gmail.com>"

ENV TERRAFORM_VERSION="0.13.5"
ENV PACKER_VERSION="1.6.4"
ENV VAULT_VERSION="1.5.4"

ENV PACKAGES="\
apt-utils \
locales \
python3-setuptools \
python3-pip \ 
python3-boto \
software-properties-common \ 
rsyslog \ 
systemd \
systemd-cron \
sudo \
iproute2 \
unzip \
"

ENV PIP_PACKAGEs="\
ansible \
awscli \
"

RUN apt-get update \
    && apt-get install -y --no-install-recommends ${PACKAGES} \
    && curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && curl -LO https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
    && curl -LO https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip \
    && unzip '*.zip' -d /usr/local/bin \
    && rm *.zip

RUN rm -rf /var/lib/apt/lists/* \ 
    && rm -rf /usr/share/doc \
    && rm -rf /usr/share/man \
    && apt-get clean

RUN pip3 install ${PIP_PACKAGES}

CMD ["/bin/bash"]