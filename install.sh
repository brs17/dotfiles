#!/bin/bash
#Create backups and symbolic links for dotfiles
#Script originated from: https://github.com/michaeljsmalley/dotfiles

dir=~/dotfiles
backupdir=~/backupdotfiles
files="vimrc bashrc git-prompt.sh gitconfig"

#create folders
echo "Creating backup directory"
mkdir -p $backupdir

for file in $files; do
    echo "backing up $file"
    mv ~/.$file $backupdir/
    echo "creating symlink for $file"
    ln -s $dir/.$file ~/.$file
done
