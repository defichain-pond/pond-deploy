#!/bin/bash

set -eu


usage() {
  echo 'Usage: . ./setup.sh <EMAIL> <DOMAIN>'
  exit
}


if [ "$#" -ne 2 ]
then
  usage
fi

LOC=$PWD
DATA_LOC=$LOC/data
LEVELDB_LOC=$LOC/leveldb
INDEX="https://snapshots-eu.sanc.ch"
SNAPSHOT_VERSION="1927451"
POND_NODE="pond-node-$SNAPSHOT_VERSION.tar.gz"
POND_WHALE="pond-whale-$SNAPSHOT_VERSION.tar.gz"
NETWORK="ocean"
EMAIL=$1
DOMAIN=$2


mkdir $DATA_LOC $LEVELDB_LOC

#download defichain & leveldb snapshot
wget $INDEX/$POND_NODE
wget $INDEX/$POND_WHALE

#untar whale and node snapshots
tar -xzvf $POND_WHALE -C $LEVELDB_LOC
tar -xzvf $POND_NODE -C $DATA_LOC

sudo chown -R ${UID}:${UID} $LEVELDB_LOC
sudo chown -R ${UID}:${UID} $DATA_LOC


#inject user parameters in traefik config
sed -i -e "s/POND_EMAIL/$EMAIL/g" $LOC/traefik.toml
sed -i -e "s/POND_DOMAIN/$DOMAIN/g" $LOC/dynamic_conf.yml

#create docker network
if [ -z $(docker network ls --filter name=^${NETWORK}$ --format="{{ .Name }}") ] ; then
     docker network create ${NETWORK} ;
fi

#start pond
docker-compose up -d