#!/bin/bash
# Проверка на отсутствие параметра
if [ -z "$1" ] # Возвращает истинное значение, если длина параметра равна 0.
then
  echo "Error: There is no parameter found!"
  echo "Try to call the script again with correct parameters."
  exit 1
fi

# Проверка на цифровые символы
for arg in $@
do
  if [[ $arg != [[:digit:]] ]]
  then
    echo "Error: Parameters must have digit format!"
    echo "Try to call the script again with correct parameters."
    exit 1
  fi
done

# Проверка на диапазон значений от 1 до 6
for arg in $@
do
  if [ $arg -gt 6 ] || [ $arg -lt 1 ]
  then
    echo "Error: Parameters must have integer values from 1 to 6!"
    echo "Try to call the script again with correct parameters."
    exit 1;
  fi
done

# Проверка на то, что параметров больше или меньше 4
if [[ $# -gt 4 ]] || [[ $# -lt 4 ]]
then
  echo "Error: 4 parameters needed!"
  echo "Try to call the script again with correct parameters."
  exit 1
fi

# Цвета шрифта и фона одного столбца не должны совпадать.
if [ $1 == $2 ] || [ $3 == $4 ]
then
  echo "Error: The font and background colours of one column must not match!"
  echo "Try to call the script again with correct parameters."
  exit 1;
fi
