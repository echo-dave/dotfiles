# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# if [ -z "$SSH_AUTH_SOCK" ]; then
#   eval "$(ssh-agent -s)"
# fi


# nvim data location global
# export XDG_DATA_HOME=/usr/local/share
 export XDG_CONFIG_HOME="$HOME/.config"
 export XDG_DATA_HOME="$HOME/.local/share"
export PATH=/opt/nvim-macos-arm64/bin:$PATH

bindkey -v
# The following lines were added by compinstall

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=3
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/dave/.zshrc'

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

#export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43" 
# export LSCOLORS="exfxcxdxbxegedabagacad"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# if [[ -n $SSH_CONNECTION ]]; then
# #remotehost
#   PROMPT=$'%{\e[38;5;125m%}%m%{\e[0m:%}%{\e[38;5;172m%}%2~%{\e[0m%}%# \ '
# else
# #localhost
# # PROMPT=$'%{\e[38;5;100m%}\u27A4 %{\e[0m:%}%{\e[38;5;172m%}%2~%{\e[0m%}%# \ '
#   PROMPT=$'%{\e[38;5;100m%}\u27A4 %{\e[38;5;172m%}%2~%{\e[0m%} $(git_prompt_info) %# \ '
# fi

#colorized ls
 alias ls='ls -G'
 alias du='du -h -d 1'
 alias ll='eza -ah --long --git --git-repos'
 alias ansicolors='msgcat --color=test'

# CLICOLOR=1
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# export TERM="xterm-256color"
export EDITOR=nvim
export VISUAL=$EDITOR

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/opt/homebrew/sbin:$PATH:$HOME/.local/bin"
#source /dev/fd/13
source <(fzf --zsh) 
