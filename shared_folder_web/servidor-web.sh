#!/bin/bash

# Atualizar pacotes
sudo apt-get update

# Instalar Apache
sudo apt-get install -y apache2

# Configurar pasta compartilhada
sudo rm -rf /var/www/html
sudo ln -fs /vagrant_shared /var/www/html

# Reiniciar Apache
sudo systemctl restart apache2

