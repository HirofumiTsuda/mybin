#!/bin/bash

lst=`find . -type d | grep -v ".*/\..*" | grep -v "^\.$"`
echo $lst
filename=".dir-locals.el"

rm $filename
touch $filename

echo "((nil . ((company-clang-arguments . (" >> $filename

for f in ${lst[@]}; do
    line="-I${f}"
    echo $line >> $filename
done

echo ")))))" >> $filename
