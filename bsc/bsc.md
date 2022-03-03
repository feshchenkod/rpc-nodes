# BSC node

## Requirements for Ethereum network
* memory: 48Gb
* disk: 3Tb SSD (require periodically prune state) - the size increases quickly, so you need to periodically check the remaining space.

## Installation
Set in the `.env` file:
* `DOMAIN=` - the domain name to be used in traefik;
* `BSC_TAG=` - Use latest stable version from https://github.com/bnb-chain/bsc/tags.

You can also set a list of allowed IP addresses there and addresses to treat as local. Rename `example.env` to `.env`:
```
mv example.env .env
```

Start node:
```bash
docker-compose build
docker-compose up -d bsc
```

## Upgrade
Periodically check for new versions. if there is a release, then you need to update the tag in the environment file. 
```bash
docker-compose build
docker-compose up -d bsc
```

## Pruning 
Use it if the size is approaching 2.6TB. At least 150 GB must be free for successful pruning.
```bash
docker-compose down
docker-compose up bsc-pruning
docker-compose down
docker-compose up -d bsc
```