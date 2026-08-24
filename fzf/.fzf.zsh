source <(fzf --zsh)

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git --follow"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git --follow"

_fzf_compgen_path() {
  fd --hidden --exclude .git --follow . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git --follow . "$1"
}

# ---- Catppuccin Mocha theme for fzf ----
# https://vitormv.github.io/fzf-themes/
# https://catppuccin.com/palette/
# https://github.com/catppuccin/fzf/blob/main/themes/catppuccin-fzf-mocha.sh
export FZF_DEFAULT_OPTS=" \
--color=fg:#cdd6f4,fg+:#b4befe,bg:-1,bg+:#262626 \
--color=hl:#f38ba8,hl+:#eba0ac,info:#cba6f7,marker:#b4befe \
--color=prompt:#cba6f7,spinner:#f5e0dc,pointer:#d0d0d0,header:#f38ba8 \
--color=border:#89b4fa,label:#cdd6f4,query:#d9d9d9 \
--border=rounded --border-label= --preview-window=border-rounded --prompt='> ' \
--marker='>' --pointer='◆' --separator='─' --scrollbar='│'"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}
