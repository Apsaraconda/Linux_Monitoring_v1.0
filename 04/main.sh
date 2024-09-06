#!/bin/bash

# Проверки вводимых параметров
. ./param_check.sh

HOSTNAME=$(hostname)
TIMEZONE="$(cat /etc/timezone) $(date +"%Z" -u) $(date +"%:::z")"
USER=$(whoami)
OS=$(cat /etc/issue | cut -d '\' -f 1)
DATE=$(date +"%d %B %Y %X")
UPTIME=$(uptime -p | cut -f2- -d ' ')
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
IP=$(hostname -I)
MASK=$(ifconfig $(ip r | grep default | awk '{print $5}') | awk '/netmask / {print $4}')
GATEWAY=$(ip r | grep default | awk '{print $3}')
RAM_TOTAL=$(free | grep -e Mem: -e Память: | awk '{printf "%.3f GB", $2/(1024. * 1024.)}')
RAM_USED=$(free | grep -e Mem: -e Память: | awk '{printf "%.3f GB", $3/(1024. * 1024.)}')
RAM_FREE=$(free | grep -e Mem: -e Память: | awk '{printf "%.3f GB", $4/(1024. * 1024.)}')
SPACE_ROOT=$(df / | grep dev | awk '{printf "%.2f MB", $2/(1024.)}')
SPACE_ROOT_USED=$(df / | grep dev | awk '{printf "%.2f MB", $3/(1024.)}')
SPACE_ROOT_FREE=$(df / | grep dev | awk '{printf "%.2f MB", $4/(1024.)}')


backcolor1=0
textcolor1=0
backcolor2=0
textcolor2=0

# Присвоение цвета
. ./colors.sh

# Вывод в терминал
. ./print.sh

exit 0