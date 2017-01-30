#!/bin/bash

BASEDIR=process.env.BASEDIR
filepath=$1
culprit=$2
pre=$((culprit-5))
post=$((culprit+5))
count=0
red="\033[0;31m"
green="\033[0;32m"
cyan="\033[0;36m"
yellow="\033[1;33m"
reset='\033[0m'
echo ""
echo -e "${cyan}Nodame debugger${reset}"
echo -e "${cyan}---------------${reset}"
echo -e "${green}filepath: ${filepath}${reset}"
echo ""
while IFS='' read -r line || [[ -n $line ]]; do
    count=$((count+1))
    if [[ $count -ge $pre && $count -le $post ]]; then
        if [ $count -eq $culprit ]; then
            echo -e "${red}${count}: $line${reset}"
        else
            echo -e "${yellow}${count}: $line${reset}"
        fi
    fi
done < "${filepath}"
echo ""
