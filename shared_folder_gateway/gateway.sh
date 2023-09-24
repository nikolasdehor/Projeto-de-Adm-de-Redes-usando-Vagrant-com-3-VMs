#!/bin/bash

# Habilitar o roteamento de pacotes
sudo sysctl -w net.ipv4.ip_forward=1

# Configurar NAT para fornecer acesso à Internet para as VMs
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE

# Instalar pacotes necessários (como iptables-persistent)
sudo apt-get update
sudo apt-get install -y iptables-persistent

