#! /bin/bash
## user-data: Criando ambiente DevOps - Distro Ubuntu 22.04 LTS
## By Rodrigo César Assis
USER="ubuntu"   # change-me

echo "
### DevOps Tools - Install ###

ATENÇÃO: antes de qualquer instalação execute UMA vez: sudo apt update && sudo apt upgrade
- Baseado nas documentações oficiais.

1. Docker
2. Docker Compose
3. Git
4. Ansible
5. Terraform
6. AWS CLI
7. Todas 
0. Limpando lixo de pacotes

Digite o software que deseja instalar: "
read tool

function1()
{
    echo "### Instalando DOCKER ###"
    echo "### Docker install - Install using the repository ###"
    # Documentation: https://docs.docker.com/engine/install/ubuntu/
    echo -e "\n1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:"
    sudo apt install lsb-release ca-certificates curl gnupg vim apt-transport-https -y
        
    echo -e "\n2. Add Docker’s official GPG key:"
    sudo mkdir -m 0755 -p /etc/apt/keyrings
    #curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
        
    echo -e "\n3. Use the following command to set up the repository:"
    #echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \ $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
       
    echo -e "\nInstall Docker Engine, containerd"
    sudo apt update
    sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin
    sudo usermod -aG docker $USER
    echo -e "\nFinalizando instalacao do DOCKER\n"
    echo "-------------------------//-------------------------"
}

function2()
{
    echo -e "### Instalando DOCKER COMPOSE ###\n"
    sudo apt install docker-compose -y
    echo -e "\nFinalizando instalacao do DOCKER COMPOSE\n"
    echo "-------------------------//-------------------------"
}

function3()
{
    echo -e "### Instalando GIT ###\n"
    sudo apt install git -y      
    echo -e "\n Finalizando instalacao do GIT\n"
    echo "-------------------------//-------------------------"
}

function4()
{
    echo -e "### Instalando ANSIBLE ###\n"
    sudo apt install software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install ansible -y
    echo -e "\nFinalizando instalacao do ANSIBLE\n"
    echo "-------------------------//-------------------------"
}

function5()
{
    echo -e "### Instalando TERRAFORM ###\n"
    echo -e "1. Download the signing key to a new keyring\n"
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo -e "Processo concluído\n"
    #wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
    
    echo -e "\n2. Add the HashiCorp repo"
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    
    echo -e "\n3.Update and install\n "
    sudo apt update
    sudo apt install terraform -y
    echo -e "\nFinalizando instalacao do TERRAFORM\n"
    echo "-------------------------//-------------------------"
}

function6()
{
    echo -e "\n### Instalando AWS CLI ###"
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip"
    sudo unzip awscliv2.zip
    sudo ./aws/install
    echo -e "\nFinalizando instalacao do AWS CLI\n"
    echo "-------------------------//-------------------------"
}

function7()
{
    echo "### Instalando TODAS as tools ###"
}

function0()
{
    echo "### Limpando lixo de pacotes ###"
    sudo apt autoremove
    sudo apt clean
    echo -e "\nFinalizando limpeza\n"
}

case $tool in 
    1)  function1 ;;

    2)  function2 ;;

    3)  function3 ;;    

    4)  function4 ;;

    5)  function5 ;;

    6)  function6 ;;

    7)  function1 && function2 && function3 && function4 && function5 
        echo -e "\nFerramentas instaladas\n"
    ;;

    0)  function0 ;;

    *)  echo "Codigo Invalido" ;;
esac