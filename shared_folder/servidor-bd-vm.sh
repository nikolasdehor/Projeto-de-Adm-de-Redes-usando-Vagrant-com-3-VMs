# Script para VM Servidor de Banco de Dados (servidor-bd-vm)

# Atualiza os pacotes
sudo apt-get update

# Instala o MySQL Server, MySQL Client e libmysqlclient-dev
sudo apt-get -y install mysql-server mysql-client libmysqlclient-dev

# Instala o pacote net-tools
sudo apt-get -y install net-tools

# Remove a rota padrão e define um novo gateway
sudo ip route del default
sudo route add default gw 192.168.56.14

# Configura o servidor DNS
sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf
