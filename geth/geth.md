# Geth node

## Requirements for Ethereum network
* memory: 32Gb
* disk: 1Tb SSD (require periodically prune state)

## Installation
Set the domain name to be used in the `.env` file. You can also set a list of allowed IP addresses there and addresses to treat as local. Rename `example.env` to `.env`:
```
mv example.env .env
```

Start node (If you do not use traefik, specify the compose file with the `-f docker-compose.no-proxy.yml`):
```bash
docker-compose up -d geth
```
To see the sync status run:
`curl -X POST --data '{"jsonrpc": "2.0", "id": 1, "method": "eth_syncing"}' -H 'Content-Type: application/json' -s https://${DOMAIN}/geth-http/`
* `currentBlock` - your node current height;
* `highestBlock` - network height.

## Upgrade
```bash
docker-compose pull
docker-compose up -d geth
```

## Pruning 
Use it if the size is approaching 800 GB. At least 120 GB must be free for successful pruning.
```bash
docker-compose down
docker-compose up geth-pruning
docker-compose down
docker-compose up -d geth
```