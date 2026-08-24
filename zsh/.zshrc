# ─── Powerlevel10k instant prompt (keep at top) ───
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ─── XDG dirs & PATH ───
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export PATH=/opt/nvim-macos-arm64/bin:$PATH
export PATH="/opt/homebrew/sbin:$PATH:$HOME/.local/bin"

# ─── Editor / locale ───
export EDITOR=nvim
export VISUAL=$EDITOR
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# ─── Keybindings ───
bindkey -v

# ─── Completion ───
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=3
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload -Uz compinit
compinit

# ─── History ───
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# ─── Aliases ───
alias ls='ls -G'
alias du='du -h -d 1'
alias ll='eza -ah --git --git-repos'
alias ansicolors='msgcat --color=test'

# ─── Plugins ───
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ─── Powerlevel10k theme ───
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ─── fzf ───
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

#───eza───
export BAT_THEME="Catppuccin Mocha"
