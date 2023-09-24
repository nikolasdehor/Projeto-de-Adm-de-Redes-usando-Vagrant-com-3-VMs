#!/bin/bash

# Atualiza o sistema
sudo apt-get update

# Instala o MySQL e as bibliotecas necessárias
sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev

# Instala net-tools
sudo apt-get install -y net-tools

# Remove a rota padrão
sudo ip route del default

# Adiciona uma nova rota padrão através do gateway
sudo route add default gw 192.168.56.14

# Configura o servidor DNS (usando o Google DNS como exemplo)
sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# Instala o pacote virtualbox-guest-utils
sudo apt-get install -y virtualbox-guest-utils

