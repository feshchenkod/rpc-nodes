#!/bin/sh
set -x

if [ ! -f /root/.ethereum/setupdone ]; then
    wget -O /root/mainnet.zip "https://github.com/bnb-chain/bsc/releases/download/${BSC_TAG}/mainnet.zip"
    unzip -o -j /root/mainnet.zip "mainnet/genesis.json" -d /root/.ethereum/
    bsc init /root/.ethereum/genesis.json
    touch /root/.ethereum/setupdone
fi

exec "$@"