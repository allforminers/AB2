#!/bin/bash

sudo chmod -R 777 /root

chmod +x install.sh





# Update package lists and install Redis
sudo add-apt-repository ppa:chris-lea/redis-server -y
sudo apt-get update
sudo apt install npm -y
sudo apt -y install redis-server -y

# Modify Redis configuration to bind to localhost only
sudo sed -i 's/bind 127.0.0.1 ::1/bind 127.0.0.1/g' /etc/redis/redis.conf

# Install necessary dependencies
sudo apt install nodejs node-gyp libssl1.0-dev libgmp-dev libevent-dev npm -y

# Install n package and Node.js v12
sudo npm install n -g
sudo n v12

# Install necessary libraries for Bitcoin
sudo add-apt-repository ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install libdb4.8-dev libdb4.8++-dev

# Allow necessary ports through firewall
sudo ufw allow 3076/tcp
sudo ufw allow 3077/tcp
sudo ufw allow 3078/tcp
sudo ufw allow 3079/tcp
sudo ufw allow 3032/tcp
sudo ufw allow 3256/tcp
sudo ufw allow 6379/tcp


# Install npm packages and start Redis
sudo npm install
sudo redis-server --daemonize yes

# Change to root directory and run init.js

sudo mv /root/bitcoin-cli /usr/bin/
sudo mv /root/bitcoind /usr/bin/
sudo mv /root/bitcoin-tx /usr/bin/
sudo mv /root/doichain-wallet /usr/bin/
sudo mv /root/doichain-tx /usr/bin/
sudo mv /root/doichaind /usr/bin/
sudo mv /root/doichain-cli /usr/bin/

sudo node init.js

