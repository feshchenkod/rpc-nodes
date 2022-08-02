#!/bin/sh
set -x

if [ ! -f /bsc/config/setupdone ]; then
    wget -O /bsc/mainnet.zip "https://github.com/bnb-chain/bsc/releases/download/${BSC_TAG}/mainnet.zip"
    unzip -o -j /bsc/mainnet.zip "mainnet/genesis.json" -d /bsc/config/
    bsc --datadir /bsc/.ethereum init /bsc/config/genesis.json
    touch /bsc/config/setupdone
fi

exec "$@"