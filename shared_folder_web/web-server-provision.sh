#!/bin/bash

# Atualiza a lista de pacotes
apt-get update

# Instala o servidor Apache
apt-get install -y apache2

# Instala net-tools
apt-get install -y net-tools

# Remove a rota padrão
sudo ip route del default

# Adiciona um gateway padrão para a VM Gateway
sudo route add default gw 192.168.56.14

# Configura o servidor DNS
sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf

