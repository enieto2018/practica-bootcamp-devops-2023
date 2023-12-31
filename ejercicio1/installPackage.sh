#!/bin/bash
LRED='\033[1;31m'
LGREEN='\033[1;32m'
NC='\033[0m'
LBLUE='\033[0;34m'
LYELLOW='\033[1;33m'

# Instalacion de paquetes
function installPackage_git {
    echo -e "\n${LGREEN} Git se instalará en tu sistema.${NC}"
    apt install -y git
    git config --list
    git config --global user.name "enieto2018"
    git config --global user.email e.nieto@utp.edu.co
    git config --global --add safe.directory '*'
}

function installPackage_apache {
    echo -e "\n${LGREEN} Apache  se instalará en tu sistema.${NC}"
    apt install apache2 -y
    systemctl start apache2
    systemctl enable apache2
    #backup de archivo index
    mv /var/www/html/index.html /var/www/html/index.html.bkp
    echo -e "\n${LBLUE} Configuración apache para que soporte de extensión php...${NC}"
    config_apache="/etc/apache2/mods-enabled/dir.conf"
cat << EOF > $config_apache
<IfModule mod_dir.c>
    DirectoryIndex index.php index.cgi index.pl index.html index.xhtml index.htm
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
EOF
echo -e "\n${LBLUE} Servicio apache reiniciado...${NC}"
    systemctl reload apache2
}

function installPackage_mariadb {

    echo -e "\n${LYELLOW} Instalando MARIA DB ...${NC}"
    apt install -y mariadb-server
    #Iniciando la base de datos
    systemctl start mariadb
    systemctl enable mariadb
    # Configuracion de la base de datos 
    echo -e "\n${LBLUE} Configurando base de datos ...${NC}"
    mysql -e "
    CREATE DATABASE devopstravel;
    CREATE USER 'codeuser'@'localhost' IDENTIFIED BY 'codepass';
    GRANT ALL PRIVILEGES ON *.* TO 'codeuser'@'localhost';
    FLUSH PRIVILEGES;"

}

function installPackage_php {
    echo -e "\n${LGREEN}php se instalará en tu sistema.${NC}"
    apt install -y php libapache2-mod-php php-mysql php-mbstring php-zip php-gd php-json php-curl 
    php -v
}

# Comprobar si el servidor se encuentra actualizado
sudo apt-get update
echo -e "\n${LGREEN}El Servidor se encuentra Actualizado ...${NC}"

# Comprobar si Git está instalado
if dpkg -s git > /dev/null 2>&1; then
    echo -e "\n${LYELLOW}Git está instalado en tu sistema.${NC}"
    git --version
else
    installPackage_git
fi
# Comprobar si Apache está instalado
if dpkg -s apache2 > /dev/null 2>&1; then
    echo -e "\n${LYELLOW}Apache está instalado en tu sistema.${NC}"
else
    installPackage_apache
fi
# Comprobar si php está instalado
if dpkg -s php > /dev/null 2>&1; then
    echo -e "\n${LYELLOW}php está instalado en tu sistema.${NC}"
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