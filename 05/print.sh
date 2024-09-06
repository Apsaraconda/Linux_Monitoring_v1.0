#!/bin/bash

# Общее число папок, включая вложенные
directories=`sudo find $1 -type d | wc -l`
# Топ 5 папок с самым большим весом в порядке убывания (путь и размер)
top_5_folders=`sudo du -Sh $1 | sort -rh | head -5 | cat -n | awk '{print $1" - "$3", "$2}'`
# Общее число файлов
files_number=`sudo find $1 -type f | wc -l`
# Число конфигурационных файлов (с расширением .conf)
conf_files=`sudo find $1 -type f -name "*.conf" | wc -l`
# текстовых файлов
text_files=`sudo find $1 -type f -name "*.txt" | wc -l`
# исполняемых файлов
exec_files=`sudo find $1 -type f -executable | wc -l `
# логов (файлов с расширением .log)
log_files=`sudo find $1 -type f -name "*.log" | wc -l`
# архивов
archive_files=`sudo find $1 -regex '.*\(tar\|zip\|gz\|rar\)' | wc -l`
# символических ссылок
symb_files=`sudo find $1 -type l | wc -l`

# Топ 10 файлов с самым большим весом в порядке убывания (путь, размер и тип)
top_10_search() {
  for i in {1..10}
  do
    top_10_files=$(sudo find $1 -type f -exec du -h {} + | sort -rh | head -10 | sed "${i}q;d")
    if [[ ! -z $top_10_files ]];
    then
      echo -n "$i - "
      echo -n "$(echo $top_10_files | awk '{print $2}'), "
      echo -n "$(echo $top_10_files | awk '{print $1}'), "
      echo "$(echo $top_10_files | grep -m 1 -o -E "\.[^/.]+$" | awk -F . '{print $2}')"
    fi
  done
}

# Топ 10 исполняемых файлов с самым большим весом в порядке убывания (путь, размер и хеш)
top_10_exec_search() {
  for i in {1..10}
  do
    top_10_exec=$(sudo find $1 -type f -executable -exec du -h {} + | sort -rh | head -10 | sed "${i}q;d")
    if [[ ! -z $top_10_exec ]]
    then
      echo -n "$i - "
      echo -n "$(echo $top_10_exec | awk '{print $2}'), "
      echo -n "$(echo $top_10_exec | awk '{print $1}'), "
      echo "$(md5sum $(echo $top_10_exec | awk '{print $2}') | awk '{print $1}')"
    fi
  done
}

# Вывод на печать
print() {
  echo "Total number of folders (including all nested ones) = $directories"
  echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
  echo "$top_5_folders"
  echo "Total number of files = $files_number"
  echo "Number of:"
  echo "Configuration files (with the .conf extension) = $conf_files"
  echo "Text files = $text_files"
  echo "Executable files = $exec_files"
  echo "Log files (with the extension .log) = $log_files"
  echo "Archive files = $archive_files"
  echo "Symbolic links = $symb_files"
  echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
  top_10_search $1
  echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
  top_10_exec_search $1
}