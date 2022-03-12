# Nethermind node

## Requirements for Xdai network
* memory: 16Gb
* disk: 200Gb SSD

## Installation
Set the domain name to be used in the `.env` file. You can also set a list of allowed IP addresses there. Rename `example.env` to `.env`:
```
mv example.env .env
```

Start node (If you do not use traefik, specify the compose file with the `-f docker-compose.no-proxy.yml`):
```bash
docker-compose up -d
```

To see the sync status run:
`curl -X POST --data '{"jsonrpc": "2.0", "id": 1, "method": "eth_syncing"}' -H 'Content-Type: application/json' -s https://${DOMAIN}/nm-http/`
* `currentBlock` - your node current height;
* `highestBlock` - network height.

## Upgrade
```bash
docker-compose pull
docker-compose up -d
```