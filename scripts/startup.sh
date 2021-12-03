#!/bin/bash

#setup bootstrap
printf "Checking bootstrap\n";
/usr/libexec/vericoin2/bootstrap.sh

#setup config file
printf "Checking configuration file\n";
/usr/libexec/vericoin2/setupconfig.sh

#setup config file
printf "Checking wallet file(s)\n";
/usr/libexec/vericoin2/walletcheck.sh

#look config file
printf "Loading configuration file\n";
source /root/.vericonomy/vericoin/dockervericoin.conf

printf "Startup\n";
if [ "$vericoin_stake" = true ] ; then
    echo 'Starting with stake'
    
    printf "Start vericoin deamon\n";
    vericoind -daemon -staking -conf=/root/.vericonomy/vericoin/vericonomy.conf -wallet=wallet.dat &
    printf "Finish vericoin deamon\n";

    echo "Waiting for staking";

    for i in 1 2 3 4 5
    do
        sleep 120
        echo "Start staking for the $i times";
        vericoin-cli -conf=/root/.vericonomy/vericoin/vericonomy.conf walletpassphrase "$vericoin_walletpassword" 9999999 true
        printf "Finished staking\n";
    done
else
    echo 'Starting without stake'
    
    printf "Start vericoin deamon\n";
    vericoind -daemon -conf=/root/.vericonomy/vericoin/vericonomy.conf &
    printf "Finish vericoin deamon\n";
fi
printf "Finished starting\n";

#sleep script
sleep infinity

printf "Shutdown\n";
