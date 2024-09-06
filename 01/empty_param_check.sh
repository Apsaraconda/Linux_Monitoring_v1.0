#!/bin/bash
# Проверка на отсутствие параметра
if [ -z "$1" ] # Возвращает истинное значение, если длина параметра равна 0.
then
  echo "Error: There is no parameter found!"
  exit 1
fi