#!/bin/bash
LRED='\033[1;31m'
LGREEN='\033[1;32m'
NC='\033[0m'
LBLUE='\033[0;34m'
LYELLOW='\033[1;33m'

# Instalacion de paquetes
function installPackage_git {
    echo "\n${LGREEN}Git se instalará en tu sistema.${NC}"
    apt install -y git
    git config --global user.name "enieto2018"
    git config --global user.email e.nieto@utp.edu.co
    git config --global --add safe.directory '*'
}

function installPackage_apache {
    echo "\n${LGREEN}Apache  se instalará en tu sistema.${NC}"
    apt install apache2 -y
    systemctl start apache2
    systemctl enable apache2
}

function installPackage_mariadb {
    echo -e "\n${LYELLOW}instalando MARIA DB ...${NC}"
    apt install -y mariadb-server
    #Iniciando la base de datos
    systemctl start mariadb
    systemctl enable mariadb

}

function installPackage_php {
    echo "\n${LGREEN}php se instalará en tu sistema.${NC}"
    apt install -y php libapache2-mod-php php-mysql php-mbstring php-zip php-gd php-json php-curl 
    php -v
}

# Comprobar si el servidor se encuentra actualizado
sudo apt-get update
echo -e "\n${LGREEN}El Servidor se encuentra Actualizado ...${NC}"

# Comprobar si Git está instalado
if dpkg -s git > /dev/null 2>&1; then
    echo "\n${LYELLOW}Git está instalado en tu sistema.${NC}"
    git --version
else
    installPackage_git
fi
# Comprobar si Apache está instalado
if dpkg -s apache2 > /dev/null 2>&1; then
    echo "\n${LYELLOW}Apache está instalado en tu sistema.${NC}"
else
    installPackage_apache
fi
# Comprobar si php está instalado
if dpkg -s php > /dev/null 2>&1; then
    echo "\n${LYELLOW}php está instalado en tu sistema.${NC}"
    php -v
else
    installPackage_php
fi
# Comprobar si mariadb-server está instalado
if dpkg -s mariadb-server > /dev/null 2>&1; then
    echo -e "\n${LYELLOW}mariadb-server se encuentra instalado ...${NC}"
else
    installPackage_mariadb
fi