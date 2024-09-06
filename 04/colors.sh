#!/bin/bash

# Коды цветов текста:
# 30 - чёрный 6
# 31 - красный 2
# 32 - зелёный 3
# 34 - синий 4
# 35 - пурпурный 5
# 37 - белый 1

# Коды цветов фона:
# 40 - чёрный 6
# 41 - красный 2
# 42 - зелёный 3
# 44 - синий 4
# 45 - пурпурный 5
# 47 - белый 1

case $background1 in
1) backcolor1=47 ;;
2) backcolor1=41 ;;
3) backcolor1=42 ;;
4) backcolor1=44 ;;
5) backcolor1=45 ;;
6) backcolor1=40 ;;
esac

case $font_color1 in
1) textcolor1=37 ;;
2) textcolor1=31 ;;
3) textcolor1=32 ;;
4) textcolor1=34 ;;
5) textcolor1=35 ;;
6) textcolor1=30 ;;
esac

case $background2 in
1) backcolor2=47 ;;
2) backcolor2=41 ;;
3) backcolor2=42 ;;
4) backcolor2=44 ;;
5) backcolor2=45 ;;
6) backcolor2=40 ;;
esac

case $font_color2 in
1) textcolor2=37 ;;
2) textcolor2=31 ;;
3) textcolor2=32 ;;
4) textcolor2=34 ;;
5) textcolor2=35 ;;
6) textcolor2=30 ;;
esac