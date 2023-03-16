#!/bin/sh

#disable beep
unsetopt BEEP

#sets Prompt
PROMPT="%n@%m->%~$ "

#Setting up history file
HISTFILE=~/config/zsh/zsh_history
HISTSIZE=10000
SAVEHIST=10000

#Sourcing plugins
source $ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $ZDOTDIR/plugins//zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins//zsh-z/zsh-z.plugin.zsh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh #must be loaded last

#Z stuff
autoload -U compinit && compinit
zstyle ':completion:*' menu select

#Aliases
alias config='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'
