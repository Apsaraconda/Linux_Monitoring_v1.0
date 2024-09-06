#!/bin/bash

echo "Do you want to save this data to a file?"
echo "(Y/N):"
read answer

if [[ $answer = "y" || $answer = "Y" ]]
then
  for var in "$val1" "$val2" "$val3" "$val4" "$val5" "$val6" "$val7"\
    "$val8" "$val9" "$val10" "$val11" "$val12" "$val13" "$val14" "$val15"\
    "$val16"
  do
    echo $var >> $(date +"%d_%m_%g_%H_%M_%S").status
  done
  echo "file saved successfully"
fi

