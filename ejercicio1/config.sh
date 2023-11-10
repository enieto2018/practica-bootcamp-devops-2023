#!/bin/bash
LRED='\033[1;31m'
LGREEN='\033[1;32m'
NC='\033[0m'
LBLUE='\033[0;34m'
LYELLOW='\033[1;33m'

function replace_password {
    sed -i 's/""/"codepass"/g' /var/www/html/config.php
}
#Ejecucion de reeplace password
replace_password
echo -e "\n${LBLUE}Reemplazo de datos de BD..${NC}"
#Validación de aplicacion travel
echo -e "\n${LBLUE}Servicio apache reiniciado...${NC}"
systemctl reload apache2

echo -e "\n${LBLUE} Consultando Servicio...${NC}"
#curl -I http://1.130.252.101:80/