#! /bin/bash

touch ~/.at_work
ln -s /commandhistory/.gitconfig.local ~/.gitconfig.local
git clone https://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
source ~/.homesick/repos/homeshick/homeshick.sh
git -C $HOME/.homesick/repos/dotfiles submodule update --init --recursive

homeshick link -f dotfiles

sudo update-alternatives --install /usr/local/bin/bat bat /usr/bin/batcat 20

# check if the github cli is installed. Add the github cli to the path if it is
if [ -x "$(command -v gh)" ]; then
    gh extension install github/gh-copilot --force
fi

vim +PlugInstall +qall
