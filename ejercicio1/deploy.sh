#!/bin/bash
LRED='\033[1;31m'
LGREEN='\033[1;32m'
NC='\033[0m'
LBLUE='\033[0;34m'
LYELLOW='\033[1;33m'
if ! [ $(id -u) = 0 ]; then 
    echo "I am not root!"
    echo "${LRED}It's not possible the execution${NC}"
else
    echo -e "\n${LGREEN}Empieza la ejecución reto1 ...${NC}"
    echo -e "\n${LGREEN}STAGE 1: [Init]\n${NC}"
    ./installPackage.sh
    echo -e "\n${LGREEN}STAGE 2: [Build]\n${NC}"
    ./accessRepo.sh
    echo -e "\n${LGREEN}STAGE 3: [Deploy]\n${NC}"
    ./config.sh
    echo -e "\n${LGREEN}STAGE 4: [Notify]\n${NC}"
    ./discord.sh ./../practica-bootcamp-devops-2023/   
exit 1 
fi
