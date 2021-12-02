#!/bin/bash

if [ ! -d "/root/.vericonomy/vericoin/" ]; then
    echo "/root/.vericonomy/vericoin/ not exist"

    printf "\e[32mCreating directory\e[0m\n"
	mkdir -p /root/.vericonomy/vericoin/

    printf "\e[32mGetting bootstrap.zip\e[0m\n"
	wget https://files.vericonomy.com/vrc/2.0/bootstrap/bootstrap.zip -O /root/.vericonomy/vericoin/bootstrap.zip
	
    printf "\e[32mUnzipping bootstrap.zip\e[0m\n"
	unzip -q /root/.vericonomy/vericoin/bootstrap.zip -d /root/.vericonomy/vericoin/

    printf "\e[32mCopy content bootstrap\e[0m\n"
	mv /root/.vericonomy/vericoin/bootstrap/* /root/.vericonomy/vericoin/
	
	printf "\e[32mCopy directory bootstrap\e[0m\n"
	rm /root/.vericonomy/vericoin/bootstrap/ -r
	
	printf "\e[32mCopy file bootstrap.zip\e[0m\n"
	rm /root/.vericonomy/vericoin/bootstrap.zip 

	printf "\e[32mCreating vericonomy.conf\e[0m\n"
	configurationfile=/root/.vericonomy/vericoin/vericonomy.conf

	/bin/cat <<EOM >$configurationfile
[verium]
addnode=108.35.90.100
addnode=113.65.229.169
addnode=167.100.70.30
addnode=174.110.148.193
addnode=202.171.78.5
addnode=206.189.209.81

[vericoin]
addnode=179.61.240.144
addnode=179.61.240.25
addnode=37.201.226.13
addnode=54.37.42.45
addnode=73.161.0.9
addnode=79.100.51.15
addnode=79.124.36.162
addnode=81.155.90.5
addnode=82.204.244.2
addnode=85.224.96.165
addnode=86.139.192.21
addnode=86.139.192.91
addnode=93.177.120.42

rpcuser=vericoinrpc
rpcpassword=5jswCEheDSfnR8btd8iUNA8A4bfddKLfps8apbE2KLLE
EOM

fi
