#!/bin/bash
LRED='\033[1;31m'
LGREEN='\033[1;32m'
NC='\033[0m'
LBLUE='\033[0;34m'
LYELLOW='\033[1;33m'

function remove_git {
    echo -e "\n${LGREEN}Uninstalling git\n${NC}"
    apt remove git -y
    apt purge git -y
}

function delete_files {
    echo -e "\n${LGREEN}Depuracion directorio de archivos estaticos\n${NC}"
    rm -rf /var/www/html/*
}

function remove_apache {
    echo -e "\n${LGREEN}Uninstalling apache\n${NC}"
    apt remove apache2 -y
    apt purge apache2 -y
}

function remove_mariadb {
    echo -e "\n${LGREEN}Uninstalling mariadb\n${NC}"
    rm -rf /var/lib/mysql
    apt remove --purge mariadb-* -y
}

function remove_php {
    echo -e "\n${LGREEN}Uninstalling php\n${NC}"
    apt remove php libapache2-mod-php php-mysql php-mbstring php-zip php-gd php-json php-curl -y
    apt purge php libapache2-mod-php php-mysql php-mbstring php-zip php-gd php-json php-curl -y
}

remove_git
delete_files
remove_apache
remove_mariadb
remove_php