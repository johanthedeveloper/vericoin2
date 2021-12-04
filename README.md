# Welcome to Vericoin2

</br>
This docker container is made base on the vericion 2.0.0 assemblies who you can find here: https://vericoin.info/vericoin-digital-currency/#wallet_dl </br>
How this container is made you can find here: http://johanthedeveloper.com/how-to-build-a-vericoin-docker-container-for-docker-hub/ </br>
The source code you can find here: https://github.com/johanthedeveloper/vericoin2 </br>
</br>

## How to start
The best way  to start this container is with the following command:</br>
'docker run -d --restart=always --mount source=vericoin2_root_home,target=/root -p 58684:58684 --name vericoin2 johanthedeveloper/vericoin2:latest'</br>
This will open the right port (58684) and make a persistent filestorage on your device.</br>
</br>

## How to start staking
By default the container is not staking. Do you want to enable it, then you have to do the following.</br>

### 1. Change dockervericoin.conf
In the container you will find the following file '/root/.vericonomy/vericoin/dockervericoin.conf'</br>
Edit this file and change the first line from 'false' to 'true'. And change in the second line 'yourpassword' to what your wallet password is.

Options to do this are (any will do):
- docker exec -it vericoin2 nano /root/.vericonomy/vericoin/dockervericoin.conf
- nano /var/lib/docker/volumes/vericoin2_root_home/_data/.vericonomy/vericoin/dockervericoin.conf
- sudo nano /var/lib/docker/volumes/vericoin2_root_home/_data/.vericonomy/vericoin/dockervericoin.conf

### 2. Copy your wallet
In the container upload/copy your wallet to '/root/.vericonomy/vericoin/walletnew.dat'</br>

Options to do this are (any will do):
- docker cp [yourlocalpath) vericoin2:/root/.vericonomy/vericoin/walletnew.dat

### 3. Restart the docker container
Restart the docker container will run the scripts again. It will rename 'walletnet.dat' to wallet.dat and pick up staking (if you have done 'dockervericoin.conf' right)

