FROM ubuntu:trusty
ENV DEBIAN_FRONTEND noninteractive

MAINTAINER Tomohiro Nishimura

RUN apt-get update -y && apt-get install -y sudo curl
RUN curl -fsSL https://mackerel.io/assets/files/scripts/setup-apt.sh | sh
RUN apt-get install -y mackerel-agent
RUN apt-get clean -y

COPY mackerel-agent.conf /etc/mackerel-agent/
RUN mkdir -p /var/run
RUN mkdir -p /var/lib/mackerel-agent

ENTRYPOINT /usr/local/bin/mackerel-agent -apikey=$APIKEY
