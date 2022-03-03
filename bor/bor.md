# Bor node

## Requirements for Polygon network
* memory: 64Gb (minimum)
* disk: 2Tb SSD (if you periodically prune state)

## Installation
Set in the `.env` file:
* `DOMAIN=` - the domain name to be used in traefik;
* `HEIMDALL_ETH_RPC_URL=` - your Ethereum RPC.

You can also set a list of allowed IP addresses there and addresses to treat as local. Rename `example.env` to `.env`:
```
mv example.env .env
```

Start node:
```bash
docker-compose build
docker-compose up -d rabbitmq heimdalld heimdallr bor
```

## Upgrade
Periodically check for new versions. if there is a release, then you need to update the tag in the environment file. 
```bash
docker-compose build
docker-compose pull
docker-compose up -d rabbitmq heimdalld heimdallr bor
```

## Pruning 
Use it if the size is approaching 1.7Tb. At least 150 GB must be free for successful pruning.
```bash
docker-compose stop bor
docker-compose up prune-bor
docker-compose rm prune-bor 
docker-compose up -d bor
```