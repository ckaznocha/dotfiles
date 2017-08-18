#! /zsh
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wedisagree_ckmod"

# Dracula Shell
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
plugins=(
    brew
    cabal
    cargo
    colored-man-pages
    colorize
    command-not-found
    common-aliases
    compleat
    composer
    docker
    emoji
    gem
    git
    golang
    kubectl
    man
    node
    npm
    osx
    pip
    python
    ruby
    rust
    swiftpm
    tmux
    tmuxinator
    vagrant
    vundle
    yarn
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-completions
)

# User configuration

if [[ $- == *i* ]]; then
    source $ZSH/oh-my-zsh.sh
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# added by travis gem
[ -f /Users/clifkaznocha/.travis/travis.sh ] && source /Users/clifkaznocha/.travis/travis.sh
