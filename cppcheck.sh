#!/bin/bash
set -e
thisdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
output=$(cppcheck --template="{file};{line};{severity};{id};{message}" --quiet --enable=all \
--std=c99 --std=c++11 --relative-paths --suppress=missingIncludeSystem \
--suppress=syntaxError --inline-suppr $thisdir 2>&1)
if [ "x$output" != "x" ];then
    echo "CppCheck Failed:"
    echo $output
    exit 1  
fi 
echo "CppCheck OK"
