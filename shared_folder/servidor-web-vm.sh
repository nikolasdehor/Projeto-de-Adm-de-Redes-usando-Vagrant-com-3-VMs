# Script para VM Servidor Web (servidor-web-vm)

# Atualiza os pacotes
sudo apt-get update

# Instala o Apache2
sudo apt-get -y install apache2

# Instala o pacote net-tools
sudo apt-get -y install net-tools

# Remove a rota padrão e define um novo gateway
sudo ip route del default
sudo route add default gw 192.168.56.14

# Configura o servidor DNS
sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf
