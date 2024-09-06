#!/bin/bash
# Возвращает истинное значение, если параметр больше 1
if [ $# -gt 1 ]
then
    echo "Error: Only one parameter needed!"
    exit 1
fi