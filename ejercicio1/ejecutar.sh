#!/bin/bash
LRED='\033[1;31m'
LGREEN='\033[1;32m'
NC='\033[0m'
LBLUE='\033[0;34m'
LYELLOW='\033[1;33m'


cd bootcamp-devops-2023
REPO_NAME=$(basename $(git rev-parse --show-toplevel))
echo $REPO_NAME




