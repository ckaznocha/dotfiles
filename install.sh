#! /bin/bash

ln -s /workspace/container-data/.gitconfig.local ~/.gitconfig.local
git clone https://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
source ~/.homesick/repos/homeshick/homeshick.sh
git -C $HOME/.homesick/repos/dotfiles submodule update --init --recursive

homeshick link -f dotfiles

npm install -g diff-so-fancy
sudo apt install -y fzf tmux sqlite3