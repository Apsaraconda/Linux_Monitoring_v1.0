#!/bin/bash
# Проверка на отсутствие параметра
. ./empty_param_check.sh
# Проверка кол-ва параметров больше 1
. ./quantity_check.sh
# Проверка параметра на содержание только цифр
. ./symbols_check.sh