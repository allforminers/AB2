#!/bin/bash

# Aktualizacja github
sudo apt-get install dos2unix -y

# Aktualizacja github
sudo apt-get update && sudo apt-get install screen -y

# Instalacja zależności NOMP
sudo apt install -y build-essential curl git libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev automake -y

# Aktualizacja common
sudo apt-get update
sudo apt-get install software-properties-common

# Update package lists and install Redis
sudo add-apt-repository ppa:chris-lea/redis-server -y
sudo apt-get update
sudo apt -y install redis-server -y

# Modify Redis configuration to bind to localhost only
sudo sed -i 's/bind 127.0.0.1 ::1/bind 127.0.0.1/g' /etc/redis/redis.conf


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

# Change to root directory and run init.js

sudo mv /root/bitcoin-cli /usr/bin/
sudo mv /root/bitcoind /usr/bin/
sudo mv /root/bitcoin-tx /usr/bin/
sudo mv /root/doichain-wallet /usr/bin/
sudo mv /root/doichain-tx /usr/bin/
sudo mv /root/doichaind /usr/bin/
sudo mv /root/doichain-cli /usr/bin/

sudo chmod -R 777 /root

# NOMP

cd nomp

# Instalacja Node.js (wymagana wersja 10.x.x)
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs

# Instalacja zależności NOMP
npm update
npm install

# Uruchomienie NOMP
node init.js






