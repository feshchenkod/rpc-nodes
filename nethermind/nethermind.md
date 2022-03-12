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

## Upgrade
```bash
docker-compose pull
docker-compose up -d
```