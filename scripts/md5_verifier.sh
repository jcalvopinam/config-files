#!/bin/bash
current_folder=$(pwd)

md5_file_name1="bb78064078fab15823a772c0c9d77c1e"
md5_file_name2="b806d2320b1c8d466e43d0e42b8815ab"
md5_file_name3="12528f03d5da4da3a355d552859667fc"

files=("file_name1.war" "file_name2.war" "file_name3.zip")

for file in "${files[@]}"; do
  current_file="$HOME/Downloads/$file"

  if [ -f "$current_file" ]; then
    current_hash=$(md5 "$current_file" | awk '{ print $4 }')

    if [ "$current_hash" = "$md5_file_name1" ] || \
       [ "$current_hash" = "$md5_file_name2" ] || \
       [ "$current_hash" = "$md5_file_name3" ]; then
      echo -e "\033[0;32m :: ✓ $file \033[0m"
    else
      echo -e "\033[0;31m :: x $file \033[0m"
    fi
  else
    echo -e "\033[0;31m :: The file $file is not in the Downloads folder.\033[0m"
  fi
done

cd "$current_folder"
