# Dotfiles
These are my dotfiles for use with [homesick](https://github.com/technicalpickles/homesick)

I've set everything to use the awesome Base16 Bright Dark color scheme from [Base16](https://github.com/chriskempson/base16).

## Usage
### Install
1. `gem install homesick`
1. `homesick clone ckaznocha/dotfiles`
1. `homesick link`

### Get updates
`homesick pull`

---

### Vim
Vundle will need to download and install some plug-ins.

1. `vi`
1. `:PluginInstall`
1. `:q`

#### YouCompleteMe
`~/.vim/bundle/YouCompleteMe/install.sh --clang-completer`

---

### Git

Put user name and email in a new file called `.gitconfig.local`

## TODO
* create a .homesickrc file to automate set up
* figure out how to include my Sublime Text 3 settings
