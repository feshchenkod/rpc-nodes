# rpc-nodes

## 1. Start traefik proxy (you can skip this step if you are not going to use traefik)
Create a shared network for running containers:
```bash
docker network create rpc-shared-network
```

Specify the domain name to be used and the email address for issuing the Let's Encrypt certificate in the `example.env` file. Rename `example.env` to `.env`:
```
mv example.env .env
```

Start proxy:
```bash
docker-compose up -d
```

## 2. Start blockchain node
* Ethereum - [geth.md](/geth/geth.md)
* Polygon - [bor.md](/bor/bor.md)
* BSC - [bsc.md](/bsc/bsc.md)
* Xdai - [nethermind.md](/nethermind/nethermind.md)

## 3. Monitoring
[Visit the repository with instructions on how to install Zabbix template for blockchain nodes here.](https://github.com/feshchenkod/zabbix-templates#rpc-nodes-geth-bsc-bor-etc)