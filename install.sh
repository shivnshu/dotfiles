#!/bin/bash
sudo pacman -S zsh git --noconfirm
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
mv ~/.zshrc ~/.zshrc.backup
cp .zshrc ~/.zshrc
chsh -s /bin/zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting
