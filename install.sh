#!/bin/bash

mkdir ~/.backup
mv ~/.bashrc ~/.backup/.bashrc.backup
cp .bashrc ~/

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting

mv ~/.zshrc ~/.backup/.zshrc.backup
cp .zshrc ~/

cp .gtkrc-2.0 ~/
cp .vimrc ~/
cp .vocab ~/
cp .vocabscript ~/

cp -r .config ~/
cp -r .fonts ~/
