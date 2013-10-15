#!/bin/sh

mkdir -p ~/.backup/backup ~/.backup/undo ~/.backup/swap

# Setup symlinks for VIM
if [ ! -d ~/.vim ]; then
  ln -s ~/vim ~/.vim
  echo "=> .vim symlink created."
else
  echo "=> .vim allready exist."
fi

if [ ! -f ~/.vimrc ]; then
  ln -s ~/.vim/.vimrc ~/.vimrc
  echo "=> .vimrc symlink created."
else
  echo "=> .vimrc allready exist."
fi

if [ ! -d ~/.svimtp ]; then
  ln -s ~/.vim/.svimtp ~/.svimtp
  echo "=> .svimtp symlink created."
else
  echo "=> .svimtp allready exist."
fi
