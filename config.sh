#!/bin/bash
LRED='\033[1;31m'
LGREEN='\033[1;32m'
NC='\033[0m'
LBLUE='\033[0;34m'
LYELLOW='\033[1;33m'
apache_config_file="/etc/apache2/mods-enabled/dir.conf"
# Configuracion de la base de datos 
echo -e "\n${LBLUE}Configurando base de datos ...${NC}"
#    mysql -e "
#    CREATE DATABASE devopstravel;
#    CREATE USER 'codeuser'@'localhost' IDENTIFIED BY 'codepass';
#    GRANT ALL PRIVILEGES ON *.* TO 'codeuser'@'localhost';
#    FLUSH PRIVILEGES;"
#Configurar apache para que soporte extensión php
cat << EOF > $apache_config_file
<IfModule mod_dir.c>
    DirectoryIndex index.php index.cgi index.pl index.html index.xhtml index.htm
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
EOF
sudo systemctl reload apache2

sudo curl http://1.130.252.101/