#!/bin/bash
# Проверка параметра на содержание только цифр
if [[ $1 = *[[:digit:]]* ]]  # digit - класс символов POSIX
then
  echo "Error: Parameter must have text format without digits!"
  exit 1
else
  echo "$1"
fi