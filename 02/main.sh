#!/bin/bash

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

val1="HOSTNAME = $HOSTNAME"
val2="TIMEZONE = $TIMEZONE"
val3="USER = $USER"
val4="OS = $OS"
val5="DATE = $DATE"
val6="UPTIME = $UPTIME"
val7="UPTIME_SEC = $UPTIME_SEC"
val8="IP = $IP"
val9="MASK = $MASK"
val10="GATEWAY = $GATEWAY"
val11="RAM_TOTAL = $RAM_TOTAL"
val12="RAM_USED = $RAM_USED"
val13="RAM_FREE = $RAM_FREE"
val14="SPACE_ROOT = $SPACE_ROOT"
val15="SPACE_ROOT_USED = $SPACE_ROOT_USED"
val16="SPACE_ROOT_FREE = $SPACE_ROOT_FREE"

for var in "$val1" "$val2" "$val3" "$val4" "$val5" "$val6" "$val7"\
  "$val8" "$val9" "$val10" "$val11" "$val12" "$val13" "$val14" "$val15"\
  "$val16"
do
  echo $var
done

. ./save_to_file.sh

exit 0