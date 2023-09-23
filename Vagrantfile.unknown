# -*- mode: ruby -*-
# vi: set ft=ruby :

#Trabalho de Administração de Redes de Computadores
#By: Nikolas de Hor

Vagrant.configure("2") do |config|
    # VM1 - Servidor Web
    config.vm.define "vm1" do |vm1|
        vm1.vm.box = "gusztavvargadr/ubuntu-server"  
        vm1.vm.network "private_network", ip: "192.168.56.10"
        vm1.vm.provision "shell",inline: <<-SHELL 
            sudo apt update
            sudo apt install apache2 -y
            sudo ip route delete default
            sudo route add default gw 192.168.56.12
        SHELL
        vm1.vm.synced_folder ".", "/var/www/html"
    end
    
    # VM2 - Servidor de Banco de Dados
    config.vm.define "vm2" do |vm2|
        vm2.vm.box = "gusztavvargadr/ubuntu-server"
        vm2.vm.network "private_network", ip: "192.168.56.11" 
        vm2.vm.provision "shell",inline: <<-SHELL
            sudo apt update
            sudo apt install mysql-server -y
            sudo ip route delete default
            sudo route add default gw 192.168.56.12
        SHELL
    end
    
    # VM3 - Gateway de Rede
    config.vm.define "vm3" do |vm3|
        vm3.vm.box = "gusztavvargadr/ubuntu-server"
        vm3.vm.network "private_network", ip: "192.168.56.12"
        vm3.vm.network "public_network", type: "dhcp"
        vm3.vm.provision "shell",inline: <<-SHELL
            sudo apt update
            sudo sysctl -w net.ipv4.ip_forward=1
            sudo iptables -t nat -A POSTROUTING -j MASQUERADE 
        SHELL
    end
end
