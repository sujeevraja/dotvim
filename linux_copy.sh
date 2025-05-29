#!/bin/bash

rm -rf ~/.vim
echo "removed ~/.vim"

cp -r vim ~/.vim
echo "copied vim folder to ~/.vim"

cp vimrc ~/.vimrc
echo "copied vimrc to ~/.vimrc"

echo "completed copying"
