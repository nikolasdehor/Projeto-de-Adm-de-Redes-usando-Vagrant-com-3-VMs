# Script para VM Gateway (gateway-vm)

# Atualiza os pacotes
sudo apt-get update

# Instala o pacote net-tools
sudo apt-get -y install net-tools

# Habilita o IP forwarding
sudo sysctl -w net.ipv4.ip_forward=1

# Configura as regras de NAT para o masquerading
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE
