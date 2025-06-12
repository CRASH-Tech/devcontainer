FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG ARCH=

USER root

RUN apt update

RUN apt -y install apt-utils
RUN apt -y install bash
RUN apt install -y bash-completion
RUN apt -y install curl
RUN apt -y install fdisk
RUN apt -y install gawk
RUN apt -y install git
RUN apt -y install htop
RUN apt -y install iotop
RUN apt -y install iputils-ping
RUN apt -y install jq
RUN apt -y install lvm2
RUN apt -y install mc
RUN apt -y install mtr
RUN apt -y install nano
RUN apt -y install net-tools
RUN apt -y install openssh-client
RUN apt -y install postgresql-client
RUN apt -y install python3
RUN apt -y install python3-pip
RUN apt -y install python3-yappi
RUN apt -y install redis-tools
RUN apt -y install rsync
RUN apt -y install sngrep
RUN apt -y install software-properties-common
RUN apt -y install ssh
RUN apt -y install sshpass
RUN apt -y install tcpdump
RUN apt -y install telnet
RUN apt -y install tzdata
RUN apt -y install unzip
RUN apt -y install valgrind
RUN apt -y install wget
RUN apt -y install zip

RUN pip install 'ansible==9.2.0'
RUN pip install 'ansible-core==2.16.3'

RUN wget https://dl.min.io/client/mc/release/linux-${ARCH}/mc -O /usr/local/bin/minio-mc

RUN wget https://github.com/opentofu/opentofu/releases/download/v1.9.1/tofu_1.9.1_${ARCH}.deb -O tofu.deb
RUN dpkg -i tofu.deb
RUN rm tofu.deb

RUN wget https://releases.hashicorp.com/vault/1.18.3/vault_1.18.3_linux_${ARCH}.zip -O vault.zip
RUN unzip -j vault.zip "vault" -d /usr/local/bin
RUN rm vault.zip

RUN wget https://go.dev/dl/go1.24.4.linux-${ARCH}.tar.gz -O go.tar.gz
RUN tar -C /usr/local -xzf go.tar.gz
RUN rm go.tar.gz

RUN wget https://dl.k8s.io/release/v1.33.0/bin/linux/${ARCH}/kubectl -O /usr/local/bin/kubectl

RUN wget https://get.helm.sh/helm-v3.18.2-linux-${ARCH}.tar.gz -O helm.tar.gz
RUN tar -C /usr/local/bin -xzf helm.tar.gz linux-${ARCH}/helm --transform="s|linux-${ARCH}/helm|helm|"
RUN rm helm.tar.gz

RUN chmod -R a+x /usr/local/bin

RUN useradd -m crash

COPY .my_bashrc /home/crash/.my_bashrc
COPY .tofurc /home/crash/.tofurc

RUN echo "source /home/crash/.my_bashrc" >>/home/crash/.bashrc

USER crash
WORKDIR /home/crash/project
