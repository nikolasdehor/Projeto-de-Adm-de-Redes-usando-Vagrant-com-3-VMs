#!/bin/bash

# Atualiza a lista de pacotes
apt-get update

# Instala net-tools
apt-get -y install net-tools

# Habilita o roteamento IP
sudo sysctl -w net.ipv4.ip_forward=1

# Configura a regra NAT para roteamento
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE

