#! /bin/sh

set -x

DOCKER_COMPOSE=`which docker-compose`

if [ ! -x $DOCKER_COMPOSE ]; then
  echo "please install docker-compose" >&2
  exit -1
fi

if [ -z "$1" ]; then
  echo "USAGE: ./setup.sh <YOUR_APIKEY>" >&2
  exit -1
fi

sed -i.old -e "s/<YOUR_APIKEY>/$1/" docker-compose.yml
rm docker-compose.yml.old

$DOCKER_COMPOSE build --no-cache
$DOCKER_COMPOSE up -d

