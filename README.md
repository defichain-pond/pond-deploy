# DefiChain Pond

<p align="center"><img src="https://user-images.githubusercontent.com/100532523/171270272-6e551042-4925-4096-8349-b89d1f2199dc.png" width="300px"/></p>


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
. ./setup.sh EMAIL DOMAIN
```

## Contributors
- @sancag
- @laghao

## License
MIT
