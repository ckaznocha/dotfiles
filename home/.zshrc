#! /zsh
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ckaznocha"

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
plugins=(
    battery
    branch
    brew
    bgnotify
    cabal
    colored-man-pages
    colorize
    command-not-found
    common-aliases
    compleat
    dash
    docker
    emoji
    fzf
    gem
    git
    golang
    grc
    kubectl
    macos
    man
    node
    npm
    pip
    python
    vundle
    yarn
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# User configuration

if [[ $- == *i* ]]; then
    source $ZSH/oh-my-zsh.sh
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# added by travis gem
[ -f /Users/clifkaznocha/.travis/travis.sh ] && source /Users/clifkaznocha/.travis/travis.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="/opt/homebrew/lib/ruby/gems/3.0.0/bin:$PATH"
export GPG_TTY=$(tty)
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

[[ -s "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

[ -f ~/.inshellisense/key-bindings.zsh ] && source ~/.inshellisense/key-bindings.zsh

alias cat='bat --paging=never'
