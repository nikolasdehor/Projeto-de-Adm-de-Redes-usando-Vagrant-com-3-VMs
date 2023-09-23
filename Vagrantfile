# -*- mode: ruby -*-
# vi: set ft=ruby :

#by: Nikolas de Hor

Vagrant.configure("2") do |config|

  # VM 1 Gateway
  config.vm.define "gateway-vm" do |gateway|
    gateway.vm.box = "ubuntu/focal64"
  
    gateway.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
  
    gateway.vm.network "private_network", ip: "192.168.56.14"
  
    gateway.vm.network "public_network", type: "dhcp", bridge: "wlp3s0"
  
    gateway.vm.synced_folder "shared_folder_gateway", "/vagrant_shared"
  
    gateway.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get -y install net-tools
      sudo sysctl -w net.ipv4.ip_forward=1
      sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE

      # Instala o pacote virtualbox-guest-utils
      apt-get install -y virtualbox-guest-utils
    SHELL
  end

  # VM 2 Servidor Web
  config.vm.define "servidor-web-vm" do |web|
    web.vm.box = "ubuntu/focal64"
      
    web.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
    
    web.vm.network "private_network", ip: "192.168.56.15"
  
    web.vm.synced_folder "shared_folder_web", "/var/www/html"
  
    web.vm.network "forwarded_port", guest: 81, host: 8080
  
    web.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y apache2
      apt-get install -y net-tools
      sudo ip route del default
      sudo route add default gw 192.168.56.14
      sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf
    SHELL
  end

  # VM 3 Servidor BD
  config.vm.define "servidor-bd-vm" do |banco|
    banco.vm.box = "ubuntu/focal64"

    banco.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
    
    banco.vm.network "private_network", ip: "192.168.56.16"
    
    banco.vm.synced_folder "shared_folder_db", "/vagrant_shared"
  
    banco.vm.network "forwarded_port", guest: 81, host: 8081
  
    banco.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y mysql-server mysql-client libmysqlclient-dev
      apt-get install -y net-tools
      sudo ip route del default
      sudo route add default gw 192.168.56.14
      sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf

      # Instala o pacote virtualbox-guest-utils
      apt-get install -y virtualbox-guest-utils
    SHELL
  end
end

