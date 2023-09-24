# Configuração de Rede no Vagrant

Este documento descreve o processo de configuração e as configurações de rede para um ambiente de laboratório usando o Vagrant. O ambiente consiste em três máquinas virtuais (VMs) que se comunicam entre si e têm acesso à Internet por meio de uma VM de gateway.

## Pré-requisitos

Certifique-se de ter o Vagrant e o VirtualBox instalados no seu sistema.

## Configuração das Máquinas Virtuais

As VMs são configuradas no arquivo `Vagrantfile`. Cada VM tem suas próprias configurações de rede e provisionamento.

### VM1 - Gateway

- **Sistema Operacional:** Ubuntu Server 20.04 LTS
- **Interface de Rede 1 (eth0):** IP Privado Estático (192.168.56.17)
- **Interface de Rede 2 (eth1):** IP Público DHCP
- **Função:** Gateway de Rede
- **Pasta Compartilhada:** `/vagrant_shared` na máquina host compartilhada com `./shared_folder` na VM1.

### VM2 - Servidor Web

- **Sistema Operacional:** Ubuntu Server 20.04 LTS
- **Interface de Rede:** IP Privado Estático (192.168.56.18)
- **Função:** Servidor Web (instalação do Apache)
- **Pasta Compartilhada:** `/var/www/html` na máquina host compartilhada com `/var/www/html` na VM2.

### VM3 - Servidor de Banco de Dados

- **Sistema Operacional:** Ubuntu Server 20.04 LTS
- **Interface de Rede:** IP Privado Estático (192.168.56.19)
- **Função:** Servidor de Banco de Dados (instalação do MySQL)
- **Pasta Compartilhada:** `/vagrant_shared` na máquina host compartilhada com `./shared_folder` na VM3.

## Configuração de Rede

A configuração de rede é definida no arquivo `Vagrantfile` usando o Vagrant. As interfaces de rede privadas e públicas são especificadas, bem como os endereços IP estáticos, a interface de rede do gateway e as pastas compartilhadas.

## Procedimento de Configuração

1. Clone o repositório com o arquivo `Vagrantfile`.

   `git clone https://github.com/seu-usuario/seu-repositorio.git`
   `cd seu-repositorio`

2. Inicie as VMs com o comando `vagrant up`.

   `vagrant up`

3. Acesse cada VM usando `vagrant ssh` e execute os testes de conectividade, conforme necessário.

4. Para interromper as VMs, use o comando `vagrant halt`.

   `vagrant halt`

## Testes de Conectividade

Após iniciar as VMs, você pode executar os seguintes testes de conectividade:

- De VM1 para VM2: `ping 192.168.56.18`
- De VM2 para VM1: `ping 192.168.56.17`
- De VM3 para VM1 ou VM2: `ping 192.168.56.17` ou `ping 192.168.56.18`
- Da VM1 ou VM2 para a Internet (via VM3): `ping google.com`

## Problemas e Soluções

Se você encontrar problemas de conectividade, verifique as configurações de rede no arquivo `Vagrantfile` e certifique-se de que as VMs foram inicializadas corretamente.

## Autor

- Nikolas de Hor
- madeira_clerigo_0@icloud.com

Lembre-se de personalizar este arquivo com as informações específicas do seu ambiente e suas preferências. Isso fornecerá um guia claro para configurar e gerenciar suas VMs usando o Vagrant.
