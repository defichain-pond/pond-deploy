# DefiChain Pond

<p align="center"><img src="https://user-images.githubusercontent.com/100532523/171270272-6e551042-4925-4096-8349-b89d1f2199dc.png" width="300px"/></p>


This is a self-hosted ocean api (https://ocean.defichain.com) that you can deploy for your own usage. It is based on the official DefiChain full node and the original [Jellyfish Whale](https://github.com/JellyfishSDK/jellyfish/) code base.

## Prerequisites

- Linux VPS (Tested on 2 CPU, 4 GB Ram)
- Docker installed
- Docker Compose installed
- Minimum 200 GB free storage
- Domain name pointing to the Linux VPS
- Git installed
- Allow your normal user to access docker ```usermod -aG docker your_user```

You can find the docker engine setup here https://docs.docker.com/engine/install/.

## Setup

As your normal user:

First clone this git repository

```
git clone https://github.com/defichain-pond/pond-deploy.git
cd pond-deploy
```

Then, run the following script.

```
. ./setup.sh EMAIL DOMAIN
```

***DOMAIN*** is your custon domain that needs to point to your servier. Something like pond.example-domain.com
You can verify if the domain name is pointing to your server using following command: ```nslookup -type=A domain_name```

***EMAIL*** the email is required for the SSL certificate generation. You will get notified when this certificate is being expired. Although the mechanism will automatically renew it for you.

## Security

The rpc username and password are generated automatically in [setup.sh](https://github.com/defichain-pond/pond-deploy/blob/main/setup.sh), then will be injected into [docker-compose](https://github.com/defichain-pond/pond-deploy/blob/main/docker-compose.yml).

## Snapshots

We upload regular snapshots for the defichain node as well as whale DB to https://snapshots-eu.sanc.ch/

## Monitoring

You can monitor your Pond environment my checking the url ```https://your_domain.com/_actuator/probes/readiness```. This will return a 2xx return code if all is file. It will fail if pond-node or pond-whale or traeffik or the whole server is down. You can use a service such as UptimeRobot to monitor your service.

Depending on the issue Traefik service will automatically failover to the proper Ocean. ***This will not work if either Traefik or the whole server is down***

## Troubleshooting

1. Is pond-node running?

```docker logs -f pond-node --tail 50```

2. Is pnod-whale running and no errors?

```docker logs -f pond-whale --tail 50```

## AWS Cloudformation deployment

For users who want to deploy Pond on AWS they can simply use the AWS Cloudfromation [template](https://github.com/defichain-pond/pond-deploy/blob/main/template.yml) and deploy it on AWS (Currently we are supporting only eu-central-1 Frankfurt region).

To deploy Pond on AWS you can follow the steps mentionned in [Cloudformation-deploy](https://github.com/defichain-pond/pond-deploy/blob/main/Cloudformation-deploy.md)

## AWS Pricing Calculator

The estimated monthly price of Pond deployment including t3.medium EC2 instance will be 58$. A summary of the Pricing calculator can be found in the [Pricing page](https://calculator.aws/#/estimate?id=aa35317f0d930177458d63a860121c1e904cd7be).

The price can be brought down substancially if you want a reserved instance with 1 year upfront payment. It goes down to $247 USD / year or $19 USD / month.


## Support
If you are facing any issues feel free to open either a Github Issue or join us on [Telegram](https://t.me/+lv1Scz8rO7U0OTM0)

## Contributors
- @sancag
- @laghao

## License
MIT
