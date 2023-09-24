#Laboratório de Redes com Vagrant

#Este é um laboratório de redes automatizado criado com o Vagrant, que consiste em três máquinas virtuais (VMs): Servidor Web, Servidor de Banco de Dados e Gateway. O objetivo deste ambiente é criar um ambiente de laboratório onde VM1 e VM2 podem se comunicar através da rede privada e VM3 atua como um gateway, fornecendo acesso à Internet para VM1 e VM2 através de sua interface de rede pública.
Requisitos

#Para executar este laboratório, você precisará ter as seguintes ferramentas instaladas em sua máquina:

Vagrant
VirtualBox ou outro provedor de VMs compatível com o Vagrant

#Configuração do Ambiente
#Passo 1: Clone o Repositório

#Clone este repositório para sua máquina local usando o seguinte comando:

git clone https://github.com/seu-usuario/seu-repositorio.git
cd seu-repositorio

#Passo 2: Inicialize as VMs

#Para iniciar as VMs, basta executar o seguinte comando na raiz do projeto:

vagrant up

#Este comando criará e configurará as VMs de acordo com as especificações fornecidas no arquivo Vagrantfile. Os scripts de provisionamento estão localizados na pasta provision e são executados automaticamente durante o processo de inicialização.
#Passo 3: Acesse as VMs

#Depois que as VMs estiverem em execução, você pode acessá-las usando o seguinte comando:

vagrant ssh nome-da-vm

#Por exemplo, para acessar a VM do Servidor Web:

vagrant ssh servidor-web

#Passo 4: Teste a Comunicação

Você pode testar a comunicação entre as VMs seguindo estas etapas:

#Na VM Servidor Web, abra um terminal:

vagrant ssh servidor-web

#Na VM Servidor de Banco de Dados, abra um terminal:

vagrant ssh servidor-bd

#Tente fazer ping de uma VM para a outra usando seus endereços IP privados:

ping IP_DA_OUTRA_VM

#Por exemplo, para fazer ping do Servidor Web para o Servidor de Banco de Dados:

ping 192.168.56.17, 192.168.56.18, 192.168.56.19

#Passo 5: Acesso à Internet

A VM Gateway está configurada para fornecer acesso à Internet para as VMs Servidor Web e Servidor de Banco de Dados. Certifique-se de que as VMs possam acessar a Internet através do Gateway.
Estrutura de Rede

#Aqui está a estrutura de rede das VMs:

    VM Servidor Web:
        Interface de Rede 1 (eth0): IP Privado Estático (192.168.56.17)
        Interface de Rede 2 (eth1): IP Público DHCP

    VM Servidor de Banco de Dados:
        Interface de Rede 1 (eth0): IP Privado Estático (192.168.56.18)
        Interface de Rede 2 (eth1): IP Público DHCP

    VM Gateway:
        Interface de Rede 1 (eth0): IP Privado Estático (192.168.56.19)
        Interface de Rede 2 (eth1): IP Público DHCP

#Personalização

Você pode personalizar este ambiente de laboratório de acordo com suas necessidades específicas, adicionando ou removendo VMs, ajustando as configurações de rede ou provisionamento, e instalando os serviços desejados.
Encerrando as VMs

#Para desligar as VMs, execute o seguinte comando:

vagrant halt

#Para destruir completamente as VMs e liberar os recursos, execute o seguinte comando:

vagrant destroy -f

#Conclusão

Este arquivo README fornece uma visão geral do laboratório de redes criado com o Vagrant. Você pode usá-lo como referência para configurar e personalizar seu próprio ambiente de laboratório de acordo com seus requisitos específicos. Certifique-se de ajustar e expandir conforme necessário.
