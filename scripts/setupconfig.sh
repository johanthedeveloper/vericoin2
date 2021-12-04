#!/bin/bash

if [ ! -f "/root/.vericonomy/vericoin/dockervericoin.conf" ]; 
then
    echo "/root/.vericonomy/vericoin/dockervericoin.conf not exist"

    mkdir -p /root/.vericonomy/vericoin/

/bin/cat <<EOM >/root/.vericonomy/vericoin/dockervericoin.conf
vericoin_stake=false
vericoin_walletpassword=yourpassword
EOM

chmod +x /root/.vericonomy/vericoin/dockervericoin.conf

else
    echo "/root/.vericonomy/vericoin/dockervericoin.conf exist"
fi
