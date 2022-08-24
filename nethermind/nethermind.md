# Nethermind node

## Requirements for Xdai network
* memory: 16Gb
* disk: 240Gb SSD (prune at ~180Gb)

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

## Pruning
1. Restart node with admin methods enabled:
```
- --JsonRpc.EnabledModules
- "Admin,Web3,Eth,Subscribe,Net,Parity"
```
2. Send prune command:
```
curl --data '{"method":"admin_prune","params":[],"id":1,"jsonrpc":"2.0"}' -H "Content-Type: application/json" -X POST localhost:8545
```
3. Watch pruning process:
```
docker logs nethermind --since 60m -f | grep 'Pruning'
```
4. Disable admin methods.
