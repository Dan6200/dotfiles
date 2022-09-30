# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
export LC_ALL=en_NG.UTF-8
export LANG=en_NG.UTF-8
export LANGUAGE=en_NG.UTF-8
export PATH="$HOME/.local/bin:$PATH"
xmodmap -e "keycode 94 = Shift_L"
export FZF_DEFAULT_COMMAND='find . -name .git -prune -o -name node_modules -prune -o -name built -prune -o -name coverage -prune -o -name tmp -prune -o -type f -print'
alias m=mkdir
alias rmd=rmdir
alias e='vim $(fzf)'
alias R='vim -R $(fzf)'
alias C='cd $(find . -type d -print | fzf)'
alias P='pushd $(find . -type d -print | fzf)'
alias PP=popd
alias ls='ls -F --color'
# Search backwards and forwards with a pattern
bindkey -M vicmd ']' history-incremental-pattern-search-backward
bindkey -M vicmd '[' history-incremental-pattern-search-forward

# # set up for insert mode too
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward
stty -ixon
alias thrift='cd && cd ~/Documents/dev_work/thrift'
