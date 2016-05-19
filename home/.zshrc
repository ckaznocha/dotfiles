# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM=xterm-256color

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wedisagree_ckmod"

# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/base16-bright.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
DRACULA_SHELL="$HOME/.config/dracula-shell/dracula.sh"
[[ -s $DRACULA_SHELL ]] && source $DRACULA_SHELL

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/zsh-custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man colorize compleat command-not-found brew docker npm tmux tmuxinator zsh-syntax-highlighting)

# User configuration

export PATH="~/.swift/bin:~/.cabal/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='vim'
fi

# gvm config
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
[[ -s "/home/ckaznocha/.gvm/scripts/gvm" ]] && source "/home/ckaznocha/.gvm/scripts/gvm"

# added by travis gem
[ -f /home/clifton/.travis/travis.sh ] && source /home/clifton/.travis/travis.sh
