#!/bin/bash

# Atualizar pacotes
sudo apt-get update

# Instalar MySQL Server (ou PostgreSQL)
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password your_password_here'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password your_password_here'
sudo apt-get -y install mysql-server

# Configurar MySQL para aceitar conexões remotas (não recomendado para produção)
sudo sed -i 's/bind-address/#bind-address/' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql

# Criar banco de dados e usuário de exemplo (personalize conforme necessário)
sudo mysql -u root -pyour_password_here -e "CREATE DATABASE dehor.net;"
sudo mysql -u root -pyour_password_here -e "GRANT ALL PRIVILEGES ON dehor.net.* TO 'dehor'@'%' IDENTIFIED BY '1';"
sudo mysql -u root -pyour_password_here -e "FLUSH PRIVILEGES;"

