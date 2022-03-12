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

Start node (If you do not use traefik, specify the compose file with the `-f docker-compose.no-proxy.yml`):
```bash
docker-compose build
docker-compose up -d bsc
```

To see the sync status run:
`curl -X POST --data '{"jsonrpc": "2.0", "id": 1, "method": "eth_syncing"}' -H 'Content-Type: application/json' -s https://${DOMAIN}/bsc-http/`
* `currentBlock` - your node current height;
* `highestBlock` - network height.

## Upgrade
Periodically check for new versions. If there is a release, then you need to update the tag (`BSC_TAG`) in the environment file. 
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