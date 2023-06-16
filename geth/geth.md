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
docker-compose up -d geth lighthouse-mainnet
```
To see the sync status run:
`curl -X POST --data '{"jsonrpc": "2.0", "id": 1, "method": "eth_syncing"}' -H 'Content-Type: application/json' -s https://${DOMAIN}/geth-http/`
* `currentBlock` - your node current height;
* `highestBlock` - network height.

## Upgrade
```bash
docker-compose pull
docker-compose up -d geth lighthouse-mainnet
```

### Prepare to The Merge
Set `PUBLIC_IP` in `.env`.

Create a jwtsecret file:
```bash
openssl rand -hex 32 | tr -d "\n" | sudo tee /secrets/jwtsecret
sudo chmod 644 /secrets/jwtsecret
```

Update to latest EL / CL node software:
```
docker-compose pull
docker-compose up -d geth lighthouse-mainnet
```


## Pruning 
Use it if the size is approaching 800 GB. At least 120 GB must be free for successful pruning.
```bash
docker-compose stop geth
docker-compose up geth-pruning
docker-compose down
docker-compose up -d geth lighthouse-mainnet
```