#!/bin/sh
set -x

if [ ! -f /bsc/.ethereum/config/setupdone ]; then
    wget -O /bsc/mainnet.zip "https://github.com/bnb-chain/bsc/releases/download/${BSC_TAG}/mainnet.zip"
    unzip -o -j /bsc/mainnet.zip "genesis.json" -d /bsc/.ethereum/config/
    bsc --datadir /bsc/.ethereum init /bsc/.ethereum/config/genesis.json
    touch /bsc/.ethereum/config/setupdone
fi

exec "$@"