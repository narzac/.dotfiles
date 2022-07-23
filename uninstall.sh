#!/bin/bash

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
)

for file in ${DOTFILES[@]}; do
   rm -fv "${HOME}/${file}"
done;

unset file;