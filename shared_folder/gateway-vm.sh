#!/bin/bash

# Atualiza o sistema
sudo apt-get update

# Instala net-tools
sudo apt-get -y install net-tools

# Habilita o IP forwarding
sudo sysctl -w net.ipv4.ip_forward=1

# Configura o NAT para fornecer acesso à Internet
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE

# Instala o pacote virtualbox-guest-utils
sudo apt-get install -y virtualbox-guest-utils

