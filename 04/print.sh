#!/bin/bash

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

# Функция возвращает название цвета по коду
color_table() {
  if [ $1 -eq 1 ]
  then
  color_name="(white)"
  elif [ $1 -eq 2 ]
  then
  color_name="(red)"
  elif [ $1 -eq 3 ]
  then
  color_name="(green)"
  elif [ $1 -eq 4 ]
  then
  color_name="(blue)"
  elif [ $1 -eq 5 ]
  then
  color_name="(purple)"
  elif [ $1 -eq 6 ]
  then
  color_name="(black)"
  fi
  echo "$color_name"
}

# Функция печати информации о выбранной цветовой схеме
param_print() {
  echo ""
  print_str_1="Column 1 background = "
  print_str_2="Column 1 font color = "
  print_str_3="Column 2 background = "
  print_str_4="Column 2 font color = "
  if [ $1 -eq 0 ]
  then
    echo "$print_str_1"$background1" $(color_table $background1)"
    echo "$print_str_2"$font_color1" $(color_table $font_color1)"
    echo "$print_str_3"$background2" $(color_table $background2)"
    echo "$print_str_4"$font_color1" $(color_table $font_color2)"
  elif [ $1 -eq 1 ]
  then
    echo "$print_str_1"default" $(color_table $background1)"
    echo "$print_str_2"default" $(color_table $font_color1)"
    echo "$print_str_3"default" $(color_table $background2)"
    echo "$print_str_4"default" $(color_table $font_color2)"
  fi
}

param_print $default_colors