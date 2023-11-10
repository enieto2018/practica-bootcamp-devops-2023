#!/bin/bash
LRED='\033[1;31m'
LGREEN='\033[1;32m'
NC='\033[0m'
LBLUE='\033[0;34m'
LYELLOW='\033[1;33m'
repo="bootcamp-devops-2023"
project="app-295devops-travel"
branch="clase2-linux-bash"

function execution_script_sql {
    devopstravel_sql="/var/www/html/database/devopstravel.sql"
    mysql < $devopstravel_sql
}
function copyfiles {
    cp -rf $project/* /var/www/html
}
if [ -d "$repo" ] ; then
    echo "Existe repo"
    cd $repo
    git pull origin $branch
    git checkout $branch
    #llamado a la función de copia de archivos estaticos
    copyfiles
    echo -e "\n${LBLUE} Archivos estaticos copiados.${NC}"
else
    echo -e "\n${LYELLOW} Se clonará el repositorio.${NC}"
    git clone https://github.com/roxsross/$repo.git
    cd $repo/
    git checkout $branch
    #llamado a la función de copia de archivos estaticos
    copyfiles
    echo -e "\n${LBLUE} Archivos estaticos copiados.${NC}"
    #llamado a la función de ejecución de script
    execution_script_sql
    echo -e "\n${LBLUE} Script ejecutado.${NC}"
fi