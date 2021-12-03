#!/bin/bash

if [ -f "/root/.vericonomy/vericoin/walletnew.dat" ]; then
    echo "/root/.vericonomy/vericoin/walletnew.dat does exist. Starting swapping."

    mv /root/.vericonomy/vericoin/wallet.dat /root/.vericonomy/vericoin/wallet_$(date +%F).dat
    mv /root/.vericonomy/vericoin/walletnew.dat /root/.vericonomy/vericoin/wallet.dat

    echo "Swapping completed. Old wallet.dat renamed to wallet_$(date +%F).dat"
fi
