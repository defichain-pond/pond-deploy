# DefiChain Pond

This is a self-hosted ocean api (https://ocean.defichain.com) that you can deploy for your own usage. It is based on the official DefiChain full node and the original [Jellyfish Whale](https://github.com/JellyfishSDK/jellyfish/) code base.

## Prerequisites

- Linux VPS
- Docker installed
- Docker Compose installed
- Minimum 100 GB free storage
- Domain name pointing to the Linux VPS

## Setup

First clone this git repo

```
git clone https://github.com/defichain-pond/pond-deploy.git
cd pond-deploy
```

Then, run the following

```
export POND_EMAIL=your@email.com
export POND_DOMAIN=your_pond.domain.com
sed -i -e "s/POND_EMAIL/${POND_EMAIL}/g" traefik.toml
sed -i -e "s/POND_DOMAIN/${POND_DOMAIN}/g" dynamic_conf.yml
mkdir data leveldb
docker-compose up -d
```

## Contributors
- @sancag
- @laghao

## License
MIT
