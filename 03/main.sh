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

text_format_1="\033[1m\033[${textcolor1}m\033[${backcolor1}m"
text_format_2="\033[1m\033[${textcolor2}m\033[${backcolor2}m"

# Вывод в терминал
echo -e ""$text_format_1"HOSTNAME\e[0m = "$text_format_2"$HOSTNAME\e[0m"
echo -e ""$text_format_1"TIMEZONE\e[0m = "$text_format_2"$TIMEZONE\e[0m"
echo -e ""$text_format_1"USER\e[0m = "$text_format_2"$USER\e[0m"
echo -e ""$text_format_1"OS\e[0m = "$text_format_2"$OS\e[0m"
echo -e ""$text_format_1"DATE\e[0m = "$text_format_2"$DATE\e[0m"
echo -e ""$text_format_1"UPTIME\e[0m = "$text_format_2"$UPTIME\e[0m"
echo -e ""$text_format_1"UPTIME_SEC\e[0m = "$text_format_2"$UPTIME_SEC\e[0m"
echo -e ""$text_format_1"IP\e[0m = "$text_format_2"$IP\e[0m"
echo -e ""$text_format_1"MASK\e[0m = "$text_format_2"$MASK\e[0m"
echo -e ""$text_format_1"GATEWAY\e[0m = "$text_format_2"$GATEWAY\e[0m"
echo -e ""$text_format_1"RAM_TOTAL\e[0m = "$text_format_2"$RAM_TOTAL\e[0m"
echo -e ""$text_format_1"RAM_USED\e[0m = "$text_format_2"$RAM_USED\e[0m"
echo -e ""$text_format_1"RAM_FREE\e[0m = "$text_format_2"$RAM_FREE\e[0m"
echo -e ""$text_format_1"SPACE_ROOT\e[0m = "$text_format_2"$SPACE_ROOT\e[0m"
echo -e ""$text_format_1"SPACE_ROOT_USED\e[0m = "$text_format_2"$SPACE_ROOT_USED\e[0m"
echo -e ""$text_format_1"SPACE_ROOT_FREE\e[0m = "$text_format_2"$SPACE_ROOT_FREE\e[0m"

exit 0