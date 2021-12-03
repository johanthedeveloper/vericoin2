#!/bin/bash

if [ ! -f "/root/.vericonomy/vericoin/walletnew.dat" ]; then
    echo "/root/.vericonomy/vericoin/walletnew.dat not exist"

    mv /root/.vericonomy/vericoin/wallet.dat /root/.vericonomy/vericoin/wallet_$(date +%F).dat
    mv /root/.vericonomy/vericoin/walletnew.dat /root/.vericonomy/vericoin/wallet.dat
fi
