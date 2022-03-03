# Geth node

## Requirements for Ethereum network
* memory: 32Gb
* disk: 1Tb SSD (if you periodically prune state)

## Installation
Set the domain name to be used in the `.env` file. You can also set a list of allowed IP addresses there. Rename `example.env` to `.env`:
```
mv example.env .env
```

Start node:
```bash
docker-compose up -d geth
```

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