#!/bin/bash

# The directory of this file, following through link
BASEDIR="$(dirname $(test -L "${BASH_SOURCE[0]}" && readlink -n "${BASH_SOURCE[0]}" || echo "${BASH_SOURCE[0]}"))"

for file in "${BASEDIR}"/bash/{path,config,aliases,functions,local}; do # local, prompt}
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

unset file;
