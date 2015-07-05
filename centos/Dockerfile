FROM centos:centos7

MAINTAINER Tomohiro Nishimura

RUN yum update -y && yum install -y sudo
RUN sed -i -e "s/Defaults    requiretty/# Defaults    requiretty/" /etc/sudoers
RUN curl -fsSL https://mackerel.io/assets/files/scripts/setup-yum.sh | sh
RUN yum install -y mackerel-agent

COPY mackerel-agent.conf /etc/mackerel-agent/
RUN mkdir -p /var/run
RUN mkdir -p /var/lib/mackerel-agent

ENTRYPOINT /usr/local/bin/mackerel-agent -apikey=$APIKEY
