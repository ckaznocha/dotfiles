#! /bin/bash

touch ~/.at_work
ln -s /workspace/container-data/.gitconfig.local ~/.gitconfig.local
ln -s /workspace/container-data/.zshrc.local ~/.zshrc.local
git clone https://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
source ~/.homesick/repos/homeshick/homeshick.sh
git -C $HOME/.homesick/repos/dotfiles submodule update --init --recursive

homeshick link -f dotfiles

npm install -g diff-so-fancy
sudo apt update && sudo apt install -y vim-nox fzf tmux sqlite3

vim +PlugInstall +qall
