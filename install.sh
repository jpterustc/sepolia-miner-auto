#!/bin/bash

echo "===== SETUP MINING SEPOLIA FAUCET ====="

read -p "Masukkan Alamat Ethereum Sepolia kamu: " WALLET

# Update sistem & install dependensi
sudo apt update && sudo apt upgrade -y
sudo apt install -y git curl screen build-essential

# Install Node.js 18
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Clone faucet repo
git clone https://github.com/pk910/sepolia-pow-faucet.git
cd sepolia-pow-faucet

# Install dependensi node
npm install

# Jalankan miner dalam screen
screen -dmS sepolia-miner npm run miner -- --address $WALLET

echo "===== MINER SEPOLIA DIJALANKAN DI BACKGROUND ====="
echo "Gunakan 'screen -r sepolia-miner' untuk melihat proses mining."
