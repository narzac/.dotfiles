#!/bin/bash

# The directory of this file.
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

bash ${BASEDIR}/brew.sh


DOTFILES=(
    ".bashrc"
    ".bash_profile"
    ".hushlogin"
    ".gitignore"
    ".inputrc"
    ".gitconfig"
    ".gdbinit"
    ".vimrc"
    ".agignore"
    ".yabairc"
    ".skhdrc"
)

for file in ${DOTFILES[@]}; do
    ln -nsvf "${BASEDIR}/${file}" "${HOME}/${file}"
done;

unset file;