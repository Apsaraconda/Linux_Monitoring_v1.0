#!/bin/bash

FILE=colors.conf

# Проверка на отсутствие параметров
for arg in $@
do
  if [ $arg -gt 0 ]
  then
    echo "Error: The script runs without parameters."
    echo "Try to call the script again with correct parameters."
    exit 1;
  fi
done

if [ ! -f "$FILE" ]; then
  echo "Please, create colors.conf file and \
try to call the script again."
  exit 1;
fi

# Функция поиска параметров из конфигурационного файла
param_searching() {
  counter=0
  while read -n 20 line
  do
    if [ ! -z "$line" ]
    then
      tmp=`echo $line | grep $1 | cut -c 20`
      if [ ! -z "$tmp" ]
      then
        break
      fi
    fi
  done < $FILE
  echo "$tmp"
}

background1=$(param_searching 'column1_background=[0-9]')
font_color1=$(param_searching 'column1_font_color=[0-9]')
background2=$(param_searching 'column2_background=[0-9]')
font_color2=$(param_searching 'column2_font_color=[0-9]')
default_colors=0

# Обработка полученных конфигураций
if [ -z "$background1" ] || [ -z "$font_color1" ] || [ -z "$background2" ] || [ -z "$font_color2" ]
then
  echo "One or more parameters are not set in the configuration file, \
colours are substituted from the default colour scheme. "
  background1=6
  font_color1=1
  background2=2
  font_color2=1
  default_colors=1
elif [ $background1 -gt 6 ] || [ $background1 -lt 1 ] \
|| [ $font_color1 -gt 6 ] || [ $font_color1 -lt 1 ] \
|| [ $background2 -gt 6 ] || [ $background2 -lt 1 ] \
|| [ $font_color2 -gt 6 ] || [ $font_color2 -lt 1 ]
then
  echo "Error: Incorrect color parameter found."
  echo "Colour designations: (1 - white, 2 - red, 3 - green, \
  4 - blue, 5 - purple, 6 - black)."
  echo "Please, choose correct color parameters and \
try to call the script again."
  exit 1
fi