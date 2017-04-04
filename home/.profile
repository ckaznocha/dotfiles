# shellcheck disable=SC2148
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash include .bashrc if it exists
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
    # shellcheck disable=SC1090
    . "$HOME/.bashrc"
fi

# set PATH so it includes user's private bin if it exists

paths=(
    $HOME/bin
    $HOME/.swift/usr/bin
    $HOME/.cabal/bin
    $HOME/.rbenv/bin
    $HOME/.rbenv/shims
    $HOME/.cargo/bin
    $HOME/.config/composer/vendor/bin
    /usr/local/share/npm/bin
)

cdpaths=(
    $HOME
    $HOME/Library
)

#Go
if [ -d "/usr/local/go" ]; then
    export GOROOT=/usr/local/go
    export GOPATH=$HOME
    paths+=($GOROOT/bin)
    paths+=($GOPATH/bin)
    cdpaths+=($GOPATH/src/github.com)
fi

#Android
if [ -d "/usr/local/opt/android-sdk" ]; then
    export ANDROID_HOME=/usr/local/opt/android-sdk
fi

#Perl
if [ -d "$HOME/perl5" ]; then
    export PERL_LOCAL_LIB_ROOT=$HOME/perl5
    export PERL5LIB=$PERL_LOCAL_LIB_ROOT/lib/perl5
    export PERL_MB_OPT="--install_base \"$PERL_LOCAL_LIB_ROOT\""
    export PERL_MM_OPT="INSTALL_BASE=$PERL_LOCAL_LIB_ROOT"
    paths+=($PERL_LOCAL_LIB_ROOT/bin)
fi

for i in "${paths[@]}"
do
    if [ -d "$i" ] && [[ $PATH != *"$i"* ]]; then
      PATH=$i:$PATH
    fi
done

CDPATH="."
for i in "${cdpaths[@]}"
do
    if [ -d "$i" ] && [[ $CDPATH != *"$i"* ]]; then
      CDPATH=$CDPATH:$i
    fi
done
